Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39907C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 23:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06DF84001;
	Sun, 29 May 2022 23:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpxcsEFfHH4r; Sun, 29 May 2022 23:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D91FF83FA4;
	Sun, 29 May 2022 23:13:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C7E11BF489
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 23:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AE8D60B0E
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 23:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibA51Y3YyfUU for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 23:13:06 +0000 (UTC)
X-Greylist: delayed 00:29:59 by SQLgrey-1.8.0
Received: from 20.mo581.mail-out.ovh.net (20.mo581.mail-out.ovh.net
 [46.105.49.208])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFDBB60B0C
 for <buildroot@buildroot.org>; Sun, 29 May 2022 23:13:05 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.111.208.229])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id E801E20E3E
 for <buildroot@buildroot.org>; Sun, 29 May 2022 22:33:13 +0000 (UTC)
Received: from blach.pl (unknown [178.218.193.145])
 (Authenticated sender: grzegorz@blach.pl)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id D01222AEAC19B;
 Sun, 29 May 2022 22:33:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004d7594b6f-4887-4541-b763-46917e5798a3,
 B6E767EC557CE4FA95D05743EA4C0310EE7C05D6) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 178.218.193.145
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 00:32:44 +0200
Message-Id: <20220529223248.51556-2-grzegorz@blach.pl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529223248.51556-1-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17629622218415685953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefirhiivghgohhriicuuehlrggthhcuoehgrhiivghgohhriiessghlrggthhdrphhlqeenucggtffrrghtthgvrhhnpeeifffhteelvedtuddtuedtfeelgedvjeevfeeuteehgfdtgfejhfdvteffjeehvdenucffohhmrghinhepphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkpheptddrtddrtddrtddpudejkedrvddukedrudelfedrudegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhiivghgohhriiessghlrggthhdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] [PATCH 2/5] package/python-pyjwt: Bump to version 2.4.0
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
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 5ea6c0cd50..1de3a79a15 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  60cf2d463157bf21eb37be0430521036  PyJWT-2.3.0.tar.gz
-sha256  b888b4d56f06f6dcd777210c334e69c737be74755d3e5e9ee3fe67dc18a0ee41  PyJWT-2.3.0.tar.gz
+md5  665f444d7805e36826bb09ce6434e73a  PyJWT-2.4.0.tar.gz
+sha256  d42908208c699b3b973cbeb01a969ba6a96c821eefb1c5bfe4c390c01d67abba  PyJWT-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index ba8130e7ca..53cc50b650 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.3.0
+PYTHON_PYJWT_VERSION = 2.4.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/1d/8e/01bdcfdbb352daaba8ea406d9df149c5bba7dbf70f908d4fa4c269fe6a08
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/d8/6b/6287745054dbcccf75903630346be77d4715c594402cec7c2518032416c2
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
