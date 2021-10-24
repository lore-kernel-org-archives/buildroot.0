Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF68C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 05:54:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C23160ED4
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C23160ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6596061A;
	Sun, 24 Oct 2021 05:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szVn-G2ekas2; Sun, 24 Oct 2021 05:54:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 913606061D;
	Sun, 24 Oct 2021 05:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB7541BF3F9
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 05:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B34A80DDD
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 05:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_BzBcAckEFj for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 05:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 800A980C1F
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 05:54:22 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A5D00FF805
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 05:54:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Oct 2021 05:54:19 -0000
Message-Id: <20211024055424.9B34A80DDD@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-23
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

Autobuild statistics for 2021-10-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 38  |  3  |  0  | 41  |
  2021.08.x  | 34  |  1  |  0  | 35  |
    master   | 69  | 78  |  0  | 147 |

Classification of failures by reason for master
-----------------------------------------------

                  boinc-7.18.1 | 14
              host-erlang-22.2 | 11
                tpm2-tss-3.1.0 | 11
             transmission-3.00 | 6 
              tinydtls-0.9-rc1 | 5 
               host-qemu-6.1.0 | 3 
                 wavemon-0.9.4 | 3 
                   gstd-0.13.0 | 2 
            python-ujson-4.2.0 | 2 
             util-linux-2.37.2 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                 diffutils-3.8 | 1 
                    ffmpeg-4.4 | 1 
firmware-utils-86739f2b3ae9... | 1 
                  gensio-2.2.9 | 1 
           host-mono-6.12.0.90 | 1 
libdbi-88b8477d57153b9f736d... | 1 
               linux-pam-1.5.1 | 1 
                  ndisc6-1.0.5 | 1 
                    olsr-0.9.8 | 1 
               pipewire-0.3.38 | 1 
          python-libusb1-2.0.1 | 1 
                 samba4-4.14.8 | 1 
              strongswan-5.9.1 | 1 
                suricata-6.0.3 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b680b5e4768ca848a68ed02340bc314109987b9a |     
powerpc64le  |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5fec38a910e9f5432d6748bff6e3f2ee1e52ed4d |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c52a6b8982c4fc70ad440a565551ec3d8e61c56c |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6212f35c02d0b8a82b19614b2cb9322225fa5eb3 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/9963b4de8c047300aedfb90d286dea08b68165c3 |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/55a09da8940b5b1dabf52dc01335591bfafc1826 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/bf11906798dba7575590af84836fd80a4da6699b |     
   sparc     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/333cf26a5ed1ada91f5668b29ce3e09227ceb325 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cee566726f902e94302a083ed3f4acb9bb370690 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3358b9b5867b368405095e1c84fb002312557600 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/e9271e4febea1681925272740029d8e3b06596f7 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5a49c18154831a0102b958a659203b8ab61b4340 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f912a46e569fa3001cd7277cd8422d7d3df09919 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/198cef8c2ce353430e30c992dd717f6338ba9ca9 |     
   sparc     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/868c0002f7aba15053d0e2dd71c510ff9d1b8e3d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/49422dd71da7db156c5d0ee6968382e2a76ba926 |     
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/584c6d4cdffd9add21b2967df219075d8b9360f9 | ORPH
    arc      |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1f6a5f34c94d0d1fdae490193bce4ebb456f6139 |     
    m68k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/47623cfbd846f1c44201218532938f30f898bcca |     
   sparc     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/c7130dd4521d6c9b101d4de39837dfa993fabce2 |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/33dcabaefdd4184d54918a7999cb4b716c6b2cdc |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/0cd9fa8ef113af24df28aa843a5a0dd19dba6811 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b18c3438d966d56181d146aff0b6c88516cc5024 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/544f4206a24f100b8621dbc150da699ef95905d3 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/31ac2ae762da281f1dbfa938f85405a406d9dde8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3729572486e656989c786b384fdf4c1f849a418d |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3b7caca6666cda07996878944c181d3987f19357 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7bebfad4ed022728b9e9aa34ded8c1b9c89b7e82 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/042dcb7a60fbfea173f3fef6b94adb9e58e33f75 |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b9e1100f89171ee0bb92513292f1199965eb4a68 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c7192d50b3a89b4fe5576307c30e4f3ee7e0ccc2 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/77158fae94c384a7c9d60cc5d2e47d1eea17eac9 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/18f4dde5ae4c7db9eff4ce3cb86ffa01f8a3810a |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/677f1d5751f1ce4b1c26aefec5dad1db8ac21b4a |     
  riscv32    |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/b979c7bead1bfe8a566c8a5398f6e29d25cb6aaa |     
  aarch64    |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/06193b431d3dfd97a5a64aaa87f53e6be62940c3 |     
   x86_64    |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/b3f3b8a0cfc6d51b00f0141cbb645802d82eda20 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/0de5d39eb59889f09f3cc50dbd0df24a693be0ca |     
  riscv64    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/a6ae3ce99dba429da9a0d1eb8402c8a6fe0e9524 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/75f9b7c36d233f3391d6156b1e86fb79be92d25a | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/241a09ef3d988c3f8a6f2769f780cb376c7e172f | ORPH
    sh4      |        pipewire-0.3.38         | NOK | http://autobuild.buildroot.net/results/a141d57aa7bd951a657a32fbc19ff5d5ec6a47fd |     
 powerpc64   |      python-libusb1-2.0.1      | NOK | http://autobuild.buildroot.net/results/1ff8f95637ff95676d0e1fe58062fa9f588d05a1 |     
   xtensa    |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/522dfc2383d82ccb2783b1635076204f7144c98c |     
