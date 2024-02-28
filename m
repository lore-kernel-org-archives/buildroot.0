Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB13FC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CD5417BE;
	Wed, 28 Feb 2024 21:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xz4e4OhwgVG5; Wed, 28 Feb 2024 21:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D747417C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D747417C7;
	Wed, 28 Feb 2024 21:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 955241BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F289C81A34
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtYl2-Yr1Ysk for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C2B81B8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C2B81B8A
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F04A087CDB; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:20:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c2c908f0c7e3f74df72683121693d045d51dc6f9
X-Git-Newrev: 885708480740d1a8ec71dcdfc5397c6f915f2502
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.F04A087CDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/flex: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=885708480740d1a8ec71dcdfc5397c6f915f2502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
index f1e731ce2e..c6417fea83 100644
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
