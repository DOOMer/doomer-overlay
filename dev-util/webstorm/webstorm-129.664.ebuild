# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils
#PVERSION=${PV}
PVERSION="6.0.2"
DESCRIPTION="WebStorm"
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/webstorm/WebStorm-${PVERSION}.tar.gz"
KEYWORDS="~x86 ~amd64"
DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}
src_install() {	
	dodir /opt/${PN}
		
	insinto /opt/${PN}
	cd WebStorm-${PV}
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

