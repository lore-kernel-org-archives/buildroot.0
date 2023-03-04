Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4720EC64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 11:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC92241821;
	Sat,  4 Mar 2023 11:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC92241821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tv2ND_l9GxSp; Sat,  4 Mar 2023 11:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA081418FC;
	Sat,  4 Mar 2023 11:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA081418FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1554E1BF853
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 11:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0F44418FC
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 11:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F44418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_Ln52RMXLMD for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 11:01:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD33418E8
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 11:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD33418E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9EA7860C9; Sat,  4 Mar 2023 11:01:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 12:00:45 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 262ffb09e8850fa2c80560a5ca65b0f8ae89f6f2
X-Git-Newrev: 99147ae8b8cfcdf6c61b5359665da1554cace016
X-Patchwork-Hint: ignore
Message-Id: <20230304110135.A9EA7860C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: drop Matt
 Weber
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

commit: https://git.buildroot.net/buildroot/commit/?id=99147ae8b8cfcdf6c61b5359665da1554cace016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

I regret that my work situation doesn't sustain me contributing.

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0b5b92019ba30aecdaa7ba34c255d15e0c0489e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 102 -------------------------------------------------------------
 1 file changed, 102 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c4bcdb223..1e84b1f707 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1846,108 +1846,6 @@ F:	board/technologic/ts4900/
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
-F:	package/python-bunch/
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
-F:	support/testing/tests/package/br2-external/openjdk/
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
