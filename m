Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04341CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A006115E;
	Tue, 14 Oct 2025 20:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcEuYtFEDO4b; Tue, 14 Oct 2025 20:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CBE610C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60CBE610C4;
	Tue, 14 Oct 2025 20:29:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DB7EBC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFA914120B
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4CRMB1bHUd9 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FED8411C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FED8411C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E736870E7; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e302e09a52d9ac721ef40b7297bb4c43dabac725
X-Git-Newrev: e4e257ff24be62b7d2568b420a40a74fd11f3653
X-Patchwork-Hint: ignore
Message-Id: <20251014202937.1E736870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpc-requests: bump version
 to 0.1.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4e257ff24be62b7d2568b420a40a74fd11f3653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpc-requests/python-grpc-requests.hash | 4 ++--
 package/python-grpc-requests/python-grpc-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
index aeb5336a4c..6933b3d4c9 100644
--- a/package/python-grpc-requests/python-grpc-requests.hash
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpc-requests/json
-md5  6d63bed1f4a80fc3e59191ce69903d31  grpc_requests-0.1.20.tar.gz
-sha256  a76744d781c5a7bf3abde8dc778d24c4e17deb39d173d85096ff3caee3d15250  grpc_requests-0.1.20.tar.gz
+md5  e933897ca5e3ad723b17e2e46a957f84  grpc_requests-0.1.21.tar.gz
+sha256  9525bcbc5439f334b39248b9bd867313631e74530cfde1aaf43e76be0298bf20  grpc_requests-0.1.21.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
index 7fecdf5a3c..1830c4dbab 100644
--- a/package/python-grpc-requests/python-grpc-requests.mk
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPC_REQUESTS_VERSION = 0.1.20
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.21
 PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
-PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/92/84/f5a3874a6e10448d8c198253d2c79f7b34a23fb4a96b78a648dc468913a6
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/97/58/7e2be40bad0964f7d6f1c11f72be941c19575ab426c10e1b97e17aa1e42f
 PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
 PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
