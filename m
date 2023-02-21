Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0F6C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9471382391;
	Tue, 21 Feb 2023 08:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9471382391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3928P4aB8ebQ; Tue, 21 Feb 2023 08:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE298238C;
	Tue, 21 Feb 2023 08:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE298238C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F831BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7543C417D8
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7543C417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LF_knbMWV-7y for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:58:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 882274030F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882274030F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7341F865DC; Tue, 21 Feb 2023 08:58:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:56:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 762b3f743dd0687841a2edb64c4b56a522058d5e
X-Git-Newrev: 9d02eab8bcf57495c8c7675021c69fc2e3edd508
X-Patchwork-Hint: ignore
Message-Id: <20230221085829.7341F865DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Julien Olivain for
 package/openmpi
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d02eab8bcf57495c8c7675021c69fc2e3edd508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package has been orphan since commit ee58353 (2018-12-22).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2eff5b23ef..6256576e02 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1691,6 +1691,7 @@ F:	package/highway/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
+F:	package/openmpi/
 F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
