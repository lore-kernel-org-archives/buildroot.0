Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1443EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 06:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082C36109F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 082C36109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAB09400C6;
	Thu, 21 Oct 2021 06:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CKQO8mucFuN; Thu, 21 Oct 2021 06:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F6F7401B6;
	Thu, 21 Oct 2021 06:03:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFF401BF2C0
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 06:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBFE0401ED
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 06:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYTqobb_aO6x for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 06:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B856401B9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 06:03:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DDED6000E
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 06:03:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Oct 2021 06:03:11 -0000
Message-Id: <20211021060315.BBFE0401ED@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-20
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

Autobuild statistics for 2021-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 40  |  3  |  0  | 43  |
  2021.08.x  | 41  |  7  |  0  | 48  |
    master   | 70  | 50  |  0  | 120 |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 13
              host-erlang-22.2 | 8 
                  boinc-7.18.1 | 5 
              tinydtls-0.9-rc1 | 5 
libdbi-88b8477d57153b9f736d... | 2 
                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
                 diffutils-3.8 | 1 
firmware-utils-86739f2b3ae9... | 1 
                      gdb-10.2 | 1 
           host-mono-6.12.0.90 | 1 
libcamera-40f5fddca7f774944... | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.38 | 1 
          python-libusb1-2.0.1 | 1 
             python-pip-21.2.4 | 1 
             transmission-3.00 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
             util-linux-2.37.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ae385f61d7377618dffac8265294225c6e230000 |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/1cf9be8ed7e706e93c92383daa52e8e669f9ced3 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c07e753d2a15fbdf0bcaa8fe5cae782fcfbd963d |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b6cfbbfb3bc2197399c5415144212b9bab9bca91 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3f5e11c47f9629e11bc9c8182f0be4bf6478ea3f |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cc21db0ccf707527a9a952df14d9672db4e1ad22 |     
    or1k     |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/31f4b60189827a0744e9150839e3451929f814e5 | ORPH
  powerpc    | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/0563b24ccb7dd242998e1b59b217405c6340e276 |     
   x86_64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/ac56fa88002b757cc4b5c74a0af5a65967745c57 | ORPH
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4dcb1d8ca3ecf10531bfecbdfc4e63beb42faf27 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/16e95fbf1aa3cdbbc96b4ec1c00e9c4ff6744b1f |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2afec0a3456eed5b90720bfddfc9b808b3f1c69f |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/59a887f17df1374a613cf82492d70fbc7406fda8 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a74fa42fd511ad20a796ef3e88bc1091efad87b1 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cc493d08d8a24d38edc47d9ed0d6bc412d89a5dc |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/607a89a586c52a078b8bbd4795c03f21fd3b602c |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/6a55965cbc2db9d9addc950fe0d0d87eba5b3964 |     
  powerpc    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/853b3256915ad997593e6f151007979acc4562d1 |     
    arm      | libcamera-40f5fddca7f774944... | NOK | http://autobuild.buildroot.net/results/e1bb8aa1de310f3d27b74ec7d8748d170ad444e2 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/83261737993bcb1bdc9ba0f1dfe19530c2a88f03 |     
microblazeel | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/788de6a3763b4f5ef41f74f62b5c58c9c14c7d4e |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1200a10b59a4ee73ee56cb6931aa7bb16a589606 |     
 powerpc64   |        pipewire-0.3.38         | NOK | http://autobuild.buildroot.net/results/ea91aa0389ea026e21150bcf498a84bea859f166 |     
   s390x     |      python-libusb1-2.0.1      | NOK | http://autobuild.buildroot.net/results/ebd3e4d39816e21cb9d798f3e23d2630c619ad01 |     
    arm      |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/fbdf2a6854cc1d8434e6d63c91e599753cf6117f |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/4bd3aab0bd229d070bbfc78ce7bfd87103d25ded |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/16b7f70a275ca9320bbddaf59e014f0f10d00a89 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9726b2ed6a4f088bfddcc6f87469163ba2b74b7a |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/df6e798126f7e4ab51c6fdc6b08bce1feb91a2ff |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d033b8f161f951ab31083cc13f73dca033bc1a0e |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9e880622b3f3ffba953c803e0ab6a60b07d23737 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6ed9fd746afa2cb444a28ee51edff49ee93c829f | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/672a02cefaf0614531d5618ce353ad1fbd59f0dc | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/911b545a2dd31a6d8b46fc21b6ccec1bae96e7c5 | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/402c441fe304e6135c2d2fcc2f155cfcab104db2 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/78452eca9838971d298bf7a8912a90b13c993eb0 | ORPH
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/317f9eb72fc20d83c7e6bc8652c512958ffb1c2a | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/42725f11c5ed1c1bd415dfbeb6fd1e29e1e98dc1 | ORPH
   sparc     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8e989daa3978f859731b33bf0f4a881022c8fef7 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1b54d38a2e8b9e1c3d2bfa4258b10317cc0cd41e | ORPH
   sparc     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/085316ce3f03933c47c7b07faf75f7cb098380ac | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/bc6bdfb8a052cec4a4ce387c12c9a4aa1aa0c8b9 | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1df503a4b8ce274e8b4c59d015be0491187ece66 | ORPH
   mipsel    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/542ead241107b2ef4b639f29ddd9d6e4c4878a9e |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a20b702f9ef948b77ebb951614b386d234a1913c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ec661d5845b03efc42b794f93d6f542c864dfdc4 |     
    arm      |       util-linux-2.37.2        | NOK | http://autobuild.buildroot.net/results/0047864a01dbcc2a065210f39444cabf01f97766 | ORPH
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/703fe7d129d2f40b1040d233a07dccb21b11e819 |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6454016adbe32226c25f5fbca3d0685641b7fd03 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5955f8fa5b65d184c3f8ce238af7848870fa6c29 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  apitrace-9.0 | 1 
                 mesa3d-20.3.5 | 1 
               openldap-2.4.59 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e7be05d673c553ff80e7440db081a0b27ce8c600 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/aa4f2ceb16c8ffd8856739c7b9e738e10ca6532a |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/8079170e7ac075f6fbf27d7c18c4daa299250475 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              asterisk-16.14.1 | 1 
                harfbuzz-2.8.2 | 1 
               libtheora-1.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                suricata-6.0.3 | 1 
                       unknown | 1 
                  weston-9.0.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/27457454b1c1eb1037bda1ce5d9bdd442ea6911d |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/332bd08ae84586eaacb9a1d7673dafb72b7866cc |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/d8f1f7de81817028e51acd6dcd6873fd199cfede | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/29db1410fb1ed7fd3377992f7e0b49fb03dad883 | ORPH
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/5824af17bc331494177476aa169001e19f0e838f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5dc5283d202faa1efba8953dc74bce64a1eec280 |     
    arm      |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/53d1ee71cd722da29a47a93773b53a1e9d6aa7c6 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
