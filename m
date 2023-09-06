Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D1EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325E7401FB;
	Wed,  6 Sep 2023 20:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325E7401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShgibN0ryNMG; Wed,  6 Sep 2023 20:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF594019F;
	Wed,  6 Sep 2023 20:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AF594019F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56EC11BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D9A882095
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9A882095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsiVT9z9gSEf for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A1481FB7
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A1481FB7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A129869E1; Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 22:56:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8ce1deff96c48a5d5dacf0ab82d9bce92c8cc6c
X-Git-Newrev: 8c79ba009d66aa0998b15beb75836c35d521ebd2
X-Patchwork-Hint: ignore
Message-Id: <20230906205809.5A129869E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2023.08
 announcement link
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c79ba009d66aa0998b15beb75836c35d521ebd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 2983d385b2..1eeb162e10 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2023.08 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/878r9jghcb.fsf@48ers.dk/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2023.08.tar.xz">2023.08 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
