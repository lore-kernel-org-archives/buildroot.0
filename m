Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C99C3ABDD
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D449C408A1;
	Fri, 16 May 2025 11:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUAYIWdQnCyn; Fri, 16 May 2025 11:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C21C419C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C21C419C9;
	Fri, 16 May 2025 11:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D2A91AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BE6840B82
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqopUfJ8VxHT for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7F0140AF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7F0140AF1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C3186A10; Fri, 16 May 2025 11:21:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 21:03:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 561dd7fa079c074cd0a84576f06193cb2b7c46eb
X-Git-Newrev: be132ec5ba7afccf17d49309870759c3fb6d1011
X-Patchwork-Hint: ignore
Message-Id: <20250516112154.B5C3186A10@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/traceroute: bump
 to version 2.1.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be132ec5ba7afccf17d49309870759c3fb6d1011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For change log since 2.1.3, see:
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute%202.1.4/
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute%202.1.5/
https://sourceforge.net/projects/traceroute/files/traceroute/traceroute%202.1.6/

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien: add links to change logs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a31dc4c21a2309e142daf662355b14a5f18be284)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/traceroute/traceroute.hash | 2 +-
 package/traceroute/traceroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/traceroute/traceroute.hash b/package/traceroute/traceroute.hash
index cf2eb127a2..5619338848 100644
--- a/package/traceroute/traceroute.hash
+++ b/package/traceroute/traceroute.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412  traceroute-2.1.3.tar.gz
+sha256  9ccef9cdb9d7a98ff7fbf93f79ebd0e48881664b525c4b232a0fcec7dcb9db5e  traceroute-2.1.6.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 133f8d3c3e..bd246e5f9e 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACEROUTE_VERSION = 2.1.3
+TRACEROUTE_VERSION = 2.1.6
 TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
