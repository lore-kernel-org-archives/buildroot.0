Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4A7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1284A83F5A;
	Fri, 28 Jan 2022 20:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dy0O45T-K05g; Fri, 28 Jan 2022 20:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A23783F55;
	Fri, 28 Jan 2022 20:47:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64FB41C1189
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5214F83F55
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWMk-Ldyqrzs for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:46:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D37A83F4C
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D7A33821A9; Fri, 28 Jan 2022 20:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 21:43:19 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9f448847223b00567c048e152ed37e375eae7ad8
X-Git-Newrev: 1eb773baf6c6c06190a487b590424ffd1d9cded3
X-Patchwork-Hint: ignore
Message-Id: <20220128203942.D7A33821A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/tinyxml: add
 TINYXML_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eb773baf6c6c06190a487b590424ffd1d9cded3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tinyxml_project:tinyxml is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinyxml_project%3Atinyxml

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e46157821f0ad4107e8ddcf039661e9ac189609)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyxml/tinyxml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index 15280517ac..b8b8e43c05 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -12,5 +12,6 @@ TINYXML_AUTORECONF = YES
 TINYXML_INSTALL_STAGING = YES
 TINYXML_LICENSE = Zlib
 TINYXML_LICENSE_FILES = README
+TINYXML_CPE_ID_VENDOT = tinyxml_project
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
