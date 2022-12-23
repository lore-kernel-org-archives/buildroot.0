Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD8DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 23 Dec 2022 09:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70FFE8217A;
	Fri, 23 Dec 2022 09:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FFE8217A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfwVwfLCOHzf; Fri, 23 Dec 2022 09:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD5982179;
	Fri, 23 Dec 2022 09:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD5982179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA7C1BF34C
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67C4340C39
 for <buildroot@lists.busybox.net>; Fri, 23 Dec 2022 09:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C4340C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PFp4pf-SSOI for <buildroot@lists.busybox.net>;
 Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9297240160
 for <buildroot@buildroot.org>; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9297240160
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C8B986DD9; Fri, 23 Dec 2022 09:36:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 10:29:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 183de9155b138497783717383418544da00e0da7
X-Git-Newrev: de584a78a37b99b99a4011020a17b3ae99f002c7
X-Patchwork-Hint: ignore
Message-Id: <20221223093614.7C8B986DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: bump version to 2.3.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=de584a78a37b99b99a4011020a17b3ae99f002c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://dovecot.org/pipermail/dovecot-news/2022-December/000479.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 124f834dca..7036df57a8 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256  db5abcd87d7309659ea6b45b2cb6ee9c5f97486b2b719a5dd05a759e1f6a5c51  dovecot-2.3.19.1.tar.gz
+sha256  caa832eb968148abdf35ee9d0f534b779fa732c0ce4a913d9ab8c3469b218552  dovecot-2.3.20.tar.gz
 sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index e28f500b7b..4b17784f93 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).19.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).20
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