powerpc64le  |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/5af6476114f8251c89f6e7796a82bb2a84d710f2 |     
    arc      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/bd8f3e0fa8396ad3bea08735e9f6fa0d49760b30 |     
  mips64el   |        strongswan-5.9.1        | NOK | http://autobuild.buildroot.net/results/57419d02652a2d9de233b7f05c8b980d62dbd063 |     
    arm      |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/7fe577e065ec947cee6d8e3fcf9098557a948718 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/611a27b1392bef5a2cd253a8bf8b42e8e5dd21ab |     
  riscv32    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5432f09c0d6ed0ee5b9d3c6270aed918457f6635 |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2052e7dab7f38bc8192ebb73aa300b82d93f1d8a |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f11d1c6485f94a4a7769cbe4c479f7f6392a359f |     
  nds32le    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b41d856dc3ae5ed6a2536d30a5076fbf67b78e72 |     
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a17c1d9e991a2861344553d8f37be2f1dfa09bfe | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7da7d3129bbcb34e0a0199cd832f58b4c3300099 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6509222b40369441801c017184459b69444d4bfa | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a7965d3458ec690bd9946003bf9575fe97aaf3aa | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4f8bdbb70714b6281d3399ede3bc0e1ce5e4576a | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6cc81ffe3dd02ba4e44eb4b193f76a71793f2325 | ORPH
    mips     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f127917088fec62ab900418b0a398b8a85b69a61 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f85f62d52500e882beef91074149ca1513cc6f7b | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/164fe04594f060171f26f62f43769b4468fbd8d6 | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d060fd50480765c55e054e7233795bf78a837e60 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/728b8307ed4f0f617fe0184536aa36de86461b19 | ORPH
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/3818e39135a0fe3cab33541ad40649dc1fd9280c |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/1ea439c9f6f049e8c6ed57c27f320436ba6514bf |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/78e095b20a1f4c3450a8851ee6ae1294c5d27ead |     
  mips64el   |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/90431f842c9dab1e77cb0938e0f8477f015f4c10 |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/90eed5d44153373c57e15beb9f0207cf572861fb |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/6f1ed04db838477c5ab4e79a82c48380a0fa025a |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/54a36399fcbe9019dfd581ce0c1abab1903faaf0 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/d1bc2138aed79aec6e6121661db52c9f911182d6 |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/a4c3ef0f4748140873eb52b3d657d1a0ad7caf03 | ORPH
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/b9de688eb32d5f41752fb30148cc914772a7dfa6 | ORPH
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b8f328cc7c532acc91a9e22b208ab5dac5b441f8 |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0aa118533daec3c9ae4edf22b293ba76fb4243f9 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/62aba3eb092482156c90fb8e6360295b06cc1ea5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a945b1a85fb470259532acdb1fb174bf354fe546 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 
              webkitgtk-2.30.6 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/491ab77cce063e68926ec7a2cfd900146795768d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bfe377101af204901d3e0b4d0c149392c0ddcb03 |     
  mips64el   |        webkitgtk-2.30.6        | NOK | http://autobuild.buildroot.net/results/2f0ea20f1dd7816a8f3a6755acb1815d0758b55a |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/482888037fd0ba54e04ea8312ae88e5e65a95cfe | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
