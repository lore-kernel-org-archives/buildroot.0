From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:30:28 +0100
Subject: [Buildroot] [git commit] dosfstools: add license information
Message-ID: <20130128223358.A8D789A86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07d732af917f158b1788ff4bfe9ea6b98d452dbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 507f485..4f89364 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -6,6 +6,8 @@
 
 DOSFSTOOLS_VERSION = 3.0.12
 DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
+DOSFSTOOLS_LICENSE = GPLv3+
+DOSFSTOOLS_LICENSE_FILES = COPYING
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
