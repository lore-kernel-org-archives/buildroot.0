From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Aug 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-29
Message-ID: <20180830060015.669EF207B1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   0 |   1 |  27 |
   2018.05.x |  19 |   0 |   0 |  19 |
      master | 196 |   7 |   0 | 203 |
        next |  21 |  46 |   0 |  67 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 


Detail of failures
------------------

         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/51887e138b6c9a32c1e6a3dedc110c878464373c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               domoticz-4.9700 | 2 
                libmpeg2-0.5.1 | 2 
                  boost-1.67.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a027e8081f8018b66497a836e6c01515a3f3d088 |     
   powerpc64 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/414ee412f690534f7a7a79aea5e390169517fec5 |     
      mipsel |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/b1b84b8c12d31b9242b5732fcdd1eb76b1217366 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/686768c386a464a445fba77d86d05f715a70d6d6 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/edc53016f03b94a05704e2e17b65d7b0a311c0b9 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9b9d11b3281a72c8f54fc675408acb96d24d8e7e | ORPH
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/8afc8771741f62da3b2117d2124d1c6f2d941903 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

         host-e2fsprogs-1.44.2 | 5 
                libsoup-2.62.3 | 5 
            libyaml-legal-info | 5 
              ptpd2-ptpd-2.3.1 | 5 
           python-pyzmq-16.0.2 | 4 
               target-finalize | 4 
                    ncmpc-0.30 | 3 
                rtorrent-0.9.6 | 3 
                 lvm2-2.02.180 | 2 
 Makefile:708: target-finalize | 2 
             util-linux-2.32.1 | 2 
                  boost-1.68.0 | 1 
                   botan-2.7.0 | 1 
                   libiio-0.14 | 1 
      libusbgx-libusbgx-v0.2.0 | 1 
package/libyaml/libyaml.mk:... | 1 
                     vlc-3.0.3 | 1 


Detail of failures
------------------

      mipsel |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a3d8cd0245467bd6b90ddd2b3f5eff6248a463ae |     
      x86_64 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d036f5805ebc2b8c32baaabb8b58955bcfb05fb4 |     
      mipsel |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/7efe015ecd5c894cb358fb530ca3c2b39e86533f | ORPH
     aarch64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/74a92847352bd56fecfccc1db920f38857b76c67 | ORPH
microblazeel |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/a1fa842395f1994e3bc3592685f2dbf44be92266 | ORPH
     powerpc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/5f1d31963e1918fccba69ade9e3adf649ea448d1 | ORPH
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/4a9bb548bc75262cd60aa2c021a23aba8c0ebe5d | ORPH
         arc |                    libiio-0.14 | NOK | http://autobuild.buildroot.net/results/1d1fee8385575c5f97b8039fa1db850cc80607f3 |     
        mips |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/91c2d6a1ca011787130db06695d6cd9e882f7258 |     
         arc |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/505dc2da1784edadebc5aa85266485b600d88383 |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/a091bc8fac6c9b3d8a70e3e6d8b74dfda4bb9f7f |     
microblazeel |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/a318e595f02937534b3f8698ef4c04194a8b34af |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/868375d08d73ce2dcf391d839b5b5ab81d318fc5 |     
         arm |       libusbgx-libusbgx-v0.2.0 | NOK | http://autobuild.buildroot.net/results/2add25597dc722abcd7ea8784e023ed3c4567afe |     
         arm |             libyaml-legal-info | NOK | http://autobuild.buildroot.net/results/c66ddb56fecf1570a8669bd9d8824cd2132f9776 | ORPH
         arm |             libyaml-legal-info | NOK | http://autobuild.buildroot.net/results/c10baf6e9bae92d515264b677eeb1ce6c98c793d | ORPH
         arc |             libyaml-legal-info | NOK | http://autobuild.buildroot.net/results/1672615b9b685686d8ffc7a3ec52d011571ba0ca | ORPH
        i586 |             libyaml-legal-info | NOK | http://autobuild.buildroot.net/results/e2ad685038d3cf3985cc917f17d1d4931b1cd9af | ORPH
         arm |             libyaml-legal-info | NOK | http://autobuild.buildroot.net/results/84e9530aff0c981a009416f31470133fb2114421 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/26052eaa82de77cb467091de4cc85b14b3aef901 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/2f0e8a669845593dc3bcc7a8de16011ad3992886 | ORPH
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ea9062a605c52c64cc4d1e872ba91d147449c284 |     
        i686 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f96188789da97e5955f28fc1500ea56b48cb31b7 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/696090333c058a6921c70e8282a28dfe5e6d7b98 |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/40cd76d58bea30ae16dc700d526ed715c01897ea |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/70ce27ffc2d6fe85a8a7c532716aab961bcd45f5 |     
         sh4 | package/libyaml/libyaml.mk:... | NOK | http://autobuild.buildroot.net/results/9734e8a201940f099f923811235faf4ee51d3fe8 |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/159ee23c5afa8452da24c7692c8afaa957c8877c | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/572d3c97df1ab90feb49b9949aa41e4c748ed668 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eec613880873093209847af46aa2db2a75f61f3d | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/68d7266becbcb560cac854171b27d559424bff7b | ORPH
        m68k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/0e520c0ed1d62e576be066baae6ea2cf0c8d3ae4 | ORPH
    mips64el |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/076fc1d5b6c40102ab9dff66aacad9af097330b5 |     
         arm |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/51d5fab750c44c2e5d947e744e0fda7eaaa62f0e |     
      xtensa |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/b0173ecf02eb9f3e71d8a10153a21d3ce1c0e771 |     
         arm |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/836423effc43f1a6d9c7c98a79411222c909ef64 |     
     sparc64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/972eeaf32cfa65582363bd907acb4924c59bedf5 | ORPH
      x86_64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/df520aa83938ac90cb0bbbae0ba812b607ed081a | ORPH
        m68k |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c280570f726ad52233b0d7d5c460e31a07b9e093 | ORPH
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/57edcb6be7098855e9d87e5dea17aef69fa044e6 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/8fed93795c9acc4bd074d193fa6724543e4d2995 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0c5bc9f41f80f4958b93e1ca0f54b53367601e06 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/24c622fdb1e19b42dd4fbce3cc06ed3e55b3d777 |     
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/04f40654cbf5439feef80e96da900578f2e1de83 |     
      mipsel |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/d99bb9aa1a333186fe42bdf6635a897a911d6b94 |     
      mipsel |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/76ec2af21bf8571925b4f8d32d8178fdd52d1637 |     


-- 
http://autobuild.buildroot.net
