Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6AFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D517E402F3;
	Sat, 15 Jan 2022 09:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43TYsXKi4DBF; Sat, 15 Jan 2022 09:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B844028E;
	Sat, 15 Jan 2022 09:21:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 436671BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 311AC4056A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGftDRUL50bA for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:21:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 657074010E
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:21:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A36FC813AA; Sat, 15 Jan 2022 09:15:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 10:21:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d19436b88dcea890b6a73b242e2a2cbb66e17fcd
X-Git-Newrev: 88606bd9eb4cc244388a3dec70a21d54ee3fe352
X-Patchwork-Hint: ignore
Message-Id: <20220115091525.A36FC813AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=88606bd9eb4cc244388a3dec70a21d54ee3fe352
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:open62541:open62541 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen62541%3Aopen62541

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/open62541/open62541.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 66777ce501..fb28a614e2 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -11,6 +11,7 @@ OPEN62541_GIT_SUBMODULES = YES
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
