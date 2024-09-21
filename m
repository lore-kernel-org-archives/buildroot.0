Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F6CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35BF360A50;
	Sat, 21 Sep 2024 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5n8826OtBjNH; Sat, 21 Sep 2024 21:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BD560A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BD560A46;
	Sat, 21 Sep 2024 21:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B424F1BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E237C4055D
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knwpqePCSAgQ for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD92403C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCD92403C1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3CE384174; Sat, 21 Sep 2024 21:07:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60bb1e89f4a1eb01d2b822d721933b93eacce79b
X-Git-Newrev: 4a380858da0b727ac4d1ba65196096de9d45b109
X-Patchwork-Hint: ignore
Message-Id: <20240921210742.D3CE384174@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymysql: bump to version
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a380858da0b727ac4d1ba65196096de9d45b109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index 641d5dba97..d697dfae88 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  81d559c87414017075de030d8ce93257  PyMySQL-1.1.0.tar.gz
-sha256  4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96  PyMySQL-1.1.0.tar.gz
+md5  66e1b2c679250e0ae9ae037444de950a  pymysql-1.1.1.tar.gz
+sha256  e127611aaf2b417403c60bf4dc570124aeb4a57f5f37b8e95ae399a42f904cd0  pymysql-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index c600fe515c..742fb4f6f1 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.1.0
-PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/41/9d/ee68dee1c8821c839bb31e6e5f40e61035a5278f7c1307dde758f0c90452
+PYTHON_PYMYSQL_VERSION = 1.1.1
+PYTHON_PYMYSQL_SOURCE = pymysql-$(PYTHON_PYMYSQL_VERSION).tar.gz
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/b3/8f/ce59b5e5ed4ce8512f879ff1fa5ab699d211ae2495f1adaa5fbba2a1eada
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
