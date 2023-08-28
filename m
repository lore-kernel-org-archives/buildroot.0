Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D76C83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 15:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9EC81AAC;
	Mon, 28 Aug 2023 15:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE9EC81AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEiaEFEc9pvj; Mon, 28 Aug 2023 15:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17066817C0;
	Mon, 28 Aug 2023 15:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17066817C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11E11BF95F
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 15:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F112817C0
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 15:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F112817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qFJxvFpbzNW for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 15:30:02 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BFDE81583
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 15:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BFDE81583
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A5149352BD8B; Mon, 28 Aug 2023 17:29:58 +0200 (CEST)
Date: Mon, 28 Aug 2023 17:29:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZOy9diJAMsHJaqH6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1693236598; bh=8wDEnAR02tgj2c89f2fA99bAGVmZ/WLQynpXrV7VXns=;
 h=Date:From:To:Cc:Subject:From;
 b=smEvokbxjRB0iHQklPXzXTUKsfQDiYMLA7vAttbS7h5nx1XCh8wniF/zGfqOZPnob
 QC0h4ClZX9FqimGtFS4iNeD3mF59qc/uLVhafI0UUNJntXpKFdbfRY7AyTVxsIsLTD
 gzBZXF34vT8pZzUsJ0U6oeRlHNxgROUNG+bjBlcoFB+kQUXuJqjemfb5KHpSKi/5PN
 vWTvsq4psHckyQVqMt92HyX77g8K/aZtGrRhVn06+3X/IfKo2iK1U6Ns20LuZCkZRY
 YNIvXKIG2f9/mabEgAJC6TvVNozwymdl12CrLRB903Qe2bDG7zx8zqszbUmf1Ic8CD
 RqJriMcMyjuNQ==
Subject: [Buildroot] [PATCH/next] package/mutt: bump version to 2.2.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See http://mutt.org/ for any news.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index c475641ab5..78bce76585 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa531b231d58fe1f30ceda0ed626683ea9ebdfb76ce47ef8bb27c2f77422cffb  mutt-2.2.9.tar.gz
+sha256  12325cf66d5ff8ac4bd87fac8db52c869de52dd278fc301cfd57d5a1f9f465cc  mutt-2.2.11.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 5cf1b6bad2..c5e4e4a14e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.9
+MUTT_VERSION = 2.2.11
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
