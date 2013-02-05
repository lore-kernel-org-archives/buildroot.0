From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 15:56:33 +0100
Subject: [Buildroot] [git commit] util-linux: add numbers to patches
Message-ID: <20130205150055.349559A987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01e859ebffe7e0e335ba0b834789c04afea3f404
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are going to add an Xtensa related patch that needs to be
applied *after* the AArch64 patch, let's first add a number to each
util-linux patch file name, so that we know they will be applied in
the right order.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ....patch => util-linux-001-sscanf-no-ms-as.patch} |    0
 ...patch => util-linux-002-uclibc-build-fix.patch} |    0
 ... => util-linux-003-fdisk-aarch64-support.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/util-linux-sscanf-no-ms-as.patch b/package/util-linux/util-linux-001-sscanf-no-ms-as.patch
similarity index 100%
rename from package/util-linux/util-linux-sscanf-no-ms-as.patch
rename to package/util-linux/util-linux-001-sscanf-no-ms-as.patch
diff --git a/package/util-linux/util-linux-uclibc-build-fix.patch b/package/util-linux/util-linux-002-uclibc-build-fix.patch
similarity index 100%
rename from package/util-linux/util-linux-uclibc-build-fix.patch
rename to package/util-linux/util-linux-002-uclibc-build-fix.patch
diff --git a/package/util-linux/util-linux-fdisk-aarch64-support.patch b/package/util-linux/util-linux-003-fdisk-aarch64-support.patch
similarity index 100%
rename from package/util-linux/util-linux-fdisk-aarch64-support.patch
rename to package/util-linux/util-linux-003-fdisk-aarch64-support.patch
