Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0406C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:16:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6825060184
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6825060184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F9E382F11;
	Thu, 26 Aug 2021 22:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dXktnTZ2CJY; Thu, 26 Aug 2021 22:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFC782EB6;
	Thu, 26 Aug 2021 22:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2671BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A907661495
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3iWPb8P7fjd for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8976149F
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 607718DC52; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 23:22:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 27b425ef4995e43c84b36c44d7d7d1c018b0fdef
X-Git-Newrev: b05d81030b650444465c4e2ea9e5067b711f5616
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.607718DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rust-bin: harmonize
 indentation
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b05d81030b650444465c4e2ea9e5067b711f5616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use an indentation of two spaces everywhere

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index be502465cc..bdb1f07fcc 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -9,7 +9,7 @@ sha256  9fb4a22b74120b81a4d896326b02d121d5f996b3288580c346ea55a52d8946a9  rust-1
 sha256  a1a77737d218087eb7d3613adcde2c9e383d758cdf128646a0ee63396145270b  rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256 9a7ff8e4cd160f6a58c3b5c7e679b7acdc427c2440ecc70a31a5dc71bbecd0c8  rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz
+sha256  9a7ff8e4cd160f6a58c3b5c7e679b7acdc427c2440ecc70a31a5dc71bbecd0c8  rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.asc
 sha256  c87dc1681756c9c275eba690c6a05bcdd2ac3bd04a70ae039869dc85fff18b69  rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz
@@ -18,16 +18,16 @@ sha256  c87dc1681756c9c275eba690c6a05bcdd2ac3bd04a70ae039869dc85fff18b69  rust-s
 sha256  74c9f120ad8a443798ebec74302b5166a0880b13b1d8c43dde0c8ba70d9e4b2d  rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256 2a19d96cf9e863448b21ff989550da54080312ce99272128cc0eb3b1fe5c73cc  rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz
+sha256  2a19d96cf9e863448b21ff989550da54080312ce99272128cc0eb3b1fe5c73cc  rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256 481192a6906c44501f910a35fc49ed9b1b271925c4569a52f45d9efbc2058ae2  rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz
+sha256  481192a6906c44501f910a35fc49ed9b1b271925c4569a52f45d9efbc2058ae2  rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256 2716f587d0da1dd26fc64251303f5705230f5b86e47e9af35e11622d01ceb963  rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz
+sha256  2716f587d0da1dd26fc64251303f5705230f5b86e47e9af35e11622d01ceb963  rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256 b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz
+sha256  b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
 sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz
@@ -36,40 +36,40 @@ sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-s
 sha256  7823b95fc3fcd7cc47ba767e2e917c9efbafed2d5ad0b74e7c087600bd72e54f  rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256 f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
+sha256  f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256 19a80cfaf18c15eaa1c112312c0cb0ccfd14179407118b35735cdcfc1cc4c60f  rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz
+sha256  19a80cfaf18c15eaa1c112312c0cb0ccfd14179407118b35735cdcfc1cc4c60f  rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.asc
 sha256  7c747dea305f5d4b1c6a23d064fbb41e24bb56f2917867020bb57cb064878dc4  rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.asc
-sha256 b52dd3d4ae465037ed2987e23457d30e1a75fd16c2c421613ec52c250947a5f8  rust-std-1.54.0-i586-unknown-linux-musl.tar.xz
+sha256  b52dd3d4ae465037ed2987e23457d30e1a75fd16c2c421613ec52c250947a5f8  rust-std-1.54.0-i586-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.asc
 sha256  e88269a37ebfbff52fcd07746c53fc0bfa2570531f10f226800d5783ce735e3f  rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.asc
-sha256 947054afa4d6e37c64e484c704b5f09043783b83aafbf7a00e6959442b1fc14f  rust-std-1.54.0-i686-unknown-linux-musl.tar.xz
+sha256  947054afa4d6e37c64e484c704b5f09043783b83aafbf7a00e6959442b1fc14f  rust-std-1.54.0-i686-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.asc
 sha256  59c0bd07976f9e18e05e328e2f0acd9e99b736ea0330a03b313842e5c5816e13  rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.asc
-sha256 02611ec7a6d510572803b4bd9948f0790e9f0ae8e3047ff7fa465300346e3b74  rust-std-1.54.0-mips-unknown-linux-musl.tar.xz
+sha256  02611ec7a6d510572803b4bd9948f0790e9f0ae8e3047ff7fa465300346e3b74  rust-std-1.54.0-mips-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
 sha256  dba582de46b7f97ba85b2d75662482df67214e71e0b9cea3c9c153c9d371a00f  rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256 2e94aedf59369d81524dfe8027e6e4fb0fe338d2ee7869bd96e5cef24974cf0e  rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz
+sha256  2e94aedf59369d81524dfe8027e6e4fb0fe338d2ee7869bd96e5cef24974cf0e  rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
 sha256  d1d32bc202b026470ec2c37826fef92bd91f46b08ed1e2620a50eadba03d7095  rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256 25d0c06fb445e16d7aac3b5370b43e72600a2aee41fa06605f64a3b8a8ed0e4b  rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz
+sha256  25d0c06fb445e16d7aac3b5370b43e72600a2aee41fa06605f64a3b8a8ed0e4b  rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.asc
 sha256  626b4255d31c35fa77669471c15ec63b0e88726115538e598a6ef6e814d83bae  rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz
@@ -87,16 +87,16 @@ sha256  f0329a9d6c96eeb1db5cb7969dbadbab58768b8bff48a1ffc89103031945126e  rust-s
 sha256  c08b7df82a30acacb3afcdad34b3384e77a9f35ce6bef10d43f29f129fab35e1  rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256 8b9ac3e1947036d6f2a3939edd279631fc1b0a260507343a8b3e9ecd448fe738  rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz
+sha256  8b9ac3e1947036d6f2a3939edd279631fc1b0a260507343a8b3e9ecd448fe738  rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256 6ce101e3c5b1bae6006c61a18dcb5685fe0ff57ea8c00a36e6bf95f748abe5f6  rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz
+sha256  6ce101e3c5b1bae6006c61a18dcb5685fe0ff57ea8c00a36e6bf95f748abe5f6  rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.asc
 sha256  a22e19859b3c5032daac1633637546a986c51bdfa3ad0db6e394e6cc461f466b  rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256 c2de24eb3e524c0fdd1e8116f578c103035da1ece1e4c06efab67999180eefe8  rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz
+sha256  c2de24eb3e524c0fdd1e8116f578c103035da1ece1e4c06efab67999180eefe8  rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
