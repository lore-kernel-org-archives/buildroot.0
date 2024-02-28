Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAABC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97243417CC;
	Wed, 28 Feb 2024 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOAaQ8-kpUGq; Wed, 28 Feb 2024 21:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E0D41839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E0D41839;
	Wed, 28 Feb 2024 21:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A59321BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 034D68190B
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdUkuGstXPQr for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14F5282181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14F5282181
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1164687CE3; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:21:24 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 08dfcc690d107aff06046d02dea091fe4ee5a3d6
X-Git-Newrev: 164e1ecd9af059a0d579046d4e7730f40fe4ef1e
X-Patchwork-Hint: ignore
Message-Id: <20240228212553.1164687CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/c-ares: update
 C_ARES_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=164e1ecd9af059a0d579046d4e7730f40fe4ef1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:c-ares_project:c-ares has been deprecated in favor of
cpe:2.3:a:c-ares:c-ares in September 2023:

  <cpe-item name="cpe:/a:c-ares_project:c-ares:1.17.1" deprecated="true" deprecation_date="2023-09-15T11:42:40.183Z">
    <title xml:lang="en-US">C-ares Project C-ares 1.17.1</title>
      <reference href="https://github.com/c-ares/c-ares/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:c-ares_project:c-ares:1.17.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:c-ares:c-ares:1.17.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ae2baf1771cbbebae65e32397480deec6bf879e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
