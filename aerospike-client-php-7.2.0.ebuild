# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="PHP client for Aerospike"
HOMEPAGE="http://www.aerospike.com"
EGIT_REPO_URI="https://github.com/aerospike/aerospike-client-php.git"
EGIT_COMMIT="${PV}"

KEYWORDS="~amd64"

SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
        cd src
        phpize
        ./configure --enable-aerospike

}

src_compile() {
        cd src
        emake DOWNLOAD_C_CLIENT=0 AEROSPIKE_LUA_PATH=../modules/aerospike-lua-core/src/ -j1 all
}

src_install() {
        cd src
        emake INSTALL_ROOT="${D}" install
}
