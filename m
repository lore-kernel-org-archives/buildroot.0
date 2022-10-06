Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2CD83FBD;
	Thu,  6 Oct 2022 18:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C2CD83FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8ILWJeU246J; Thu,  6 Oct 2022 18:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8DA83FBC;
	Thu,  6 Oct 2022 18:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8DA83FBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 060531BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96F85419DA
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F85419DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcRsT7oFSB-H for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B51419E8
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B51419E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 851F68680C; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:58:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30d6b73271de85ba50a7f59fb2cb6c0c0d9f0057
X-Git-Newrev: 1a2baba96255f73c1c87e2d59cfbb13d3203ee5c
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.851F68680C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpica: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a2baba96255f73c1c87e2d59cfbb13d3203ee5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump to version 20220331, the license file is changed as it was
updated to the new release year.

Fixes:
http://autobuild.buildroot.net/results/93ad774a7f69e761952a3a6c92a24de7506e6312/

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 4b6981c602..564e393cb4 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
 sha256  1ccda5c6a08a90b145777df635eb09f995b3472b3128f375009c5a6b01a04c7a  acpica-unix2-20220331.tar.gz
-sha256  c7c5facde0edec64ce403043082a4b288543b9a120d86a23bba3be7585e021aa  source/include/acpi.h
+sha256  40d8e351f8dfdf5340ec76ac28f0c201b825077d7060bb3686ca1112cb26985d  source/include/acpi.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
