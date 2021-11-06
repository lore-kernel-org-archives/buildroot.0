Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052C0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 06:52:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB86611AE
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 06:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FB86611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F5194015B;
	Sat,  6 Nov 2021 06:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KMnMQvLUcjuy; Sat,  6 Nov 2021 06:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B198840048;
	Sat,  6 Nov 2021 06:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D934B1BF2C7
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 06:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C777B401E0
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 06:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGwbRp22hPuu for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 06:52:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04CB84015F
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 06:52:46 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AF3B340008
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 06:52:43 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 06 Nov 2021 06:52:43 -0000
Message-Id: <20211106065249.C777B401E0@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-05
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

Autobuild statistics for 2021-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 41  |  8  |  0  | 49  |
  2021.08.x  | 37  |  7  |  1  | 45  |
    master   | 50  | 51  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

                tpm2-tss-3.1.0 | 16
              tinydtls-0.9-rc1 | 8 
              host-erlang-22.2 | 5 
libdbi-88b8477d57153b9f736d... | 2 
                   mpd-0.22.11 | 2 
                    olsr-0.9.8 | 2 
                  zeromq-4.3.4 | 2 
                   audit-3.0.1 | 1 
                    bird-2.0.8 | 1 
                  boinc-7.18.1 | 1 
                      gdb-10.2 | 1 
               host-ruby-3.0.2 | 1 
                   iperf-2.1.4 | 1 
                  janet-1.18.1 | 1 
               linux-pam-1.5.1 | 1 
            lttng-tools-2.12.3 | 1 
                   luvi-2.12.0 | 1 
                 openal-1.21.1 | 1 
            python-ujson-4.2.0 | 1 
                 samba4-4.14.8 | 1 
             transmission-3.00 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          audit-3.0.1           | NOK | http://autobuild.buildroot.net/results/9b3c53095cba22784b96ca31eaa4cbf1d2b56085 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/d7aab7df196e0f6d6389b87ff29da7c2971e6b6d |     
    mips     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/bcb301e87c810a256df9d51e4054a06de373f234 |     
   x86_64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/6d4a62c703c85dd993ddb2d90ebe1f6cad24e0b0 | ORPH
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/cbf5d8b5bbbbfe2b719efc94c2c7244f0dc9e673 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4f52b2f194dcfd619fefb192d1c0fd070d5bd408 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1478f0db69264b65008dd19750da4b2d2746b00c |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e754611954629d5c25271c74e6e187520ceaa85d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/961b612e807432a1bc9b68d31f9fce3ff81c49a1 |     
   nios2     |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/a5ed7629d2daa5b19efc7ffb5615dc5193eee320 |     
    arm      |          iperf-2.1.4           | NOK | http://autobuild.buildroot.net/results/25116af770cf94227302cfc1cff4ded07e85fe49 |     
   sparc     |          janet-1.18.1          | NOK | http://autobuild.buildroot.net/results/8d204d8f065e6e4bc1376edd1f639864b3c69c0b |     
    arc      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/38883c815a5b29df29b8e0e4362328eae1661216 |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/e2a2a2cfd8fae7f33a00369b61bcd0e071c30faf |     
   mipsel    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/198512bf608353367a97a912d0262a5d312dd35c | ORPH
    arm      |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/70d645593c9e164d0d044da1b0128cda9c96e830 |     
    arm      |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/a6d7f6b85ce6b8f41c591d4d6804ef1c5be90593 |     
    arc      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/3c77db4e60b5632183df4fd2b1c5a1bc60f547b1 |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/b8c5879a02078f4962088dff5ae2ede1f0e6b805 |     
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e96036bf31193b62ce771bd086f7078c9e31d3fd | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/54cae924711e26f04045f8208db0d772292a3933 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/92dcac0d4bf26c415b9b3f1608b1d3bed2245a94 |     
    sh4      |       python-ujson-4.2.0       | NOK | http://autobuild.buildroot.net/results/233c1e561dd3a39db9debcf9fdd24b2fd6e949c2 |     
    arc      |         samba4-4.14.8          | NOK | http://autobuild.buildroot.net/results/d9083492a6dbbebd0aee15855923660a3044aa79 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/adc91ca02cb52b548c93ac7d294ee4f1da64e467 |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/77958f67b5121553fbd57d990d5c37924eb30de1 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e59503e1f2b0535186ec9001184596ac4a694afc |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8e5b841b6a963752906a8c06d52fcc8bf48da275 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/732c4cb4c2fb4cb82901a44006e03005f1b18478 |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/ec2df0b39b6526ff145fbd4cb2c6ebcd7015399d |     
    arc      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/19e041a9781920386f0c834ba43b3d3f80ccbde5 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3b145985c0aa38660b6da71fe470e4a06b17ed63 |     
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4c4ce728fae63eb9d7ec747f423cbf97d7db1a2f | ORPH
  aarch64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2d94d6944f5f30d78af6549bf98cf7a5c42da739 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/c863272f600e47e0973e9bb245845f6d898ef9a9 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a64c5ffd0b82b6e79dcea15ef969eef97b520001 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/77b10297bd1a4abe918861960f12dae45edc20da | ORPH
  sparc64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2e4ac4f037abf234abfd9185a0d3dab1c9be534d | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/a80e78331484b7c2c6cb8d26b718bae384b48738 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4543ee111059d627d6892ae130b3dca628997127 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/bcc0a3566af868f2d16df8d33eaa1ad30aa082c1 | ORPH
  nds32le    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/53a770c6095d4bc75937823414543da5a59f416e | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/173949f79547ad81f6773febe4395d99c1e19b2f | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2b2b13f968f2052a786032d72184a1119f065ef6 | ORPH
   nios2     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/673f3a6c5128d4f3eb8dadf4bd2b4d03f6d602fb | ORPH
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/34a6145c6425016dd32e6d494cbc4b9858581780 | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/f5772799cfc14f8032e82413c6c5712aed8d06d0 | ORPH
  nds32le    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/39943afac192843866a564a18dfcab44358421ab | ORPH
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/7a96dc94e217d78673719b980205ec584373492b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/65ef42c8442245a8263b80dee6db950269e98922 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9122bfe45d1f8084dda45eddae31e70acb8ade11 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
               cutelyst-2.11.0 | 1 
  gobject-introspection-1.64.1 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                  vim-8.2.3565 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/57752e283b3725563de06df2877b96007eac940c |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5c0c6dd677cee48b2794512c468ca0d205fa65d3 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/43d2787e07cdd6fcebfa215cac36de2292371325 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f8610c4912d9224f83aec5099251c766ebb89093 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/382dbfc4a311b6db03fdbe7b857a98a15217cfd4 |     
    arm      |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/dfc5179d8ca62d0d1828ef9fcbd2d5f270a56ee8 |     
    sh4      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e670dfc462345b9a6504cb14d38f237dc6b3792c |     
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/ced5c0adc4cdc4bba1200035579b24370abbd109 | ORPH


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  vim-8.2.3565 | 2 
              containerd-1.4.9 | 1 
          gstreamer1-mm-1.10.0 | 1 
                harfbuzz-2.8.2 | 1 
                       mongodb | 1 
                    olsr-0.9.8 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        containerd-1.4.9        | NOK | http://autobuild.buildroot.net/results/f4291a7f220cb74a4a2017e605eff41e8247b460 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/86267d0f8905a4b0df509afdfb606d39c48b428d | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/afb9b45401cb58072a9386d23aebc18fffabf2b9 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/0f392d3155b1014e09f8ac8e3ea2216611abb1bd |     
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1380e6096260c67ca95a0dd73b411aa81673fa9a | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/0bdaaa0c3fec6ae564788b47d73725d2500a6635 |     
  mips64el   |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/6e3d17a5d45d329b5c2d921d35b443534f016cc7 | ORPH
   xtensa    |          vim-8.2.3565          | NOK | http://autobuild.buildroot.net/results/34e8d0940c423a600f8a3c0958c409d807027d7a | ORPH


