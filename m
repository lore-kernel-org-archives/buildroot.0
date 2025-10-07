Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08642CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 20:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB06C60B16;
	Tue,  7 Oct 2025 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAX7oqFIEIDE; Tue,  7 Oct 2025 20:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C54EF60B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54EF60B0C;
	Tue,  7 Oct 2025 20:19:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2948119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B5E60B0C
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyL-zeJsRv9v for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 20:18:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D48860AEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D48860AEF
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 20:18:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CBCE86A8F; Tue,  7 Oct 2025 20:18:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 22:12:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 747fed73f985b8972052cc8111707279079e4aaa
X-Git-Newrev: d90d3ae8a667bd34d1af989267e3e3e5f3332a28
X-Patchwork-Hint: ignore
Message-Id: <20251007201859.1CBCE86A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: bump to version 1.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d90d3ae8a667bd34d1af989267e3e3e5f3332a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://codeberg.org/dnkl/foot/src/tag/1.23.1/CHANGELOG.md#1-23-1
https://codeberg.org/dnkl/foot/src/tag/1.24.0/CHANGELOG.md#1-24-0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: use tags in release notes URLs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index a48fe74b22..fe058c05be 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ae0f56a375342a88e94ee540b87dc77147737b24a21f77c92c84fed788e2942  foot-1.22.3-git4.tar.gz
+sha256  6fb18d482e2ac6a1d8ec293bbdd144e4f7f3bbd0302e9a8b60141cdb02b1aa6f  foot-1.24.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index a09b61d717..055adf8bce 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.22.3
+FOOT_VERSION = 1.24.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
