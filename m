Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A3C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7D941961;
	Fri, 28 Jul 2023 20:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D7D941961
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDVZFiCtO4iF; Fri, 28 Jul 2023 20:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A4574218B;
	Fri, 28 Jul 2023 20:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4574218B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A26B81BF995
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3498450A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C3498450A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_4Ua6tU17Dr for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9798684490
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9798684490
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84CF583954; Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:09:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d37a8f3a2e2a387b102f2982d51aca78bcc09727
X-Git-Newrev: d536197234c75d301448369ef47415c79e38a974
X-Patchwork-Hint: ignore
Message-Id: <20230728201025.84CF583954@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: adjust Upstream header in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d536197234c75d301448369ef47415c79e38a974
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch:0:
  missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

In:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/4763324039

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
index e7158a2b3f..4f53356ffc 100644
--- a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
+++ b/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
@@ -46,7 +46,7 @@ Fixes: https://github.com/golang/go/issues/61620
 
 ---
 
-Upstream PR: https://github.com/golang/go/pull/61621
+Upstream: https://github.com/golang/go/pull/61621
 
 Signed-off-by: Christian Stewart <christian@aperture.us>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
