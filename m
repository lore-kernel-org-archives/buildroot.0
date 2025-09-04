Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACADBCA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 18:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17214039B;
	Thu,  4 Sep 2025 18:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FjOk5gYyPWRo; Thu,  4 Sep 2025 18:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390A4403B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390A4403B2;
	Thu,  4 Sep 2025 18:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 459E1111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10F1180C41
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePqjFkdqA9o1 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5561980C3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5561980C3A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F5D082A1E; Thu,  4 Sep 2025 18:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:18:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aec2f2ddc44d037ad21c9a061475459dd9f3d3a1
X-Git-Newrev: cb0c193c81fe0afb54de5d445b8c9dfa2831cc92
X-Patchwork-Hint: ignore
Message-Id: <20250904183622.3F5D082A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cutekeyboard: bump
 version to 1.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb0c193c81fe0afb54de5d445b8c9dfa2831cc92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 53b438cc1f..e4093dc4ef 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0f0af01ec99ad07607d2e58c2feee1fba37c9cb7118e8af309fa021f599aec86  cutekeyboard-v1.3.0.tar.gz
+sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-v1.4.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index 775bed0fe9..e97eb9db2c 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = v1.3.0
+CUTEKEYBOARD_VERSION = v1.4.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
