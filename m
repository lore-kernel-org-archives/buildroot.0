Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12436C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3FB84BAE;
	Fri, 28 Feb 2025 16:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfaUlrjL2B3G; Fri, 28 Feb 2025 16:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D777584BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D777584BB4;
	Fri, 28 Feb 2025 16:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 061A868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB8D42F1B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isXiqWwFtgWt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5B42CED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF5B42CED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C702A86612; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 19:31:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 61a0020d744663f5ffd16e48070966e15d35ebf7
X-Git-Newrev: 7b4b7a46fb80730caf4d407a2ec6f7693f0c00a2
X-Patchwork-Hint: ignore
Message-Id: <20250228162959.C702A86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ruby: update to 3.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b4b7a46fb80730caf4d407a2ec6f7693f0c00a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for changes:
https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-0-released/
https://www.ruby-lang.org/en/news/2024/11/05/ruby-3-3-6-released/

The LEGAL file was updated.
Entries for following files got removed:
[ext/json/generator/generator.c]
[ext/nkf/nkf-utf8/config.h]
[ext/nkf/nkf-utf8/nkf.c]
[ext/nkf/nkf-utf8/utf8tbl.c]
Some minor rdoc changes were made.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ruby/ruby.hash | 6 +++---
 package/ruby/ruby.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index d6622909e5..be3e380a55 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,7 +1,7 @@
-# https://www.ruby-lang.org/en/news/2024/09/03/3-3-5-released/
-sha512  dd5c6a7f74854e143e0ca46b9d7c0d1983fc4886f5f733cd108345dbf4b21f61ad978ad6806e05a57b7af28fd9216dd38d7145808188bbb3695a7f3a4eda3883  ruby-3.3.5.tar.xz
+# https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
+sha512  8d2e34117696f9debf463ae1eed288fdbb5c1a12e32800e901b69218e3b7302a0066052077e2ebca851e3a635296199bd5a10437eea1d6f787f69a77bb865680  ruby-3.4.1.tar.xz
 
 # License files, Locally calculated
-sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
+sha256  39917f453428cba1f1054c6a1973f74599a30b8d92e752da94e205a213ef8f92  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
 sha256  36a9a6e7347214bbba599a412617204e65bff065dcbe5c46f5cb454c80de9eb0  BSDL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 2e04cb3e92..be1b38ae59 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).5
-RUBY_VERSION_EXT = 3.3.0
+RUBY_VERSION_MAJOR = 3.4
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
+RUBY_VERSION_EXT = 3.4.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
