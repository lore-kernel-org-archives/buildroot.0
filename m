Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC26CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F1E80AA1;
	Sat, 31 Aug 2024 16:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhy1Fj2arNwX; Sat, 31 Aug 2024 16:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB0D80A7C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB0D80A7C;
	Sat, 31 Aug 2024 16:25:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE0C1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A7E080A9B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGBCc1uCsjdQ for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E4E80A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56E4E80A99
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E90C86789; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:22:35 +0200
Subject: [git commit branch/2024.02.x] DEVELOPERS: add Flávio Tapajós for python-paho-mqtt
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4aff9fae454495d071829cbe651643b2fcc94a96
X-Git-Newrev: 7e9676c22a9f36a889a14852185274a3c3079b7b
X-Patchwork-Hint: ignore
Message-Id: <20240831162459.4E90C86789@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0699816237596870838=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0699816237596870838==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7e9676c22a9f36a889a14852185274a3c3079b7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a10979754ffbf41b2fb09da934213b60065c26ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b6ea33233..def588d1ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1071,6 +1071,7 @@ F:	package/python-pymodbus/
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
 F:	board/asus/tinker-s/
+F:	package/python-paho-mqtt/
 F:	package/python-sqlalchemy/
 F:	package/rsyslog/
 

--===============0699816237596870838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0699816237596870838==--
