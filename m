From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  5 Dec 2018 08:00:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-04
Message-ID: <20181205070024.A6D6E20743@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   2 |   0 |  31 |
   2018.08.x |  28 |   0 |   0 |  28 |
      master | 159 |  50 |   2 | 211 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/b595caccdb128ddefa7f9f0b8d6d7e5986e51371 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d0358b33613fa97b8a82519ce22ab2056cd33b2a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.3 | 12
             host-grpc-v1.16.1 | 7 
                  linuxptp-2.0 | 5 
   libtorrent-rasterbar-1.1.11 | 4 
             stress-ng-0.09.47 | 4 
     intel-microcode-20180807a | 2 
               libiscsi-1.18.0 | 2 
                qt5base-5.11.2 | 2 
       shadowsocks-libev-3.2.3 | 2 
                civetweb-v1.11 | 1 
                 dmalloc-5.5.2 | 1 
                   eudev-3.2.7 | 1 
       gst-plugins-bad-0.10.23 | 1 
                host-libsodium | 1 
                libmpd-11.8.17 | 1 
                libmpeg2-0.5.1 | 1 
                 minizip-2.5.3 | 1 
                     pcre-8.42 | 1 
                    postgresql | 1 
               pulseview-0.4.1 | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

       sparc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/7b3bc71d64aedf617dde35798099e16d7ae46713 |     
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/250cbfc0d7be5de2176686574c5a2c87f994aa0f | ORPH
         arm |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/0c0aff02df91cdb869efa01e397f7ccc0d9f69af |     
        i686 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/d937f6a0a2860de487ee99854a4f9b24212cb4ed | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5732e48c00ee302b459d043b9082d51504706fdd |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9dcff453573ec80845fbffaae2a9364a56e931e6 |     
      xtensa |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/dc17f46b04e90ef213d3153a8f84c0bb0bc7a372 |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6db7aef00aff3724dfd27f6828f4979ad07059a5 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f94c6b78bf4565ce7a4ae107eb63298b448a462d |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/02ee71db227cc69e936cd9162d811ab6461c44cd |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b118acef46545b94adb9175e86c3b1685f4e3d2a |     
     riscv64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5b2f632021f7fb942f780b41f0df5416523fb0eb |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/d5dd8179a036ac356087418a7ee5499cbb98f308 |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/47f4e1f4a96fe8c688fc0f2356aa7bda36cfe55c |     
     powerpc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/7139efe8d140ba1346bd4041f77eddd770475a25 |     
     riscv64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/6e1ba996d341a0016bf65b2df5b42a6c94a64001 |     
     aarch64 |                 libmpd-11.8.17 | NOK | http://autobuild.buildroot.net/results/f9d530e4010027341277ddaaf469818c72df4d52 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/28a18d9343e0ea2c4f14ba5108e68163aebbe8f5 | ORPH
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a71ebfd3b412142fde388a52b7bb7668b4626d8f |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b29879beb21c164b586a41a16f6722bee24dc28a |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/082d949225a771a1a54c64e053b3a49517db8b68 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a6a66b9f750be0ad185f2d325e352c603335bdae |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/88b98569dee4d9b66d15be1604378144583fd9e0 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0540b01c111a263b9b02405ac302c8836366d82f |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c2f489f613347722dc8b3b60d5eb17b5a1a29d80 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5758cf57510c7c6b4b0eee9d02191223d516935a |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/48113305179baae01426adcedbd886190546a526 |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/d4252ec98512538213eac1e30cfb309eab0e471d |     
         sh4 |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/a891696998ea2b6bdd1146c79f9dcc92f661efba |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/1998e4fcc6859dbefea167d93e882661ecf88cdb |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/2b9131b2030956c48caaa5bf170c130a4a590a6d |     
microblazeel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/95de27312a3fc8ac7bb77289e3176cf1256003d6 |     
      xtensa |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/d6f68bf8001dd56518c42cffb74080809492e51e |     
     powerpc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/18ad605e6cb85e6541039c6cd68d3ff344a97eed |     
        or1k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/f039cd606e47b0f9971917f29bbe200c96ddba9f |     
         sh4 |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/effadd16fbbfbe4c1c5165d7ebfbccf7cae2e20d |     
     powerpc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/f9795f1e8c51fc6dfc01ca092d50ceceb929f4ce |     
        or1k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/467b40d8ca0430b601ac7f3ca64031214c879e9c |     
        m68k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/ac8f4f55a75d171b1487027d7d3d0c7107392a8e |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/3d6580e1485ccbc95f3837d4d4d440b3df747583 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/3563180e09eff6532c94a783831fd4e67bfa3e91 | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/81db125aa2bbcda35e6949ebf27ebc07d97f9b99 |     
 powerpc64le |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/9a9e8d390941cbfde70c4b4033d7e68ce28e041e |     
    mips64el |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/906d86b533d711941dd73569f01f20c72ddcfe18 |     
      x86_64 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/4f162cbb2c34c29af5fc0d58b71cc77d9ee0bbc2 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/cb555a124bb3bdb9c5a3465673c21022d94cf2ca |     
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/f547cadd554d679449d2eeb93bb55bae3e2ad10b |     
         arm |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/6236308ff512fe455d5d0c3fc10c09b7000dfce4 |     
        m68k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f2d3b06afa6e31527a71c03671c8f08eb3f46c36 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/1c95898b2833683a22bbe2ff8471fa08d94210e1 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/71dc93e4777195909493d63f8b0fdf87b8fe53c0 |     
        m68k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/81730075527260214ca7ea4c5b904ea8a2dfb35e |     


-- 
http://autobuild.buildroot.net
