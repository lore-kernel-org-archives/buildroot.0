Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26B0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 07:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05983401B7;
	Thu, 23 Dec 2021 07:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCob4TSbDJld; Thu, 23 Dec 2021 07:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8EFB4052C;
	Thu, 23 Dec 2021 07:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 018131BF865
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 07:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30EC4052C
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 07:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGo4PICbC8BT for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 07:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17511401B7
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 07:05:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EACF31BF20D
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 07:05:48 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Dec 2021 07:05:48 -0000
Message-Id: <20211223070553.E30EC4052C@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-22
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

Autobuild statistics for 2021-12-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 73  |  5  |  0  | 78  |
  2021.11.x  | 21  |  7  |  0  | 28  |
    master   | 120 | 34  |  0  | 154 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 9 
                  boost-1.78.0 | 4 
                  assimp-5.1.3 | 3 
              host-erlang-22.2 | 3 
              gnuradio-3.8.2.0 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                 wavemon-0.9.4 | 2 
docker-proxy-55685ba49593e6... | 1 
                       frr-8.1 | 1 
           host-harfbuzz-3.2.0 | 1 
      intel-mediadriver-21.4.2 | 1 
            libnetconf2-2.0.24 | 1 
               linux-pam-1.5.2 | 1 
           python-pybind-2.6.1 | 1 
xdriver_xf86-video-mach64-6... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/8fa894a2a1368097b246dda947b8240de4cfbe0d |     
microblazeel |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/634d99722f6811d3a9c11f3bee00de839c6adbf8 |     
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/493470bb1b9a5cf798fa32b142a0330bdd872710 |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/01e65aec848f8b0a2d8e7a036df191fae1f9acfd |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/2d464773010d22b1b953a350d8fd5f9d0e7da2c3 |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/b59dcf855133af3be4053cbadfb0795b60025ade |     
    i586     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/a669c8bfafd933bd8743aa93e265ba8ca4916581 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/e327276397b4ce1f65e7ca010140d6c3ca751501 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/70166132e9bc590377b5bf9326e80d1074740329 |     
  riscv64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/77c51938f33ae301ff8b37ff39a0e6e467701c25 |     
    arm      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/ce5de0b3b603673bcc69daa0c9ee5ea2903dd33f |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1ead300b8d482643e5a2ac45646403b1aafd01aa |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/69c00b877388054368d5cff6ebfa78cac80b638f |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c85fcfda0386ca64b06c59f1178bc46c7a06078f |     
    i686     |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/6cbcabc04436df0e5a4a8533847355d480c9b874 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/814334887b0dda5bf052f7b99672c6abbc7cbbb7 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/df46243205d2411aa1516e54ad7fc304ea482a38 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/a1c4129bc8440a68267b4cb0577172460189405c |     
microblazeel |       libnetconf2-2.0.24       | NOK | http://autobuild.buildroot.net/results/2b41d54d88bb443a96854a1cc9f2a06c66a3d0f9 |     
    arc      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/71e73062c56355c07cf143cec5012c99dcc2f480 | ORPH
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/970827adf02731c66b772932e4cb87736e2a0a82 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4e9e6677620173a26fc0713f086d1f3c1c0d6fd6 |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4c36abf9fa2a22e3685f70fd6d21e252cd761018 |     
  aarch64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/eff6cda4c1493424a667bde3b1c218c84572b98d |     
 powerpc64   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/122c46b83909862438c5d768aeaa81f09ab76f90 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0e2d1b8ca01de8b1f84eb4b17991b2e5d73c2833 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/41815958a19f425df15491dd41e6dadf804c16e0 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/977a1ccb5342780b56876fbf4799167ddc92c06c |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7bc481537ef404df8a121a1110ab9b4f3a64714d |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7ae376bdad47d6a7c5452c2bd0b33ee677bf616a |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b1986ba5e781843354aa96787a2c122fda70d8f7 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/691fe8f5271be0f8b0c0af8a696e96515452980f |     
  mips64el   | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/9cd272d7d0e653ccaf031e73348d8ee8c63049b0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9f699843d4f7a847978167941db1efaebb4c0688 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
                 openal-1.20.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/67aaa6746bf62054f810794138873def29ab3a4a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0d3a71d361947cb63b99d56e002ce0a6475ca7bc |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e8c3dc620cdcfbb39461fbb793399b9c5ad5f559 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/97e33038e3c30679b63e8180ccb91bfe5ad57330 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ab71c27a47233697e65c4616eaf9cc8122138761 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

libdbi-88b8477d57153b9f736d... | 2 
              host-erlang-22.2 | 1 
                 openal-1.21.1 | 1 
                suricata-6.0.4 | 1 
                 wavemon-0.9.4 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c68432042421596b83199a0636c51b8ab7b63c43 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/d9f44f6787dd5db4dd087aa32c3b4212670f91e2 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7a281f6ecc05aeb7c05d189943059a25cb102f01 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/4a062b26144695c8484b45efa5624b415b683488 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/281013688ede0ae9e3431b7755367dcb1e8a6efe |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1799e182a02835c8279980a874bf0524691292ab |     
    arm      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2d3dabd952b4333f670507c47155923b12fe56f5 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
