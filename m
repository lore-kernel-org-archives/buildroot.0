Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9918C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6498840A00;
	Fri, 23 Sep 2022 21:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6498840A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WR2gjq25b3yX; Fri, 23 Sep 2022 21:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EE540992;
	Fri, 23 Sep 2022 21:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EE540992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6302E1BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F08E812D2
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F08E812D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnvbPPS_B_bD for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:43:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF2C812CF
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF2C812CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56F4F85F2D; Fri, 23 Sep 2022 21:43:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:43:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 003ed345b1c4f1c11feecca68bca37bf871001af
X-Git-Newrev: 71d35a41640bc4cef818b0d303478595e03d895f
X-Patchwork-Hint: ignore
Message-Id: <20220923214333.56F4F85F2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: add missing hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=71d35a41640bc4cef818b0d303478595e03d895f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8723ds/rtl8723ds.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
new file mode 100644
index 0000000000..440ce75ef4
--- /dev/null
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cc5dcf9d17cefabfeba3e68671367c7d69091936e40f71dc5e1165c61195a9fb  rtl8723ds-76146e85847beb2427b1d4958fa275822f2b04ab.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
