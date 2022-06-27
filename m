Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E9C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A8D680B6E;
	Mon, 27 Jun 2022 21:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8D680B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JdJ68C9PdTM; Mon, 27 Jun 2022 21:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E76380B2F;
	Mon, 27 Jun 2022 21:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E76380B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF9F1BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09642605AE
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09642605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7i3WRm96KW8 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:44:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C34605AD
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C34605AD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 47F9787638; Mon, 27 Jun 2022 21:32:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:44:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b598a284f120d9bda2a018e145f50ef5758a24f6
X-Git-Newrev: 8d66e70400198e53fa35e774b6f41b66737464b3
X-Patchwork-Hint: ignore
Message-Id: <20220627213216.47F9787638@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccid: bump to version 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d66e70400198e53fa35e774b6f41b66737464b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LudovicRousseau/CCID/releases/tag/1.5.0
https://github.com/LudovicRousseau/CCID/blob/1.5.0/README.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index 4ef7aff3d4..d42d0778f1 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e6f7645b59a9a2844eb4b1a7eff512960d7f04a4654af02f7fd2f8aded5db40a  ccid-1.4.34.tar.bz2
+sha256  81549b3422469d503996d03a3aed2ef1375b359167f10d66be9e3844e729322e  ccid-1.5.0.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 3cb599d566..c05e28a5d2 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.4.34
+CCID_VERSION = 1.5.0
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
