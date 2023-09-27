Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2D1E7F14F
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 22:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CBA7419A6;
	Wed, 27 Sep 2023 22:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CBA7419A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8AfgV0y5HKRs; Wed, 27 Sep 2023 22:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE8A41983;
	Wed, 27 Sep 2023 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE8A41983
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA081BF263
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 588068136A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 22:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 588068136A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOdcEdtXQmrj for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 22:21:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 307DA81366
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 22:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 307DA81366
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78FE4FF806
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 22:21:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qlcug-005LPD-RQ
 for buildroot@buildroot.org; Thu, 28 Sep 2023 00:21:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:21:46 +0200
Message-ID: <87v8bvxnnp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.08.1 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2023.08.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2023.08.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2023.08.1.tar.xz

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2023.08.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2023.08 release.

- Security fixes for asterisk, freerdp, ghostscript, go, haproxy, hwloc,
  irssi, libcoap, libcurl, libjxl, libpjsip, libqb, libraw, mutt,
  netatalk, opensc, sngrep, strongswan, vim, webkitgtk, webp, wireshark,
  xterm

- Fixes for download/compilation/runtime/license issues in agentpp,
  binutils, conmon, docker-cli, docker-engine, erlang, esp-hosted, fio,
  fstrcmp, gcc, gdb, libjxl, libopenssl, libuv, lldpd, ne10, nodejs,
  nut, openblas, openvpn, petitboot, php, pound, pppd, python-pytest,
  qt5, rtl8812au-aircrack-ng, stress-ng, tcl, timescaledb, util-linux,
  xserver_xorg-server, xzing-cpp, zynaddsubfx

- Various fixes to the CPE / CVE ignore markings

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2023.08.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2023.08..

    33  Fabrice Fontaine
    13  Daniel Lang
     6  Julien Olivain
     5  Peter Korsgaard
     5  Yann E. MORIN
     4  Jens Maus
     3  Giulio Benetti
     3  Marcin Niestroj
     2  Christian Stewart
     2  Stefan Agner
     2  Waldemar Brodkorb
     2  Yanghao Cheng
     1  Adam Duskett
     1  Baruch Siach
     1  Frank Hunleth
     1  Maxim Kochetkov
     1  Reza Arbab
     1  Thomas Devoogdt
     1  Thomas Petazzoni

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
