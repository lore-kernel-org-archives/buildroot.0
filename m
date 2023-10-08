Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5512FE95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C0C2821D6;
	Sun,  8 Oct 2023 21:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0C2821D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhZ0a0OGQa4z; Sun,  8 Oct 2023 21:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E4C821BE;
	Sun,  8 Oct 2023 21:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38E4C821BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5501BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBAA860F3E
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAA860F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Py-jMSfKNFBp for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46FDE6101A
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46FDE6101A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32454843F5; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 23:17:38 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5b570f6c74a9427212562fc430810400cd510c84
X-Git-Newrev: 98afa7bc86eb3652e2cc65980bddc602ba9f0bba
X-Patchwork-Hint: ignore
Message-Id: <20231008212753.32454843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: adjust
 Upstream header in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=98afa7bc86eb3652e2cc65980bddc602ba9f0bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:

  package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch:0:
  missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

In:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/4763324039

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d536197234c75d301448369ef47415c79e38a974)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
