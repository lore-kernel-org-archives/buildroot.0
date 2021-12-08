Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5BAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BB0C84C0F;
	Wed,  8 Dec 2021 08:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-GatkVA2oId; Wed,  8 Dec 2021 08:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E314983EFC;
	Wed,  8 Dec 2021 08:42:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82BED1BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA4E40147
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p26V52KohI4u for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49079400EB
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A84E81D55; Wed,  8 Dec 2021 08:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:35:09 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d78f9d568cff8f026459bb50233c115f1b90a02a
X-Git-Newrev: 1cc84a71cc00331708fd6fc11694f2b64d955345
X-Patchwork-Hint: ignore
Message-Id: <20211208083455.2A84E81D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/asterisk: replace
 BSD-{3, 4}c
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cc84a71cc00331708fd6fc11694f2b64d955345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Replace BSD-{3,4}c by BSD-{3,4}-Clause

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e22572d1a109f4010c552d72e91da86a3fd1e3fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 7451a796b8..6852a13559 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -14,7 +14,7 @@ ASTERISK_EXTRA_DOWNLOADS = \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-core-sounds-en-gsm-1.6.1.tar.gz \
 	$(ASTERISK_SOUNDS_BASE_URL)/asterisk-moh-opsound-wav-2.03.tar.gz
 
-ASTERISK_LICENSE = GPL-2.0, BSD-3c (SHA1, resample), BSD-4c (db1-ast)
+ASTERISK_LICENSE = GPL-2.0, BSD-3-Clause (SHA1, resample), BSD-4-Clause (db1-ast)
 ASTERISK_LICENSE_FILES = \
 	COPYING \
 	main/sha1.c \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
