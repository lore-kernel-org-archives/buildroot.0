From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:03:44 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.9.x series to version 4.9.3
Message-ID: <20150628120349.519AA80DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fed00ea1eaeca952f872120af79a46f39b0868c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 110-pr64896.patch and 920-libgcc-remove-unistd-header.patch since
they're upstream.

Tweak 850-libstdcxx-uclibc-c99.patch for this new release.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.9.2/110-pr64896.patch                |   59 -----
 package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch   |  273 --------------------
 .../4.9.2/920-libgcc-remove-unistd-header.patch    |   12 -
 package/gcc/{4.9.2 => 4.9.3}/100-uclibc-conf.patch |    0
 ...00-powerpc-link-with-math-lib.patch.conditional |    0
 package/gcc/{4.9.2 => 4.9.3}/111-pr65730.patch     |    0
 .../{4.9.2 => 4.9.3}/301-missing-execinfo_h.patch  |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.9.2 => 4.9.3}/830-arm_unbreak_armv4t.patch  |    0
 .../840-microblaze-enable-dwarf-eh-support.patch   |    0
 package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch   |  255 ++++++++++++++++++
 package/gcc/{4.9.2 => 4.9.3}/860-cilk-wchar.patch  |    0
 .../gcc/{4.9.2 => 4.9.3}/900-musl-support.patch    |    0
 .../910-gcc-poison-system-directories.patch        |    0
 package/gcc/Config.in.host                         |    2 +-
 package/gcc/gcc.hash                               |    4 +-
 16 files changed, 258 insertions(+), 347 deletions(-)

Patch is too large, so refusing to show it
