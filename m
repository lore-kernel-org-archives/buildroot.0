Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81922C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6D541893;
	Wed, 28 Feb 2024 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2iIuCcxPD1E; Wed, 28 Feb 2024 21:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED576418C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED576418C2;
	Wed, 28 Feb 2024 21:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CFB31BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF00581971
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFa24TzBFBi2 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE78D817C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE78D817C3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBD8E87CDB; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:17:00 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 038845825dc7798f5f6ec2111738ea6a3a5debb5
X-Git-Newrev: 3f0c6bf49fa1a415c64d59e8589cc8e5a3b86fd3
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.CBD8E87CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/netatalk: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f0c6bf49fa1a415c64d59e8589cc8e5a3b86fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
