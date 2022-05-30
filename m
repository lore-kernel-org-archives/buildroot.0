Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0741C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 19:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6821441B42;
	Mon, 30 May 2022 19:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBB-eJwqojKV; Mon, 30 May 2022 19:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BBF41A6F;
	Mon, 30 May 2022 19:05:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8561BF2AB
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F3F60FCF
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 19:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTN5Hi-H-8zj for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 19:05:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74E1660B04
 for <buildroot@buildroot.org>; Mon, 30 May 2022 19:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B38F97F9C2; Mon, 30 May 2022 18:54:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 21:05:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32f93b0ef2c602dfa1f5b243ba865d5b16e2fa33
X-Git-Newrev: 3e50b5fe2632a3081fd3f6574a5e9525fa897fdb
X-Patchwork-Hint: ignore
Message-Id: <20220530185423.B38F97F9C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/elf2flt: update
 AUTORECONF comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e50b5fe2632a3081fd3f6574a5e9525fa897fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The patch that causes the need for AUTORECONF = YES has been renamed a
while ago, fix the corresponding comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/elf2flt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 11cacaf9e0..9230e3ce1a 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -11,7 +11,7 @@ ELF2FLT_LICENSE_FILES = LICENSE.TXT
 
 HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
 
-# 0003-elf2flt-handle-binutils-2.34.patch
+# 0001-elf2flt-handle-binutils-2.34.patch
 HOST_ELF2FLT_AUTORECONF = YES
 
 # It is not exactly a host variant, but more a cross variant, which is
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
