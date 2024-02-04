Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F73C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A4618516E;
	Sun,  4 Feb 2024 10:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4618516E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgVhDrMDvWL9; Sun,  4 Feb 2024 10:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E8F84FFE;
	Sun,  4 Feb 2024 10:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9E8F84FFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD3F61BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8335341923
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8335341923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndUsCxy88NJa for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 181154193B
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 181154193B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 079EB868D9; Sun,  4 Feb 2024 10:17:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:16:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 363b4ebf1aaf4821c0c49713eba71937bd5639ca
X-Git-Newrev: ae2baf1771cbbebae65e32397480deec6bf879e4
X-Patchwork-Hint: ignore
Message-Id: <20240204101729.079EB868D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: update C_ARES_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae2baf1771cbbebae65e32397480deec6bf879e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:c-ares_project:c-ares has been deprecated in favor of
cpe:2.3:a:c-ares:c-ares in September 2023:

  <cpe-item name="cpe:/a:c-ares_project:c-ares:1.17.1" deprecated="true" deprecation_date="2023-09-15T11:42:40.183Z">
    <title xml:lang="en-US">C-ares Project C-ares 1.17.1</title>
      <reference href="https://github.com/c-ares/c-ares/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:c-ares_project:c-ares:1.17.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:c-ares:c-ares:1.17.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/c-ares/c-ares.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 7a49b2639a..586fde9afb 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,7 +10,7 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
-C_ARES_CPE_ID_VENDOR = c-ares_project
+C_ARES_CPE_ID_VENDOR = c-ares
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
