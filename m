Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AFED0E3F3
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE09760BEF;
	Thu, 24 Oct 2024 20:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKaLQeytMRpQ; Thu, 24 Oct 2024 20:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956A360B33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956A360B33;
	Thu, 24 Oct 2024 20:01:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E6BF4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A043D81865
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUsL4IarM-76 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69FF8188A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C69FF8188A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2DBD83540; Thu, 24 Oct 2024 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 21:52:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4769724ee2bebd671f6a9372fb8922a8c22c5079
X-Git-Newrev: 2347e2f6902d050a7e19516e45afec4d4f107404
X-Patchwork-Hint: ignore
Message-Id: <20241024200129.B2DBD83540@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openipmi: bump to version 2.0.36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2347e2f6902d050a7e19516e45afec4d4f107404
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announces since 2.0.34, see:
https://sourceforge.net/p/openipmi/news/2024/08/openipmi-2036-released/
https://sourceforge.net/p/openipmi/news/2024/04/openipmi-2035-released/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openipmi/openipmi.hash | 6 +++---
 package/openipmi/openipmi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index fdba9518c7..6015be0eaf 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1  bc910d5d682710e9ff290c33e0780a71edba29d4  OpenIPMI-2.0.34.tar.gz
-md5  9d27cc86b95a29251009db96452e7213  OpenIPMI-2.0.34.tar.gz
+sha1  a7b8b581a32b649cbf5bc79926f97d59919c5b79  OpenIPMI-2.0.36.tar.gz
+md5  e77028dcfb6e91cc256da19723af1a2e  OpenIPMI-2.0.36.tar.gz
 # Locally computed
-sha256  93227e43c72b5c3bd5949323e0669aa5527d1a971473a3a365af03fb8284a95f  OpenIPMI-2.0.34.tar.gz
+sha256  a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9  OpenIPMI-2.0.36.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 1c406879e3..63043f677b 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.34
+OPENIPMI_VERSION = 2.0.36
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
