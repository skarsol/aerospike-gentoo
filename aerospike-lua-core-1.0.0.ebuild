# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="PHP client for Aerospike"
HOMEPAGE="http://www.aerospike.com"
EGIT_REPO_URI="https://github.com/aerospike/aerospike-lua-core.git"
EGIT_COMMIT="acb9eb1ec2dda2c64375b28c7fb08a0518aadd27"

KEYWORDS="~amd64"

SLOT="0"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
insinto /opt/aerospike/sys/udf/lua
doins -r src/*

fowners -R aerospike:aerospike /opt/aerospike/sys/udf/lua
}
