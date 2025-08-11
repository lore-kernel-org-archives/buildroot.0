Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953CCC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B17061305;
	Mon, 11 Aug 2025 10:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDX2IEdwO-w5; Mon, 11 Aug 2025 10:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393ED6130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393ED6130B;
	Mon, 11 Aug 2025 10:44:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1255D154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED17682379
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAsZt_kzuPCq for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 10:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC9E48234B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC9E48234B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:44:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BBE987110; Mon, 11 Aug 2025 10:44:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 12:40:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4694522c9ec9783eeadcabc1cf647ad037538f9
X-Git-Newrev: eac5605b576474c3619de17309fff41a7f0f1871
X-Patchwork-Hint: ignore
Message-Id: <20250811104423.9BBE987110@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: move 2025.02.4 where it belongs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eac5605b576474c3619de17309fff41a7f0f1871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f30bf62f5340 ("CHANGES: update for 2025.02.4") added the release to
the top of the file instead of below 2025.05-rc1.  Fix that and indent with
a tab like the other releases.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 144 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6ce20522bb..957a838a7e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,75 +1,3 @@
-2025.02.4, released June 23th, 2025
-
-    Important / security related fixes:
-
-    - assimp: CVE-2025-3015, CVE-2025-3016
-    - binutils: CVE-2025-3198
-    - connman: CVE-2025-32366, CVE-2025-32743
-    - go: CVE-2025-0913, CVE-2025-4673, CVE-2025-22874
-    - iputils: CVE-2025-47268, CVE-2025-48964
-    - jq: CVE-2024-23337, CVE-2025-48060, CVE-2024-53427
-    - libcurl: CVE-2025-4947, CVE-2025-5025, CVE-2025-5399
-    - net-tools: CVE-2025-46836
-    - nodejs: CVE-2025-23165, CVE-2025-23166
-    - openvmtools: CVE-2025-22247
-    - python-django: CVE-2025-48432
-    - python-requests: CVE-2024-47081
-    - python-tornado: CVE-2025-47287
-    - redis: CVE-2025-21605, CVE-2025-27151
-    - samba4: CVE-2025-0620
-    - sox: CVE-2021-23159, CVE-2021-23172, CVE-2021-23210, CVE-2021-3643,
-        CVE-2021-40426, CVE-2022-31650, CVE-2022-31651, CVE-2023-26590,
-        CVE-2023-32627, CVE-2023-34318
-    - webkitgtk: CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
-        CVE-2025-31206, CVE-2025-31215, CVE-2025-31257
-
-    Updated / fixed packages: alsa-utils, atkmm, atmm2_28, audit,
-    bluez5_utils, busybox, catch2, connman, dbus-glib, dlib, dovecot,
-    esp-hosted, execline, firmware-ele-imx, flex, fluent-bit, freescale-imx,
-    ghostscript, gmrender-resurrect, grub2, gst1-plugins-bad, gtkmm3, iputils,
-    kmsxx, libcamera, libcurl, libglade, libical, libuv, llvm-project,
-    lm-sensors, m4, mesa3d, mongoose, openvmtools, php, protobuf-c,
-    python-django, python-fastapi, python-flit-core, python-jc,
-    python-requests, python-uvicorn, qt5 (declarative, webengine,
-    webengine-chromium), qt6 (base, multimedia, tools), rpm, samba4, spdlog,
-    systemd, uacme, uboot-tools, yasm
-
-    Removed package: libebur128
-
-    Infrastructure updates / fixes:
-
-    - pkg-cmake now forces CMake>=3.5
-    - pkg-meson now uses a dedicated buildroot build directory
-      see https://gitlab.com/buildroot.org/buildroot/-/issues/64
-    - include defconfigs in sub-directories in make list-defconfigs
-    - new manual section about private repositories
-    - pkg-autotools: handle libtool 2.5.x
-    - pkg-cmake: force check_language(CXX) to be false when building w/o C++
-    - pkg-stats: add support for reporting stale CVE entries
-    - add basic support for package file download over smb
-    - toolchain/wrapper: check unsafe paths earlier
-    - test_flutter: drop unneeded vga/vnc stanzas from QEMU invocation
-
-    Test improvements
-
-    - new python-pydantic runtime tests
-    - new dieharder runtime test
-    - test_xen: fix runtime test
-    - test_timezone: fix test by setting a fixed time
-    - new tree runtime test
-
-    Boards fixes
-
-    - imx6ulz-bsh-smm-m2: fix missing U-Boot
-    - freescale: fix cpu name in i.MX9 boards
-    - imx8mn-bsh-smm-s2: erase the entire NAND chip
-    - freescale_t1040d4rdb: fix kernel build
-
-    In addition, thanks to the new stale CVE reporting, reported
-    vulnerabilities have been fixed for the following packages:
-    busybox, dnsmasq, dovecot, exim, exim, freeradius-server, grub2,
-    libopenh264, libssh, netsnmp, ninja, qt5base, ripgrep, sox, tinyxml
-
 2025.05, released June 9th, 2025
 
 	Various fixes.
