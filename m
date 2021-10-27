Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138C9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 06:04:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513BA610CA
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 06:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 513BA610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06464013F;
	Wed, 27 Oct 2021 06:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5xwuJGuNjWC; Wed, 27 Oct 2021 06:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6539E40188;
	Wed, 27 Oct 2021 06:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC4B41BF4D7
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 06:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C60B140188
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 06:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cifkfgsYMN3 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 06:04:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C524013F
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 06:04:23 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F2B321C000C
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 06:04:19 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Oct 2021 06:04:19 -0000
Message-Id: <20211027060425.C60B140188@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-10-26
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

Autobuild statistics for 2021-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 32  |  9  |  0  | 41  |
  2021.08.x  | 39  |  6  |  0  | 45  |
    master   | 58  | 95  |  0  | 153 |

Classification of failures by reason for master
-----------------------------------------------

      ca-certificates-20211016 | 31
                  boinc-7.18.1 | 17
                tpm2-tss-3.1.0 | 14
              host-erlang-22.2 | 6 
             transmission-3.00 | 5 
              tinydtls-0.9-rc1 | 3 
libdbi-88b8477d57153b9f736d... | 2 
               apcupsd-3.14.14 | 1 
                 apitrace-10.0 | 1 
  binutils-arc-2020.09-release | 1 
                 diffutils-3.8 | 1 
                   gstd-0.13.0 | 1 
           host-mono-6.12.0.90 | 1 
               host-ruby-3.0.2 | 1 
               libtheora-1.1.1 | 1 
               lighttpd-1.4.60 | 1 
                log4cxx-0.12.0 | 1 
                  ndisc6-1.0.5 | 1 
                    olsr-0.9.8 | 1 
            qt5location-5.15.2 | 1 
                    ruby-3.0.2 | 1 
               target-finalize | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/8d28215306d014367d64a650aba8644eace2ce54 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/ec7f09717d6af620e636948d30dfe521d95aab2b |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/62f90f61356932a1dd697378641bf1e3df8bf9bf |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/2faff2f66afe94038dffd5834ff624be0336c2f2 |     
powerpc64le  |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/a4f4814023c21fddfdaf5eea2afa81fc9f05c5bb |     
powerpc64le  |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/cd6773b71c2e25f956ac7813b7969b98f7c8f84f |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/dddbc45245a8ece2824420f1db42676689ab1262 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f08327515bafdeb887177b8e7eb7a521a0382f4d |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/ed01d151b2c55ff0cf6ec2d52cd68009a3bc8915 |     
  riscv32    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c6f1892adb07d24c785831346d11e7225a1e4aba |     
   s390x     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/d1a78fe7226c54b0671a21fcbc18e9c0a3e17401 |     
  mips64el   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/06dc49af5175ede4b84442ce690fa65e54527297 |     
  powerpc    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6b84c964cba11346446d486b2df9899b451fa510 |     
   xtensa    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c66054cf3882703ddab48b9a292ec8c00a6dbb7a |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/b3bdce4a6701666fdb4e97a256bf6bb16f8ba1ab |     