Gitlab CI results for 2021-11-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850427  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850429  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850430  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850431  |      
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850433  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850435  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850436  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850437  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850439  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850440  |      
                   armadeus_apf28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850442  |      
                   armadeus_apf51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850443  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850445  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850446  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850447  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850448  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850449  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850450  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850451  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850452  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850453  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850454  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850455  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850456  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850457  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850458  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850459  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850460  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850461  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850462  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850463  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850465  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850467  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850468  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850469  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850470  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850472  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850473  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850474  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850476  |      
                     beagleboneai | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850477  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850478  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850480  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850482  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850484  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850485  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850487  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850488  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850490  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850492  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850493  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850511  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850512  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850513  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850515  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850516  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850518  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850522  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850520  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850521  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850524  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850525  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850527  |      
                 grinn_chiliboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850530  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850533  |      
                   imx6-sabreauto | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850534  |      
                        imx6slevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850537  |      
                       imx6sx-sdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850538  |      
                        imx6ulevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850539  |      
                       imx6ulpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850541  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850545  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850546  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850551  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850552  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850554  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850555  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850556  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850557  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850558  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850559  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850596  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850600  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850611  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850615  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850625  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850626  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850632  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850631  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850634  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850635  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850639  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850641  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850645  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850651  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850653  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850654  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850655  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850712  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850720  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850721  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850722  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850733  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850734  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850735  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850737  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850739  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850741  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850744  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850745  |      
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850749  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850750  |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850752  | ORPH 
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850753  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850754  |      
              stm32mp157c_odyssey | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850755  | ORPH 
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850758  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850760  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850762  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850767  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850769  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850770  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850771  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850773  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1746850774  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
