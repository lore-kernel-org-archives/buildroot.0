From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:07:33 +0200
Subject: [Buildroot] [git commit] package/qemu: move patch 3 to the 3.1.1.1
 subdir
Message-ID: <20191021170118.DD95283640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ef6d39565cc6bc0ba55b3ffcb44dda14e20232c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required since the bump from 3.1.1.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
similarity index 100%
rename from package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
rename to package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
