From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 15:47:23 +0100
Subject: [Buildroot] [git commit] package/libfreeimage: bump version to
 3.18.0
Message-ID: <20191231143811.043D78E93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49d19395aa599c7c7919b8b8c45f01df1045ceae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://freeimage.sourceforge.net/news.html

Removed patches
0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
0004-fix-gcc-6.patch
0005-Manage-powf64-with-glibc.patch
because upstream added updated version of various dependencies.

Added upstream patch to fix big endian build.
Added md5 & sha1 hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...P-fix-compilation-issue-with-GCC-5.x-C-11.patch | 1172 --------------------
 package/libfreeimage/0003-fix-big-endian-os.patch  |   64 ++
 package/libfreeimage/0004-fix-gcc-6.patch          |   31 -
 .../0005-Manage-powf64-with-glibc.patch            |  725 ------------
 package/libfreeimage/libfreeimage.hash             |    6 +-
 package/libfreeimage/libfreeimage.mk               |    2 +-
 6 files changed, 70 insertions(+), 1930 deletions(-)

Patch is too large, so refusing to show it
