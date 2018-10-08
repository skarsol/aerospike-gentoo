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

RDEPEND="libev? ( dev-libs/libev )
        libuv? ( dev-libs/libuv )
        libevent? ( dev-libs/libevent )
        dev-lang/lua"
DEPEND="${RDEPEND}"

IUSE="libuv libev libevent"

REQUIRED_USE="?? ( libuv libev libevent )"


src_compile() {
        if use libev ; then
                EV_LIB=libev
        elif use libev ; then
                EV_LIB=libuv
        elif use libevent ; then
                EV_LIB=libevent
        fi

# Compile fails under -j5
        emake -j1 EVENT_LIB=${EV_LIB} USE_LUAMOD=0

}

src_install() {
        emake INSTALL_PREFIX="${D}/usr/" install
}
