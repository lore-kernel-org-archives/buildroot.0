Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CDDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D85812CF;
	Sun, 23 Jan 2022 19:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFgOMzlZ1VUK; Sun, 23 Jan 2022 19:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C50681A58;
	Sun, 23 Jan 2022 19:53:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90D851BF97A
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BB3E4014C
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8dKr3ca_WSj for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6153240105
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:52:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BB3967F93B; Sun, 23 Jan 2022 19:45:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 20:49:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa1a33027fabe03f98b10edfa2a94555e9413415
X-Git-Newrev: 029a6dc3e3320984c6369747e0b79060f13b2afc
X-Patchwork-Hint: ignore
Message-Id: <20220123194537.BB3967F93B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/neon: bump to version 0.32.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=029a6dc3e3320984c6369747e0b79060f13b2afc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest version
- README has been renamed to README.md
- Update indentation in hash file (two spaces)

https://github.com/notroj/neon/blob/0.32.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/neon/Config.in |  2 +-
 package/neon/neon.hash | 10 +++++-----
 package/neon/neon.mk   |  6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index d055b37607..45348a7f4d 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_NEON
 	help
 	  HTTP and WebDAV client library, with a C interface.
 
-	  http://www.webdav.org/neon/
+	  https://notroj.github.io/neon/
 
 if BR2_PACKAGE_NEON
 
diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 2ebefbe520..5a5a77a58b 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,6 +1,6 @@
-# Locally calculated after checking pgp signature
-sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
 # Locally computed
-sha256 95f77624e96f6728145826fc895142275451f43f41c073766db3dbbcc8b790b0  README
-sha256 d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
-sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
+sha256  986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286  neon-0.32.2.tar.gz
+# Hash for license files
+sha256  ce2421ee38d6c0e02c85ac076478a0f92da6ef92b92b7a174877cabf01b2e531  README.md
+sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  src/COPYING.LIB
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  test/COPYING
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index da53735d0e..3bbd12561f 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.30.2
-NEON_SITE = http://www.webdav.org/neon
+NEON_VERSION = 0.32.2
+NEON_SITE = https://notroj.github.io/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
-NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
+NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README.md
 NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
