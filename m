Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A0C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35CF82640;
	Mon, 20 Feb 2023 23:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C35CF82640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4yzUA3Fmx6Q; Mon, 20 Feb 2023 23:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3333825E8;
	Mon, 20 Feb 2023 23:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3333825E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37FD41BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B16C41726
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B16C41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYkKYB5S7TBC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5395741702
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5395741702
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 513BB86495; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:43:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 43c833e6cb44d4ffe59629cd83344caa9f63a0c6
X-Git-Newrev: e7792f539e440d40566bfab3dd86881a8f8edd7a
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.513BB86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tinyxml: fix typo for
 TINYXML_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7792f539e440d40566bfab3dd86881a8f8edd7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyxml/tinyxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index d173254e31..8e706f1a1e 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,7 +12,7 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
-TINYXML_CPE_ID_VENDOT = tinyxml_project
+TINYXML_CPE_ID_VENDOR = tinyxml_project
 
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
