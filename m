From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-09
Message-ID: <20181010060010.4E3C920736@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.08.x |  29 |   1 |   0 |  30 |
      master | 187 |  68 |   0 | 255 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f93ef5916bbc7931809f34cef54d125c02e8b176 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              wireshark-2.2.16 | 1 


Detail of failures
------------------

      mipsel |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/7bc9dd7385ce6a98e3e74d7d48d6aed75c03018d | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 18
              ptpd2-ptpd-2.3.1 | 7 
                collectd-5.7.1 | 4 
 Makefile:709: target-finalize | 4 
      docker-containerd-v1.1.3 | 3 
                     gpsd-3.18 | 3 
                  boost-1.68.0 | 2 
                    brltty-5.6 | 2 
                libmpeg2-0.5.1 | 2 
                qt5base-5.11.2 | 2 
               qt5webkit-5.9.1 | 2 
                     vlc-3.0.4 | 2 
               boa-0.94.14rc21 | 1 
                   erlang-21.0 | 1 
              glibc-legal-info | 1 
       gst-plugins-bad-0.10.23 | 1 
                  host-go-1.11 | 1 
                   luvi-v2.8.0 | 1 
                 minizip-2.5.3 | 1 
          motion-release-4.1.1 | 1 
                   netsnmp-5.8 | 1 
open-plc-utils-1be781d1ea81... | 1 
package/glibc/glibc.mk:143:... | 1 
                    php-7.2.10 | 1 
              spandsp-20180108 | 1 
                     squid-4.2 | 1 
              traceroute-2.1.0 | 1 
             util-linux-2.32.1 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e5ff4589243ce1f11248b5f9fab3cca614a48b11 | ORPH
        i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/1ceed7d91627711c12c4866fa6672a02fc6ddc8c |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/41054f876975214741dccd08eda999a425281b7f |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/7187e560e66f2bd6073b5510e2782ebdaccfb4a9 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/5f8e8b8517fda50a2e98a456933260f08054356d |     
     aarch64 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/24a280d6233b3284edd44c4528d8799c6894c11a | ORPH
         sh4 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f | ORPH
         arc |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/1a6f2fcf1a88ecc5b598dd11c5914dcacf0e1e6b | ORPH
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/b0829bc3343d6dc3065078e94896725b1c808bc1 | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/6c26ac3a8aa39abcb5eb390109891790610a759b |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/10654bccc3d20ec6d29d371c48dd90cbddb8c4da |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/56b564a27a06792c4854fe983da92d40c0c4708c |     
      x86_64 |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/64c70d82c857c272df171ae6783629c1ba92d812 | ORPH
    mips64el |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/c00d22a6dcadb82a19afab6eacea654d3c41b4c5 | ORPH
     powerpc |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/18599ea12a35b9715a67c1f4e5c4e56906235c94 | ORPH
         arm |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/a13a5d852c83cd1fc9f2d1fc2b7302db515278b8 | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ab39280ceaf967e08abfd1f51efa4613495237f5 | ORPH
         arm |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/8d3af6f00bf34737faabc21bdccf7d025462fec7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/69f52854b222b5be1a981b96a804098fec5a849b | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/eb8dc1e67eae123a823fadc17ca7611c2cc7f621 | ORPH
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/2bdbb93e6404943e59791773106d8b2680211886 |     
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/dcbbae0180bc597c58fc694c3006b623633aab7f |     
     aarch64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/cef7e38fbd4de65d1830f681a497bc007a897502 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/62143510a7ede7d92f55e908306bc367586c2748 |     
     sparc64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/d0c1aa394745ba48d832cc77c23721ca6b453d23 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/78b8eb0f9f7f2963f0056834054f16e764bc3106 |     
     powerpc |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/78061b61cfe3f42554a475c048d54dacacfe11d5 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9f02e0f09ae2d2a66a8d33d73f1bdd45ea8b0f16 | ORPH
         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/67bc5e7ac8ae1c49c035b022a394d2f746705cf2 |     
         arc | package/glibc/glibc.mk:143:... | NOK | http://autobuild.buildroot.net/results/4a1ddb5c0afb1e80ac769d36cb720372f7bb5457 |     
         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/7b7e25bfd269f7c252d15ab4e9f1b68348823478 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1c00bfa77c38f0aad7643344b16d8f401c9b927a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/298fda61ab5a192c235027e1b4c57aba4e6b8b37 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8fe8061cb27cbab8f02e6dfb0a870d76be3f7f3e | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/80b014e965b088e6767af671d39657b415f82453 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/40f1090a0eb720d4cce2715bca51823213efb9f9 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/55933c2c4ecf8a84b283c93adf0c2ed8a4f03301 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/08d40b95945ed0e61805b07446b5eb5731f23198 | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/aeddb85c0262cdc23019c72e1c390d3885cb4ae4 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/5bec7d7f14befa3a03f902ef90cc2c6589943ec2 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/7aca204c7fd486def6306412b0a6e0bfb8234786 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b8ae1b94891206746815fa85fafabfbd6bed8c74 |     
         arm |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/05885325ec274cb9860d423c57eed5e7063aedc0 |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751 | ORPH
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/068fa36a0be7a2207144cfcc9d595d6099bd9e39 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/3b17b82658842849cf72d01b6f6a4f735e13a642 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c76bf4a1902da001de673c2160e7f68f83072feb |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/a0f68aba5c02cbf053c0a425667f1393ef71a0e5 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/21adc28431f328526d88158e98e84b2fab2e4275 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0bf569d8d0ae380bdd1c8b6ddfa111e85670e981 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f92fd883386a547d42e0c699f7db859f2918e3f2 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/ca096daed97a11b9be1618bd284b626527414e88 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8b4ce48f1b612710b8f2bb1b4ca3b203e1ed6293 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/797e736dc81d84e63a9293a7b1b62d7d4ae29194 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/dd94cc60c4eb5a102b04db52b0ee2c7417c0c2f5 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8329204dc3737635b92c2fdef224992f3c302f0c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5ab016529d2ec177f2865ac184d4a91149a649db |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/b8e27bd74c40cbc6f6ed9c5df4f0021af4fda050 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a5f6626116e8e721d5f6eb1d0aebf4656b9452f0 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/89b5cc38f7b45046417fa20bbd8078646e9c39ef |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a28d07fd7999f1505a346598ea62ac3c212db7a2 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c905171b7a2beb768e23c7b834c50df0764500e1 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/22855418dcb5bca4b6499991bc810b368a0cfcd5 |     
 powerpc64le |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/7b79a5fa265e2387cab421e42b3c946562e4781b |     
        mips |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/6662b312a99955fccc924ffd831d31c3f5b93b9f |     
       nios2 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/441a7d1b875549013a30e70d6bb425892392e403 |     
         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/829fb15eac2b16943c366ac82b260831de882149 | ORPH


-- 
http://autobuild.buildroot.net
