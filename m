Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41756C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A76416F2;
	Sun, 31 Jul 2022 06:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A76416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id py7BR-3CzoeW; Sun, 31 Jul 2022 06:19:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A029D4163E;
	Sun, 31 Jul 2022 06:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A029D4163E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3868C1BF5A0
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20CA440235
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CA440235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJ4Wei7hHhNz for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:18:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57615400C8
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57615400C8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6308869F5; Sun, 31 Jul 2022 06:04:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 08:17:23 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 447357e90fe091cf35d45657ae7d666d64656226
X-Git-Newrev: dc6b4ba66721e9b91119440a3bf402807c9bd2db
X-Patchwork-Hint: ignore
Message-Id: <20220731060456.A6308869F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/protobuf-c: add
 PROTOBUF_C_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc6b4ba66721e9b91119440a3bf402807c9bd2db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cpe:2.3:a:protobuf-c_project:protobuf-c is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprotobuf-c_project%3Aprotobuf-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d2286690baae34edc0246737494b2e28631d2a1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index baea4d623f..7dd3b09a6c 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -13,6 +13,7 @@ PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
+PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
 PROTOBUF_C_AUTORECONF = YES
 HOST_PROTOBUF_C_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
