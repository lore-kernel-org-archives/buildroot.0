Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18600C63793
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:52:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CC060FD7
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 05:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CC060FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F26A82C04;
	Thu, 22 Jul 2021 05:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lF75_cVCwomI; Thu, 22 Jul 2021 05:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 295CB826BF;
	Thu, 22 Jul 2021 05:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62A351BF865
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DB1400F6
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 05:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9NWUOAvYl1n for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 05:52:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A898400C2
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:52:51 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 332621BF203
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 05:52:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Jul 2021 05:52:49 -0000
Message-Id: <20210722055254.52DB1400F6@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-21
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

Autobuild statistics for 2021-07-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 13  |  3  |  0  | 16  |
  2021.05.x  | 11  |  8  |  0  | 19  |
    master   | 59  | 62  |  0  | 121 |

Classification of failures by reason for master
-----------------------------------------------

           host-libtirpc-1.3.2 | 8 
cegui-00b4e1fe174da53b7ed72... | 5 
                qt5base-5.15.2 | 5 
        host-sentry-cli-1.57.0 | 4 
           optee-client-3.13.0 | 4 
              tpm2-tools-4.3.2 | 4 
          darkhttpd-legal-info | 3 
                  exiv2-0.27.4 | 3 
                   gconf-3.2.6 | 3 
              host-libcap-2.51 | 2 
             bluez5_utils-5.60 | 1 
   brickd-ev3dev-stretch_1.2.1 | 1 
                    daq3-3.0.3 | 1 
            erlang-jiffy-1.0.6 | 1 
                      gdb-10.1 | 1 
                       gdb-9.2 | 1 
           gumbo-parser-0.10.1 | 1 
         host-gcc-final-11.1.0 | 1 
               libfuse3-3.10.4 | 1 
             libmediaart-1.9.4 | 1 
              libostree-2021.3 | 1 
               nfs-utils-2.5.4 | 1 
               pipewire-0.3.27 | 1 
                 pixman-0.40.0 | 1 
                  polkit-0.116 | 1 
                    qemu-6.0.0 | 1 
                 samba4-4.14.4 | 1 
                suricata-6.0.3 | 1 
                     tftpd-5.2 | 1 
                  udisks-2.9.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/20cc47f54de0b0d4bdf108c3715c590ae8ab476f |     
  sparc64    |  brickd-ev3dev-stretch_1.2.1   | NOK | http://autobuild.buildroot.net/results/731349712be7147de4d119b90dcfb7639e7be8ed |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2c796a63bd5a19e223e73c3c51f9740e468f1c27 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b177dea62072e8f8713d0f7eea8f4ec0980301b8 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e5957fc22334176b2cb29271c964a26db40c8cb1 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/931d4c4c5f0c1caca0f72f3e683ddcda6a336f82 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/acf4db53b1839da5737bf6d001897d984efe0ea7 |     
    arm      |           daq3-3.0.3           | NOK | http://autobuild.buildroot.net/results/9d2a48e71f9123e950dd96749a924316ccb7f486 |     
  riscv64    |      darkhttpd-legal-info      | NOK | http://autobuild.buildroot.net/results/95625bd4896d85be485704cdc26714e0ffc22b66 |     
    arm      |      darkhttpd-legal-info      | NOK | http://autobuild.buildroot.net/results/7e3f71425d998b56665f21e2ec79eec9243a0590 |     
    arc      |      darkhttpd-legal-info      | NOK | http://autobuild.buildroot.net/results/a1503d8d6f67a3742350b0188b0b2621afe5c476 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/08bb4007c04a263d1311ea02fd9609a968ae8b5a |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/966230af665fccb5d529715851f4e9d7b7cafb9e |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9cc928882ca9340c9630f63169d5ccc56163f00a |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/20aee9fc7869051de528d693d52ab20cb5ac042b |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/db697845bac235af5cba4cb3655f543aab370eff |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a300e71b7a9581afe0019d995f5212cba36edb5e |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a034fb4337f1839fc4c7bf3552c706b63ec069ea |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b15ae8a961c22366174ceb796254ab91b9d5d008 | ORPH
   nios2     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/d697c532a5773d9e703eb2f53d900876d2316c95 | ORPH
