# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils
PVERSION="131.515"
DESCRIPTION="WebStorm"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/webstorm/WebStorm-${PV}.tar.gz"
KEYWORDS="~x86 ~amd64"
DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}
src_install() {	
	dodir /opt/${PN}
		
	insinto /opt/${PN}
	cd WebStorm-${PVERSION}
	doins -r *
	fperms a+x /opt/${PN}/bin/webstorm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	dosym /opt/${PN}/bin/webstorm.sh /usr/bin/${PN}

	doicon "bin/webide.png"
	make_desktop_entry ${PN} "${PN}" "${PN}"
}
pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}

