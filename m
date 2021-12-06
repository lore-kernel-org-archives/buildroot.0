Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BC1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 22:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18967404CF;
	Mon,  6 Dec 2021 22:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FK4KVIjUviM0; Mon,  6 Dec 2021 22:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 259D4404C5;
	Mon,  6 Dec 2021 22:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 895681BF232
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78C0560E02
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 22:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4G92vBGxq5p for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 22:40:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C83B060D9D
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 22:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC39D817E5; Mon,  6 Dec 2021 22:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 23:40:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fa5f56a06b40b10c4281292aef95587ecff27768
X-Git-Newrev: 5ee093db3035716b98233f70c4ec27b4426809ce
X-Patchwork-Hint: ignore
Message-Id: <20211206223540.EC39D817E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-cycler:
 set license to BSD-3-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ee093db3035716b98233f70c4ec27b4426809ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

License is BSD-3-Clause since the addition of the package in commit
e96c1b244e4283f5c8596728423c4d3b8a6487cb and
https://github.com/matplotlib/cycler/commit/a1c8a50ce79d37517d58552d8f0ee8f41f4ba9be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit df729d9c250845dd23235ae3014a0bf2791b4bb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cycler/python-cycler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index 4f1f40191f..fcdcb148a1 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -7,7 +7,7 @@
 PYTHON_CYCLER_VERSION = 0.10.0
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
 PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488
-PYTHON_CYCLER_LICENSE = BSD
+PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
