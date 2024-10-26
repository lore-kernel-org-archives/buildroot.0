Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C25D10BE9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B9260667;
	Sat, 26 Oct 2024 13:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYNVIAodpis4; Sat, 26 Oct 2024 13:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1B16063E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F1B16063E;
	Sat, 26 Oct 2024 13:58:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC9B5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C23A81E74
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG0sHCYSLkNv for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 370BE81E7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 370BE81E7B
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:58:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22C8783BBD; Sat, 26 Oct 2024 13:58:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:33:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8af46be29e97c67870dbae33e0355606db991011
X-Git-Newrev: 33015ce954dce6bd3b35f10fa66fb252695b410d
X-Patchwork-Hint: ignore
Message-Id: <20241026135833.22C8783BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump version to go1.23.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33015ce954dce6bd3b35f10fa66fb252695b410d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.23.0 is a major release of Go.

Most of its changes are in the implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.23
https://go.dev/doc/devel/release#go1.23.2

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 4d18e0cd2e..cc87cac3a6 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
-sha256  0c8e9f824bf443f51e06ac017b9ae402ea066d761b309d880dbb2ca5793db8a2  go1.22.8.linux-386.tar.gz
-sha256  5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f  go1.22.8.linux-amd64.tar.gz
-sha256  5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a  go1.22.8.linux-arm64.tar.gz
-sha256  5191e87a51a85d88edddc028ab30dfbfa2d7c37cf35d536655e7a063bfb2c9d2  go1.22.8.linux-armv6l.tar.gz
-sha256  c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27  go1.22.8.linux-ppc64le.tar.gz
-sha256  fabb3adc241474e28ae151a00e1421983deb35184d31cc76e90025b1b389f6bf  go1.22.8.linux-s390x.tar.gz
+sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
+sha256  cb1ed4410f68d8be1156cee0a74fcfbdcd9bca377c83db3a9e1b07eebc6d71ef  go1.23.2.linux-386.tar.gz
+sha256  542d3c1705f1c6a1c5a80d5dc62e2e45171af291e755d591c5e6531ef63b454e  go1.23.2.linux-amd64.tar.gz
+sha256  f626cdd92fc21a88b31c1251f419c17782933a42903db87a174ce74eeecc66a9  go1.23.2.linux-arm64.tar.gz
+sha256  e3286bdde186077e65e961cbe18874d42a461e5b9c472c26572b8d4a98d15c40  go1.23.2.linux-armv6l.tar.gz
+sha256  c164ce7d894b10fd861d7d7b96f1dbea3f993663d9f0c30bc4f8ae3915db8b0c  go1.23.2.linux-ppc64le.tar.gz
+sha256  de1f94d7dd3548ba3036de1ea97eb8243881c22a88fcc04cc08c704ded769e02  go1.23.2.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 40cb5c801a..b475ec4a46 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
+sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 68fd359ed0..33dc681358 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.8
+GO_VERSION = 1.23.2
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
