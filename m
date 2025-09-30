Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB4ACCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D558B614C8;
	Wed,  1 Oct 2025 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCxXekXB2NdI; Wed,  1 Oct 2025 21:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5FC615D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5FC615D8;
	Wed,  1 Oct 2025 21:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA3AD9F
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA0454148A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXrGoMmppKYs for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12A041463
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12A041463
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0E68129B; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:29:12 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: c50711ddf54837bc8bd95548c1301f158aeb97ee
X-Git-Newrev: ccfd3e3fa567da2a2a7d5a2101709a00e41cc105
X-Patchwork-Hint: ignore
Message-Id: <20251001210010.CE0E68129B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] docs/manual: update links
 to buildroot.org from http to https
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1426895038357529633=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1426895038357529633==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ccfd3e3fa567da2a2a7d5a2101709a00e41cc105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Many links pointing to buildroot.org are still prefixed with HTTP.
Update those to HTTPS.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6f29c81703221b448f60ba1611fe2a06324cfc09)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/adding-packages-tips.adoc | 2 +-
 docs/manual/contribute.adoc           | 8 ++++----
 docs/manual/getting.adoc              | 4 ++--
 docs/manual/manual.adoc               | 2 +-
 docs/manual/resources.adoc            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index c243e7b75b..57ca11ab5d 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -85,7 +85,7 @@ under various conditions: does it build for all architectures? Does it
 build with the different C libraries? Does it need threads, NPTL? And
 so on...
 
-Buildroot runs http://autobuild.buildroot.org/[autobuilders] which
+Buildroot runs https://autobuild.buildroot.org/[autobuilders] which
 continuously test random configurations. However, these only build the
 `master` branch of the git tree, and your new fancy package is not yet
 there.
diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f77aff9d6c..caecd09764 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -40,8 +40,8 @@ with a random selection of packages. With the large commit activity on
 Buildroot, these autobuilders are a great help in detecting problems
 very early after commit.
 
-All build results are available at http://autobuild.buildroot.org[],
-statistics are at http://autobuild.buildroot.org/stats.php[]. Every day,
+All build results are available at https://autobuild.buildroot.org[],
+statistics are at https://autobuild.buildroot.org/stats.php[]. Every day,
 an overview of all failed packages is sent to the mailing list.
 
 Detecting problems is great, but obviously these problems have to be
@@ -58,7 +58,7 @@ basically two things that can be done:
   these steps:
   . Check if you can reproduce the problem by building with the same
     configuration. You can do this manually, or use the
-    http://git.buildroot.org/buildroot-test/tree/utils/br-reproduce-build[br-reproduce-build]
+    https://git.buildroot.org/buildroot-test/tree/utils/br-reproduce-build[br-reproduce-build]
     script that will automatically clone a Buildroot git repository,
     checkout the correct revision, download and set the right
     configuration, and start the build.
@@ -73,7 +73,7 @@ basically two things that can be done:
     In the commit message of a patch fixing an autobuild failure, add a
     reference to the build result directory, as follows:
 ----
-Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
+Fixes: https://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ----
 
 === Reviewing and testing patches
diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
index 1437a3ccef..b3a451f67d 100644
--- a/docs/manual/getting.adoc
+++ b/docs/manual/getting.adoc
@@ -8,7 +8,7 @@ Buildroot releases are made every 3 months, in February, May, August and
 November. Release numbers are in the format YYYY.MM, so for example
 2013.02, 2014.08.
 
-Release tarballs are available at http://buildroot.org/downloads/[].
+Release tarballs are available at https://buildroot.org/downloads/[].
 
 For your convenience, a https://www.vagrantup.com/[Vagrantfile] is
 available in `support/misc/Vagrantfile` in the Buildroot source tree
@@ -32,5 +32,5 @@ vagrant up
 
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
-http://buildroot.org/download.html[Download page] of the Buildroot website
+https://buildroot.org/download.html[Download page] of the Buildroot website
 for more details.
diff --git a/docs/manual/manual.adoc b/docs/manual/manual.adoc
index cfcc3e52a9..d4748c5c68 100644
--- a/docs/manual/manual.adoc
+++ b/docs/manual/manual.adoc
@@ -9,7 +9,7 @@ Buildroot {sys:echo $BR2_VERSION} manual generated on {localdate}
 
 The Buildroot manual is written by the Buildroot developers.
 It is licensed under the GNU General Public License, version 2. Refer to the
-http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
+https://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
 file in the Buildroot sources for the full text of this license.
 
 Copyright (C) The Buildroot developers <buildroot@buildroot.org>
diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
index 4ef709c317..a1b8b366e1 100644
--- a/docs/manual/resources.adoc
+++ b/docs/manual/resources.adoc
@@ -17,12 +17,12 @@ main method of interaction for Buildroot users and developers.
 +
 Only subscribers to the Buildroot mailing list are allowed to post to
 this list. You can subscribe via the
-http://lists.buildroot.org/mailman/listinfo/buildroot[mailing list info
+https://lists.buildroot.org/mailman/listinfo/buildroot[mailing list info
 page].
 +
 Mails that are sent to the mailing list are also available in the
 mailing list archives, available through
-http://lists.buildroot.org/pipermail/buildroot[Mailman] or at
+https://lists.buildroot.org/pipermail/buildroot[Mailman] or at
 https://lore.kernel.org/buildroot/[lore.kernel.org].
 
 IRC::

--===============1426895038357529633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1426895038357529633==--
