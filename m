Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2F3C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78BA482284;
	Fri, 25 Aug 2023 16:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BA482284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11SENZmuCXvt; Fri, 25 Aug 2023 16:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C723B83B98;
	Fri, 25 Aug 2023 16:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C723B83B98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26D391BF995
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B80341969
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B80341969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wR1L6hUYQn8z for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1715941939
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1715941939
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 016E886368; Fri, 25 Aug 2023 16:49:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:44:37 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: afef2ea19031d541f74a4e5c06b85596a1a3e192
X-Git-Newrev: 42a36db68e7bedd7d21987d0b87d971ee8c65c6c
X-Patchwork-Hint: ignore
Message-Id: <20230825164931.016E886368@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] DEVELOPERS: update entry
 for Daniel Lang
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

commit: https://git.buildroot.net/buildroot/commit/?id=42a36db68e7bedd7d21987d0b87d971ee8c65c6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a1a2bfa429ebeb061059a00fdb6c2f9def494c78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index adbf85ab17..c4a2557aba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -649,7 +649,7 @@ F:	package/odroidc2-firmware/
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
-N:	Daniel Lang <d.lang@abatec.at>
+N:	Daniel Lang <dalang@gmx.at>
 F:	package/atkmm/
 F:	package/atkmm2_28/
 F:	package/cairomm/
@@ -663,6 +663,7 @@ F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
+F:	package/sam-ba/
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
