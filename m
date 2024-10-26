Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B001BD10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F581605E0;
	Sat, 26 Oct 2024 14:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoSDe6O8qm-6; Sat, 26 Oct 2024 14:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6942C605E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6942C605E4;
	Sat, 26 Oct 2024 14:31:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F33F62318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E11FD40363
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTipUXKRNrJh for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:31:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7CF3402D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7CF3402D5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:31:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE4A783BEA; Sat, 26 Oct 2024 14:31:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:30:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d40b47866753340b214e811af53e6a95216bbb3
X-Git-Newrev: 9f3e805428302c16769da78ce6604d5db77fbc39
X-Patchwork-Hint: ignore
Message-Id: <20241026143108.CE4A783BEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: fix typo in help text of
 openjdk zero
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f3e805428302c16769da78ce6604d5db77fbc39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: He Haorui <hehaorui1999@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 25d6960ecf..78775370ca 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -148,7 +148,7 @@ config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
 	select BR2_PACKAGE_LIBFFI
 	help
 	  A non-assembler variant with wide arch support, however
-	  performance is less then client/server.
+	  performance is less than client/server.
 
 	  http://openjdk.java.net/projects/zero
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
