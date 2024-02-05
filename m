Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9A8C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B30417B1;
	Mon,  5 Feb 2024 10:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B30417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGBCWXsSN6SX; Mon,  5 Feb 2024 10:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6799741763;
	Mon,  5 Feb 2024 10:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6799741763
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7F61BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18FB660F58
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FB660F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMmAC4AhA5cc for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:13:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B25260F51
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B25260F51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37C90869EA; Mon,  5 Feb 2024 10:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:12:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1e3841f5c2da36e1833068ba948c52a58c07ae
X-Git-Newrev: 8120f29935c0070c2c7ebdcfeceb37d2c3dc0d7d
X-Patchwork-Hint: ignore
Message-Id: <20240205101326.37C90869EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymysql: bump to version
 1.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8120f29935c0070c2c7ebdcfeceb37d2c3dc0d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pymysql/python-pymysql.hash | 4 ++--
 package/python-pymysql/python-pymysql.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymysql/python-pymysql.hash b/package/python-pymysql/python-pymysql.hash
index dd81bdab7e..641d5dba97 100644
--- a/package/python-pymysql/python-pymysql.hash
+++ b/package/python-pymysql/python-pymysql.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymysql/json
-md5  3fe6ff2eefb58af5c54d335c6e0216de  PyMySQL-1.0.2.tar.gz
-sha256  816927a350f38d56072aeca5dfb10221fe1dc653745853d30a216637f5d7ad36  PyMySQL-1.0.2.tar.gz
+md5  81d559c87414017075de030d8ce93257  PyMySQL-1.1.0.tar.gz
+sha256  4f13a7df8bf36a51e81dd9f3605fede45a4878fe02f9236349fd82a3f0612f96  PyMySQL-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  314120dc65f0800f738a4b31400c76ee14decd1fbe77ce9c3540a421b86ea7b6  LICENSE
diff --git a/package/python-pymysql/python-pymysql.mk b/package/python-pymysql/python-pymysql.mk
index 3703572f35..c600fe515c 100644
--- a/package/python-pymysql/python-pymysql.mk
+++ b/package/python-pymysql/python-pymysql.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMYSQL_VERSION = 1.0.2
+PYTHON_PYMYSQL_VERSION = 1.1.0
 PYTHON_PYMYSQL_SOURCE = PyMySQL-$(PYTHON_PYMYSQL_VERSION).tar.gz
-PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/60/ea/33b8430115d9b617b713959b21dfd5db1df77425e38efea08d121e83b712
+PYTHON_PYMYSQL_SITE = https://files.pythonhosted.org/packages/41/9d/ee68dee1c8821c839bb31e6e5f40e61035a5278f7c1307dde758f0c90452
 PYTHON_PYMYSQL_LICENSE = MIT
 PYTHON_PYMYSQL_LICENSE_FILES = LICENSE
 PYTHON_PYMYSQL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
