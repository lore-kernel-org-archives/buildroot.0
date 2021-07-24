Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA6CC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 05:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499D460E78
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 05:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 499D460E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D23526061F;
	Sat, 24 Jul 2021 05:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPYvY5JDXdG4; Sat, 24 Jul 2021 05:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7DFF6062B;
	Sat, 24 Jul 2021 05:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A088E1BF5A8
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 05:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EE5F40668
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 05:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tM1APpZ5rYmt for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 05:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E8B440648
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 05:47:50 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6E8F41BF20D
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 05:47:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Jul 2021 05:47:47 -0000
Message-Id: <20210724054752.8EE5F40668@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-23
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

Autobuild statistics for 2021-07-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 18  |  7  |  0  | 25  |
  2021.05.x  | 16  |  4  |  0  | 20  |
    master   | 53  | 60  |  0  | 113 |

Classification of failures by reason for master
-----------------------------------------------

                qt5base-5.15.2 | 7 
                  exiv2-0.27.4 | 5 
              alsa-lib-1.2.5.1 | 3 
        host-sentry-cli-1.57.0 | 3 
          libmodsecurity-3.0.5 | 3 
                 mesa3d-21.1.5 | 3 
                    qemu-6.0.0 | 3 
              tpm2-tools-4.3.2 | 3 
                      gdb-10.1 | 2 
                librsvg-2.50.5 | 2 
               apcupsd-3.14.14 | 1 
                    bird-2.0.8 | 1 
              bluez-alsa-3.1.0 | 1 
                    ffmpeg-4.4 | 1 
                flannel-0.14.0 | 1 
  gobject-introspection-1.68.0 | 1 
                harfbuzz-2.8.2 | 1 
         host-gcc-final-11.1.0 | 1 
           host-mono-6.12.0.90 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libfuse3-3.10.4 | 1 
                libmbim-1.24.8 | 1 
                    mpv-0.33.1 | 1 
                  nginx-1.20.1 | 1 
           optee-client-3.13.0 | 1 
                     php-8.0.7 | 1 
                 pixman-0.40.0 | 1 
           proxychains-ng-4.14 | 1 
       python-matplotlib-3.0.3 | 1 
                 python3-3.9.6 | 1 
                   seatd-0.5.0 | 1 
sox-7524160b29a476f7e87bc14... | 1 
          sphinxbase-5prealpha | 1 
              syslog-ng-3.33.1 | 1 
                  zeromq-4.3.4 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/83381d39211a816a5711b6edbce3281fe18da6b4 |     
    arm      |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/33906658962f4b7e0b67850d8db063c364fb5904 |     
    i686     |        alsa-lib-1.2.5.1        | NOK | http://autobuild.buildroot.net/results/1509dbc4a6493aca16d10b1ae709d7927d939b3f |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3722a75c07875f0b6b0de374822143570c028565 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/51080f50b47809d5af3bdad5a51e2b802e403930 |     
    arm      |        bluez-alsa-3.1.0        | NOK | http://autobuild.buildroot.net/results/a8cd389796bbc8488e5b5aea995d1cef4c581e8d |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4f321d307f5ef36b88d74b74feaa1219ff958396 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d17fbcfbbca81dfff774f6a11d16269197e329b4 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8bd2cfb9a1accbe447170f096d92e68aa530c6f0 |     
    mips     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f2a77c24b93529ad7a31c5316760d0bed5bad508 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f4a395d6712fcc86096d6bcdb9c50148bc2ae432 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b2dca1d58af8fde7df298451d76ebf35144e8188 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/927df600fa3c60fceaa03ede56f43b4001e65987 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/014fa4b81d8a98005c3c5fe6bdb846fb8485869f | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/20994611e100a9465fc7901309c863b0145048f9 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b442ba128eec663ad873c5b7e7941baf7728cdac | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/3c18eeb6ca9bb20e8f37ba7403b639f80c1e9693 | ORPH
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c546a31ff5fc6d185414e7359e54bc73ce03260b |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/6a185e69fe8e123ba26c26b69091d001656693c7 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42964f0bf53572134bd8fde733fcfdc82fc4b9ee |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4541457ceeb8855e67c679d1a8835d75bd538dde |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c16a8177d2e072a2141959b74e7d0ab2693b83a4 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e13f8fc01a73308ec1245ebce21305daccbb1542 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/480b9bceb06b8535cd49cebaa4fd481d3a44af8c |     
powerpc64le  |         libmbim-1.24.8         | NOK | http://autobuild.buildroot.net/results/6808105c7b94479757a213cb5a89bd64426a2961 |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7666dc42bf68e6872447e7e957534e26355720eb |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d975916b098c70510dda9d4a398a1611c63c0c09 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/907bb309eae0530a391863b32a46bcb8fa5b6421 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/60e4494b06e07358fcfd373867b1ce2c2624b5b9 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b938e2b57c90a2739fe90fef7c383fbabd367419 |     
    arm      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/b5f549e1263f9fa8a2f37f4947264f3c1e802ebc |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/201c345aa88f4eb122a4ebdb93dcb0c056afae46 |     
    arm      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/c234274d92297110ce3753ca508a16ba715481a8 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a3dc8410ba03cbdd40ea3a4e42b0bd97412b1002 |     
  mips64el   |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/d32dc9217cc44ef518d16b986b5b5b153bedc7d1 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/887924866c0a165e314a5088bf074c1f6a19e613 |     
    arm      |           php-8.0.7            | NOK | http://autobuild.buildroot.net/results/58d94367c587f2c6e14850f8688cc7da0e5e0246 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4d094f433bbc2a82df4cceb86fe9c134b17e685b |     
   xtensa    |      proxychains-ng-4.14       | NOK | http://autobuild.buildroot.net/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5 | ORPH
    mips     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/911ff6d1d7b647e172a31f0b1f4ba1589d4a4d05 |     
  riscv32    |         python3-3.9.6          | NOK | http://autobuild.buildroot.net/results/fe04a259109368428927a17d131e7437e08abece |     
 powerpc64   |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/88540469cef87ea91d1123d9a1e5d7976576cd63 |     
 powerpc64   |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b498309aa023a324c90907c59c22ed631c0dcfbc |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/55bb9db778e63777ce069dfed041f1d491d42cc4 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/30ad1627ad3aa965aa3f43ee7ea83d5bed2d5bbe |     
   nios2     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f08d84d45ec018fc263e54a7f5943098851cf824 |     
