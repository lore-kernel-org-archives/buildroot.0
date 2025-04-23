Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065D9C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 18:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC30C412A5;
	Wed, 23 Apr 2025 18:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgGPieecusb9; Wed, 23 Apr 2025 18:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C065941296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C065941296;
	Wed, 23 Apr 2025 18:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B42819F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D54841813
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LyHBsXI6eNf for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 18:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D317400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D317400D8
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:46:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33178861F6; Wed, 23 Apr 2025 18:46:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 20:45:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a41ebd6ca1129b9945da8d5ae990b79a13f8e49d
X-Git-Newrev: cd6141ab150e504283791730fad35cb31123d002
X-Patchwork-Hint: ignore
Message-Id: <20250423184611.33178861F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Jugurtha BELKALEM
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============0654756950773968582=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0654756950773968582==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd6141ab150e504283791730fad35cb31123d002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Jugurtha's email address is bounding:

 550 5.1.1 The email account that you tried to reach does not exist. Please try double-checking the recipient's email address for typos or unnecessary spaces.

Remove it from the DEVELOPERS file so that utils/get-developers
doesn't send emails to non-existent addresses.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6c71aacc5e..a692a9779c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,15 +1768,6 @@ F:	package/unclutter-xfixes/
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
-N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
-F:	package/bcc/
-F:	package/python-aiofiles/
-F:	package/python-crayons/
-F:	package/python-cycler/
-F:	package/python-matplotlib/
-F:	package/python-opcua-asyncio/
-F:	package/python-piexif/
-
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
 

--===============0654756950773968582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0654756950773968582==--
