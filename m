Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DC5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 23:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48B283403;
	Tue, 31 May 2022 23:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPWXkgGhQ6jj; Tue, 31 May 2022 23:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2113817EB;
	Tue, 31 May 2022 23:43:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9361BF844
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D50817EB
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 23:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQIR-eIBdAKR for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 23:43:11 +0000 (UTC)
X-Greylist: delayed 04:30:04 by SQLgrey-1.8.0
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net
 [87.98.184.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15150817D3
 for <buildroot@buildroot.org>; Tue, 31 May 2022 23:43:10 +0000 (UTC)
Received: from player756.ha.ovh.net (unknown [10.109.138.54])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 763BC249DF
 for <buildroot@buildroot.org>; Tue, 31 May 2022 18:55:23 +0000 (UTC)
Received: from blach.pl (unknown [178.218.193.145])
 (Authenticated sender: grzegorz@blach.pl)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id 2A3752A41FDBF;
 Tue, 31 May 2022 18:55:14 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00580538729-2ef1-4880-8ac2-b6a44f2b6248,
 9FBD27401CD9201F28E554BA6E9F2A6F99B84174) smtp.auth=grzegorz@blach.pl
X-OVh-ClientIp: 178.218.193.145
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 20:54:44 +0200
Message-Id: <20220531185444.226429-1-grzegorz@blach.pl>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7249106550391456065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepifhriigvghhorhiiuceulhgrtghhuceoghhriigvghhorhiisegslhgrtghhrdhplheqnecuggftrfgrthhtvghrnhepuedvheegleeludegleeggffgueekhedtfeelueegffehlefhiefhteejvdeuueetnecuffhomhgrihhnpehphihpihdrohhrghdpphihthhhohhnhhhoshhtvggurdhorhhgnecukfhppedtrddtrddtrddtpddujeekrddvudekrdduleefrddugeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejheeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhriigvghhorhiisegslhgrtghhrdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH 3/5] package/python-falcon: Bump to version 3.1.0
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
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 979419c25a..d4e99a6998 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  4a70cfeeacb453f5fd7eb791bdd3ac01  falcon-3.0.1.tar.gz
-sha256  c41d84db325881a870e8b7129d5ecfd972fa4323cf77b7119a1d2a21966ee681  falcon-3.0.1.tar.gz
+md5  0172450908573a4449a5937810d512b9  falcon-3.1.0.tar.gz
+sha256  f2760bd18c16393a6fb5e55f371f67921edb72febe693a82b3c5e82195d087b7  falcon-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index 1f400f9a1f..01b5eca4a2 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 3.0.1
+PYTHON_FALCON_VERSION = 3.1.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/63/22/6a9009c53ad78e65d88a44db8eccc7f39c6f54fc05fb43b1e9cbbc481d06
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/36/53/4fd90c6c841bc2e4be29ab92c65e5406df9096c421f138bef9d95d43afc9
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
