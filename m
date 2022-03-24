Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CFFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 22:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC4486104C;
	Thu, 24 Mar 2022 22:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2kTqiJDyuki; Thu, 24 Mar 2022 22:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C978260A8D;
	Thu, 24 Mar 2022 22:32:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 656001C115D
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575FE41094
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 22:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p43OhH4AFNg4 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 22:32:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CECF4107C
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 22:32:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 226D385CB7; Thu, 24 Mar 2022 22:23:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 23:29:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68159373d1a1fcb542a1ad411141dc910b8e1d49
X-Git-Newrev: 3c6b750201e27cfdf3e0ce23f0bd45b1c62f18c2
X-Patchwork-Hint: ignore
Message-Id: <20220324222320.226D385CB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c6b750201e27cfdf3e0ce23f0bd45b1c62f18c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d30542dde748f4d3b04ac5d1a238c8280de611fb)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index 59ae8f15ce..981c4c08ec 100644
--- a/CHANGES
+++ b/CHANGES
@@ -131,6 +131,29 @@
 	#14501: lttng-modules v2.11 package fails to build
 	#14531: Package EFL - build error
 
+2021.11.3, released March 24th, 2022
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, azure-iot-sdk-c, boinc, dbus,
+	directfb, docker-engine, exempi, expat, flac, gdb, gdk-pixbuf,
+	gnutls, go, haproxy, libcurl, libiec61850, libminiupnpc,
+	libodb, libodb-boost, libopenssl, libpjsip, libressl, librsvg,
+	libsrtp, libvirt, libxml2, libxslt, lxc, mariadb, minidlna,
+	odb, openblas, openvpn, oprofile, php, pppd, python-ipython,
+	python-twisted, raptor, rpi-firmware, samba4, seatd,
+	timescaledb, usbguard, util-linux, vim, wavpack,
+	wireless-regdb, wireplumber, wireshark, wolfssl, xscreensaver,
+	xterm, zsh
+
+	New packages: gdk-pixbuf-xlib
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13126: make fails - bzip2-1.0.6.tar.gz and DirectFB-1.7.7.tar..
+	#14636: azure-iot-sdk-c: Installed headers do not compile
+	#14641: oprofile can not find the events files
+
 2021.11.2, released February 28th, 2022
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
