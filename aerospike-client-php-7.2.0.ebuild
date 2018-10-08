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

# PHP client doesn't seem to be able to use the event libraries, possibly PHP issue?
RDEPEND="dev-db/aerospike-client-c[-libev,-libevent,-libuv]"
DEPEND="${RDEPEND}"

src_configure() {
        cd src
        phpize
        ./configure --enable-aerospike
}

src_compile() {
        cd src
        DOWNLOAD_C_CLIENT=0 LUA_SYSPATH=${D}/opt/aerospike/sys/udf/lua LUA_USERPATH=${D}/opt/aerospike/usr/udf/lua ./build.sh
}

src_install() {
        cd src
        emake INSTALL_ROOT="${D}" install
}
