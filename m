Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30663C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 02:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE26740423;
	Mon, 30 May 2022 02:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlawebPLxYPU; Mon, 30 May 2022 02:13:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A06F40C00;
	Mon, 30 May 2022 02:13:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE101BF3A4
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 02:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55B2D8191E
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 02:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWoZBmVPGbOx for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 02:13:07 +0000 (UTC)
X-Greylist: delayed 02:19:59 by SQLgrey-1.8.0
Received: from 2.mo581.mail-out.ovh.net (2.mo581.mail-out.ovh.net
 [87.98.143.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3B8F81842
 for <buildroot@buildroot.org>; Mon, 30 May 2022 02:13:06 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.108.20.202])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id CFE3222416
 for <buildroot@buildroot.org>; Sun, 29 May 2022 22:33:24 +0000 (UTC)
Received: from blach.pl (unknown [178.218.193.145])
 (Authenticated sender: grzegorz@blach.pl)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 1F4392AEAC1CA;
 Sun, 29 May 2022 22:33:20 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00451339f1b-0e07-4b62-9c34-073a5a696859,
 B6E767EC557CE4FA95D05743EA4C0310EE7C05D6) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 178.218.193.145
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 00:32:46 +0200
Message-Id: <20220529223248.51556-4-grzegorz@blach.pl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529223248.51556-1-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17632718443065524545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeeifffhteelvedtuddtuedtfeelgedvjeevfeeuteehgfdtgfejhfdvteffjeehvdenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpudejkedrvddukedrudelfedrudegheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 4/5] package/python-aioblescan: Bump to version
 0.2.13
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-aioblescan/python-aioblescan.hash | 4 ++--
 package/python-aioblescan/python-aioblescan.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
index 2592aace33..9a40ca4560 100644
--- a/package/python-aioblescan/python-aioblescan.hash
+++ b/package/python-aioblescan/python-aioblescan.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioblescan/json
-md5  f59934c040a817192fcd3e713633cf20  aioblescan-0.2.8.tar.gz
-sha256  2b048f5fe6e85b18fe306bdb63307705f3d1139563d3187d751b8657065a5bd9  aioblescan-0.2.8.tar.gz
+md5  0601cf9335e5d89166a88f53597c79bf  aioblescan-0.2.13.tar.gz
+sha256  28632e32c8180ea4b792f4cf9b88968dd100f4d3cee0cf16d27c193cf954422a  aioblescan-0.2.13.tar.gz
 # Locally computed sha256 checksums
 sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
index 8a9db927ac..f0e277d528 100644
--- a/package/python-aioblescan/python-aioblescan.mk
+++ b/package/python-aioblescan/python-aioblescan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOBLESCAN_VERSION = 0.2.8
+PYTHON_AIOBLESCAN_VERSION = 0.2.13
 PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
-PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/d2/10/b8b496903f33935c99f3602200d44ccc0b0a57b87e5fa65b89466c1b1f31
+PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/bd/04/c6798c76704d57da22f19c2e47485821d4b23144ef75f9c0e18dbfe47565
 PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
 PYTHON_AIOBLESCAN_LICENSE = MIT
 PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
