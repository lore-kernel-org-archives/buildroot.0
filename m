Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE71C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 07:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAAA61053
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 07:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FAAA61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2354042589;
	Thu, 26 Aug 2021 07:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aojlJoOfkkCv; Thu, 26 Aug 2021 07:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8F542595;
	Thu, 26 Aug 2021 07:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6B761BF85D
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 07:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5BE681BCB
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 07:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDg7O6EeVlsM for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 07:01:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1714181BB2
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 07:01:21 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 16D981BF212
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 07:01:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Aug 2021 07:01:19 -0000
Message-Id: <20210826070126.C5BE681BCB@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-25
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Autobuild statistics for 2021-08-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 37  | 11  |  1  | 49  |
  2021.05.x  | 43  |  8  |  1  | 52  |
    master   | 218 | 20  |  2  | 240 |
     next    | 36  | 26  |  1  | 63  |

Classification of failures by reason for master
-----------------------------------------------

                  zeromq-4.3.4 | 3 
                       mongodb | 2 
                 openmpi-4.0.0 | 2 
                qt5base-5.15.2 | 2 
            qt5location-5.15.2 | 2 
                apparmor-3.0.1 | 1 
                    ffmpeg-4.4 | 1 
              gnuradio-3.8.2.0 | 1 
             kismet-2021-06-R1 | 1 
                   libnl-3.5.0 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.1.6 | 1 
                  nginx-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                rtorrent-0.9.8 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/cbf613ed78b41b0135b36575e51afd4f9c4a6639 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/45a1111ef34768154d0a66d24b0c597168e31aca |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/46bf9ace88a7678abb165b92b394c3a7fa5161cf |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/436d52e3037f57709647dc3097b87b97f2b0eb1d | ORPH
  aarch64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/afe44f4b6a3c53e5864cfb10b04529011e72cf5c | ORPH
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/e74d61f9e065df4913930759c3e3a989d7bdbb8d |     
   x86_64    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/114e3848eb8fa00f807192cfa2990b4eba0d5269 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/c4d43ad389eb2cea0119bdb114f3ee31548a2303 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b39d98ba2c17ebd98c6e559256df228f7c2f152a |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/dc80fd02738b46af62ed4bb86d8ddd297f6d18f8 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/2e3d03658c703b95c10fc86f78bd0d8bb6f7c2ca | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9f577627203d9d521f50fca2d07bf08830457dd8 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/eea487eb0de911f4e4bce7a557d4c93d732181cf |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d3140fcd1dfe13c221bbeeddb59247c32136bf3e |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7192e76249e050dfecd60bb322a5c311a5d30837 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/c647fbe4f432c76e2afbae84af8b58ee956654a6 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/581ddc512b0f005aa88bdde03b727a1c0f0cfc2d |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/d2f18ccad6a0330d78e97d70c810ac89b84d2261 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/bf9bd9fdb5afb7e6ab69825562f0f2f7565e76bb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/269f64ac3bc064e17a4af69f99a0160fdf0ee8c9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6ac0eae4cd8ca15b7bb913b4764e03b1c4c885c8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8055a64c628a4a9e0fbb0031fb93d4c4c547dd0e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
  binutils-arc-2020.09-release | 1 
        host-sentry-cli-1.57.0 | 1 
          libmodsecurity-3.0.5 | 1 
               libtheora-1.1.1 | 1 
                       mongodb | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eb514dd8234c3e2acd6d0a550a64d282fc7e9f41 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/a78bb3f1d74aabe1319865c63f0ba9fafad02592 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79c18b60dfb92ec148aff6061cbb83c56d7029a5 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c0f29002e6bfe709ba4022d8f53556324dcdd41f |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ac208d8bfeacd99510df3c72acb1540893ca8c79 | ORPH
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/866fa81083af48b0fea47347b3c004eb75b3e66c |     
   s390x     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/21cf4d1f4033551ffbd05efa1c1acccc1ac268f2 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/b5fafe162d477b2f5d8463f6cb908bc4a4db1fe7 |     
  riscv32    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a39c1a97542457d6719f379bd94c02d5ab19361a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/95f7dadeccc8536af573d01f55358dd92ec191e8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f4b858877967578501c9178e92691993eb7af63d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5bc09995218875ee0c821da212cb0412e9bcaf11 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  apitrace-9.0 | 1 
               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-21.0.3 | 1 
                qt5base-5.15.2 | 1 
                  waffle-1.6.1 | 1 
                     webkitgtk | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/feba2057b80f595e6761af1dd1023b4cb3a78f6b |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/f7876f5e9c0ae2f2f9497c9eda8defeb24bca88b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ba1417889e348d1564fd12e2e2b018f21b12c488 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/29b602bfa0c7fc3f783b871c4f0677eb77f01292 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/332dfeb458a3b2c8b6543e4006b5a14bb3a12d4b |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a231a0059571a00b1f45434c93b055fa5a81b41f |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/e6810214bde7fbab3e7ef5402d2350bae3862502 |     
  mips64el   |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/b6e48bd1009e5a27e48747fb4c73e78e4bca9fb0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4aeff67f1d0e909210047dbdfb9e2e1b23c86da1 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 15
              host-libcap-2.52 | 2 
                  libbpf-0.4.0 | 2 
            erlang-jiffy-1.0.6 | 1 
                   guile-3.0.4 | 1 
                   gvfs-1.44.1 | 1 
               libtheora-1.1.1 | 1 
          lua-lunix-20170920-1 | 1 
                 mesa3d-21.1.7 | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6fe4c361ac2d79742a73afd8521881328b407ced |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3b9bf023bdd0bf15b4e704bd822e25d42b83cf84 | ORPH
 aarch64_be  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/8aacbfb04eba238cbdaa6bcf4e4ad4c08a295431 | ORPH
  riscv32    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8fda2a812b26701300f7ee1fb3019bee81428807 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4189a74471daf438047be047724e6bbf130fce96 |     
    arc      |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/8e365217850b964d09093cdc7c52161dd5213c8a |     
 aarch64_be  |          libbpf-0.4.0          | NOK | http://autobuild.buildroot.net/results/827542bfcd938a9cf1eb404a0a9b27ee06f0e9da |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/104d6381cd8cf410d8d8aca77d2a3a37bbfe4755 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/737c80865c4c8d1858fe5e630cc7f2a195a24ff8 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b5c2f80f3f0f5724400b9e5f283449c6b178db98 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/af71f810d54f4e93d82613b767d325157d99dfc3 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/75e22005e7c0587254deeb6a41dd9e159d47ecfd |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b147a026d603e56e1ed502c5772a66119e7e8ffa |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/51419c6de61fae1691265a62a704efbe5b9f1fcb |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1c38af968f3ff8d4c3c82eadef05b0613394534c |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/55c7526b277308d148b3d66ba76a7ae06810131d |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/106e0ad3e40264f93ddb5fb04f41bd9e1f6f6b49 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3a0011cce328b6318e7eb0d9b5706095e44b4c88 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/07f0eacdd104fa0a200ad9456f1ca3147364ed1a |     
  sparc64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3466d0c4220e6991c3b6dce2ac6426e702619908 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1cc10c072a0959371fcdd3aa018b9b4e0902055d |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1f5cb8b975513ca4e2d3c2ec26fc3e4e851ae0e8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0802859f327c1b55953b478ace6ae37ebf84bffb | ORPH
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/66015c66e3c43f4386d84ff5145a5508eca43280 |     
  riscv32    |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/c5c6bace2a64d3b5932746601f500824fd076b5d |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/dc4ee75d4b18a319ea58f4a3bf32610dec0c4577 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/965c04902120175c80b956fdf735dc24709f947c |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
