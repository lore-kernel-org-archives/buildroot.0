Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4110DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 13:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D08758424D;
	Fri, 25 Mar 2022 13:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj86l8eZIbiR; Fri, 25 Mar 2022 13:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D924B823CF;
	Fri, 25 Mar 2022 13:17:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B55E1BF35D
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97B02605EA
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 13:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JX-41VVpw4h for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 13:17:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F291660591
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 13:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5A4F085D2D; Fri, 25 Mar 2022 13:08:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 14:14:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7a2c761745357379d42ee907bd738ed2309db3
X-Git-Newrev: 7935ca44508a605a5bce73d4ad63cd7c18450c70
X-Patchwork-Hint: ignore
Message-Id: <20220325130832.5A4F085D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=7935ca44508a605a5bce73d4ad63cd7c18450c70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6a78c830a49b19425de5d1df407c2ba8c302cb7a)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGES b/CHANGES
index 981c4c08ec..370f89aa6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -803,6 +803,30 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.11, released March 25th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, azure-iot-sdk-c, dbus,
+	directfb, docker-engine, exempi, expat, flac, gdk-pixbuf,
+	gnutls, go, haproxy, libcurl, libiec61850, libminiupnpc,
+	libodb, libodb-boost, libopenssl, libpjsip, libressl, librsvg,
+	libsrtp, libxml2, libxslt, lxc, mariadb, odbm openblas,
+	openvpn, oprofile, php, pppd, python-ipython, python-treq,
+	python-twisted, python-txbus, python-txtorcon, raptor,
+	rpi-firmware, samba4, timescaledb, util-linux, vim, wavpack,
+	wireless-regdb, wireshark, wolfssl, xscreensaver, xterm, zsh
+
+	New packages: gdk-pixbuf-xlib
+
+	Removed packages: python-coherence
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13126: make fails - bzip2-1.0.6.tar.gz and DirectFB-1.7.7.tar..
+	#14636: azure-iot-sdk-c: Installed headers do not compile
+	#14641: oprofile can not find the events files
+
 2021.02.10, released February 28th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
