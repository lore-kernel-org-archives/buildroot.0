From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 07:18:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-09
Message-ID: <20200110071839.306E32040E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  0  |  0  | 16  |
  2019.11.x  | 10  |  3  |  0  | 13  |
    master   | 102 | 92  |  2  | 196 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libva-utils-2.6.0 | 13
               libsigrok-0.5.2 | 12
             freeswitch-1.10.2 | 9 
              host-grpc-1.25.0 | 6 
                   libnss-3.49 | 4 
                apr-util-1.6.1 | 3 
          gstreamer1-mm-1.10.0 | 2 
           host-doxygen-1.8.17 | 2 
                     host-llvm | 2 
            host-mfgtools-0.02 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                     lxc-3.2.1 | 2 
                  ndisc6-1.0.4 | 2 
                oprofile-1.3.0 | 2 
                qt5base-5.12.5 | 2 
                  snort-2.9.15 | 2 
                      tio-1.32 | 2 
               acpica-20191018 | 1 
                  bcg729-1.0.4 | 1 
                bitcoin-0.16.3 | 1 
                 clapack-3.2.1 | 1 
                   dav1d-0.5.2 | 1 
                 gerbera-1.3.4 | 1 
                    git-2.24.1 | 1 
               libgcrypt-1.8.5 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                   nload-0.7.4 | 1 
             openjdk-12.0.2+10 | 1 
           python-numpy-1.16.4 | 1 
           python-pillow-6.2.1 | 1 
                   sudo-1.8.28 | 1 
                suricata-4.1.5 | 1 
                   tor-0.4.2.5 | 1 
                       unknown | 1 
               wireshark-3.2.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/d943b0c1261d8a0b57db39ae1dafdffd45ddd9a8 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/22db4bfa87ef79149b83ad4705e6fe28ea9aff5e |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/88c412c889fb94a611a9b86ac17fc234ca253c78 |     
    m68k     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8af934cd492a2133575dada2c82c1f29baba8fcc |     
    arm      |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/b916ccf217d2ce2457541eadd9e85aec66e720e5 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/ca16339ffd0d48631c2851fedd26f69dfc16121f |     
    arm      |         clapack-3.2.1          | NOK | http://autobuild.buildroot.net/results/8c085ceacd50de44d1f87ca170d14d30591fd4c0 |     
    m68k     |          dav1d-0.5.2           | NOK | http://autobuild.buildroot.net/results/b1d6ac8b0b2f4275fc221ad091e15ec5a2c30652 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/134ae352be12b992c06a9c12a292751d30bcb941 |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/40fbbc86a0f5b895f185cf3f4485f8fe622f36a1 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/2a148d41199dd79d7544553ee04eb76cf7b8f819 |     
 aarch64_be  |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/f6c2fa631d1008fbd1e1c0c0281597de436f5829 |     
  aarch64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/5c3ecb5ddb7ad6a40d71cafa413787c3eff00a69 |     
powerpc64le  |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/3d0c5fc59a10daf13a2a099580cc13798648eb65 |     
   mipsel    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/4005ddbf551f88d2b57a9fc37ba9dfaa2c4d1c9f |     
  sparc64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/6a17f8002f0d1bc59a3651f4f5b731f0c4364f1f |     
 powerpc64   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/50fa7c3d79a1a3f13cc2f0da3ce6a3311ad291fd |     
   nios2     |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/ea2fb65353608b92b79f1531227d444ce98456af |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/43728b788234de498cc8df7b641e106570a15173 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/74ce4f3bfae87cbeb29e8c41fccf229816a21b43 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9a3a1a0f92bdc493a2f11df883ccd96e06d6a0a0 |     
  aarch64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/d1f14520e6a1b8f10c062f1da8b28e0087aef682 |     
    mips     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/c16ff6fd57789551769b95a1b7480b85ad213dba |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c07983f1cf35b2dff23953b2210681e20b490ba9 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9c10cecde1a5e7ff7bcd5a4adb541db84070d93b |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e76546bc395783adb9962b66d9e17e5d54e6977a |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2efc5730e2b6ff667dd8262d65d3c93a2b125509 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/041f4b0f3ae994e9853cb95539d77a0fe6577da6 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c228dbc494b0ff2f0a74b7dcb34b60b7a110e49a |     
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/8364edd7b3402be6f28aab29d339a7a6ea9b70c9 |     
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/ad1f5e6fe493dc502e2a5b1b8ce51adeaca6e646 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/adfad009a2fba17604eb66a19d24f260d27598f8 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/21f6af4572eb180323ce3e72e785cf7a5dd61c52 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/70490e876c36e443d469bf50cefaff7adb01e424 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/7875507cc1009c9a495695f9d9ecb974530a3f72 |     
    arm      |        libgcrypt-1.8.5         | NOK | http://autobuild.buildroot.net/results/3bc6e8aa4660ec994bd335830df1975b530e8485 | ORPH
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/3323215b481c1b1fc727aaadec1c096fbd8edcc2 |     
  powerpc    |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/6a1578619a477e1605fe152070f004b662f1d839 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/f7251c025de00d2c937adbc167f9b57c98e7cd95 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/0f4ccd052b27b4aba794f38b90dafacdc9547075 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/8fec37050a79c17d9a8bef1e06d8bdbab5f69c53 |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/5bf6b250d0de43f0546fa6f0bb4d25f49c16b44f |     
