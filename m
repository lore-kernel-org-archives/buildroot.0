Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF566C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 07:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE00611C2
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 07:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EE00611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE8E831F5;
	Fri, 15 Oct 2021 07:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmnalVmQM4RY; Fri, 15 Oct 2021 07:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03819832B3;
	Fri, 15 Oct 2021 07:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 38A0D1BF381
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 07:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3338640153
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 07:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAWTbWiB-A_n for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 07:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 138D540012
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 07:06:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1FB88E0010
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 07:06:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Oct 2021 07:06:06 -0000
Message-Id: <20211015070611.3338640153@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-14
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

Hello,

Autobuild statistics for 2021-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  5  |  0  | 25  |
  2021.05.x  | 31  |  4  |  0  | 35  |
  2021.08.x  | 24  |  3  |  0  | 27  |
    master   | 26  | 46  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

           oracle-mysql-5.1.73 | 7 
      host-oracle-mysql-5.1.73 | 4 
                libgpiod-1.6.3 | 4 
                       unknown | 4 
              host-erlang-22.2 | 3 
libdbi-88b8477d57153b9f736d... | 3 
              tinydtls-0.9-rc1 | 3 
                tpm2-tss-3.1.0 | 3 
             transmission-3.00 | 3 
   host-python-decorator-5.1.0 | 2 
                  boinc-7.18.1 | 1 
               capnproto-0.8.0 | 1 
                  libsoc-0.8.2 | 1 
            lttng-tools-2.12.3 | 1 
              micropython-1.17 | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.5 | 1 
                 openal-1.21.1 | 1 
             python-pip-21.2.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/8f8b8bcb11116ec9ea292641bec63d5b2d5bc4a2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c3d2c1a4cb6a135556e3aaa9748ce433b1fe3f26 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a97aeaee5655399fe0f919cd323e9af77aec10c8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/379f424bf199e8fc42e566dc2d1c052e13077284 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/719b58c60ad10ecc2b967102c018cf2db5f69230 |     
   xtensa    |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/ae08a2db89a487a6a2ad58da9f5fd02f68e5059b | ORPH
powerpc64le  |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/8de001cc4ca47590bd57f67d16d996717d81f4e8 | ORPH
  aarch64    |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/359a134613d3351b594ee237b9b44a6ce9151bc9 | ORPH
  aarch64    |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/20eff94e3354135c6498415f2aa0b8e52aac38d5 | ORPH
  powerpc    |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/dba8939c81c7d100c29716e879345b17ab28799e |     
microblazeel |  host-python-decorator-5.1.0   | NOK | http://autobuild.buildroot.net/results/ae16dede81303cf191ca98eea737f9e313d7adb5 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/4920519132b3b1994f9cf35e330b3c8586547615 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/5ebf99202b5b0457c15048b915785110b744f3e1 |     
  powerpc    | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/9cd56a625cbd52b0c070e2d462e02f5161d9631d |     
  aarch64    |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/59b967d31680dfd7b3a03843afa65fb7e4f379a7 |     
    or1k     |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/57024dc050017bc0564cc3490c7c862a425dc69f |     
    arc      |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/cf127f31c504950b8ff0115c0a32d80ba7ab28c3 |     
 powerpc64   |         libgpiod-1.6.3         | NOK | http://autobuild.buildroot.net/results/8ea8b31ae416fac48d85d652308a2cadc5ab24f6 |     
  riscv32    |          libsoc-0.8.2          | NOK | http://autobuild.buildroot.net/results/97b9eaa4c01b044af10dc659055c1d83694a1542 |     
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/d4d21f3085cbcbcb4baaa7d69734ae8c57b3ffc3 |     
    m68k     |        micropython-1.17        | NOK | http://autobuild.buildroot.net/results/96f7b81f5d14715b0b6673a8016a31e9e1552d0b |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/6eae37be36059f78c0602c4a156923112b33e12e |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/ce14ff0d0dca7dcba8b7685b273e1c266ff5309c | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a9025abfc05fba25991e1b4f4d0e2362cc2c1ac9 |     
    arm      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/81bae87422b51f4c02162d7a2204bf069491410a | ORPH
   nios2     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/99fe9cc47bf69deddacf2ea6efe71f0df5a53258 | ORPH
    arm      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/df269564d2e85f551d240effb9a8f7aca5fc8738 | ORPH
    mips     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/b93a6cc4227cdb7015d799c6c500659828eb9507 | ORPH
    arm      |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/22aca098ecabed9a7d1ff0b4e8e7ff694469014d | ORPH
  aarch64    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/6be1ef25ab4a7f22c5cfef4f0c6c3b18a8dff180 | ORPH
    or1k     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/404357eb5dffc94c909671879ee56adb5276753d | ORPH
    arc      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/17f9b54b25f3d306c3a9606645e9a352f95f83b4 |     
   x86_64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c808b16e0e6bcbd83d59fa2ccc83d2add6bd36fc |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/67eaff260925683143414d5294c3eab07dbc523d |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/da051828a2d6250de6ef77bcf002fb53bf367952 |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/92db4566e477bd51dd1fe69e3d12dfea20fa487c | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9d0938ea10770207d936e16b703ec287d8a2ca04 | ORPH
  riscv32    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4c543ce362202f679aff7fd2678e9902ce1c5728 | ORPH
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/dc888ec0e24ec533ce0c7a1779dd037931760657 |     
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/d5066247a9b4fa8c9c341273c4b408918c6bd1d3 |     
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/d5f77c7f9de33ae8e5c730118c2f621de151886b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ac5f2df87db238d6c331d72c9994f81479d8a139 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c4f6a75fc16ee30f9b7d1b6f4a46250458dc6b71 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/698cd0fb0f4c46e93df495a967c64c69023522d7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/293576962952feb794450e0e3268ef160f0f6724 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/10b92a2ed560f508efa746861ee1fc9691333e9b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a8189ed1570a9c65f7992da3588c0faed432ec19 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2476e59cd96ae16886e0db2cef8d6133f13b6e74 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e2b1b098f1455639170e420a8e64d8e8f91c0745 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6de2893e068f9aa37d12ae4779b68879e3284df3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/887bd310a55330245eebf539249088066d8e076c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f9aefd011e903528c00dea878d36c2b7500adc2d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5f1ec9404e7bbf5f945f13fc36ea115b292cfe2a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/04193520914288a00d0e5412840028154d49de5e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/08fb716758935c2b393bf92fd18f4290a9c76bbc |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                 mesa3d-21.1.6 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/60296a48210e7ffc6bc9fa50ee586441a8957e85 |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/7daaffa387b0791dc5af59605d499c13afd47127 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/726330089c8875b59a26eddc1b6a06ff1b58132a |     


Gitlab CI results for 2021-10-14
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
