Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBFAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98AA784354;
	Wed,  9 Mar 2022 21:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_Lgn-TB2IjU; Wed,  9 Mar 2022 21:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8078884338;
	Wed,  9 Mar 2022 21:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3478E1BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 223DF60FAA
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBQrnsA7T7RE for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:04:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 635E260FA6
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:04:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1DFE083A34; Wed,  9 Mar 2022 20:56:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 9 Mar 2022 22:04:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66d348ae18c6e73d6ff9d935a241e55a65948be6
X-Git-Newrev: 59ab0dff71c0da0dfa58369d81c41e9d2f3e470f
X-Patchwork-Hint: ignore
Message-Id: <20220309205614.1DFE083A34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riemann-c-client: bump to version
 1.10.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=59ab0dff71c0da0dfa58369d81c41e9d2f3e470f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/algernon/riemann-c-client/releases/tag/riemann-c-client-1.10.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/riemann-c-client/riemann-c-client.hash | 4 ++--
 package/riemann-c-client/riemann-c-client.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/riemann-c-client/riemann-c-client.hash b/package/riemann-c-client/riemann-c-client.hash
index 6d4d634d75..43d4cd45c4 100644
--- a/package/riemann-c-client/riemann-c-client.hash
+++ b/package/riemann-c-client/riemann-c-client.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 334874f0b9a507a8abbc7138df719cba4f28f12c02c39d5e55090b8edb86f9d2 riemann-c-client-1.10.4.tar.gz
-sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE
+sha256  568416d854d1c1e5eac743c9f56db6fa0d6a8144daa74a799d0556bb6b50e679  riemann-c-client-1.10.5.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE
diff --git a/package/riemann-c-client/riemann-c-client.mk b/package/riemann-c-client/riemann-c-client.mk
index 6fbb3caf5c..f942d560c8 100644
--- a/package/riemann-c-client/riemann-c-client.mk
+++ b/package/riemann-c-client/riemann-c-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIEMANN_C_CLIENT_VERSION = 1.10.4
+RIEMANN_C_CLIENT_VERSION = 1.10.5
 RIEMANN_C_CLIENT_SITE = \
 	$(call github,algernon,riemann-c-client,riemann-c-client-$(RIEMANN_C_CLIENT_VERSION))
 RIEMANN_C_CLIENT_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
