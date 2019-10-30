From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 09:39:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/qemu: move patch
 3 to the 3.1.1.1 subdir
Message-ID: <20191030085445.EE8A8811F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a73f23c816f90da14f0aecf36eff60394378568b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Required since the bump from 3.1.1.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1ef6d39565cc6bc0ba55b3ffcb44dda14e20232c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
similarity index 100%
rename from package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
rename to package/qemu/3.1.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
