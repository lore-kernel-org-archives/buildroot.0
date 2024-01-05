Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165D5C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C40140141;
	Fri,  5 Jan 2024 08:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C40140141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WKipKnmrTYW; Fri,  5 Jan 2024 08:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2A843553;
	Fri,  5 Jan 2024 08:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F2A843553
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6284E1BF30D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B06B83D81
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B06B83D81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqwoLpkPXuCc for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F9B783D79
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9B783D79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE7084330; Fri,  5 Jan 2024 08:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 09:45:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5594570a0c2ebb162ae304d7dca92aadf8f439ad
X-Git-Newrev: 2d0327c802557bdf892a6aaf3abac57ed15fd80e
X-Patchwork-Hint: ignore
Message-Id: <20240105084541.4CE7084330@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/easy-rsa: bump to version 3.1.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2d0327c802557bdf892a6aaf3abac57ed15fd80e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/OpenVPN/easy-rsa/blob/v3.1.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/easy-rsa/easy-rsa.hash | 2 +-
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index 5be651bde0..de19d8b693 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,5 +1,5 @@
 # Locally computed: (after verifying gpg sig)
-sha512  8c8d1f4baf90475d4cce334d116b7f12b82687157796b25560600b5098769226ae2f60f02982c75266b625d66b465360ffa815260ad44850923e3fbc9ba8540a  EasyRSA-3.1.1.tgz
+sha512  eb3978b07c313af148c6ae94b60e213c8b810c5974242855560b22ad949cfc094d311e4cc04a95ddd0f817bfec54971caa5289e5fc532895e1e58499d265c705  EasyRSA-3.1.7.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 4ea45506dd..7266943f5b 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.1.1
+EASY_RSA_VERSION = 3.1.7
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