microblazeel |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/3234dbf008d257f9d4efd990ef882ddd5b9ef3c4 |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/6e648297e2e36cca583feb62e106c01b0fcd42af |     
   nios2     |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/1a19b53f68caf82b36e875a4eb4e63417b41d03c |     
  aarch64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/7727108eb0c5657f2dafbfd37d263dcab177acd1 |     
 powerpc64   |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/f06b56105b0de51d504af55826c68fc4ecd75b64 |     
    i586     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bd68a6ec5f8bf097f5f72855582ce08d3536c91d |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b136ba6b2beeb519c7187ec838e7b4381233579d |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/a20cec864831939b3b6ec526b178133bddb1c631 |     
   x86_64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d7c399204401066b796bddc9099ce97a6ae83f5c |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c32be1d7143ef63578e2a9ce6512d4eaf2b34d5c |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c0e31f1bcbc05726370f973e86697fc4144e28a7 |     
   mipsel    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e88ceef56ae0d2566fe4619dfc320e973f5e2643 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/69e30ab3e031add54c766c031c5b93cadcf90252 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/39155f3f3aad60826f895918f7382d235fa46f17 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/bfdcd00c3a49e9bf4910c50d3fc99f3ebdf43815 |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c22e47fdf42dd40c50c083b0625cc3786b9a7caf |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/67a5d02f8a818808edd6b570bb32e97faef855ef |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b6ce0f9b3235ec37a0fa29851dc662576134dfff |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f7c4a444064683334eb4cba5aafe31986ef5625c |     
  riscv64    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/5aa76b66954f8cb9252573f9e1b06cf504f5bc7a |     
 powerpc64   |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/33228489226cfefae5abe95300daa6a27e402f18 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/b3c653dad66585f4ae5b60fdf2bc357a3e65ad87 |     
    arc      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/7d811edf2d0cb98c71e8755d1b7bf198824a2bfb |     
   sparc     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4a2562c8065ab2d854b628bca4e3dbe07fe65e61 |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/d60f7201aedb42029cca71202c0c6e2dea632d64 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/cb9932e7d239a4255932653a4386be1e4cfd0ce7 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/13e658fb942eeeff9033edb255c6ad0d69b37ddc |     
  powerpc    |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/8518377a5cb31e918b311ac89a056757fe57c46f |     
microblazeel |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/c865b4bcfaf7681cd6fdaaa4023558e936a370c6 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2f737cf946361eee2ddd9a3c65eaa3fbbb19b18b |     
   nios2     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/188f6bb5eb5e1c6f887323f04f8796e0db52ad07 |     
    mips     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/f6d8117c741fd19e9bb72bcbaf26d269864c59eb |     
    or1k     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4f179eb021fee30d7011292aabf3d2640b144b94 |     
   s390x     |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/2629bd04083f46dabe0deb66e305cccc967bf0fe |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/4ed3def37c884e5267d2016af6e2a6a8dfa89872 |     
    arm      |    ca-certificates-20211016    | NOK | http://autobuild.buildroot.net/results/e5a085138fc0188a41f446afa32ddb629c5123b2 |     
   x86_64    |         diffutils-3.8          | NOK | http://autobuild.buildroot.net/results/2c91c86a890079ab73081e8883b281932592016e | ORPH
    i686     |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/71252414daf2a45bec0bd9fc8ea9a73f641c9aab |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1040d74a71e9c37fb2b98a5b4861c60e6ea1b50e |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9efb2241902b0dca320dc5ec77fba004d7232720 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/df56c7365e6d19f47ebc728d7185425022a4ee49 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f0183531d97e622d6a01dffddef683596372a051 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d7e28b1d3f8b0f472a9a853c8cac75a849d626bb |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3bb5196371398273ba8983cfebea4f2dea4358eb |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/e7a9b7bcd667a33a1c3e179dd8ac4f7ab1858c40 |     
  powerpc    |        host-ruby-3.0.2         | NOK | http://autobuild.buildroot.net/results/3f65d79b1bb57d9362894ec27835d5101cef00fd |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/7edf48c61280fdce76ca2392201f5b5bf474b32f |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/dd3d5a8cbd2a182f5ce7495ab522f0b70b45adf1 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/c85195acf4a27df149613157385c8cee801d59b6 | ORPH
    arm      |        lighttpd-1.4.60         | NOK | http://autobuild.buildroot.net/results/0d56a44449e89773499051b35f21ec83bfab4ca6 |     
    mips     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/1258547d12cf6a5354c65687032514af943c362f |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/c61d1befea26590e585627e7d2f9b56c1788bf42 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bdd20fb8a15a9429aadf4eeef5244328808624ff | ORPH
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/be3591fc3688e83ba1e0bd89f8794473f295ba88 |     
    arm      |           ruby-3.0.2           | NOK | http://autobuild.buildroot.net/results/f196f8bc68d1b4c20bddced89478598a3fcd3dea |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9f283774ca2c89540753bbd62fdbddb1f9d4e392 |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/38dbe23be8017869736675084b334008c6a7cf21 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/57cde534ea2bc4d2a6d9baaad6b71e09728fdd2d |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d57e23051d2a45fdc83eaae8ff5a8456865fc022 |     
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/2cb5e9155f3b6047430a32b0325e1d0f281e351a | ORPH
    mips     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/35d55caef2bac68ad31e743a4aa2f34e91d82006 | ORPH
   xtensa    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/cbd23b356181e2265d2b680080e50e59816f0015 | ORPH
    i686     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4c7e119d4f8b1ff762b7ab0ab047252a7390e94a | ORPH
 powerpc64   |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/abb63423f55d08f6d15b5001e06460f280de63ca | ORPH
  powerpc    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/32cbb1cd0fe7f91c657b406d9e116bf91caca368 | ORPH
