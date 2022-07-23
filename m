Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8961C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 591AC416A3;
	Sat, 23 Jul 2022 20:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 591AC416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSX7xIxetY4G; Sat, 23 Jul 2022 20:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F7034048D;
	Sat, 23 Jul 2022 20:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F7034048D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408DD1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14040827A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14040827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9ILU5Hip2K1 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B736E824EE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B736E824EE
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2BDFF85167; Sat, 23 Jul 2022 20:05:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0fc71e0025bbbd8bc5ba4b930d501bbc6e3fd32
X-Git-Newrev: 5691b74f4cd4860d0759bb51e4a522fa6475482d
X-Patchwork-Hint: ignore
Message-Id: <20220723200510.2BDFF85167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-artifact: bump version to
 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5691b74f4cd4860d0759bb51e4a522fa6475482d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License changes:

New:

Apache2.0:
  - vendor/google.golang.org/genproto/LICENSE
  - vendor/google.golang.org/grpc/LICENSE
  - vendor/google.golang.org/appengine/LICENSE
  - vendor/cloud.google.com/go/LICENSE
  - vendor/cloud.google.com/go/kms/LICENSE
  - vendor/cloud.google.com/go/iam/LICENSE
  - vendor/cloud.google.com/go/compute/LICENSE
  - vendor/go.opencensus.io/LICENSE
  - vendor/github.com/golang/groupcache/LICENSE
  - vendor/gopkg.in/square/go-jose.v2/LICENSE
  - vendor/github.com/oklog/run/LICENSE

BSD-3-Clause:
  - vendor/github.com/remyoudompheng/go-liblzma/LICENSE
  - vendor/github.com/klauspost/compress/LICENSE
  - vendor/github.com/google/go-cmp/LICENSE
  - vendor/golang.org/x/net/LICENSE
  - vendor/golang.org/x/oauth2/LICENSE
  - vendor/golang.org/x/text/LICENSE
  - vendor/golang.org/x/crypto/LICENSE
  - vendor/golang.org/x/time/LICENSE
  - vendor/google.golang.org/api/LICENSE
  - vendor/google.golang.org/api/internal/third_party/uritemplates/LICENSE
  - vendor/google.golang.org/protobuf/LICENSE
  - vendor/github.com/golang/protobuf/LICENSE
  - vendor/github.com/googleapis/gax-go/v2/LICENSE
  - vendor/github.com/golang/snappy/LICENSE
  - vendor/gopkg.in/square/go-jose.v2/json/LICENSE
  - vendor/github.com/pierrec/lz4/LICENSE

ISC:
  - vendor/github.com/klauspost/cpuid/v2/LICENSE
  - vendor/go.uber.org/atomic/LICENSE.txt
  - vendor/github.com/mitchellh/go-homedir/LICENSE
  - vendor/github.com/mitchellh/go-testing-interface/LICENSE
  - vendor/github.com/mitchellh/mapstructure/LICENSE
  - vendor/github.com/mitchellh/copystructure/LICENSE
  - vendor/github.com/mitchellh/reflectwalk/LICENSE
  - vendor/github.com/ryanuber/go-glob/LICENSE
  - vendor/github.com/mattn/go-colorable/LICENSE
  - vendor/github.com/fatih/color/LICENSE.md
  - vendor/github.com/armon/go-radix/LICENSE
  - vendor/github.com/armon/go-metrics/LICENSE
  - vendor/github.com/cenkalti/backoff/v3/LICENSE
  - vendor/github.com/hashicorp/go-hclog/LICENSE

MPL-2.0:
  - vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE
  - vendor/github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE
  - vendor/github.com/hashicorp/errwrap/LICENSE
  - vendor/github.com/hashicorp/hcl/LICENSE
  - vendor/github.com/hashicorp/go-cleanhttp/LICENSE
  - vendor/github.com/hashicorp/go-version/LICENSE
  - vendor/github.com/hashicorp/go-rootcerts/LICENSE
  - vendor/github.com/hashicorp/go-retryablehttp/LICENSE
  - vendor/github.com/hashicorp/go-uuid/LICENSE
  - vendor/github.com/hashicorp/go-plugin/LICENSE
  - vendor/github.com/hashicorp/go-sockaddr/LICENSE
  - vendor/github.com/hashicorp/vault/sdk/LICENSE
  - vendor/github.com/hashicorp/vault/api/LICENSE
  - vendor/github.com/hashicorp/yamux/LICENSE
  - vendor/github.com/hashicorp/go-immutable-radix/LICENSE
  - vendor/github.com/hashicorp/go-multierror/LICENSE
  - vendor/github.com/hashicorp/golang-lru/LICENSE

