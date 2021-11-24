Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DEFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 08:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82BFE40117;
	Wed, 24 Nov 2021 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IN9mFsNEoyg; Wed, 24 Nov 2021 08:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16952401A1;
	Wed, 24 Nov 2021 08:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEC541BF42E
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 08:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B624B80D0D
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 08:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrjYJUm9Uz8f for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 08:02:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF2280CD4
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 08:02:03 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3567AC0019
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 08:02:01 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Nov 2021 08:02:01 -0000
Message-Id: <20211124080205.B624B80D0D@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-23
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

Autobuild statistics for 2021-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 63  | 10  |  0  | 73  |
  2021.08.x  | 66  |  4  |  0  | 70  |
    master   | 73  | 24  |  0  | 97  |
     next    |  9  |  9  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 11
              host-erlang-22.2 | 6 
                 openal-1.21.1 | 2 
                 wavemon-0.9.4 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
                  ndisc6-1.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2301f93c3a26a7665de963fae0db72430effa94f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dfa97c326545bd953cc39096a37d6d9a4bc41c4e |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9ddb31be1948c7769054f793b9f4af2f270ae6ec |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7b048ea41600c82ed6f05e171bb80d42bd035d14 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ece4e2419f38a3cfd3b1d31fce2b51e28eb68c18 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e86ab208731da305e6e076b6138abf0a048e7cf9 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cd25e367fdb251411e535e05a0e1ce60eb47418d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/28826ab8ead9e913700380d647a83946e80885bf |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/662e2ea4869f1cdfe4968a485505ce83ef5a48f9 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/450455cca1bb4e3ab7fd6911325f7d699b55aa31 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/f0ea0482c7023959ef32299ed1c5fe41fe0d0af4 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/429c5f708864bed4ca1487de42ce11b7266f837c |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b8cacccc67b7cc92248eca38587a50c15bd7eb78 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/231c5148d5a9a14e5e05a96df37c630a93b42e22 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f15e3e66342ada98a5caa43495283cd568919174 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f239f1cf2acbd9d6d8bb24eea50aff22ae078cd7 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/66dd9dfb7eb3cc3088ba042887bc6d29aba4d7d1 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d3674d472fe3e930cecf0341011f87bb0a1c0682 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f0e7b731aef827ff266285478397773c52120018 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fedfaa5bfea4c77bb491b6265bad3930e605dc76 |     
  aarch64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bd51276674570fad4ca865ba222ed6a33801d1e7 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/1e4e3bda494a52de94de2807057419d5e94eb582 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/10e4d11f7c91350d2360d8c18409b7fb6b15fa2c |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/acb6373b926fdb332335051977ad16cd38f92830 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                  gensio-2.2.3 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.5 | 1 
                rocksdb-6.13.3 | 1 
                suricata-6.0.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/523d4c3c8dd5a488a502d99e6a77a1e4f8cc3d72 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36e822f0a56f2408a49a0b9611c23afa09b540eb |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/48d371f371f00933001feb01c7744c3dce9600c9 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7a1ae1d0d63104d7e53352b7354ad050a81be48d |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/09e853bb0c926789d4d3569580982969e87b690b |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f33bcb8b91d72b39f1b6dd7bd95fe5a2be0123c4 | ORPH
 powerpc64   |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/3bba4cb74776190ef0bf62bc53a82853c54ac230 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ef8946e394e619c691f3b1292c7943ff6a67ba4c |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/da9500ce190705538687d207b66c06324e7bcc90 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/85de7e04e0b325d5d8881f16c2078190be5edaa7 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                 openal-1.21.1 | 1 
                 python3-3.9.7 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7db81b67130c96d8f53ec8354286d35fdd575bd4 |     
  riscv64    |         python3-3.9.7          | NOK | http://autobuild.buildroot.net/results/5fb8411460361a0f6bd5edd138375873b6c47216 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/cb9c560fbfc55c38b8b92776ce27426bc4d6dac4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2ef03451d55c3c70e8a07186e31bff38f08ebe99 |     


Classification of failures by reason for next
---------------------------------------------

                 wavemon-0.9.4 | 2 
                 diffutils-3.8 | 1 
              host-erlang-22.2 | 1 
                 libv4l-1.22.1 | 1 
               pipewire-0.3.39 | 1 
rpi-userland-bab9bf8790cd69... | 1 
              tinydtls-0.9-rc1 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/0b89c4abc11d66046498e542553f7c0fb19cdb78 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3f4639b30d709649b74ecc7fa4dd58eb0f8379f5 |     
    i686     |         libv4l-1.22.1          | NOK | http://autobuild.buildroot.net/results/2d58906a1eefdf921b42f6c0d9fd680ef2ad6e27 |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/96ff849caa2acc5037095a1ac86adec966421e2d |     
    arm      | rpi-userland-bab9bf8790cd69... | NOK | http://autobuild.buildroot.net/results/49a27362e36bad6076a727877bccb6e28edb06bd |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e50680810f2ac7c1a2503c70441368813ab34377 |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/41d564732fcef36304b4858b5f77863dbf08e1d5 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/03d0dbcf4395173d80c7d7c8efef719550498f2f |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bfd146699f333f4d53b0f56695aea2e766151ca3 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
