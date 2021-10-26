Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892A7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 05:54:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A148C60FD7
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 05:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A148C60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BDD404C4;
	Tue, 26 Oct 2021 05:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zwxQRj2ZW-o; Tue, 26 Oct 2021 05:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D965F404BE;
	Tue, 26 Oct 2021 05:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1CA51BF32B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 05:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCBD7404BE
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 05:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0feg0XR5g5rg for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 05:54:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED5B8404BC
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 05:54:05 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0893DE000B
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 05:54:02 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 05:54:02 -0000
Message-Id: <20211026055407.BCBD7404BE@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-25
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

Autobuild statistics for 2021-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 46  |  4  |  0  | 50  |
  2021.08.x  | 27  |  1  |  0  | 28  |
    master   | 60  | 74  |  1  | 135 |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 22
                  boinc-7.18.1 | 15
              tinydtls-0.9-rc1 | 6 
              host-erlang-22.2 | 4 
                       unknown | 3 
               host-qemu-6.1.0 | 2 
                   iperf-2.1.4 | 2 
                log4cxx-0.12.0 | 2 
            python-ujson-4.2.0 | 2 
aer-inject-9bd5e2c7886fca72... | 1 
                apparmor-3.0.3 | 1 
                    atk-2.36.0 | 1 
  binutils-arc-2020.09-release | 1 
      ca-certificates-20211016 | 1 
                 coreutils-9.0 | 1 
           host-mono-6.12.0.90 | 1 
               host-ruby-3.0.2 | 1 
                      linphone | 1 
                nodejs-14.18.1 | 1 
                    olsr-0.9.8 | 1 
                    qemu-6.1.0 | 1 
            qt5location-5.15.2 | 1 
          refpolicy-2.20210908 | 1 
                sg3_utils-1.46 | 1 
             transmission-3.00 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/adc88bb7a6cc9cfe8866348237e7d6b545931186 | ORPH
  aarch64    |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/9a4963ad3241c1a0a794d59369906ab620179339 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/aaefac89faa627513342b3f325617608e55f6940 | ORPH
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/9cafc727dd736589ecd34b32f834307d13b06dcf |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/248403d30ae9b7dc69ccceedfe88abcf91a19b37 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/863e7acfff403e84f4737d63ecfb26ca056d0bda |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cf6db50a755b22ca3b89b20fb828324458510190 |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/511e81eb47aeae0d9a628fda41ceecc15385bbbd |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/71941692a8ecbe482a44d3835d016e7665ef43a7 |     
   sparc     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2b5e7609b7b4698eda0160c4bfc286998f1f7ae0 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/05d1e5aa0210cec2a7bee78b3bf6d47d646bfdee |     
 powerpc64   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/00880e2790a8c44d80cb9fa7e4e77dbda76c39aa |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/01272d5b4f2ce4b9aa86b435b2cb5dff13371719 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/47d91391449b8f2dca699bc48a73918d63e59fa3 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2d30c61cbccdf9123b15f8089f82d77cb665d324 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/4d11cd760f894df16bf16e3c831a3975f87dff51 |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c18a52280eda16ff809f121128cf7c9091d2471e |     
  riscv64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7cafec8328f9cf990b20f90d324158ca5d32ab8c |     
    arc      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/86f74a61f2c2aa9a776c9ce8b0e3b19291da650d |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2b6872eec31362bf3edf88c69b67d681b2f016aa |     
   x86_64    |         coreutils-9.0          | NOK | http://autobuild.buildroot.net/results/0b99381e2cad391abb74bef605e6a1889ee753d9 | ORPH
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/493102e6a362befc0a5649fee713cce3fbc862cc |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0ba753709293a48850b9a7578383e25e8068d89c |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c9405145c47a1a8d1f31d23a1039cd31b4e45c54 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/80892579ae7c99c01c5207922ca27bc188de6236 |     
  powerpc    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/4fdf95d63f74e5895c16dc9b347712c243a207ea |     
    arm      |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/27c13dfd457fb77a0c42de9bd1efe29280af24ed |     
   s390x     |        host-qemu-6.1.0         | NOK | http://autobuild.buildroot.net/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652 |     
    arm      |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/81bdac585600877d3fa8d9478b7f160dbd1537a9 |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/f22d7b2c3d46178be59402af263fe76778659fe5 |     
    i586     |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/d815b864cb2dd719815af2436b919b8e093d3c1b |     
   xtensa    |            linphone            | TIM | http://autobuild.buildroot.net/results/2e30fb5e595c6e8857cbe562c7776e1bc49b8c14 |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/7c80349de520cf2fe35fd04a5c63a5e24731c8a6 |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/79b3770b174ff9ede166043c2bb1768ca170bac0 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/feb9f17222c33c73305e23bd8e76578ca5f39245 |     
    sh4      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ee33d5eec998b961e8c33d119efde306fb5e3eff | ORPH
    arc      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/3ef2b6f49f5f5533ac5a7fa846a28c2a3876d88a |     
    i586     |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/64cb22b59e0c53d79dd79090c63cc844b9c7e5d2 |     
   x86_64    |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/07faf4b41b22ed1fd26a5a620ea57e9c7dd14d0c |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6a0ce0283da76c0efca5cf8a234b455ce4bef3f1 |     
   x86_64    |      refpolicy-2.20210908      | NOK | http://autobuild.buildroot.net/results/c3a42b66006c1e4a42d2cfb53a15ad6a270e5118 |     
    arm      |         sg3_utils-1.46         | NOK | http://autobuild.buildroot.net/results/359f4afeac50bc1c0e2b8b65370cf7718353af80 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/857d16712c9d782af5b50bb3764d4238ac0379f8 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/377b1b6e5358fa222f0eb2749b6df0485d1951b3 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/761002775542f2d6e92c24602946fd4171b015e9 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/754e580996c26de31de949a24952a97eebc0489f |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7ff6b9261e84980722f9264a70ddd4d0438fd250 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/68bd648a4c44af93082649bbc685226ee5ca22c2 |     
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/b08c8f9467482911bb4ea35ae99476e51eaa02af | ORPH
  mips64el   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1f6bd60c23f056f2db02b0b171394a786371d6ed | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3f15e6cd0b6ef714bcc36460392d3397f7f587e6 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/5b2f2b8fbbd8809e163a44a7c6842419fe8d7ede | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/8241b53d7fccb00cdfcd4a1c7a36070ab6fd8b2b | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ce7e7cb7a3bc49562161b535cf25e96a68680e2f | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/52fb1a1861ad0929036d0256c9c4b7126452d2a1 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1467d7048e0bd20e7cc9151e716be2908eb20cd9 | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d069ad206b7c51d9a967c22611718debf0f6bdbe | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/fdc5795bddbbc1be715c264204f82fb59ae38593 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/88c65e12b96fe004b5a056fc043fbab609e1da72 | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/3e0ac17f275b8e34d5aefae2ddf9575baf9ecacc | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6843d0792ced62692d4cf4e6bed81ea287678c16 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7e960756442a05531ba693efb71854f8f04f5fb3 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/6c26543dbae66ab22553828f917cb2ea1196e643 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/9e6027819cb09b8c3a4a24962868d8106bb07c35 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4ba51c7ac461f2ae790ae7ee3edfd5409270f4e4 | ORPH
   mipsel    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d7008d79eba484e5025ca25ec53212be6ba9b81c | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/ec4b4b8c4da1e32e31eb6963b384b5ac81e7512b | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2ff3db065198e3b0def7bab6d125789438db0a3e | ORPH
  nds32le    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2e28b293423ec96fb8391f9f1a7ec61fdfb0fd65 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/7b3d7fedd5051f3e3550613ba2a7ff7e88625268 | ORPH
   mipsel    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/89a42dbf6c4e69207f9ab46049b39df5762efe29 |     
    arc      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/eb55cc803bebc8acc93bb3d2ad9e4f58f34c680c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/88de889719798ff59d0ca936fcda8a5cb0405c01 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/70fde33cb21011ebb95cfea85c7d020872c78737 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e0e3e1b05d034a9520e8d055e19e3a34be5e334 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 1 
                ejabberd-20.07 | 1 
           heirloom-mailx-12.5 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/bad1ae6a15f78fca379587789e1a4d357e3d7b93 |     
  powerpc    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/490ec5dc74a348cee55f739b7499e739f2ef2f1d |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/3be9ad36b77ed4299ce3634846479eaa9cbc3c56 |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4659c4a7a80e4838b058c166572d635c95c394ec |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

  gobject-introspection-1.68.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3d178c200483cecc9a33033d601b0d98f0514d29 | ORPH


Gitlab CI results for 2021-10-25
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552455  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552445  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605  | ORPH 
 TestPythonPy2Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552692  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552693  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552412  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
