Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436D5C54E41
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 125398200D;
	Sat,  9 Mar 2024 13:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QbebRMxb37MX; Sat,  9 Mar 2024 13:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8A6F82037
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A6F82037;
	Sat,  9 Mar 2024 13:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85C211BF853
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7289F81FCB
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-f2rrasXEaz for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6530815AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6530815AD
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B144288167; Sat,  9 Mar 2024 13:39:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Mar 2024 14:37:30 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f742dc5474ec9a426cbc301129e1af1ebaca5e71
X-Git-Newrev: b7e0a3db0f4d6533daed12a9c48404c2a2ba453b
X-Patchwork-Hint: ignore
Message-Id: <20240309133935.B144288167@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] doc/manual: indent the
 CVE example the same as the CVE list item
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7e0a3db0f4d6533daed12a9c48404c2a2ba453b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 949c1a51b7f31982b66efe2d4adc55095a4c7811)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index 76b037f436..935270a19c 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -503,7 +503,7 @@ not and can not work as people would expect it should:
   the package, or when the CVE for some reason does not affect the
   Buildroot package. A Makefile comment must always precede the
   addition of a CVE to this variable. Example:
-
++
 ----------------------
 # 0001-fix-cve-2020-12345.patch
 LIBFOO_IGNORE_CVES += CVE-2020-12345
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
