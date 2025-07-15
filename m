Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B920C83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EF6140C4E;
	Wed, 16 Jul 2025 18:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoWUFw9X4oFi; Wed, 16 Jul 2025 18:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD587415C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD587415C1;
	Wed, 16 Jul 2025 18:38:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 540DB1514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFAD40F39
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5PIicKMdtJo for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED5EE40CED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED5EE40CED
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E95BA86450; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5fe7e96397b672e91458c228a65bc2bb5f7524a
X-Git-Newrev: 6a192b0d282cb85ff4272e26df082f5eacd8e3a6
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.E95BA86450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: bump to version 2025.06.11
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a192b0d282cb85ff4272e26df082f5eacd8e3a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/passt/passt.hash | 2 +-
 package/passt/passt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/passt/passt.hash b/package/passt/passt.hash
index 011ba84b89..af55658594 100644
--- a/package/passt/passt.hash
+++ b/package/passt/passt.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f76c12e0535b9f6af59ee747d8ed7a8f691bb1ac7429225484788f0bc6e23dac  passt-2025_02_17.a1e48a0-git4.tar.gz
+sha256  ac2562e4b589c518b6e30101daaa430691da2605ccc2988d0b704079c2aea4f3  passt-2025_06_11.0293c6f-git4.tar.gz
 sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
index 5b9fcd831f..8f9ab937b1 100644
--- a/package/passt/passt.mk
+++ b/package/passt/passt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PASST_VERSION = 2025_02_17.a1e48a0
+PASST_VERSION = 2025_06_11.0293c6f
 PASST_SITE = https://passt.top/passt
 PASST_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
