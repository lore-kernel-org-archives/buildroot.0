Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02932C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABC63403E7;
	Sun, 30 Oct 2022 16:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC63403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14GO8dVDsabv; Sun, 30 Oct 2022 16:15:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C87C3403A2;
	Sun, 30 Oct 2022 16:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87C3403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71F9C1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5947F60A8C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5947F60A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBxt-2oT9Ewf for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD7F607FE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD7F607FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 689C587572; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:10:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce8eb37a7ea0a13644fe9ec29bf8ce72df094386
X-Git-Newrev: e0f40892e921dc06e89ff543df754e434b608633
X-Patchwork-Hint: ignore
Message-Id: <20221030161421.689C587572@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slang: bump to version 2.3.3
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
Content-Type: multipart/mixed; boundary="===============0959796508808975123=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0959796508808975123==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e0f40892e921dc06e89ff543df754e434b608633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refresh patch

http://lists.jedsoft.org/lists/slang-users/2022/0000005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/slang/0001-slsh-libs.patch | 6 ++++--
 package/slang/slang.hash           | 4 ++--
 package/slang/slang.mk             | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/slang/0001-slsh-libs.patch b/package/slang/0001-slsh-libs.patch
index 211cb4a0e0..fad16d1b2f 100644
--- a/package/slang/0001-slsh-libs.patch
+++ b/package/slang/0001-slsh-libs.patch
@@ -5,6 +5,8 @@ probably Diego Pettenò.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Bernd: rebased against 2.3.1a]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Fabrice: rebased against 2.3.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 --- a/slsh/Makefile.in
 +++ b/slsh/Makefile.in
@@ -12,8 +14,8 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  $(OBJDIR)/slsh_exe: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
     $(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh_exe $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh: $(OBJDIR)/slsh.o $(OBJDIR)/readline.o
--	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
-+	$(CC) $(CFLAGS) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
+-	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(INST_LIBS)
++	$(CC) $(OBJDIR)/slsh.o $(OBJDIR)/readline.o -o $(OBJDIR)/slsh $(LDFLAGS) $(DLINK_FLAGS) $(SRC_LIBS)
  $(OBJDIR)/slsh.o: $(OBJDIR_TSTAMP) slsh.c slsh.h config.h Makefile
     cd $(OBJDIR) && $(CC) $(SLANG_SRCINC) $(CFLAGS) -c $(DEFS) $(SRCDIR)/slsh.c
  $(OBJDIR)/readline.o: $(OBJDIR_TSTAMP) readline.c slsh.h config.h Makefile
diff --git a/package/slang/slang.hash b/package/slang/slang.hash
index 3e211ab548..563117b48a 100644
--- a/package/slang/slang.hash
+++ b/package/slang/slang.hash
@@ -1,6 +1,6 @@
 # sha1 from http://www.jedsoft.org/releases/slang/, sha256 locally computed
-sha1  bbf7f2dcc14e7c7fca40868fd4b411a2bd9e2655  slang-2.3.2.tar.bz2
-sha256  fc9e3b0fc4f67c3c1f6d43c90c16a5c42d117b8e28457c5b46831b8b5d3ae31a  slang-2.3.2.tar.bz2
+sha1  38d9b8e80e4336f76dff3e1d85761d2d0f713595  slang-2.3.3.tar.bz2
+sha256  f9145054ae131973c61208ea82486d5dd10e3c5cdad23b7c4a0617743c8f5a18  slang-2.3.3.tar.bz2
 
 # License file, locally computed
 sha256  ff05a90962e7773f8bdc47b2a9585130526039102759b524c1dffbd57cfe469b  COPYING
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 44a0148088..e0f5968b46 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLANG_VERSION = 2.3.2
+SLANG_VERSION = 2.3.3
 SLANG_SOURCE = slang-$(SLANG_VERSION).tar.bz2
 SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+

--===============0959796508808975123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0959796508808975123==--
