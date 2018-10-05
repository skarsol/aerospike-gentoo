# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="C client for Aerospike"
HOMEPAGE="http://www.aerospike.com"
EGIT_REPO_URI="https://github.com/aerospike/aerospike-client-c.git"
EGIT_SUBMODULES=( '*' )
EGIT_COMMIT="${PV}"

KEYWORDS="~amd64"

SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_compile() {
        emake -j1
}

src_install() {
        emake INSTALL_PREFIX="${D}/usr/" install
}
