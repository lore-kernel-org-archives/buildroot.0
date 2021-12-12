Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24154C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01C861CF7;
	Sun, 12 Dec 2021 17:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nxf5CFFnPt0w; Sun, 12 Dec 2021 17:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A94F61CEE;
	Sun, 12 Dec 2021 17:37:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55F631BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DD29421BD
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfHij3Q7D3gK for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC44F421BB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8D376835F8; Sun, 12 Dec 2021 17:30:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:32:21 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: d0f503d5107f0af5e6d74842ac4d418593cef5a1
X-Git-Newrev: 12f767975f589cd89f25920a1153bb3501e106e0
X-Patchwork-Hint: ignore
Message-Id: <20211212173017.8D376835F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/netdata: add
 NETDATA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=12f767975f589cd89f25920a1153bb3501e106e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:netdata:netdata is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetdata%3Anetdata

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 349159c43932c68430e82e5de7680f70dc6e8f5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/netdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 34365cbf56..b20d5ea37b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -8,6 +8,7 @@ NETDATA_VERSION = 1.21.1
 NETDATA_SITE = $(call github,netdata,netdata,v$(NETDATA_VERSION))
 NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
+NETDATA_CPE_ID_VENDOR = netdata
 # netdata's source code is released without a generated configure script
 NETDATA_AUTORECONF = YES
 NETDATA_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