Removed:
  - vendor/golang.org/x/crypto/LICENSE
  - vendor/github.com/remyoudompheng/go-liblzma/LICENSE
  - vendor/github.com/klauspost/compress/LICENSE

Updated:
  - LICENSE: Updated copyright year.
  - vendor/github.com/klauspost/compress/LICENSE:
    - Added Apache 2.0 license for gzhttp/* directory

  - vendor/github.com/remyoudompheng/go-liblzma/LICENSE:
    - Update license year from 2012 to 2019

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mender-artifact/mender-artifact.hash | 70 +++++++++++++++++++++++++---
 package/mender-artifact/mender-artifact.mk   | 63 +++++++++++++++++++++++--
 2 files changed, 123 insertions(+), 10 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 27f18862bc..8262e26bf0 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  c46c305616cf53e65b786862addf04d97c388e451f11478886967b494c4ce5d9  mender-artifact-3.6.1.tar.gz
-sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FILES_CHKSUM.sha256
+sha256  d3ed68d8637195ff35de97b12c8fa148cebffb1ee0fd0d43909ec1643c0c296a  mender-artifact-3.8.0.tar.gz
+sha256  b8462a14975e30fb0dff14ed50e7563e833ccce13c2aa93f95386ffe877ed673  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,9 +8,21 @@ sha256  ac23df36801aea6a28685b60a742f68f99d357e0d9973d5c36aa2e72599d8e2a  LIC_FI
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256  b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a  LICENSE
+sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  8f5d89b47d7a05a199b77b7e0f362dad391d451ebda4ef48ba11c50c071564c7  vendor/github.com/mendersoftware/progressbar/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/genproto/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/grpc/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/appengine/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/kms/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/iam/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/cloud.google.com/go/compute/LICENSE
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  vendor/go.opencensus.io/LICENSE
+sha256  73ba74dfaa520b49a401b5d21459a8523a146f3b7518a833eea5efa85130bf68  vendor/github.com/golang/groupcache/LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/gopkg.in/square/go-jose.v2/LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  vendor/github.com/oklog/run/LICENSE
+
 #
 # BSD 2 Clause licenses.
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
@@ -18,10 +30,23 @@ sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor
 # BSD 3 Clause licenses.
 sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
-sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
-sha256  a284e538f3e5649ae6a8f32da2bbd18e9daabf2c1ebbfb99ed92e797b159be1a  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
-sha256  16f848582e4b276a7392cd34496b7a33d6f65c0e190c163ff3a056a7c61219ce  vendor/github.com/klauspost/compress/LICENSE
+sha256  87640bc4df2ceb1559f268a3db1ba859ab780f7ba5b1b4545173d4680a3d918b  vendor/github.com/remyoudompheng/go-liblzma/LICENSE
+sha256  0d9e582ee4bff57bf1189c9e514e6da7ce277f9cd3bc2d488b22fbb39a6d87cf  vendor/github.com/klauspost/compress/LICENSE
 sha256  75e1ca97a84a9da6051dee0114333388216f2c4a5a028296b882ff3d57274735  vendor/github.com/russross/blackfriday/v2/LICENSE.txt
+sha256  17b5d209ba8f9684257ecfcff87df6ceda6194143a8fbd074f29727cff6f0c40  vendor/github.com/google/go-cmp/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/oauth2/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/text/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/crypto/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/time/LICENSE
+sha256  110244b02140866ee37d17fa7449436a377ec3b85a481fbb208f4c87964382de  vendor/google.golang.org/api/LICENSE
+sha256  fc0a2f71df4e8f047902da53d1f85301be43e0f360fc167057a2d04658ed2ba9  vendor/google.golang.org/api/internal/third_party/uritemplates/LICENSE
+sha256  4835612df0098ca95f8e7d9e3bffcb02358d435dbb38057c844c99d7f725eb20  vendor/google.golang.org/protobuf/LICENSE
+sha256  8778a9fc1eaffb03ab873caae251df2d224f6b5502be8777d3cd573a4dd43903  vendor/github.com/golang/protobuf/LICENSE
+sha256  b95218cd9607855a6536384c0262922b30a0c2bf56e4ced790240f3a3bac4722  vendor/github.com/googleapis/gax-go/v2/LICENSE
+sha256  f69f157b0be75da373605dbc8bbf142e8924ee82d8f44f11bcaf351335bf98cf  vendor/github.com/golang/snappy/LICENSE
+sha256  dd26a7abddd02e2d0aba97805b31f248ef7835d9e10da289b22e3b8ab78b324d  vendor/gopkg.in/square/go-jose.v2/json/LICENSE
+sha256  6a358d2540ca14048f02d366f23787c0a480157e58f058113f0e27168dd4e447  vendor/github.com/pierrec/lz4/LICENSE
 #
 # ISC licenses.
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
@@ -35,3 +60,36 @@ sha256  a55959c4e3e8917bfa857359bb641115336276a6cc97408fd8197e079fb18470  vendor
 sha256  c8024e31c1de453fea90f22a221968835cc7af9d520274a2576c9ec9976055b0  vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE
 sha256  d18f6323b71b0b768bb5e9616e36da390fbd39369a81807cca352de4e4e6aa0b  vendor/gopkg.in/yaml.v3/LICENSE
 sha256  08eab1118c80885fa1fa6a6dd7303f65a379fcb3733e063d20d1bbc2c76e6fa1  vendor/github.com/mattn/go-isatty/LICENSE
+sha256  5d966570d7a442d4e969892860a914e542c97f262c873baee8f0aa48e1f40212  vendor/github.com/klauspost/cpuid/v2/LICENSE
+sha256  edbb5a4d165ac69376c765b551c0662ff42bea87e1f1eda85f42ac90c34b09d0  vendor/go.uber.org/atomic/LICENSE.txt
+sha256  22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff4354a07f26  vendor/github.com/mitchellh/go-homedir/LICENSE
+sha256  f48b778b7fccb6650f915cf4527c941a9578f8876a2911d035c4e44641a916be  vendor/github.com/mitchellh/go-testing-interface/LICENSE
+sha256  22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff4354a07f26  vendor/github.com/mitchellh/mapstructure/LICENSE
+sha256  3c377fad2e5ae1d7081c7c2f16da867a87cca1d1f5f1aa7ed0b8a16bb553142a  vendor/github.com/mitchellh/copystructure/LICENSE
+sha256  22adc4abdece712a737573672f082fd61ac2b21df878efb87ffcff4354a07f26  vendor/github.com/mitchellh/reflectwalk/LICENSE
+sha256  38049e50b486f5394e40b786388f4a006401996e46c7c1cd18925afe7c3b4e34  vendor/github.com/ryanuber/go-glob/LICENSE
+sha256  88a2379b3ca34bf5c57127aff9dcb802bbb60ece0805cdbda65b3bd115f971d9  vendor/github.com/mattn/go-colorable/LICENSE
+sha256  de95ed802d2f90e3c72cb3c9a927cca5f2aec234a3ef1250232db0f8178b2d93  vendor/github.com/fatih/color/LICENSE.md
+sha256  831892cd31b9eef0311bb1de9014527ef5d3592eed7add1f9f829510d2065e62  vendor/github.com/armon/go-radix/LICENSE
+sha256  d0bb61dd59b6d59021893751bdd1205ee88c8206dcabd6b4c68d35b94ee19750  vendor/github.com/armon/go-metrics/LICENSE
+sha256  5c0476add4c38b55d0ed5ac11b85e00c38f26e1caee20dfe3ab58190103d1fbc  vendor/github.com/cenkalti/backoff/v3/LICENSE
+sha256  b8ce983c0e0b1410115d42b65d5471b3666a8d4f4334a52f29f457a39a71b463  vendor/github.com/hashicorp/go-hclog/LICENSE
+#
+# MPL-2.0 licenses.
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE
+sha256  bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/github.com/hashicorp/errwrap/LICENSE
+sha256  bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/github.com/hashicorp/hcl/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-cleanhttp/LICENSE
+sha256  bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd  vendor/github.com/hashicorp/go-version/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-rootcerts/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-retryablehttp/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-uuid/LICENSE
+sha256  a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/github.com/hashicorp/go-plugin/LICENSE
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  vendor/github.com/hashicorp/go-sockaddr/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/vault/sdk/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/vault/api/LICENSE
+sha256  812e9d96e900a093ae4d1d3f22c5f82f568a0a0461c3007a99d00573d41c5461  vendor/github.com/hashicorp/yamux/LICENSE
+sha256  60222c28c1a7f6a92c7df98e5c5f4459e624e6e285e0b9b94467af5f6ab3343d  vendor/github.com/hashicorp/go-immutable-radix/LICENSE
+sha256  a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff  vendor/github.com/hashicorp/go-multierror/LICENSE
+sha256  af175b9d96ee93c21a036152e1b905b0b95304d4ae8c2c921c7609100ba8df7e  vendor/github.com/hashicorp/golang-lru/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 34d0cd9469..1031166f34 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,21 +4,45 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 3.6.1
+HOST_MENDER_ARTIFACT_VERSION = 3.8.0
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
-HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
+HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
 	vendor/github.com/minio/sha256-simd/LICENSE \
 	vendor/github.com/mendersoftware/progressbar/LICENSE \
+	vendor/google.golang.org/genproto/LICENSE \
+	vendor/google.golang.org/grpc/LICENSE \
+	vendor/google.golang.org/appengine/LICENSE \
+	vendor/cloud.google.com/go/LICENSE \
+	vendor/cloud.google.com/go/kms/LICENSE \
+	vendor/cloud.google.com/go/iam/LICENSE \
+	vendor/cloud.google.com/go/compute/LICENSE \
+	vendor/go.opencensus.io/LICENSE \
+	vendor/github.com/golang/groupcache/LICENSE \
+	vendor/gopkg.in/square/go-jose.v2/LICENSE \
+	vendor/github.com/oklog/run/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
-	vendor/golang.org/x/crypto/LICENSE \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/russross/blackfriday/v2/LICENSE.txt \
+	vendor/github.com/google/go-cmp/LICENSE \
+	vendor/golang.org/x/net/LICENSE \
+	vendor/golang.org/x/oauth2/LICENSE \
+	vendor/golang.org/x/text/LICENSE \
+	vendor/golang.org/x/crypto/LICENSE \
+	vendor/golang.org/x/time/LICENSE \
+	vendor/google.golang.org/api/LICENSE \
+	vendor/google.golang.org/api/internal/third_party/uritemplates/LICENSE \
+	vendor/google.golang.org/protobuf/LICENSE \
+	vendor/github.com/golang/protobuf/LICENSE \
+	vendor/github.com/googleapis/gax-go/v2/LICENSE \
+	vendor/github.com/golang/snappy/LICENSE \
+	vendor/gopkg.in/square/go-jose.v2/json/LICENSE \
+	vendor/github.com/pierrec/lz4/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
@@ -27,7 +51,38 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/cpuguy83/go-md2man/v2/LICENSE.md \
 	vendor/github.com/shurcooL/sanitized_anchor_name/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
-	vendor/github.com/mattn/go-isatty/LICENSE
+	vendor/github.com/mattn/go-isatty/LICENSE \
+	vendor/github.com/klauspost/cpuid/v2/LICENSE \
+	vendor/go.uber.org/atomic/LICENSE.txt \
+	vendor/github.com/mitchellh/go-homedir/LICENSE \
+	vendor/github.com/mitchellh/go-testing-interface/LICENSE \
+	vendor/github.com/mitchellh/mapstructure/LICENSE \
+	vendor/github.com/mitchellh/copystructure/LICENSE \
+	vendor/github.com/mitchellh/reflectwalk/LICENSE \
+	vendor/github.com/ryanuber/go-glob/LICENSE \
+	vendor/github.com/mattn/go-colorable/LICENSE \
+	vendor/github.com/fatih/color/LICENSE.md \
+	vendor/github.com/armon/go-radix/LICENSE \
+	vendor/github.com/armon/go-metrics/LICENSE \
+	vendor/github.com/cenkalti/backoff/v3/LICENSE \
+	vendor/github.com/hashicorp/go-hclog/LICENSE \
+	vendor/github.com/hashicorp/go-secure-stdlib/strutil/LICENSE \
+	vendor/github.com/hashicorp/go-secure-stdlib/parseutil/LICENSE \
+	vendor/github.com/hashicorp/errwrap/LICENSE \
+	vendor/github.com/hashicorp/hcl/LICENSE \
+	vendor/github.com/hashicorp/go-cleanhttp/LICENSE \
+	vendor/github.com/hashicorp/go-version/LICENSE \
+	vendor/github.com/hashicorp/go-rootcerts/LICENSE \
+	vendor/github.com/hashicorp/go-retryablehttp/LICENSE \
+	vendor/github.com/hashicorp/go-uuid/LICENSE \
+	vendor/github.com/hashicorp/go-plugin/LICENSE \
+	vendor/github.com/hashicorp/go-sockaddr/LICENSE \
+	vendor/github.com/hashicorp/vault/sdk/LICENSE \
+	vendor/github.com/hashicorp/vault/api/LICENSE \
+	vendor/github.com/hashicorp/yamux/LICENSE \
+	vendor/github.com/hashicorp/go-immutable-radix/LICENSE \
+	vendor/github.com/hashicorp/go-multierror/LICENSE \
+	vendor/github.com/hashicorp/golang-lru/LICENSE
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
