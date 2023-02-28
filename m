Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694A8C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110BA6113B;
	Tue, 28 Feb 2023 15:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110BA6113B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPbf1fbsb6I8; Tue, 28 Feb 2023 15:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 522FC61186;
	Tue, 28 Feb 2023 15:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 522FC61186
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 827B31BF95D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B6EA403ED
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6EA403ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CC4t5IVJM_RE for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F77D402E5
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F77D402E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48B3D86CE8; Tue, 28 Feb 2023 15:53:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:46:51 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 348b2e25df76b9a603639dc9a99c03442ab673e1
X-Git-Newrev: 10ae94b6bbfac57c23508129b942f052f0797dce
X-Patchwork-Hint: ignore
Message-Id: <20230228155307.48B3D86CE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/xz: bump to
 version 5.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=10ae94b6bbfac57c23508129b942f052f0797dce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit be3a6bf2e7130b084ec4ed65274ff7c4bf67510c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xz/xz.hash | 3 ++-
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3aa68791fd..1153e02b4d 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256  b65f1d0c2708e57716f4dd2216989a73847ac6fdb4168ffceb155767e22b834b  xz-5.2.7.tar.bz2
+# https://tukaani.org/xz/xz-5.2.10.tar.bz2.sig
+sha256  01b71df61521d9da698ce3c33148bff06a131628ff037398c09482f3a26e5408  xz-5.2.10.tar.bz2
 
 # Hash for license files
 sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 004eea94b2..0120d23b85 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.7
+XZ_VERSION = 5.2.10
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
