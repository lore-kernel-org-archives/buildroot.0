Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC9C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 079D6403B8;
	Wed, 28 Feb 2024 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rs1l08K_3lxO; Wed, 28 Feb 2024 21:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38B65417F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38B65417F9;
	Wed, 28 Feb 2024 21:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFC751BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5436E41610
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vRllzVWWKC1 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65C684174E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65C684174E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FBA787CA0; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:20:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ab793d11dbff02c982f335f237adf420b676dcb1
X-Git-Newrev: 51cf6919d02043d57970a5ebe084868547550756
X-Patchwork-Hint: ignore
Message-Id: <20240228212549.5FBA787CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/flex: update
 FLEX_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=51cf6919d02043d57970a5ebe084868547550756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:flex_project:flex has been deprecated in favor of
cpe:2.3:a:westes:flex in October 2023:

  <cpe-item name="cpe:/a:flex_project:flex:2.6.4" deprecated="true" deprecation_date="2023-10-06T17:12:20.950Z">
    <title xml:lang="en-US">Flex Fast Lexical Analyser 2.6.4</title>
      <reference href="https://github.com/westes/flex/releases">Version</reference>
      <reference href="https://github.com/westes/flex/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:flex_project:flex:2.6.4:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:westes:flex:2.6.4:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c438422d4972f41c0c59d1b701eefd3028abee43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flex/flex.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 85da5ddae8..f2261f2da4 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -9,7 +9,7 @@ FLEX_SITE = https://github.com/westes/flex/files/981163
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
-FLEX_CPE_ID_VENDOR = flex_project
+FLEX_CPE_ID_VENDOR = westes
 # bug does not cause stack overflows in the generated code and has been
 # noted upstream as a bug in the code generator
 FLEX_IGNORE_CVES = CVE-2019-6293
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
