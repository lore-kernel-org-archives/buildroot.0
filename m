Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C620C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF523610DC;
	Tue, 21 Feb 2023 00:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF523610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VxpV3QirHvr8; Tue, 21 Feb 2023 00:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28074610DB;
	Tue, 21 Feb 2023 00:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28074610DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 442CA1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C27F41810
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C27F41810
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNOHMfj7VM0O for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 927E34181A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 927E34181A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FD0B8648F; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 21:56:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4cc59b5cb397ee79d1a8152540eec512354b1825
X-Git-Newrev: 0b5b92019ba30aecdaa7ba34c255d15e0c0489e8
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.8FD0B8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Matt Weber
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b5b92019ba30aecdaa7ba34c255d15e0c0489e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

I regret that my work situation doesn't sustain me contributing.

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 105 -------------------------------------------------------------
 1 file changed, 105 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index df2b98ad53..72a56deb4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1984,111 +1984,6 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
-N:	Matt Weber <matthew.weber@collins.com>
-F:	board/freescale/p*
-F:	board/freescale/t*
-F:	board/qemu/ppc64-e5500/
-F:	configs/freescale_p*
-F:	configs/freescale_t*
-F:	configs/qemu_ppc64_e5500_defconfig
-F:	package/ace/
-F:	package/argp-standalone/
-F:	package/aufs/
-F:	package/aufs-util/
-F:	package/bc/
-F:	package/bridge-utils/
-F:	package/checkpolicy/
-F:	package/checksec/
-F:	package/cgroupfs-mount/
-F:	package/compiler-rt/
-F:	package/crda/
-F:	package/cunit/
-F:	package/dacapo/
-F:	package/davici/
-F:	package/dnsmasq/
-F:	package/dosfstools/
-F:	package/eigen/
-F:	package/ethtool/
-F:	package/flashbench/
-F:	package/fmc/
-F:	package/fmlib/
-F:	package/freeradius-server/
-F:	package/git/
-F:	package/gnutls/
-F:	package/hostapd/
-F:	package/i2c-tools/
-F:	package/ifplugd/
-F:	package/igmpproxy/
-F:	package/iperf/
-F:	package/iperf3/
-F:	package/iputils/
-F:	package/iw/
-F:	package/jitterentropy-library/
-F:	package/kvm-unit-tests/
-F:	package/kvmtool/
-F:	package/libcsv/
-F:	package/libcurl/
-F:	package/libeastl/
-F:	package/libfcgi/
-F:	package/libopenssl/
-F:	package/libselinux/
-F:	package/libsemanage/
-F:	package/libsepol/
-F:	package/libssh2/
-F:	package/libtalloc/
-F:	package/libqmi/
-F:	package/lighttpd/
-F:	package/logrotate/
-F:	package/makedevs/
-F:	package/memtester/
-F:	package/mii-diag/
-F:	package/mrouted/
-F:	package/mtd/
-F:	package/mtools/
-F:	package/nginx-upload/
-F:	package/omniorb/
-F:	package/openresolv/
-F:	package/paxtest/
-F:	package/picocom/
-F:	package/policycoreutils/
-F:	package/proftpd/
-F:	package/protobuf-c/
-F:	package/protobuf/
-F:	package/python-colorama/
-F:	package/python-filelock/
-F:	package/python-flask-cors/
-F:	package/python-iptables/
-F:	package/python-ipy/
-F:	package/python-iwlib/
-F:	package/python-posix-ipc/
-F:	package/python-pycairo/
-F:	package/python-pysftp/
-F:	package/python-tinyrpc/
-F:	package/python-txdbus/
-F:	package/qoriq-rcw/
-F:	package/raptor/
-F:	package/rng-tools/
-F:	package/rsyslog/
-F:	package/setools/
-F:	package/sloci-image/
-F:	package/smcroute/
-F:	package/tclap/
-F:	package/tini/
-F:	package/uboot-tools/
-F:	package/unionfs/
-F:	package/valijson/
-F:	package/wpa_supplicant/
-F:	package/wireless_tools/
-F:	package/xen/
-F:	package/xml-security-c/
-F:	support/testing/tests/fs/test_oci.py
-F:	support/testing/tests/package/br2-external/clang-compiler-rt/
-F:	support/testing/tests/package/br2-external/openjdk/
-F:	support/testing/tests/package/test_clang.py
-F:	support/testing/tests/package/test_openjdk.py
-F:	support/testing/tests/package/test_opkg/
-F:	support/testing/tests/package/test_opkg.py
-
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
 F:	package/python-autobahn/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
