Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 08:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE59429A2;
	Sun, 12 Dec 2021 08:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4zrltXwrH85; Sun, 12 Dec 2021 08:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C5B642971;
	Sun, 12 Dec 2021 08:08:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D8AB1BF32D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 08:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 919F285302
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 08:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2voCyvSWiDOb for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 08:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 367E785069
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 08:08:49 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4A78020007
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 08:08:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Dec 2021 08:08:47 -0000
Message-Id: <20211212080851.919F285302@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-11
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

Autobuild statistics for 2021-12-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  |  4  |  0  | 43  |
  2021.08.x  | 43  |  3  |  0  | 46  |
  2021.11.x  | 21  |  2  |  0  | 23  |
    master   | 87  | 20  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

                 wavemon-0.9.4 | 5 
                     frr-7.5.1 | 4 
                  assimp-5.1.0 | 2 
              host-erlang-22.2 | 2 
libdbi-88b8477d57153b9f736d... | 2 
make: *** wait: No child pr... | 1 
                 mesa3d-21.3.0 | 1 
                mono-6.12.0.90 | 1 
                 rp-pppoe-3.15 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/84b4cdcccd1a7ad527d720ab79ee2ee5fd6d624f |     
   xtensa    |          assimp-5.1.0          | NOK | http://autobuild.buildroot.net/results/f9096729509de2109f0fed4743c13d01b4a6ee45 |     
    m68k     |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/cf044b750f5b3b822d93e2340deb920075164bb1 |     
    arm      |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/cba5bb1026293350da08a132ca81f49c914b0e17 |     
  powerpc    |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/1c172ffdd021fdc354724dd285fdf02f18063005 |     
    i686     |           frr-7.5.1            | NOK | http://autobuild.buildroot.net/results/cb4fb65daacea8ef06ee42f24c31ec6731579eae |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/16cf3ec3a9e7c9fc3795e4b3cd3ac23c7db6df8c |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1b9d009f13d8b74cbb1ae3c91b31c1a11a295d3d |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/8c45eaf87ec2f9d240ada7b07a2238bcbbe39867 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/968901c2adcf0c445096cb43145fe4a5d94c71dd |     
  riscv32    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/658c7bb372c6833b7b6dfc26ae6a5c92b0db861e |     
    arm      |         mesa3d-21.3.0          | NOK | http://autobuild.buildroot.net/results/6f9e7c864808dc0fafbca7c8984651fe92edbaf2 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2d894e2b527883cf00499ca85d98cf317f9c18ee |     
  riscv64    |         rp-pppoe-3.15          | NOK | http://autobuild.buildroot.net/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3 | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a78320e4ea9818c4121e0044803e9888e1da884c |     
powerpc64le  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3d1828cfb149848126fe0bad6980f5870ab6f74b |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/36b245590324be397b1a613bbc6c4799470fa51f |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03b196d2c68fb08b2438ab83b48eac4347da8f0f |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f68fc93e3bed19e88db75bfc84ed5d9786361fe2 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/594b5f5b28cb3f36aa4af594e69aa3bd50f29050 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c0e687fe39e7beb0fefea753a38fe906dc580b6 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/113471c720a489680675b1de24030f8d4c5cbee9 | ORPH
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8fdbf8268b2e8c6829ee4ec45346efff48bd4a22 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/cedee4d9f534e3b7ee294556639ec8d146908138 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  ndisc6-1.0.4 | 1 
                 openal-1.21.1 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/347c5e8aff3ddd35cfc0ab52f18e7c571d4e99aa | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a561053f6de73e30672c870c6e6eff0a137df350 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/3bad5536b226e1f023a29a0239bd913ae9e0ac21 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 2 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9cddde68515af5046d761afc38d135c8516b2966 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f74670fa99d22ab32173eee88468c99deca6ac85 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
