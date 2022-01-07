Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C452C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFD0429BB;
	Fri,  7 Jan 2022 20:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yr1_xoHwXTjL; Fri,  7 Jan 2022 20:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 779DC429A2;
	Fri,  7 Jan 2022 20:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80FCB1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6341B404C5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESML58_4NP1G for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E61A404C9
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:34:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B2E97834A3; Fri,  7 Jan 2022 20:28:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:33:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cb3475c5ad580adb9b783fd9684396281bca1fd
X-Git-Newrev: f7f2b73fa510fd247aaadcf250d154893bde044d
X-Patchwork-Hint: ignore
Message-Id: <20220107202839.B2E97834A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libeXosip2: bump to version 5.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f2b73fa510fd247aaadcf250d154893bde044d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.savannah.nongnu.org/cgit/exosip.git/tree/ChangeLog?h=5.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libeXosip2/libeXosip2.hash | 2 +-
 package/libeXosip2/libeXosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index b88a5b4c21..5cfee3ab29 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  87256b45a406f3c038e1e75e31372d526820366527c2af3bb89329bafd87ec42  libexosip2-5.2.1.tar.gz
+sha256  5b7823986431ea5cedc9f095d6964ace966f093b2ae7d0b08404788bfcebc9c2  libexosip2-5.3.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index b550e293ae..86d821b02f 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 5.2.1
+LIBEXOSIP2_VERSION = 5.3.0
 # Since version 5.0, letter 'X' in library's name is in lower case
 LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
