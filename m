Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68AC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39AC84F22;
	Sun,  4 Feb 2024 10:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39AC84F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3b_WSzV0KQBK; Sun,  4 Feb 2024 10:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281B884F11;
	Sun,  4 Feb 2024 10:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281B884F11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2AFD1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984074193E
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 984074193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMUDEbuPTmZx for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D749A41921
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D749A41921
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5469868D9; Sun,  4 Feb 2024 10:17:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92f3f04146654f77add9fc14c18d054783006108
X-Git-Newrev: 5ae38ec621f4821dd3eaf7ad3b0174cad21116ff
X-Patchwork-Hint: ignore
Message-Id: <20240204101728.C5469868D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netatalk: update
 NETATALK_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ae38ec621f4821dd3eaf7ad3b0174cad21116ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:netatalk_project:netatalk has been deprecated in favor of
cpe:2.3:a:netatalk:netatalk in September 2023:

  <cpe-item name="cpe:/a:netatalk_project:netatalk:3.1.13" deprecated="true" deprecation_date="2023-09-29T11:15:00.340Z">
      <reference href="https://sourceforge.net/projects/netatalk/files/netatalk/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:netatalk_project:netatalk:3.1.13:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:netatalk:netatalk:3.1.13:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netatalk/netatalk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index a47bfa7e84..40e64dabeb 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -12,7 +12,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
-NETATALK_CPE_ID_VENDOR = netatalk_project
+NETATALK_CPE_ID_VENDOR = netatalk
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
