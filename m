Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4B9C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D554361D;
	Wed, 10 Jan 2024 09:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D554361D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZDLbwssRG8g; Wed, 10 Jan 2024 09:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D80C4363B;
	Wed, 10 Jan 2024 09:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D80C4363B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 566641BF406
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DDEA613D3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DDEA613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PY4Nef3ELEmh for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52EDD60C17
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52EDD60C17
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 433D5853B3; Wed, 10 Jan 2024 09:51:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 21:35:21 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d6aa7c6b888a6511e38d3f3bb679055df8961500
X-Git-Newrev: 1f4e5eafdf86552b5b49ac8253c0b44b25fc8bf2
X-Patchwork-Hint: ignore
Message-Id: <20240110095132.433D5853B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/onevpl-intel-gpu:
 add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f4e5eafdf86552b5b49ac8253c0b44b25fc8bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:intel:onevpl_gpu_runtime is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/7F7056CA-A41D-4AB5-B9CC-9DE24A27B8BA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 312f4ab4c8a79e8cdc40dfed6870ac2aea981883)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 8c9275fe75..1ce0f17053 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -8,6 +8,8 @@ ONEVPL_INTEL_GPU_VERSION = 23.4.0
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
+ONEVPL_INTEL_GPU_CPE_ID_VENDOR = intel
+ONEVPL_INTEL_GPU_CPE_ID_PRODUCT = onevpl_gpu_runtime
 ONEVPL_INTEL_GPU_DEPENDENCIES = libva onevpl
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