powerpc64le  |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a977d1585a798a0dcc17804cd8cb858f324f6bf4 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/faf303d0b7b9ffe7006a02b27c87f81bc8639fa8 |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/16d0e9f25bdfe0e45fc857a46f29b989e56599ba |     
    or1k     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/38f41d38e6ac83e964ff4966f1fc0c181a9e3aa4 |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/dbc05730ac6dba3a72ef57f9a0ef724a7f7de2f6 |     
   xtensa    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a48e6ba45c39a8cbac27ceadc9a957304c51e85f |     
   sparc     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/d7054797d91161ae8326ecbee81e305da9ff58ea |     
    sh4      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/3232a55b23c01ab736ac8696717e4cb21fc52ede |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/2b613f60b3c163fabd378930dff06185152d68a1 |     
   x86_64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/624737a64616e2ebe47266e4ce3c31b8f3ca5a65 |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/419155c64c666fbb2dd6b2194ebc7cf74d53cbbc |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/a18c4c540134b6d2b512918ed120afff4d07a904 |     
    mips     | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/1d75d02c241c16b5cbe7319f062df197019197ed | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/ffad1675ddd3b7b0069f844956b2d6eeb70a69de |     
powerpc64le  |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/d4e8c392b8c5b9eda3b46eab6dbecf00b100b7e3 |     
    or1k     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/aeee57cf350ce335f7561be1ecf2513780f77afb |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/54315d477bf00eeb935118f5b85cebd9b33ef012 |     
  powerpc    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/4625f5c47f498c1ca7be19f811866f51bbe3cc62 |     
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/138bae2e3f38421396fb8d432f70f2705a0c9532 |     
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/ef3a50a4e5a82d51b48c01b05c19a4e7bc70f287 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/965fba8eca6243e676d822dff8e0163696aee813 |     
microblazeel |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/c1b06bd6c3f422a57d0c4ec411382e951583b946 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/9f581af3a8005829a9b6abf9261533d8a467be7f |     
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/a25a3ba061af54fff9edc4bf92a57385d8629146 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/cc747a207df91ef7b51274861bc1c20a5e2d68ad |     
    m68k     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/7f14e643a42a47b0407275982a12d6092fb4d908 |     
   xtensa    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/afbaf474f056ac4e4d08dd2cd592be93af9f0970 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/53a1bacd77e55d9d210d4779fa2c5aa9f44fff78 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/74dcff7af54c533aa8a1666b7bed4f77a047d701 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/429bd8ae5d8750fde85d0d56e2debcaeb75c4f42 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/c224aff21391a1ec52d9c1c5d6f1dfaede57e759 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/15c98ca26e4004cdcc8ef32748b2e8c03a52a467 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b1ccd8c261f98a21edbf4b4f608291f3ed61f685 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c08857767debb90f6bb95760a92e92d0ac7b0dea | ORPH
    m68k     |          nload-0.7.4           | NOK | http://autobuild.buildroot.net/results/326941bcdcb6dc2d5d7988ec260d3ea76378c777 | ORPH
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/da4745fa8e62a57e1e8e5be207a6a8dc54050985 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/233b67ebbdaf34ee5ceb9e34977e02cea8e83cc9 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/b94c7ae4cc6cf5349d8e973d74118eb2a18a739e |     
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/53bd11100e924ab6a18a52ff3363fbd05720020e |     
  powerpc    |      python-pillow-6.2.1       | NOK | http://autobuild.buildroot.net/results/ae063f8ded4cb00ff723724988200010dadd0ad2 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/833eb5f15b8c28d77ad5b8b7104ef0fd668cb01e |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/5590aa45f5ac0841727136e8add4c63387320a62 |     
 powerpc64   |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/c185c9a75ade2221b17b2e695558c38d2d534966 |     
  aarch64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/17802b5ad87f494a86d158f2547e68edddcc0a68 |     
    m68k     |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/213735cbc52f9658b304cc8af03cea78656c5492 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e795fb0d8e953c48358b39802bfd606db632034f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2554ce5375a2e1bbf35b3d682f4f8ee159721ce9 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9b3e7066749e3eb36b133194d667800e69b9f2a5 |     
   x86_64    |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/ba6f2e8ac0bc825558f95caae1fd22c41c8548ba |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6796bb51ffed94b609a2b0152742791ad2f97566 |     
    arm      |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/5c5f5442db381a8c066c7eedcb58365680c2ea75 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1106b4e211ad85d011b64feab0f0f83bf6900182 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                bitcoin-0.16.3 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/a2b0273afb337c37e13f7feedfc3e7172bf50f94 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/7208a46a7bad8641cb3ed8d9270fcffe8c550de6 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ea351fce9227cb9878db0261f1b45e8faf983473 | ORPH



-- 
http://autobuild.buildroot.net
