Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF53CC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C30D42C2C;
	Fri, 10 May 2024 21:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLGun8LnBpDx; Fri, 10 May 2024 21:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7013842DA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7013842DA5;
	Fri, 10 May 2024 21:32:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB4941BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3ADB81EDD
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Jcthwu5LRsI for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3673A81EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3673A81EA8
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:32:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15EC686F74; Fri, 10 May 2024 21:32:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:29:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66e3c7b96d5757bef7223e04bbb9f66b48182066
X-Git-Newrev: dd1ea28b07e9b50facbee4aee0254631b9b4fe14
X-Patchwork-Hint: ignore
Message-Id: <20240510213228.15EC686F74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkrb5: bump to 1.21.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0643832969995792490=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0643832969995792490==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd1ea28b07e9b50facbee4aee0254631b9b4fe14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libkrb5/libkrb5.hash | 2 +-
 package/libkrb5/libkrb5.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 22178d0dec..02c0e3396e 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  69f8aaff85484832df67a4bbacd99b9259bd95aab8c651fbbe65cdc9620ea93b  krb5-1.21.tar.gz
+sha256  9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491  krb5-1.21.2.tar.gz
 
 # Hash for license file:
 sha256  0d5373486138cb176c063db98274b4c4ab6ef3518c4191360736384b780306c2  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index c58763eddd..08bc74eb34 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBKRB5_VERSION = 1.21
-LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION)
+LIBKRB5_VERSION_MAJOR = 1.21
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
+LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
 LIBKRB5_LICENSE = MIT, BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, others

--===============0643832969995792490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0643832969995792490==--
