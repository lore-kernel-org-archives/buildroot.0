Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36C0C83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3582260DC7;
	Wed, 16 Jul 2025 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUbFkCX6FwCT; Wed, 16 Jul 2025 18:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D38A61462
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D38A61462;
	Wed, 16 Jul 2025 18:38:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD601514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6856540C4E
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0c2PUhh_95E6 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888EA40C0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888EA40C0C
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8392D86450; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34e44809505a64c045a79be185afd3d163d1fb7f
X-Git-Newrev: 0df8b84ecb33493da2465b5fe7d648f6d46e30b6
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.8392D86450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{aardvark-dns,
 netavark}: bump to versions 1.15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=0df8b84ecb33493da2465b5fe7d648f6d46e30b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the versions of those two packages, that must be updated in
lock-step to minor-level compatible versions.

For release notes, see:
https://github.com/containers/aardvark-dns/releases
https://github.com/containers/netavark/releases

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index 227ace529a..cef7f262e5 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f5a75dec1b1a54e5460ecb9e2e27c88bd7f1b8eef3d78da08ec45a8a0d99604b  aardvark-dns-v1.14.0-git4-cargo4.tar.gz
+sha256  d38758c5cf1a732d34c8bcf8f4d3d49d308903206082721c6099daf89fcca87f  aardvark-dns-v1.15.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index a2e74a72bf..1d2e06fd03 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.14.0
+AARDVARK_DNS_VERSION = v1.15.0
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index ba6c942fd9..0f6d3976e6 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00219b98bcee1c25aa2fc7557b25c3f22a12ebbcbe1e83e82fe71f51541b250b  netavark-v1.14.0-git4-cargo4.tar.gz
+sha256  1a530b275d73c937c63d513bfe3f5ac3651b9346fdf98411b16fdcf9e1cd59b0  netavark-v1.15.2-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index 31d0b28b74..4a4038d02f 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.14.0
+NETAVARK_VERSION = v1.15.2
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