@@ -160,6 +88,78 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.4, released June 23th, 2025
+
+	Important / security related fixes:
+
+	- assimp: CVE-2025-3015, CVE-2025-3016
+	- binutils: CVE-2025-3198
+	- connman: CVE-2025-32366, CVE-2025-32743
+	- go: CVE-2025-0913, CVE-2025-4673, CVE-2025-22874
+	- iputils: CVE-2025-47268, CVE-2025-48964
+	- jq: CVE-2024-23337, CVE-2025-48060, CVE-2024-53427
+	- libcurl: CVE-2025-4947, CVE-2025-5025, CVE-2025-5399
+	- net-tools: CVE-2025-46836
+	- nodejs: CVE-2025-23165, CVE-2025-23166
+	- openvmtools: CVE-2025-22247
+	- python-django: CVE-2025-48432
+	- python-requests: CVE-2024-47081
+	- python-tornado: CVE-2025-47287
+	- redis: CVE-2025-21605, CVE-2025-27151
+	- samba4: CVE-2025-0620
+	- sox: CVE-2021-23159, CVE-2021-23172, CVE-2021-23210, CVE-2021-3643,
+	  CVE-2021-40426, CVE-2022-31650, CVE-2022-31651, CVE-2023-26590,
+	  CVE-2023-32627, CVE-2023-34318
+	- webkitgtk: CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
+	  CVE-2025-31206, CVE-2025-31215, CVE-2025-31257
+
+	Updated / fixed packages: alsa-utils, atkmm, atmm2_28, audit,
+	bluez5_utils, busybox, catch2, connman, dbus-glib, dlib, dovecot,
+	esp-hosted, execline, firmware-ele-imx, flex, fluent-bit, freescale-imx,
+	ghostscript, gmrender-resurrect, grub2, gst1-plugins-bad, gtkmm3, iputils,
+	kmsxx, libcamera, libcurl, libglade, libical, libuv, llvm-project,
+	lm-sensors, m4, mesa3d, mongoose, openvmtools, php, protobuf-c,
+	python-django, python-fastapi, python-flit-core, python-jc,
+	python-requests, python-uvicorn, qt5 (declarative, webengine,
+	webengine-chromium), qt6 (base, multimedia, tools), rpm, samba4, spdlog,
+	systemd, uacme, uboot-tools, yasm
+
+	Removed package: libebur128
+
+	Infrastructure updates / fixes:
+
+	- pkg-cmake now forces CMake>=3.5
+	- pkg-meson now uses a dedicated buildroot build directory
+	  see https://gitlab.com/buildroot.org/buildroot/-/issues/64
+	- include defconfigs in sub-directories in make list-defconfigs
+	- new manual section about private repositories
+	- pkg-autotools: handle libtool 2.5.x
+	- pkg-cmake: force check_language(CXX) to be false when building w/o C++
+	- pkg-stats: add support for reporting stale CVE entries
+	- add basic support for package file download over smb
+	- toolchain/wrapper: check unsafe paths earlier
+	- test_flutter: drop unneeded vga/vnc stanzas from QEMU invocation
+
+	Test improvements
+
+	- new python-pydantic runtime tests
+	- new dieharder runtime test
+	- test_xen: fix runtime test
+	- test_timezone: fix test by setting a fixed time
+	- new tree runtime test
+
+	Boards fixes
+
+	- imx6ulz-bsh-smm-m2: fix missing U-Boot
+	- freescale: fix cpu name in i.MX9 boards
+	- imx8mn-bsh-smm-s2: erase the entire NAND chip
+	- freescale_t1040d4rdb: fix kernel build
+
+	In addition, thanks to the new stale CVE reporting, reported
+	vulnerabilities have been fixed for the following packages:
+	busybox, dnsmasq, dovecot, exim, exim, freeradius-server, grub2,
+	libopenh264, libssh, netsnmp, ninja, qt5base, ripgrep, sox, tinyxml
+
 2025.02.3, released May 19th, 2025
 	Build issues and other problems solved for packages:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
