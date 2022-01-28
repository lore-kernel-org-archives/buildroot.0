Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5EBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D55400CF;
	Fri, 28 Jan 2022 16:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvoqJSVOl9S9; Fri, 28 Jan 2022 16:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D029C40499;
	Fri, 28 Jan 2022 16:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA4D01C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C33274099B
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnrqvzlqAxqu for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 16:53:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C0AA4098E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 16:53:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D9A2C82707; Fri, 28 Jan 2022 16:46:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 17:53:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 75d2730ac1e75603509b72d711d1003799b6cdd1
X-Git-Newrev: 8af955d48aaaaa5caca577d804e0780ad40ed5ff
X-Patchwork-Hint: ignore
Message-Id: <20220128164633.D9A2C82707@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/open62541: add
 OPEN62541_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=8af955d48aaaaa5caca577d804e0780ad40ed5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:open62541:open62541 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen62541%3Aopen62541

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 88606bd9eb4cc244388a3dec70a21d54ee3fe352)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open62541/open62541.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 102e09a429..8adf09a79d 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -12,6 +12,7 @@ OPEN62541_GIT_SUBMODULES = YES
 OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
+OPEN62541_CPE_ID_VENDOR = open62541
 
 # Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
