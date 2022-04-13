Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 12:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA9060E41;
	Wed, 13 Apr 2022 12:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBK76niTXsJl; Wed, 13 Apr 2022 12:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8268A610DC;
	Wed, 13 Apr 2022 12:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8994E1BF426
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 12:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84BDD81B25
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyTYVB1aLXjN for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 12:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2E4982BC8
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 12:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7233583C28; Wed, 13 Apr 2022 12:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 14:09:07 +0200
Subject: [git commit] DEVELOPERS: drop Mylène Josserand
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b718adee4bea908a5d810e74e6e3a83379d2ee4
X-Git-Newrev: 4a9157705a5fec20a5a3aa47f7ea6bf4c95942ae
X-Patchwork-Hint: ignore
Message-Id: <20220413120023.7233583C28@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============1270496282533587053=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1270496282533587053==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4a9157705a5fec20a5a3aa47f7ea6bf4c95942ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Her e-mail address at Collabora is bouncing:

host bhuna.collabora.co.uk[/private/dovecot-lmtp] said: 550 5.1.1
<mylene.josserand@collabora.com> User doesn't exist: mylene.josserand@collabora.com

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a87cceaef..ca9decb58f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2078,9 +2078,6 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
-N:	Mylène Josserand <mylene.josserand@collabora.com>
-F:	package/rtl8723bu/
-
 N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/

--===============1270496282533587053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1270496282533587053==--
