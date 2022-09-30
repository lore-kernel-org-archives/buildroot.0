Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C14AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 14:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A33541607;
	Fri, 30 Sep 2022 14:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A33541607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBWAkBTdtjgN; Fri, 30 Sep 2022 14:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B87F8415D8;
	Fri, 30 Sep 2022 14:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87F8415D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D63F21C2745
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFBCD81A73
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFBCD81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Q8dVBsLutyl for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1611B81846
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1611B81846
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 047DA8650D; Fri, 30 Sep 2022 14:03:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 16:02:36 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2c106bcaeb503c93b0bb7f2499716b9118aaba01
X-Git-Newrev: dff80c13d5df24b1152dcf83c85bcf28a3f30a7c
X-Patchwork-Hint: ignore
Message-Id: <20220930140334.047DA8650D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723ds: add
 missing hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=dff80c13d5df24b1152dcf83c85bcf28a3f30a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 71d35a41640bc4cef818b0d303478595e03d895f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
