Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712A1C001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F8DA708D1;
	Sat, 21 Oct 2023 21:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F8DA708D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j00VfkvOcRw5; Sat, 21 Oct 2023 21:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77AFB708D2;
	Sat, 21 Oct 2023 21:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77AFB708D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 575E61BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FB0C708D2
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB0C708D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsnQ8Kx7eHGj for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 21:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 328DE708D1
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 21:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 328DE708D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFB4985C11; Sat, 21 Oct 2023 21:31:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Oct 2023 23:30:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23edf9837c93445ff32db718b1ab6b0baa32c7a7
X-Git-Newrev: f685549b19d4a728f824923e50c828d8b1f1e94e
X-Patchwork-Hint: ignore
Message-Id: <20231021213109.EFB4985C11@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f685549b19d4a728f824923e50c828d8b1f1e94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/migrating.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 21277f947b..c0f89cbf07 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -105,7 +105,7 @@ Before Buildroot 2023.11, it was possible (but undocumented and unused)
 to apply architecture-specific patches, by prefixing the patch filename
 with the architecture, e.g. `0001-some-changes.patch.arm` and such a
 patch would only be applied for that architecture. With Buildroot 2023.11,
-this is no longer supported, and such patches are now longer applied at
+this is no longer supported, and such patches are no longer applied at
 all.
 
 If you still need per-architecture patches, then you may provide a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
