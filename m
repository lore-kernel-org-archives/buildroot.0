Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D829C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 18:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFDE41886;
	Fri,  2 Jun 2023 18:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFDE41886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyD13wuNPC-h; Fri,  2 Jun 2023 18:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5312E4187F;
	Fri,  2 Jun 2023 18:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5312E4187F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8A01BF2F2
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 18:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C5140A8D
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 18:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C5140A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYuKjFMDIfMO for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DAFD40423
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DAFD40423
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C24B86B6A; Fri,  2 Jun 2023 18:56:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 20:50:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 073d6dbcb19bd7bce3be203ccfa88524ea61af6e
X-Git-Newrev: 08e92de0447591f61266ee10f982f4ad0545154d
X-Patchwork-Hint: ignore
Message-Id: <20230602185603.4C24B86B6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update etienne carriere e-mail
 address
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

commit: https://git.buildroot.net/buildroot/commit/?id=08e92de0447591f61266ee10f982f4ad0545154d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updates my e-mail address.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e76717e845..7aa5980df7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,7 +862,7 @@ F:	package/szip/
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	package/python-kiwisolver/
 
-N:	Etienne Carriere <etienne.carriere@linaro.org>
+N:	Etienne Carriere <etienne.carriere@foss.st.com>
 F:	boot/optee-os/
 F:	package/optee-client/
 F:	package/optee-examples/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
