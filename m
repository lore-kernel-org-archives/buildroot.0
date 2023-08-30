Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E999C83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A315141902;
	Wed, 30 Aug 2023 06:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A315141902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Sk8E08IZPAk; Wed, 30 Aug 2023 06:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E0B418E7;
	Wed, 30 Aug 2023 06:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E0B418E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E35A1BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 732A460E96
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732A460E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8b-x0jP-BsU for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4285D60FE2
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4285D60FE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3045F86518; Wed, 30 Aug 2023 06:27:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:16:14 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 69b34c93ecbd33e2dbb8a35512494007364c1a62
X-Git-Newrev: ea6d79c5e36e4d283e9b4a6c5b3fc290f4c6583f
X-Patchwork-Hint: ignore
Message-Id: <20230830062759.3045F86518@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: update email
 address for Pieterjan Camerlynck
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea6d79c5e36e4d283e9b4a6c5b3fc290f4c6583f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit abd0b56294e77098e233eff0c906bde6b7d7f2f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98e34cf5bb..1f30279d98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2384,7 +2384,7 @@ F:	package/tree/
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
 
-N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
