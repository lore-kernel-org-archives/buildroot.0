Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B70C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E0A611C4
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40E0A611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3A226173C;
	Fri,  5 Nov 2021 16:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZbq5jjwuD5P; Fri,  5 Nov 2021 16:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B13F61710;
	Fri,  5 Nov 2021 16:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97BE61BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86DE36F924
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsnBCP_MtDzO for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D8B61579
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0E818AC06; Fri,  5 Nov 2021 16:16:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:16:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56ef64d3d266ac471d07fe64a4472cbba257a83d
X-Git-Newrev: c4b8fa25e78f096459fceb0c50c0447986ed8822
X-Patchwork-Hint: ignore
Message-Id: <20211105161639.F0E818AC06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyssh: bump to version 20210601
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4b8fa25e78f096459fceb0c50c0447986ed8822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/janmojzis/tinyssh/compare/7e2b4025bf3a2dae4c6617e3eb39df4bcde37454...20210601

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyssh/tinyssh.hash | 2 +-
 package/tinyssh/tinyssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 99ee4afaff..30b5d13419 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  65a7dc785861a09399419a1e7c42cddf66f32dc233a33277327b11f1bd8a772c  tinyssh-7e2b4025bf3a2dae4c6617e3eb39df4bcde37454.tar.gz
+sha256  2a051437878998c7782d9d38ef13e5e7a76435ae6b9c3e9ec492c3a567bd6314  tinyssh-20210601.tar.gz
 sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 6f22be6c52..05716bcfe1 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 7e2b4025bf3a2dae4c6617e3eb39df4bcde37454
+TINYSSH_VERSION = 20210601
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
 TINYSSH_LICENSE = Public Domain, CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
