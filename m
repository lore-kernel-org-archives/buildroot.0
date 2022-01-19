Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFAFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 07:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4917F40155;
	Wed, 19 Jan 2022 07:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FO3W9JDoYDe; Wed, 19 Jan 2022 07:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6A440141;
	Wed, 19 Jan 2022 07:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 662271BF39F
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 07:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 545B340140
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 07:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MO87BsSj5not for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 07:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8C2C40137
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 07:06:52 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B73EE0006
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 07:06:47 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jan 2022 07:06:47 -0000
Message-Id: <20220119070657.545B340140@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-18
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

Autobuild statistics for 2022-01-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 66  |  3  |  0  | 69  |
  2021.11.x  | 23  |  2  |  0  | 25  |
    master   | 92  | 53  |  0  | 145 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 10
      host-riscv-isa-sim-1.1.0 | 8 
             bluez5_utils-5.63 | 4 
                   gvfs-1.48.1 | 4 
                log4cxx-0.12.0 | 3 
                       unknown | 3 
                 mesa3d-21.3.3 | 2 
             babeltrace2-2.0.4 | 1 
                    bat-0.18.3 | 1 
              cryptsetup-2.4.2 | 1 
                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
                   gstd-0.13.0 | 1 
                   guile-3.0.7 | 1 
               ipmitool-1.8.18 | 1 
             ksmbd-tools-3.4.3 | 1 
                libglvnd-1.3.2 | 1 
                nodejs-14.18.3 | 1 
               pcsc-lite-1.9.5 | 1 
               pulseview-0.4.2 | 1 
                qt5base-5.15.2 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    sslh-1.22c | 1 
             tpm2-pkcs11-1.7.0 | 1 
                 wavemon-0.9.4 | 1 
xdriver_xf86-video-mach64-6... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |       babeltrace2-2.0.4        | NOK | http://autobuild.buildroot.net/results/cb58d4fbaeb08d188c2f8bf05ef1604789fa8766 |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/1bfca20d72a0bca2e3336b6edc3a4722d18a7816 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/6571ba516c5fb13ab0ab5727671af36d8357ff70 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b912dd02ec87f6d3faacb163fcb676b0e6028ba0 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/2a61a8d8739ec9773f946aec3c00b7ba54bb7a73 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/46f212005463424f93b9f86b0feba17335cf5db8 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/57d6a2a0785245df75fd6c1f38f59e352cce8ae1 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/74ff28b31a001e4451aafb4d69c0839e2b312853 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/daf464b68bb0bec85e0f96f2c6a4deb9cfd7488c |     
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/9e0de3be130bb618514a32878e1fd3c2717ebce5 | ORPH
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a927f5d8adbfdff2bb69fb1185aa98c718d5f73a | ORPH
   s390x     |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/f2bc8f2163acda56dddde5bae8d4e0e852e8eeab | ORPH
  aarch64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/87194e411363b1e872edd0b789c7aa3236aecd6a | ORPH
   x86_64    |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/7c426984f57b5f044da597c6ddc602aeacb5e152 | ORPH
    arm      |          gvfs-1.48.1           | NOK | http://autobuild.buildroot.net/results/aaafaf0fe330fa30fa3bc50eec985b8385733f40 | ORPH
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/53283b708980285341d23ef3e1ec18c1eb64ed89 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/07662a376b7e77c3edca3725132615c2dcec4a0e |     
  powerpc    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6dd5b437ac5a1c995c79da9926e454c23eb82bab |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/1cc794a1b82832a3bd62bc9804097fadef8db3c5 |     
  riscv32    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/40af7d5baa8360cae3298d11cdad0ed36655d425 |     
microblazeel |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/e5648e68ef17ca611728fbcadf2a80c7f3818521 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/95ddf7e566d38bcb7a61365ebed4a844f3b3bf79 |     
  aarch64    |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/dee032c078aa3788fb146fc8ceb47bd6fbf5f062 |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ef3c9c4507fefdfc34d881d3b2b6f84bf541688f |     
   s390x     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/0693163f4903e8b814d6d8daa6e7e4d2f2341cc7 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/0b9193bba229573156aa92c962ac33584bf4a201 | ORPH
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/a5d3e05f1b1618b603c44c84ad786e4b2f43e260 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/22cfce984a6b1959261ef20540fcb70d92be3129 |     
  riscv64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/1f1412bb0e39e44813bacab73b984f63c20d2f09 |     
  powerpc    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/e12e6c039bf2509370f1ad5f8aa6bcb744d3abff |     
  riscv64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/58d5683a179efc2f79bba53d29ffb32b56c17a5d |     
   x86_64    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/a1f913e4a2da6fb59f67db6a9de81c41cd75e060 |     
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/6f926bec146752873f8032b593f0de1cb222ea46 | ORPH
  sparc64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/e9002c89321ae1438382dfff023fe1dba3aa096f |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/27b31481733f08f1cf8cfee34a251d3e69ab2621 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/1edec9977ce0b2f7a5fa9757bfc5f22149b30a4f |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/5ed1912a5c65dce379baeec8160ff6ee113867a6 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ef117ee0d40b36bd4c099b14aa4d2f59d2b2ef9b |     
    or1k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/41df114212d088c7ec2fff0770757092265934bc |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/43fa0d571924bd1ee96b0485cea5b62185a9800f |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/50fe491b3a6c4e6e1cefb36682a97612160112d5 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a5019decffeffdb5aed8bb93153364647b4d3935 |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d7b6e3c014f418e3ba1a9b8b91d7d2877ea8fbe6 |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f901a69ec0a3b311226fa282c4e4b4abeb845207 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/5f4e7afff729d3f1ee145b5441d449f6f3ca351a |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/37bd366dfd1c57cbcd01b115c9074f49c4b1f9fd |     
    arm      |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/59c95f4ffda404124409f4c4e9cc2dfe40ef7588 |     
    or1k     |       tpm2-pkcs11-1.7.0        | NOK | http://autobuild.buildroot.net/results/7af9d4b68bd46ed260ed66ba2cc3c9c21482e741 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fda2d1c28ffa7e73d38a52dcd4c7ae79aa0a44a5 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/05ccfe1c4a26585ce2f92f5685cf1b10ab7c8546 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/96d25f7893151a6a4f96117c1ce52d20a44fcfba |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7024cb5ef610451ee083c91fb312467709514e2c |     
   xtensa    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/f0a0224a2b368c11236fcc7d14db5175c0a829d1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c92a15f1e2ce25bfd4791318d85aa2ab385fb51b |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b94330935b48ba8124f42932f49a161cb348830e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b5a453a3196c3c8de1186984489356322e2c3ddb |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9b1a2326b5a10cda27725a991d62091079a2ea75 |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9507b99753ba8e72260dfe8b41d291248ecd2c5a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
