Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D625C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA2381AC1;
	Sun, 15 Sep 2024 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOpO73zG-d0B; Sun, 15 Sep 2024 21:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFD07847ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFD07847ED;
	Sun, 15 Sep 2024 21:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8081BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47F9580C18
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl5No7mdp7DQ for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FAC80C57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5FAC80C57
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2F9A83685; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4232f4704ea4521c9d23f9b0672c69325e203856
X-Git-Newrev: b4d2ca03daf6ffd958e657dfd84aa8d158e8590e
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.C2F9A83685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-jsonrpc: bump to
 version 3.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4d2ca03daf6ffd958e657dfd84aa8d158e8590e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash | 4 ++--
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index d5c0e46595..ad1564caab 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
-md5  fb6205e6e776802c6000ea7119229066  Flask-JSONRPC-2.2.2.tar.gz
-sha256  0cb6ac2804980dc8ac7cbbc3149025f4ec9323227978a4a7ce7b55a9f8263a11  Flask-JSONRPC-2.2.2.tar.gz
+md5  29ca67027f53912cb146d9305ea3e810  Flask-JSONRPC-3.0.1.tar.gz
+sha256  110295be39c6d6a110063630c050e3f8a4f79c50281898b3f1cb8a18fb3cb84a  Flask-JSONRPC-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index c816749085..2a60d73d42 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 2.2.2
+PYTHON_FLASK_JSONRPC_VERSION = 3.0.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/a5/7b/8cbd53084a1efb58a1105905a38b0cbefcd3ae13ef2c90c07eedf0fdb6dc
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/7e/9d/637a0620802e4c496bd5d48e3766c3a4fd6a03f815f9bcb183bc7a17a5bb
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
