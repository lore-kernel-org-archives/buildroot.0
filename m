Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A16C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45968418D5;
	Wed, 28 Feb 2024 21:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6j_M1-braqSC; Wed, 28 Feb 2024 21:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 352B6418C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 352B6418C6;
	Wed, 28 Feb 2024 21:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5071BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4153817C3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dafXoXNc6Yma for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A24817A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9A24817A9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E11BC87CDC; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:20:23 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 6cc9ab7d55c1b0b202f93d6c7d324fe353cf8d37
X-Git-Newrev: c2c908f0c7e3f74df72683121693d045d51dc6f9
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.E11BC87CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/json-c: update
 JSON_C_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2c908f0c7e3f74df72683121693d045d51dc6f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:json-c_project:json-c has been deprecated in favor of
cpe:2.3:a:json-c:json-c in September 2023:

  <cpe-item name="cpe:/a:json-c_project:json-c:0.14" deprecated="true" deprecation_date="2023-09-16T13:05:58.643Z">
    <title xml:lang="en-US">JSON-C Project JSON-C 0.14</title>
      <reference href="https://github.com/json-c/json-c/releases">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:json-c_project:json-c:0.14:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:json-c:json-c:0.14-20200419:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 63118fbb55d3be3fc182470f02fcf7c221ba5ae4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/json-c/json-c.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 517acee4db..68401433b4 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -9,7 +9,7 @@ JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
-JSON_C_CPE_ID_VENDOR = json-c_project
+JSON_C_CPE_ID_VENDOR = json-c
 JSON_C_CONF_OPTS = -DBUILD_APPS=OFF -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
