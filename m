Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E29C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6E35401F7;
	Mon, 29 Nov 2021 21:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xx4l9xV9Fl6; Mon, 29 Nov 2021 21:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B86A3401BD;
	Mon, 29 Nov 2021 21:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1A2A1BF97E
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DB2B60BC5
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teiYLMVKkGe6 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC8C60A86
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 49ECE9126E; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:32:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49d4e26358fb785b6db2bac59bce6242aec1fe56
X-Git-Newrev: fd3f8ae51db77306c79a466125b182cd46230c42
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.49ECE9126E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd3f8ae51db77306c79a466125b182cd46230c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
4f1c340311768fa3a94605086e5c99cb1733ce93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index a8f9127c94..0a26fb38ea 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -243,7 +243,7 @@ ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
 else
-ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
+ASTERISK_CONF_OPTS += --without-speex --without-speexdsp
 endif
 
 # asterisk needs an openssl-enabled libsrtp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