microblazeel |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/0e026618919a804fec19669c7ab59035f2491e05 | ORPH
    sh4      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/854f25c9efe2293cb90951fce0033862cc69b5a4 | ORPH
    arc      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/4814e501922e4f43d75716c87011ad058007ca8e | ORPH
   x86_64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/62e836469ecdb32cdab2ad05fbb9d3a5121df200 | ORPH
   s390x     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/479387a407786f6a316283026742cad4933cb98e | ORPH
  riscv64    |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d21682737a9bc6cf5a3e80e2dea64c13ee67793c | ORPH
    m68k     |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/1cb414ddc16899d5057ee863b976305de5c8a854 | ORPH
    arm      |         tpm2-tss-3.1.0         | NOK | http://autobuild.buildroot.net/results/d567d44d09222ca1d52f32a9f74a4dd3b7694b75 | ORPH
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/b4e488af99f23b77d816b81601e70eccbb3763d5 |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c955541bc7e0be8fd33f524bf1632b44857564b9 |     
   x86_64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/65e96d3ec867c36572f91590b73b318866603a1f |     
  riscv64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/ee7c0a78da9f92d21c6cf604359b545b332d3186 |     
   sparc     |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/f108bb1b1343784bbd3fa3b4ba7305b7ad81901b |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ab1c4e96f1e6d25776e5952e6a289cb00bb9de7d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/358207573974fcba38634a080aa6cbc2fabe764a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 openal-1.20.1 | 2 
               collectd-5.12.0 | 1 
                  gensio-2.2.3 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                    olsr-0.9.8 | 1 
            qt5location-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/187537a15fee44b15c427c3ea82d7277eb62f552 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/4723227cba6187d36232ddd85ad2f7d44284f90b |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/561d18af9757ba7922697e622ff69a87733e5ac8 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c6165a6f620bf0b78e592a25037414e5faca3a77 |     
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fd8daf8f426acb9b8411cbb4d69a171493c7a47d | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/accf95ab421530876dc7d832e808d032b288cb12 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0d9009cca92a9382006d41949aafc1c8a01ac339 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ea667a55728dda4441c1452760928fef9086e9ae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ee2cb8c810172c18a86585adcc5f6ce3aeab928a |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              containerd-1.4.9 | 1 
                      gdb-10.2 | 1 
  gobject-introspection-1.68.0 | 1 
                librsvg-2.50.7 | 1 
               luasyslog-2.2.0 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        containerd-1.4.9        | NOK | http://autobuild.buildroot.net/results/8388f6272881b8d453d97efc0ac2727886455498 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/f9d2b2fc22e3eb431ae82705d9e35b6b1f7bf083 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1619836525ca4e50adafe1722efe7b6878bed914 | ORPH
    arm      |         librsvg-2.50.7         | NOK | http://autobuild.buildroot.net/results/7ee7c70b7bff156b4ed863dd868afe799f95f3a3 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/5268e378d6fb8e70852068b0d18badf6a8d8891c |     
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/54b93c2d05bfa6ed3968072edf8c012af632744b | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
