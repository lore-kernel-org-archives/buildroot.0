Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26ADEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 15:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022AC60BBA;
	Sun, 16 Jul 2023 15:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 022AC60BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dslRNY98xBtO; Sun, 16 Jul 2023 15:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8738E60B92;
	Sun, 16 Jul 2023 15:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8738E60B92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 987401BF35B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 15:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCD140930
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 15:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCD140930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmMfgP9PTH0U for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 15:56:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703C34060F
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 15:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 703C34060F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C06E8692A; Sun, 16 Jul 2023 15:56:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 17:52:34 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 55ea70d56dfeb05aee5bef63950683de51fdb85a
X-Git-Newrev: 22c14e41b4203866df45b9dcf4b28289a6653773
X-Patchwork-Hint: ignore
Message-Id: <20230716155640.5C06E8692A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/freetype: bump
 version to 2.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=22c14e41b4203866df45b9dcf4b28289a6653773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22c6344c71d6a88fc5492dc4b911b581cdcd9480)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 60eb8dbb1d..ea03526c99 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.0/
-sha1  6393c1451c2f1c5f83aed5ea92d280af078e27d9  freetype-2.13.0.tar.xz
-sha256  5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c  freetype-2.13.0.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.1/
+sha1  af9b6b754320a0526179f166e3f8cffce78526ca  freetype-2.13.1.tar.xz
+sha256  ea67e3b019b1104d1667aa274f5dc307d8cbd606b399bc32df308a77f1a564bf  freetype-2.13.1.tar.xz
 
 # Locally calculated
 sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 4d7c4cd0d5..c6bc0673f6 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.0
+FREETYPE_VERSION = 2.13.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
