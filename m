Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A77C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 05:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A991A60FED
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 05:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A991A60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B4D401B3;
	Fri, 30 Jul 2021 05:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x87OQYKGqREb; Fri, 30 Jul 2021 05:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A6F0401BB;
	Fri, 30 Jul 2021 05:48:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3731BF3D8
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 05:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80EBA401BB
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 05:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qo2TbJXnE7Wn for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 05:48:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A601401B3
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 05:48:31 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0F2FDC0008
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 05:48:28 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Jul 2021 05:48:28 -0000
Message-Id: <20210730054835.80EBA401BB@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-29
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

Autobuild statistics for 2021-07-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 48  | 16  |  0  | 64  |
  2021.05.x  | 54  | 12  |  0  | 66  |
    master   | 27  | 54  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

                  libogg-1.3.5 | 27
         host-gcc-final-10.3.0 | 2 
           optee-client-3.13.0 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                    bird-2.0.8 | 1 
                  exiv2-0.27.4 | 1 
                  gtest-1.11.0 | 1 
                harfbuzz-2.8.2 | 1 
             kismet-2021-06-R1 | 1 
          libmodsecurity-3.0.5 | 1 
            libodb-mysql-2.4.0 | 1 
                lmbench-3.0-a9 | 1 
make: *** wait: No child pr... | 1 
                    olsr-0.9.8 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
               pulseview-0.4.2 | 1 
                    qemu-6.0.0 | 1 
          refpolicy-2.20210203 | 1 
                   seatd-0.5.0 | 1 
                snort3-3.1.6.0 | 1 
              tpm2-tools-4.3.2 | 1 
                    xen-4.14.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6bed2614b629767e94c649e835ff7f50593bf5bf |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/596c9ade435b70bf5a02ad17bdc8b4fcd8cb3117 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4cf0c417fd89166b0dfd698bca56eb744dc1c555 |     
    arm      |          gtest-1.11.0          | NOK | http://autobuild.buildroot.net/results/578cf5a2d7d5ab3fc5bc82e2f1d134c0b146c0a3 |     
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/aec0aef1a25d76edd0fb385c3a5f0fe88af981f8 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6a29d0215c6ce341dc5ed0981afd2f2b237bf512 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7841cef2d31a9d75a971d106716c53f621474208 |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/73c36b8fb83b128c3e2f2b319333f00bb57a56d0 | ORPH
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/70639854addea74df46c5b3ea609f6965d278c0c |     
   x86_64    |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/4e0600abd7fdf45d639826d3a01fcf707f9cd6f3 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ce246bffe427a67ca3849c8d052cbc15673d7f2d |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bcb2a012df908a20d964d94164026e10213a48be |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0a4f280da462179f60774a6dc37dc1f06543a048 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9d821727073cbf691bb7ee5feb5a2e3aca0fe369 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/86c4eb73d3bfe9c8ec4403fc8b504d836b232a5f |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3fd2bd423f0dfa1d886f438e3292c2929a7122e1 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/174a9c9c99fd75217bdf5076ef8d75e7db5461c9 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6409e2c11117e5814055f70cc6161744584f38ba |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3330ba600bc35048527f2bfcf06deeb7ff1050ab |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a69075986c4ca2fa378db081fd057e2cb0a7530e |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/00b6387efa15360ad3f2e5ab975199566bb36ff2 |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/acaf8fc4424578f4ad6b67a19f80473c98a52e28 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/70e9ba3dd7c5a23ff1308cde12173e478809219e |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/97fe6434a82bfee2e46584aa374d42f55a32133f |     
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/459cda3dadb2bd0d52775363020a2103a4d7ae7f |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0ae1dc4a54e5c876ac9bce8edad4fb0e817c582d |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e58f568e0b79afc6ba70df9830a3529670bb6389 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ccfcf9dcce96fc5c042a94430af88285604266dd |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1e6eeee193220204406810154daae988a84be5d4 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3962bb28bc02de39df3eb87893117271b43d8db4 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9b83974197a53cbfa2578abf5a98ebc25ab13678 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3c57340c2bfc09b6276ed21d8202bab71d58b723 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/90a5cc9655bd50b3ca43a1040ed7035d98e968cf |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5f7d3e65c47e7de511ccc6a74922cb2b410b7caa |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/aad06fd0b147ebc25724af33dd4d4766681bed19 |     
    sh4      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d84933f41b332db9b6a94f323a5d5317bcb41aff |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/53a364b921239cb6e9591a799c67631856962258 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/256ecb9f8a48030532d474ee48e79af1419d378a | ORPH
    arc      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/4ee7fe941fceed396f635e137fa090b885a28ec0 |     
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/edf201aa11133b222e15e66b525cddae237ae3e7 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7a7611b392ee426d1250b4b68cd6864de7425491 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6598ada58c889536946379d03a97dc0e9eedfe9d |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/154e63ccfc98793a132ca8f7d3bfda16ffbdfd6c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/72a9d5bddbd94224441f91e7b6402d0664572cf9 |     
  powerpc    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/a2d2b1d04ff7aa07ea8544213dbdcc9dd9823102 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/65436953267289e58b005eb96e83df4892b2132e |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c5b686d369ab06cad0fa751d219adaa61c5509b8 |     
    mips     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/2322c0332efa8b22f8996dbd25d2ffdc7c451f55 |     
    arm      |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/1bdf32fed40dd1af1aa02619336cae339724912d |     
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/229772da841eb6373fa17cc9d73268debf1d039b | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ea712b882c004b52179f20a1fd3380e01cbbc9fa |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/995753bf8229e13bb5cebb46e9e5d9877b78fd52 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/d12a2794dc183cb0effc961b9466b05980a6c847 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c815e99773b8ed752074c18b5796ee190cb9f30d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                    htop-3.0.5 | 2 
                  zeromq-4.3.4 | 2 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 
                netdata-1.21.1 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                 samba4-4.14.4 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5f57a9943781f0a7c6d1675dab09a9a98cef837c |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bcae1192bd2553eeb6e0eed0e43dc90dbed0cd59 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58fcd7887af02b7c2d278579d9d58d652e9f89c0 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b8d3750f926b0b98a206c83b9cd017e2e0c620fa |     
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/086740213bdde29c6625f385b1d62bbde21e933f | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/44cd7e220a56ad66a87fa87c558ea6755e6fb6f6 | ORPH
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/3ea1e230db3e8b258baa14f791e2bebda489aa6d |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4936956730f1eb1b29ea6da0732f215dac32711f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a36df1fe352f89bd5e504b85483ac778d62f4813 | ORPH
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/81a6965686e4f30673093d1dde75be9ea5ae6cca |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/db49e0d040737e2bd4efba5b06e064884231ad76 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9341bc0e9cd51c693da2119802c7c1fd7a6ab1a9 |     
  sparc64    |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/d5bc7c2bbf6e3c9c2b6fd7ab81ec39828ab71ba3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0d392bbe7f0b0f6c10450889cb556feca27c39ef |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7c879d2e5f40ae9412bb36706ff015a7f2e6ee19 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/81407c4b23ff6133d39d11e86e2f71bebce84abc |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    htop-3.0.5 | 3 
                    ffmpeg-4.4 | 2 
               belle-sip-4.4.8 | 1 
               capnproto-0.8.0 | 1 
                  exiv2-0.27.4 | 1 
        host-sentry-cli-1.57.0 | 1 
                 mesa3d-21.0.3 | 1 
                 pixman-0.40.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/15a024cf02726fbf39afcfcfc06edb9ad318355a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ca2f0721af2e04399d34cdd78cb37b1a4fc5a1db |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a23f97591319bb5b853018691250f1d710630ad |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ef1cba553d9c792957db4c54bcb5063fdd7077c1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c5336b8d9897190fe0ce4cb731d7415dfc46425b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc88f1f5e2d477462441e2f78c452b003381f930 |     
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d3de0d0ee43ce7280158f25b4d23af491a92f872 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/74fc0ddf038f382b5d73e4fed11c5d57529f191d | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cc890d0e7409b9f91927e9ed57282f38b6e29af3 | ORPH
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/d2b99287e5afd177d4b0c4d5364e0b67d850ba69 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7621f5a7ae5052ed613d522c533e68f23eea0422 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f0f2989042eed07d5b7a87228f4fe0e20ac099b3 |     


