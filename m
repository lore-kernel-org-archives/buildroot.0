Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D9C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 233E541BBA;
	Thu, 29 Feb 2024 15:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6G058UiwM7Gg; Thu, 29 Feb 2024 15:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E8B41BBB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E8B41BBB;
	Thu, 29 Feb 2024 15:58:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 433701BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 315C582925
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ArDQxKPtFFYG for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C111982923
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C111982923
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE55987DAE; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:44:55 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: dbf74002deaad62ea5b4b3b699c27089d354c002
X-Git-Newrev: 13b9d086cd7e04b2382c052535cfcb42dd6ceda0
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.BE55987DAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/lua-http: set CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=13b9d086cd7e04b2382c052535cfcb42dd6ceda0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:daurnimator:lua-http is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F210C8BC-78BB-4D10-BAB7-AC624543764E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ccf4048e43b022feba225b976e55ed3e503d424)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-http/lua-http.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index 7fbb09038e..df3e2c0059 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -10,5 +10,7 @@ LUA_HTTP_NAME_UPSTREAM = http
 LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
 LUA_HTTP_LICENSE = MIT
 LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
+LUA_HTTP_CPE_ID_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)
+LUA_HTTP_CPE_ID_VENDOR = daurnimator
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
