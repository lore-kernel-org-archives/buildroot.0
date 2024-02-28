Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675DFC54E41
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3191B416EA;
	Wed, 28 Feb 2024 21:26:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REjOdSZOI6fA; Wed, 28 Feb 2024 21:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0422E417C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0422E417C1;
	Wed, 28 Feb 2024 21:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC3551BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2183741687
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJxwEdJ315Ep for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CD241722
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CD241722
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E18F87CA0; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:16:56 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: caf50ae7504a3bba9d90ed9aa6096d42f2737c6f
X-Git-Newrev: 9d4262cf2a8fe5157a495e58e4098c3c57a6191a
X-Patchwork-Hint: ignore
Message-Id: <20240228212549.3E18F87CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/netatalk: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d4262cf2a8fe5157a495e58e4098c3c57a6191a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:netatalk_project:netatalk has been deprecated in favor of
cpe:2.3:a:netatalk:netatalk in September 2023:

  <cpe-item name="cpe:/a:netatalk_project:netatalk:3.1.13" deprecated="true" deprecation_date="2023-09-29T11:15:00.340Z">
      <reference href="https://sourceforge.net/projects/netatalk/files/netatalk/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:netatalk_project:netatalk:3.1.13:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:netatalk:netatalk:3.1.13:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5ae38ec621f4821dd3eaf7ad3b0174cad21116ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