Gitlab CI results for 2021-07-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033821  |      
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033822  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033823  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033824  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033825  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033826  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033827  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033828  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033829  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033830  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033831  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033832  |      
                 arm_foundationv8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033833  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033835  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033836  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033838  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033839  |      
               asus_tinker_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033840  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033842  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033843  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033844  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033845  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033847  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033848  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033849  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033851  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033852  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033854  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033855  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033857  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033858  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033860  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033861  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033862  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033863  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033864  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033865  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033866  |      
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033867  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033868  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033869  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033870  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033871  |      
                 bananapi_m2_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033872  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033874  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033875  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033876  |      
                       beaglebone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033877  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033878  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033880  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033881  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033882  |      
                   chromebook_elm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033885  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033886  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033887  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033888  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033890  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033891  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033895  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033898  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033899  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033900  |      
               freescale_imx28evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033903  |      
        freescale_imx6dlsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033904  |      
          freescale_imx6dlsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033906  |      
         freescale_imx6qsabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033907  |      
           freescale_imx6qsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033909  |      
          freescale_imx6sxsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033911  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033913  |      
           freescale_imx7dsabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033914  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033915  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033917  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033918  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033920  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033921  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033922  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033923  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033924  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033925  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033926  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033928  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033930  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033931  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033932  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033936  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033934  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033935  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033938  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033939  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033940  |      
          globalscale_espressobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033942  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033944  |      
                  grinn_liteboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033945  |      
                 hifive_unleashed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033946  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033947  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033948  |      
                     imx6-sabresd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033950  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033951  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033953  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033954  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033957  |      
                       imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033958  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033959  |      
                        imx7d-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033961  |      
                        imx7dpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033964  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033965  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033966  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033967  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033968  | ORPH 
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033969  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033970  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033971  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033972  |      
               linksprite_pcduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033973  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033976  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033977  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033978  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033979  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033980  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033981  | ORPH 
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033983  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033982  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033984  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033986  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033988  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033989  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033990  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033991  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033993  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033995  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033996  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033997  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033998  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461033999  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034001  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034002  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034004  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034005  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034008  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034011  | ORPH 
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034014  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034013  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034016  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034017  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034019  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034021  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034028  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034024  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034031  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034037  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034033  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034041  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034042  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034048  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034044  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034049  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034052  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034053  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034055  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034056  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034058  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034061  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034064  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034062  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034066  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034068  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034069  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034072  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034075  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034077  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034079  | ORPH 
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034082  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034084  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034087  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034089  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034091  |      
                qemu_csky610_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034092  |      
                qemu_csky807_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034096  |      
                qemu_csky810_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034098  |      
                qemu_csky860_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034102  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034103  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034107  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034108  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034112  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034113  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034116  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034118  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034121  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034122  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034125  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034128  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034131  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034132  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034135  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034139  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034140  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034141  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034143  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034148  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034149  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034151  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034154  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034155  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034158  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034159  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034160  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034161  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034162  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034165  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034164  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034167  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034169  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034186  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034170  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034171  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034174  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034178  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034177  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034180  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034182  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034181  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034189  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034187  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034191  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034193  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034196  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034198  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034200  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034203  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034206  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034208  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034211  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034212  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034214  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034215  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034217  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034218  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034219  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034222  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034223  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034225  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034227  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034229  | ORPH 
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034231  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034232  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034233  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034235  |      
        terasic_de10nano_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034236  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034239  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034240  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034243  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034244  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034246  | ORPH 
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034247  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034249  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034252  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034254  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034256  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034258  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034259  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1461034261  |      



-- 
http://autobuild.buildroot.net

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

