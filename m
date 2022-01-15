Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF88FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 06:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2105E8143A;
	Sat, 15 Jan 2022 06:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaYZArgkK5gX; Sat, 15 Jan 2022 06:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B195B8144D;
	Sat, 15 Jan 2022 06:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6421BF48C
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 06:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AEB240261
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 06:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7cFCOG2zTd2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 06:57:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4901A4024D
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:57:08 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4F7121BF210
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 06:57:05 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Jan 2022 06:57:05 -0000
Message-Id: <20220115065710.5AEB240261@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-14
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

Autobuild statistics for 2022-01-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 70  | 11  |  0  | 81  |
  2021.11.x  | 28  |  6  |  0  | 34  |
    master   | 113 | 69  |  0  | 182 |

Classification of failures by reason for master
-----------------------------------------------

      host-riscv-isa-sim-1.1.0 | 9 
                  rygel-0.40.2 | 9 
                   guile-3.0.7 | 5 
              cryptsetup-2.4.2 | 4 
                       frr-8.1 | 4 
                       unknown | 4 
             bluez5_utils-5.63 | 2 
             ksmbd-tools-3.4.3 | 2 
               pcsc-lite-1.9.5 | 2 
               pulseview-0.4.2 | 2 
                    vlc-3.0.16 | 2 
                 wavemon-0.9.4 | 2 
                    bat-0.18.3 | 1 
                    bird-2.0.8 | 1 
                  dnsmasq-2.86 | 1 
                  gensio-2.2.9 | 1 
               gocryptfs-2.2.0 | 1 
google-breakpad-7515ab13768... | 1 
                 hiawatha-11.1 | 1 
           host-nodejs-14.18.2 | 1 
               ipmitool-1.8.18 | 1 
                libglvnd-1.3.2 | 1 
                 libwpe-1.12.0 | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.3 | 1 
           oracle-mysql-5.1.73 | 1 
            qpid-proton-0.35.0 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                rtorrent-0.9.8 | 1 
                    sslh-1.22c | 1 
                suricata-6.0.4 | 1 
           tesseract-ocr-5.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
               waylandpp-0.2.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/fbcf33d023f59d70e09c8d65a50936f147542d52 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/081983b1aea4e42c508b14cedbc2a702bb847421 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/d33810e1461d5d713cc6cd51220bd1f1d22d12ea |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/e47d4ecbff3c6c453818003ed1046ad0b03586bf |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/d430815c7d060b45526881fd150fbb319e60b778 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/e2d0e16f69dd55aaaf5e10c37954ef3b6b909b29 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/4dc344db9155c75c7eb98dadb54bcc375dd6c137 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/f72cc7729cd35a3fd57cb6284aac21ce5c6a3285 |     
  mips64el   |          dnsmasq-2.86          | NOK | http://autobuild.buildroot.net/results/ebb45fb1d8865e8b6837f289b80fd44c9530531c |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4d7179f77197d52b70dc7f846f1e013389897514 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/5c48881cc0baf2176442f774d14dfa18c1ab1770 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/27ca87d0ebf9cf2c98bb9dcc705a6c55c6a25643 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/411f08caf5e307a5b639289b9ea0648f9d66d2a4 |     
    or1k     |          gensio-2.2.9          | NOK | http://autobuild.buildroot.net/results/97a28636cc3c11d92a86cc1b0b306ced3f9e5f19 |     
    arm      |        gocryptfs-2.2.0         | NOK | http://autobuild.buildroot.net/results/43783f7c8d741bc1e7c83d8b4e7b9b69033b57d2 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/14d430c5e798460ce0362b0a4d6bc1270b7798a2 |     
  sparc64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/99896bcdf6dc40add16bfaeb1903f3bc5c40a056 | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a25f4b208fd16586e8406c1fe2bd2fa3cc543eb1 | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/00e1fa3fc21c7f7fd0d70801acb3c814f3d0dff2 | ORPH
