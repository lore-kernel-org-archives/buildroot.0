Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B1ED116F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB66C80B2E;
	Fri, 28 Nov 2025 20:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew94CytTyw4Z; Fri, 28 Nov 2025 20:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FA380A8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FA380A8A;
	Fri, 28 Nov 2025 20:19:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B5A9BA
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC00741AB5
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laNuyI7h8NpJ for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 20:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7AA341AB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7AA341AB6
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 20:19:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1EF686131; Fri, 28 Nov 2025 20:19:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:31:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 19f6300ccaef9d419b3dc19690a26ea8be06969e
X-Git-Newrev: b86191f5be04ccadf6dfb1a5974874f3e9a57e60
X-Patchwork-Hint: ignore
Message-Id: <20251128201933.B1EF686131@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-apscheduler:
 bump to 3.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b86191f5be04ccadf6dfb1a5974874f3e9a57e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog: https://github.com/agronholm/apscheduler/releases/tag/3.11.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index 1f2ba1f82e..55026aec7b 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  1705663d09aeb1b174f964780c57520a  apscheduler-3.11.0.tar.gz
-sha256  4c622d250b0955a65d5d0eb91c33e6d43fd879834bf541e0a18661ae60460133  apscheduler-3.11.0.tar.gz
+md5  ff8d1731e31d88e2e1fd0794099c920f  apscheduler-3.11.1.tar.gz
+sha256  0db77af6400c84d1747fe98a04b8b58f0080c77d11d338c4f507a9752880f221  apscheduler-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index c5d89c5c2d..b03022149f 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.0
+PYTHON_APSCHEDULER_VERSION = 3.11.1
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/4e/00/6d6814ddc19be2df62c8c898c4df6b5b1914f3bd024b780028caa392d186
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/d0/81/192db4f8471de5bc1f0d098783decffb1e6e69c4f8b4bc6711094691950b
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
