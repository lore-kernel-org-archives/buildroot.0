Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21681C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:17:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE3961051
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 20:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBE3961051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCDE4045C;
	Sun, 12 Sep 2021 20:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwmKX1AJY7vO; Sun, 12 Sep 2021 20:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226094050F;
	Sun, 12 Sep 2021 20:17:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2C21BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F6016075B
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oTsjXKlpNoR for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A081860762
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 20:15:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9FB078A47C; Sun, 12 Sep 2021 20:13:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:37:09 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 8e469e30f7caec596d9e4a6cdda6fd14ac56b623
X-Git-Newrev: ff75e9e07d8bb70e4c9e5676567bf2a0133d7c28
X-Patchwork-Hint: ignore
Message-Id: <20210912201359.9FB078A47C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/openssl: fix
 spurious spaces
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff75e9e07d8bb70e4c9e5676567bf2a0133d7c28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8b2befcd7475c62f312d6d3b9a9d76f8de6fb062)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssl/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index f69e85978f..f79bac28fa 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -55,8 +55,8 @@ config BR2_PACKAGE_HAS_OPENSSL
 
 config BR2_PACKAGE_PROVIDES_OPENSSL
 	string
-	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
-	default "libressl"  if BR2_PACKAGE_LIBRESSL
+	default "libopenssl" if BR2_PACKAGE_LIBOPENSSL
+	default "libressl" if BR2_PACKAGE_LIBRESSL
 
 endif
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
