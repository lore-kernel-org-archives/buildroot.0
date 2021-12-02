Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520AAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF2F181D73;
	Thu,  2 Dec 2021 08:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCIl8kwojEAP; Thu,  2 Dec 2021 08:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B4B81CEF;
	Thu,  2 Dec 2021 08:12:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 652251BF575
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 08:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6198F81CEF
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 08:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hml-G5bdGNh3 for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 08:12:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D649081CE7
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 08:12:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E7305C0011
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 08:12:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 02 Dec 2021 08:12:30 -0000
Message-Id: <20211202081235.6198F81CEF@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-01
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

Autobuild statistics for 2021-12-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 72  |  7  |  0  | 79  |
  2021.08.x  | 71  |  3  |  0  | 74  |
    master   | 103 | 29  |  0  | 132 |
     next    | 12  |  4  |  0  | 16  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 9 
              host-erlang-22.2 | 3 
                samba4-4.14.10 | 3 
libdbi-88b8477d57153b9f736d... | 2 
               libtheora-1.1.1 | 2 
              wireshark-3.4.10 | 2 
                    bird-2.0.8 | 1 
               capnproto-0.8.0 | 1 
                  ndisc6-1.0.5 | 1 
                 openal-1.21.1 | 1 
           python-pybind-2.6.1 | 1 
                    ruby-3.0.2 | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/ada563549c5f257b9c0b36729b5102a95bfe6929 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7e37b38c7fbfcdc10bf87a3d1fab396c5acc8f6d |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/003fb0859494b761aae593f13d4cf7fb253a9882 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/989be48befb19ad71c5c2bd9192845d61e1fc1a5 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0fcefd1a8d42d09fe1454255dfeb7c1bd426292f |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/2edcefd999fb0ddd6a001b92fdd03175daac9180 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/e70bcabbb5801a3d5848d95595c112a8bff1b5df |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6dbcd019fb3304055177457fe94c0b0a0cc6425b | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6a8c46ab9486a957b10917c49327073f2bf98a40 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/687a8458bdeb19db16e6694a4c59dac5ad4a8755 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a0f032c7eb02d690482576b837a79c7db00d84ca |     
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/ac22405c1314930ee53bf2d822c42dc98173432f |     
  mips64el   |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/072f0a321f885f6a70e359bf147408ab21a4b1e0 |     
   s390x     |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/7adfc1d8c7be77070b9c922e0469c72b865384bb |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/d05d5d25ba554813a1307ca365c6056d4dcb357b |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/621d2f2b5013a22c0e644b6ab0b67ea0b692f73b |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/115030e043ffda54c4f1ffdf2ff632d01fe5ccca |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2beb4d3880c4b9df77dd5eae0950adbbd2d20aba |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d01157c9c06e9b18ab1b5803bbca3d3a5fd19b39 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ba8d6daa95954b675fc75c99422e060683fb6d5d |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/64ee3ec166890281a661f102797f41e58a9b871a |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f6e8891a08831a92afda687c2fa54a035e9a4d83 |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/2a38ebf64b536256130ee21141c60dc14b668088 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c3b64b09ce870384431570540a38f55741fb0944 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b086b67053181efa0a1598595a84756fb6980869 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c81a16721827cab334e7bd3156976d72feb9d667 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/3c120d732b01af64abaded8bedc6429a4783a570 |     
    arm      |        wireshark-3.4.10        | NOK | http://autobuild.buildroot.net/results/8e16cd42b12758d1962c314dcdf902ad5351c7dc | ORPH
  powerpc    |        wireshark-3.4.10        | NOK | http://autobuild.buildroot.net/results/02ea7d76a683b039fb37e005578644108bd1e3b7 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                rocksdb-6.13.3 | 2 
android-tools-4.2.2+git2013... | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6c5df0f4449d47b1bb2893227685940d076f4ca2 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/194b4348558c6b314d785f7e8bfbb2d2bfa9f37b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/688d5589f58c8ca94fe1f36b094e4e3261d2b0f6 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1ff1f1baa980dab31cb59064b83c88a36a927b63 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/47039cd4c05ec2693d919a2af18a530749b9df9c |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d89bb102ff48ec1a56aa997156c40b5611a97f73 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/8b9110e87ac332652e699216ae4c35a2ab2dc3c6 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                harfbuzz-2.8.2 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/926132760acee7186d7175da82132a6ea2917733 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/5503223169ab005e3218a12dd03352b723954042 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/524bcf4b29e5db1e190355d6991eca471be9822a |     


Classification of failures by reason for next
---------------------------------------------

              gnuradio-3.8.2.0 | 1 
                libgeos-3.10.1 | 1 
               pipewire-0.3.39 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/ee1beda3f33272e81dd75ba12b9fdf6ea7cecc44 |     
    arm      |         libgeos-3.10.1         | NOK | http://autobuild.buildroot.net/results/2d5fe2866dfa24f5747fbc826fea1108a2a6cb47 |     
   xtensa    |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/1df3860d9d7a2c3a273260a2f7d14632a1ee5cd9 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b5f64e4f6c18515ad9730c264a7affa25b427efc |     


Gitlab CI results for 2021-12-01
================================

Detail of runtime-test failures for 2021.11-rc3
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/1834703457  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
