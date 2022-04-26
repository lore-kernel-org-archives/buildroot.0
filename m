Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 692F16111C;
	Tue, 26 Apr 2022 20:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YqzDhMIu2loI; Tue, 26 Apr 2022 20:50:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88708610FC;
	Tue, 26 Apr 2022 20:50:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF2431BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6BC483E60
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qt785HtPCJUv for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4408583E49
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AE65E844EA; Tue, 26 Apr 2022 20:39:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 22:40:43 +0200
Subject: [git commit branch/2022.02.x] DEVELOPERS: drop Mylène Josserand
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7813d493b52006b7aae49a398dac35de14c854bc
X-Git-Newrev: 5d58fb7df673637199ec10070080e0d8d9978f50
X-Patchwork-Hint: ignore
Message-Id: <20220426203953.AE65E844EA@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4476268651705847842=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4476268651705847842==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d58fb7df673637199ec10070080e0d8d9978f50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Her e-mail address at Collabora is bouncing:

host bhuna.collabora.co.uk[/private/dovecot-lmtp] said: 550 5.1.1
<mylene.josserand@collabora.com> User doesn't exist: mylene.josserand@collabora.com

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a9157705a5fec20a5a3aa47f7ea6bf4c95942ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26719370bd..175340cd99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2069,9 +2069,6 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
-N:	Mylène Josserand <mylene.josserand@collabora.com>
-F:	package/rtl8723bu/
-
 N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/

--===============4476268651705847842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4476268651705847842==--
