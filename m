Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D1AC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C05281FB0;
	Wed, 15 Feb 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C05281FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBtS5iFNjfyI; Wed, 15 Feb 2023 20:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE311813D6;
	Wed, 15 Feb 2023 20:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE311813D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82A9F1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE64415CF
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CE64415CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xNDc1tKsz8u for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40880409AD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40880409AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BF5885C8B; Wed, 15 Feb 2023 20:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 21:56:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cc59b5cb397ee79d1a8152540eec512354b1825
X-Git-Newrev: 0b5b92019ba30aecdaa7ba34c255d15e0c0489e8
X-Patchwork-Hint: ignore
Message-Id: <20230215205629.2BF5885C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Matt Weber
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