powerpc64le  |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/2d0fb68d8cf01f3d5d432aa278622649490a5cae | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/a5deaba12abd888826468f2b30eb939db3dbac0e | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/1befc1552af91f34c600229138910c2078c2fdca |     
   mipsel    |      host-nodejs-14.18.2       | NOK | http://autobuild.buildroot.net/results/c1ff82b61963d5fbfa0fca2ac0b66c44b7178e2a |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6e55599e8cc33249b331d7ab35e18404a1a81a4e |     
  mips64el   |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4968e4402baa07e385035c67b8af75386e1934f4 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4018426cbe4bc25000cefc2d8a45f67b0b59b018 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/f783cdc212c8a608f0732869dc738004ff6a67be |     
   nios2     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/485a6894508d218dc2a2c12a4332300d53b5bcf3 |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6af52d47cfed2acfbde3a40c52f0b7af10996869 |     
    arm      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/8306678f1f22e8a8c0f9ceceeb26594213233c28 |     
    arc      |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/6c33a66386ab2171454d8ea8c1bd17a5582e21dd |     
    m68k     |    host-riscv-isa-sim-1.1.0    | NOK | http://autobuild.buildroot.net/results/4eedc823552d29c0bae119412c003696b993ac8a |     
  mips64el   |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/feb68f64d53648f7c95ae825b9c35d086a16154f |     
  powerpc    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/d010ac16563690dca83584b8fe5e029a4d3314bf |     
   mipsel    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/b4c3dba395327ab6ae28337efb962c99b2d5b922 |     
    arm      |         libglvnd-1.3.2         | NOK | http://autobuild.buildroot.net/results/63624bafc6f7a225d4db0667df977fd6141561aa | ORPH
   x86_64    |         libwpe-1.12.0          | NOK | http://autobuild.buildroot.net/results/a6d564c90a22b23982f7008af95118bb232f8f6c |     
   mipsel    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6c8a4189e611e7091e5d1707882ffaaaff78d94e |     
   x86_64    |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/4e296b5d1254cdec29e3710f0ef217581bec4a37 |     
   xtensa    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/17a46735fb5c52930ca1f04e42a3d7f44f1d698b | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/bc987ca0a08466cb834d9979ec3ed91b549b87e5 | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/b90f0e3b854682fde31d6a927f05bb092604d254 | ORPH
  aarch64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/f2e15910cced16fbf5b58eeb9678d8eb1d746cc6 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/492d599183ab104577ca66b0a7e7d9268109deb7 |     
  nds32le    |       qpid-proton-0.35.0       | NOK | http://autobuild.buildroot.net/results/260eeaccf6765cefc8240665bbe4acca99571a0e |     
    i686     |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/2fbd472f455e486780feb78389e76d66fb9bf238 |     
    i586     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/812a3839d34cad1f1a5f644308e984650b08a3b1 | ORPH
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/be408f05124601417abe93842f56e46aefbb0e3e |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/847c729011fc8ae14e6fc3c301e0626a824cc58c |     
   nios2     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/94c5d5ba952af1ce763055f0de448e9c4db93244 |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0e06f07a09321e412a11db6fbfc3b6b7403e5d48 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ebe1037bbe77a0e584e3f7a00a18ede18bba2472 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/df0a213964ef602130fbb3801ad1e0dc41f17b5d |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d05561335a8fb8823cba1a371a340b242c1edc42 |     
    m68k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/105cfaf0f5e4c899eb0f579e7e8981926c39692d |     
   mipsel    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/289a519831a5085dcd97a8ffc0aa1f2440b2c90a |     
    arm      |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/ebe07ee3c256ced96487bc58f661538d7e12adff |     
    arm      |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/a2ee74f239b6739425c6fc48853cada4677aadcc |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/f35edee58ab5ab1e388169a7b29ace7d2e311c91 |     
  aarch64    | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/119e7207db8114c735718c1402d8e01549ea8a5b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/34d92ba7008115eb9a6b4dc16d3d0cf488a4d1c1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a730286d9773341dd5fb4b70d1202de78abfd86c |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a8223c4d4db98f8e7a89703608924ac90e45c453 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/473816192409d03e9a44c3d3f75cbfc24a1ecd1b |     
    i686     |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/43e6cb8bd5bc76a66e6757d70dd3d6df62741c0a |     
