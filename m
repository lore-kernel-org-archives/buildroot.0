Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D152D116EA
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00FE6063F;
	Fri, 28 Nov 2025 21:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XO2JS9BYNLjL; Fri, 28 Nov 2025 21:38:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0048D606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0048D606AE;
	Fri, 28 Nov 2025 21:37:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9212E9BA
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7805B608A2
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5YW9UzF_qf5 for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 21:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1D1606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C1D1606AE
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 21:37:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 921BF86165; Fri, 28 Nov 2025 21:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 22:27:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a62b589c19ddf27384b8851669d152b51e644696
X-Git-Newrev: a2775607681fc490e5cd9e0577c3e187b0ededae
X-Patchwork-Hint: ignore
Message-Id: <20251128213756.921BF86165@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyicu: bump
 version to 2.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2775607681fc490e5cd9e0577c3e187b0ededae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://gitlab.pyicu.org/main/pyicu/-/blob/v2.16/CHANGES?ref_type=tags

Needed for compatibility with ICU 78.1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index afd14437ce..81cdd4f459 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  6ae2145f2a98433f461b128c3ebef233  pyicu-2.15.3.tar.gz
-sha256  f32e78e1cb64d0aeb14f027e037a8944861d3114548818a6adf0081ef51aefc3  pyicu-2.15.3.tar.gz
+md5  00715b86c27c150f48554a863688e878  pyicu-2.16.tar.gz
+sha256  42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9  pyicu-2.16.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 5025bd649b..9d3f5f6004 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.15.3
+PYTHON_PYICU_VERSION = 2.16
 PYTHON_PYICU_SOURCE = pyicu-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/88/b0/c8b61bac55424e2ff80e20d7251c3f002baff3c07c34cee3849e3505d8f5
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/11/c3/8d558b30deb33eb583c0bcae3e64d6db8316b69461a04bb9db5ff63d3f6e
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
