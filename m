Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA7BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5399B42E9D;
	Fri, 28 Feb 2025 17:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQzOMlCIZ35C; Fri, 28 Feb 2025 17:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DF1E504D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF1E504D4;
	Fri, 28 Feb 2025 17:23:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7C61DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 286C9419B6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO4xrtyOjU9n for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D7947E3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D7947E3B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 526B983577; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 13:34:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bee34e7bd0954634ba3a9534104482c6dd5e6229
X-Git-Newrev: f8fb0b5942421af6f64d061e6384590b7149f400
X-Patchwork-Hint: ignore
Message-Id: <20250228163047.526B983577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zabbix: update to 7.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8fb0b5942421af6f64d061e6384590b7149f400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for a changelog:
https://www.zabbix.com/rn/rn7.2.3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zabbix/zabbix.hash | 2 +-
 package/zabbix/zabbix.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index b4b71db5c8..fa229af00e 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  215301b6e089a685a2fabcca17fc65e5766d42d2079174b65a1bf28df7679692  zabbix-7.0.5.tar.gz
+sha256  fa957c533f042ef9b37710b00ada9c8e4c8063819d87c80212103abd53ed10b5  zabbix-7.2.3.tar.gz
 sha256  0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index 318030214c..affadef365 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZABBIX_VERSION_MAJOR = 7.0
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).5
+ZABBIX_VERSION_MAJOR = 7.2
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).3
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_SELINUX_MODULES = zabbix
 ZABBIX_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
