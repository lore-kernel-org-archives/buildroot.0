Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C20CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893C540253;
	Tue, 23 Sep 2025 16:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMO3w52Sj36U; Tue, 23 Sep 2025 16:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2101F40AB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2101F40AB5;
	Tue, 23 Sep 2025 16:38:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 874B4E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E17060E53
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHWKm8Ge1D01 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76E160DDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76E160DDC
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:38:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0B348630F; Tue, 23 Sep 2025 16:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 18:37:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7660818b4bbe3aa2540f76ed4d75fcd99c8c8bd9
X-Git-Newrev: 6f29c81703221b448f60ba1611fe2a06324cfc09
X-Patchwork-Hint: ignore
Message-Id: <20250923163840.C0B348630F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update links to buildroot.org
 from http to https
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
Content-Type: multipart/mixed; boundary="===============8945384922627416200=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8945384922627416200==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6f29c81703221b448f60ba1611fe2a06324cfc09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many links pointing to buildroot.org are still prefixed with HTTP.
Update those to HTTPS.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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

--===============8945384922627416200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8945384922627416200==--