microblazeel |      gumbo-parser-0.10.1       | NOK | http://autobuild.buildroot.net/results/a32b5d3b959433fd5c3543661c37f80d27fbd010 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/6046387849d9a4443496a10493b62e5c471f86bf |     
  riscv64    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/e71d8c296f46938504a1ab33b70fdeadde928695 |     
    arc      |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/28f9d98f728452e936a48bff38c23e32650f42b4 |     
   mipsel    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/09b387938f0e5b929d2eb16b419368c349a5c7ce |     
  riscv64    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/bd85891052fe983bb315ab08cfcaa44c0af83f0a |     
  sparc64    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/cbb7759f3b9de89205125c8dc7efb67be44d3bc3 |     
   x86_64    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/f62bd2371e21630b28117ae50d6d933bf25a77eb |     
    arm      |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/56456248d6441ff2fdf43d6616047c44f072d8e2 |     
   xtensa    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/5753e48202b81c88e35b9e5085a6ef7694b392de |     
   mipsel    |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/e93bc33ee2ed1fab9543651a318a8de347242d7a |     
   sparc     |      host-libtirpc-1.3.2       | NOK | http://autobuild.buildroot.net/results/54608358fb5c9294b17aecf7d1877c7c77d395ce |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f1306cb03e591055fc2cd88b20307864a3612a1 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a3b3c787f8436520ec24e18f5a159da7d161b80e |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b32258819f584eaadb51e2e3ff31b3979e8dfd0d |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa460e156776f48b3ca15d23073a42ab80496a8f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5f9f5c79c02a03189419d4b3eb676f4c05e990e2 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/9bd01c3607311dcf4e7f05f750350d27d759dc49 |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/9f491289a009f6b75a85485e520fdc8de687be6a |     
  riscv32    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9 |     
    or1k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1877468f273cf9b9c0dd4b7779e9d5c65dd7cfec |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6f2a07c99dba086abef2dc6696f439ac5822ec87 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5823b1944d384cd41a38ddaaca0464c69746a245 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3e5d468bc3872730b1b485a304893a7d2becfb19 |     
microblazeel |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/3d33e9a5bd22ea306fdfe93a1577ed21a4f8f709 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9ddb8b7e305ea73af96cef16d7a68608e93d936c |     
  riscv64    |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/4d9227922f72153cb244b39fc226c1907b9bf5ff |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/720805a9f87da2396d9fafe4a98138f8ef66022b |     
 powerpc64   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b90a57ed516b6613957514bf4a52513fe0646b88 |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a15356986d1c56e9ecfd90446db68584cec82952 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7e83155167a2d179678da50d4b3a108216e86a88 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2bea0389dc237988e13d3e8cfb3c4c2cd74c9c1e |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/201ae3a0ffbd2f78c1072bfc197417a48e4a21b3 |     
  riscv64    |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/4f9796fa0be34666f138e54046210344673a8e89 |     
    arm      |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/0b960f40b5d7e4bb0c4ba20638fe66a9e0964ab3 |     
microblazeel |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/f38926197761743d3cb68c146140521c2ec11592 | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/40726b33eaf3a91c8e5c70238a1a43f2a4f851e5 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7d6c284ccf0279fbbb86cb674b2f24d36e4776ee | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/591464183b7183f07f44bb917f9c671a6ec0ccf7 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e49694d9f9bbb5429f6c0eff67512e9d6bd705c7 | ORPH
    arm      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/5e7f3a5feac23640fae7aea90e2151b6e93d9fd9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/57434eb55f65a3120aebefbd986f17763f0a9bb8 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
        host-sentry-cli-1.57.0 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c1d93991045db8520a16cf831f1ddadd440c5f65 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f47f2ecb3dc38268943612e87ce26c72bbf2b1be |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ef1f7ddb93a32e69421c63590de0b2d09149288b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                   httping-2.5 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c4603c0e17c3044e08623086c000ee3143863c88 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dff5b8beb113cfe27e836265dc6c11bd7a1ca7ba |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/80073df3c56fed99b0959a47f0bd72fc0a27d72a |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/7dd02a8b614987ae17296409096de71db074509b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/af19bf7c99b83e86e34569f5d8785264a7555b10 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/2076335598c0dee2531406a63d1684181713ff72 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f18ba9a62b87a09f1ef7c26bf47ab0cf9ac33e2d |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/74816499fad39991e552a25f4e0617b3330fd25f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