powerpc64le  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/acf24baebd11d01ba6ad16599ebc7500a70a62e4 |     
  sparc64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/20c38c3bea48bca8c5b856871456068e9ac4316e |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f58c0b90b2547cffd27a53e949ab7321bbd0f436 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b8e851ad9b16e17a21224987fdc9365164ebaf38 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/df8773c3418c4cd6dacf6d049ed0e24b99ce1490 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/3674fbabd3d0cc57f87e0dcaf2d06146ae499669 |     
    m68k     | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/9c039a617dac0adb6259f8f9d0d589715dcad30d | ORPH
    m68k     |      sphinxbase-5prealpha      | NOK | http://autobuild.buildroot.net/results/10ddd42e547467f73cd5b18649857fb997b58221 |     
  riscv64    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510 |     
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/8fa56ec63d39a1dfac73df8df8667c22cb9410d7 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/5a9ab18277c387b0c29085c9104d04e3022e1a17 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/fdca8c53b202b538eb73b94f1fdfe9042d6e14c0 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/89160ebcd34a4ecdd6ce60f79a1469d94285ed3c |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/6a6820cb45146acb9e6bb4817139ffa1ab7a7613 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                   delve-1.5.0 | 1 
                  exiv2-0.27.4 | 1 
                  gensio-2.2.3 | 1 
                   gvfs-1.44.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1e1bd27fd480c6bf9c288b1168fbc68e4fca23bb | ORPH
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/cb1bbe6ef21349b62c0252c02feb855169d4ea9c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b096ce74d49dc13d9b765e4ad0af7c50528c07d |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/eb21a1a127b710fbcab766c4daf7026c4e21edc4 |     
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/bf278aa212216667916fda351eda4a7b229982c9 | ORPH
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/7919f2b9418857340ea7846081a4680dbb246770 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b9c59310c06bfebc406a54e0e96e9be32cfdf475 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                  ndisc6-1.0.4 | 1 
       python-matplotlib-3.0.3 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1b72b45f0a2f4f1248e5a719b6f2ba1fd86cf989 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/9b88e3a256ab6da74a398ce0df95009868549b66 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/1c7176c7c98dc88e57960004a7daf4d7f9c4b00b | ORPH
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/d8aeb117c2ace1b11545b3a2181e710f8de8b595 |     


Gitlab CI results for 2021-07-23
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416283  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416290  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416385  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416415  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416418  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416501  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416502  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416514  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416525  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416531  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416535  | ORPH 
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416593  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416604  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416608  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416625  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416626  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416627  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416639  |      
                qemu_csky807_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416644  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416667  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416697  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416706  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416707  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416708  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416727  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416729  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1443416747  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
