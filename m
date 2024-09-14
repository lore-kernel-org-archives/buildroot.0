Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160EBC3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD73F80EA7;
	Sun, 15 Sep 2024 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ie4xdxk4pkci; Sun, 15 Sep 2024 21:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCAC81B8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BCAC81B8A;
	Sun, 15 Sep 2024 21:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4BB81BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5035405AD
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBmGWnjG3lsx for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90122405BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90122405BB
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D3EB83682; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:52:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8be13e61e38ca4109d7ccedd463d0f0ebf4b8de
X-Git-Newrev: f3b99dac53cb84cabc3814041ad7a9e2a50606e6
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.8D3EB83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 24.4.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3b99dac53cb84cabc3814041ad7a9e2a50606e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to adding contributors:
https://github.com/crossbario/autobahn-python/commit/75f3758127d1cf0ddb4450f80e30931353b3adca

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 11448fef3a..4b9e7c1be5 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  f29d3cebec06c81a87823a2776ffcc5c  autobahn-23.6.2.tar.gz
-sha256  ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181  autobahn-23.6.2.tar.gz
+md5  cedc5252be771288b19c237cd54a63e9  autobahn-24.4.2.tar.gz
+sha256  a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9  autobahn-24.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
+sha256  49c90822821c78934079a4bfed0a880790a868bc6dba90ea8fe8274e0f985ada  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 703f106515..458739f7f4 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 23.6.2
+PYTHON_AUTOBAHN_VERSION = 24.4.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/92/ee/c3320c326919394ff597592549ff5d29d2f7bf12be9ddaa9017caff1a170
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/38/f2/8dffb3b709383ba5b47628b0cc4e43e8d12d59eecbddb62cfccac2e7cf6a
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
