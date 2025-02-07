Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13476C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B5984AFB;
	Fri,  7 Feb 2025 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LXVciFYh7Ea; Fri,  7 Feb 2025 21:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A460A84AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A460A84AFC;
	Fri,  7 Feb 2025 21:14:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EE96E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5DE84AF7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwqmEW2s2ez7 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99C3384AF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C3384AF6
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85F07872BE; Fri,  7 Feb 2025 21:14:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 21:53:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9d76e035164b0e781a826999fa293f126134a17
X-Git-Newrev: 01e049cea6ee36ae6f89a13d1249cbb482043964
X-Patchwork-Hint: ignore
Message-Id: <20250207211437.85F07872BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump to version 3.12.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01e049cea6ee36ae6f89a13d1249cbb482043964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings a number of bugfixes:
https://docs.python.org/release/3.12.9/whatsnew/changelog.html#python-3-12-9

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Julien: update hash file comment URL]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ea026376fd..34e795b704 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3128/
-md5  d46e5bf9f2e596a3ba45fc0b3c053dd2  Python-3.12.8.tar.xz
+# From https://www.python.org/downloads/release/python-3129/
+md5  880942124f7d5c01e7b65cbad62dc873  Python-3.12.9.tar.xz
 # Locally computed
-sha256  c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e  Python-3.12.8.tar.xz
+sha256  7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112  Python-3.12.9.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2be6bb7004..b15c27053f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