powerpc64le  |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/e20e86852b27087983317d28db177282637ac09e |     
    m68k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5b818bf9ca34b06cc612e9241c811c40151b729b |     
   s390x     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f2076f8bcb90580b2ce6f6492d1eb995aa452834 |     
    arm      |        waylandpp-0.2.8         | NOK | http://autobuild.buildroot.net/results/37992f753ac7309659719224e6c4b91aab301d13 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
             bluez5_utils-5.62 | 1 
                  gensio-2.2.3 | 1 
        glib-networking-2.66.0 | 1 
                netdata-1.21.1 | 1 
                   perl-5.32.1 | 1 
                suricata-6.0.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.62        | NOK | http://autobuild.buildroot.net/results/de42002621611351b0162fc726a8287cae48584b |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/1ea400ee1ffae9c3be328fffd1e422a3590c2683 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/67d8c2ea0fc33026db1aeab8c35a261856708985 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a383430008e0288282eb7bd4fe2159cb65b4419e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/173321861d5e3bd363c67b38890f202156fc5a21 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/879ca24f450ed2c759a3100f7002ad73fb0005ec |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f22a072a9e5c716885b477d29d64d0c97b36c57b |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/325ce48012a302558ffb9469979d8e95fd600743 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/399a576ed856b384f5481434010287f1d9619c37 |     
    arm      |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/2c13aceda37567d1d184b13c564a9b63ef05f38b |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/f5f77319bb7049d4029dee8347f333dba722fcec |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                      icu-69-1 | 1 
                libmbim-1.26.0 | 1 
          libmodsecurity-3.0.6 | 1 
                 libqmi-1.30.2 | 1 
                nodejs-14.18.1 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |            icu-69-1            | NOK | http://autobuild.buildroot.net/results/e89df0bab81a6133a6a206d5d4a3be89e096aa3d | ORPH
   mipsel    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/2857641e07a7ae67c75b20954c4dd272c343e586 |     
    arm      |      libmodsecurity-3.0.6      | NOK | http://autobuild.buildroot.net/results/1b17def94d719a01b5acc64a7ca218bf2235d608 |     
   sparc     |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/a231ebf0dcdc35e94fac885799099bbfbdd0da87 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/2542a6399a10195d9790492459420c330075f640 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/828c6489d4114b8f80a3529db37a5bdb22600b83 |     


Gitlab CI results for 2022-01-14
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083640  |      
                      andes_ae3xx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083642  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083643  |      
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083644  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083647  |      
                   armadeus_apf27 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083648  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083655  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083656  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083657  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083660  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083662  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083664  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083667  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083669  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083671  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083672  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083675  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083679  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083680  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083683  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083685  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083687  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083689  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083691  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083692  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083693  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083696  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083699  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083700  |      
                bananapi_m2_ultra | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083703  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083707  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083709  |      
                   beagleboardx15 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083711  |      
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083713  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083715  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083716  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083718  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083721  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083722  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083723  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083724  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083725  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083727  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083728  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083758  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083760  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083761  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083763  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083764  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083765  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083769  | ORPH 
            friendlyarm_nanopi_m4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083771  |      
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083776  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083772  |      
          friendlyarm_nanopi_neo4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083774  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083777  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083779  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083781  |      
                         imx23evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083794  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083828  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083833  |      
                         lego_ev3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083852  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083854  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083859  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083862  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083864  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083868  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083871  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083874  |      
          microchip_sama7g5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083877  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083882  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083893  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083907  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083949  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083973  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083986  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083991  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083992  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083999  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084001  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084006  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084007  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084011  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084018  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084022  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084024  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084028  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084046  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084122  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084135  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084136  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084144  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084147  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084152  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084154  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084158  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084162  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084166  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084170  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084174  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084179  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084185  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084186  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084214  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084219  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084225  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084235  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084237  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084239  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084243  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084248  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1970084251  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
