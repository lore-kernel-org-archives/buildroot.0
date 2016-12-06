From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  6 Dec 2016 08:30:01 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-05
Message-ID: <20161206073001.2221020DAA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-05
================================

      successes : 193
       failures : 83 
       timeouts : 2  
          TOTAL : 278

Classification of failures by reason
====================================

             gstreamer1-1.10.2 | 11
                  nginx-1.10.2 | 7 
ustream-ssl-ec80adaa1b47f28... | 7 
                     efivar-30 | 6 
host-pru-software-support-l... | 6 
             freeswitch-1.6.12 | 5 
pru-software-support-legal-... | 5 
                    rpm-4.13.0 | 5 
                    cups-2.1.4 | 3 
                   ezxml-0.8.6 | 3 
uhttpd-59e0c739634f46a164d9... | 3 
                 libnss-3.27.1 | 2 
            lttng-libust-2.9.0 | 2 
               qt5webkit-5.6.2 | 2 
              strongswan-5.4.0 | 2 
             berkeleydb-5.3.28 | 1 
                collectd-5.5.2 | 1 
                  ffmpeg-3.2.1 | 1 
                  guile-2.0.13 | 1 
   host-xlib_libXrender-0.9.10 | 1 
                 ibrdtnd-1.0.1 | 1 
                  lcdapi-v0.10 | 1 
                 libraw-0.17.1 | 1 
             lttng-tools-2.9.0 | 1 
make[4]: *** [.obj/debug-sh... | 1 
               openldap-2.4.44 | 1 
                  squid-3.5.22 | 1 
                  stunnel-5.36 | 1 
               trousers-0.3.13 | 1 
uclibc-ng-test-4ad1c23ae2eb... | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0c2535c1772ef13042a0aea6fca907f94dc1976f
 powerpc64le |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/1928ef0f19e73986201cd16194a7e88eb15d4f29
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/3b27bfd654e8e736ea5a566381ee6f96abd827e1
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/da4a474473bbbf30f652adf4adbc8dce3e22bfda
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/043268ce298245748f09edf36ee02fc3e58a0d78
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/4a8f170f5fc321dca228ba19e74a93749dc829fb
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/5ad4ce07c474f39643b82e12def2512f688585b6
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/8ce092192ccf3bf007e6658bbb9a091cb0a56db2
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/ab32ccacfac2e65e1fcb307058d06c3d0122979d
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/c5232120fd8bc997a0d37e3d35d35b57d9b34e06
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/5bce5673ccba7482d92566b9e52f0300f4425142
        bfin |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/4ccaa105800aef89537add1b1e3f50726d1957aa
        m68k |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/eda4ef3395c8e6b06608b91173918b634ac520cf
         arm |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/f83b300bdbab9e5f878bf8bd247615eebd88ff79
         arm |                   ffmpeg-3.2.1 | NOK | http://autobuild.buildroot.net/results/75a950657a9a0ec82517f96b6e50cb02c866a41e
         arc |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/e15db343123c2ae163800e92acf98707a87dc8de
         arm |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/23775a8e65aa48bd56ead8b31229ef5f28bf53dc
      xtensa |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/3deed0b8d697852eba93fd1cf5209547e0edd272
     powerpc |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/17afadbb98f031ef8b405c9640a50d49737604d9
         arm |              freeswitch-1.6.12 | NOK | http://autobuild.buildroot.net/results/e7b270141658a5e1d7e5ef1120b10706c7a76a5b
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/f3c9b0ed4ffb114221057237ce22c995b673a98b
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/e520f0a39afc12ea283c1b85c39283dede74d067
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/fbdcd90635d5ec3a62ad98a7ff93b71b8e5ecde4
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/97102b9231da897814713b5ab09aacf8ef91796c
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/9471a0ab78e5b3bc7cdf2611e3814fca06a59c7c
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/a3725839b0169eca583d836af04d2afa22d9fb9c
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/319510db9739ef1667a9faa9235b57bf120059aa
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/971f80b7f2bc728503073f0f127e151d617caa43
       nios2 |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/836572715a74eafd3c9858cc98a56bb7d160674e
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/96a675f4b65f86361a903399eaded17e1c1a1a78
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/6daac03e03614322493a8c8d17cb286df348f0aa
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/287066cea7c7650e4371b76004704ca1c8f5908a
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/c9c8049622c0b17dd7932869359ab5dd897ce429
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/8bea2c4dbc516fe3a06c499e2ea322c3268684be
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/47bb70bd2fcda1eabcb65baba878115d324f5fd9
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/4825a180800527397d3e2c485aa481fb42cd7a83
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/47b9b1614defd65b9781a85116b121ea46c06af6
         arm | host-pru-software-support-l... | NOK | http://autobuild.buildroot.net/results/737875f44849063932b8ef01c84c5dec91440ed9
      mipsel |    host-xlib_libXrender-0.9.10 | TIM | http://autobuild.buildroot.net/results/3b3e421a89c3b384f785f2be8d937e4d76ff00ae
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1ee0a37bab655a274d6ec2f24ee49cad6be56dfb
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/4a4329361e5a5ed4a5eeeec5f02a49d3134e2d01
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/98b9577500cc6dcda694287cdc8f89cce4457afd
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/01605fe3b40d5d674dd42d952054707db84c4139
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b4e0c669d39047c3e1057e5b9fcd27bd3efb1fac
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/66a529be69803124f6d386288ca0140d39b825b0
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/2f27387282723c6a03130b980caddd2015cd1839
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/72c6f79867c1fac706df9b1dfb4c2ca027eaf505
      mipsel | make[4]: *** [.obj/debug-sh... | TIM | http://autobuild.buildroot.net/results/161b2fafcf4ee21789047cf8aab2eb79d8846e25
     powerpc |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/6e997faf553dc70d0aa1ee811fd669650349cba2
       sparc |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/31e5ca536e6c3d570620189f1ff67243bf71116b
         arm |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/1a034e9fdb3bf14a367a91b30ba901cf679ec9db
        mips |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/bf88cbb5448976db37aff63d1d33768c874ba8bf
        m68k |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/1df67325f11a6f1c88d0c9cc5f4feab0b57bc2a6
        sh4a |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/a9cc133199a79af956f47c22b830fba412fe458f
     sparc64 |                   nginx-1.10.2 | NOK | http://autobuild.buildroot.net/results/3c8798f122a421e8fae741de76b2504c20e2da91
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/f41e891ff813626a4c097e684e007a6a1a64adc4
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/74b142157e5c6841659d90f415aefe34d21f657c
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/aacb91536857320070ffb1eac3bf43c03f7fd04d
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/41311c719993addeb659b434d14c2655e639267c
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/213cdda78b0a4762ee4fecc0f178df1225062c6f
         arm | pru-software-support-legal-... | NOK | http://autobuild.buildroot.net/results/1a6b1fdea813cf91063a8fb884c0aed2a5032c89
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/6551341ec8db0c0d4b35d10c5ea148f9d03a9f9c
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/8efaacc33145ad3208a4d5b245e598824c6080be
      mipsel |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/36526040b5d97077d0455d76a25a6e54308889de
        i686 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/0ee8279a9120fd7fec983c3c5bc5252d8425b8b2
     aarch64 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/c22cc50915a507d8f0e4ac592df8b1fcf5cff50f
    mips64el |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/0fc4861768f9251f3dc0853aa21e3f209c4879d8
     powerpc |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/2de036bbd4ee8bffbed77326e3778e795146efb8
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/4b1f97a750856840c507b788bbaa74e3a2f5167f
         arm |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/7bd64d6c6dd8ed71bdae0327dcafec4816105dd6
      x86_64 |               strongswan-5.4.0 | NOK | http://autobuild.buildroot.net/results/109f6ebf51ed562d47437d27c95fbfdedbf0e912
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/72cd3bdd513446147be6882664da2d7b74c8f933
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/925b111be923e7c3785a805b4321f68c5a31fa86
        m68k | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/a6a995c3fb1d0e282669589b23b5b3153f69da8f
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/6757de600305b012d79fb5b92f0acf230e132ff6
      mipsel | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/a71df34eeee6575c89585fbeec338c27c9c959bd
    mips64el | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/3e0d7cddc579323adcd17260c86e8f19498c053e
      x86_64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/3cf7d86747a98afd302d8ca831ecc14c163fbe68
   powerpc64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/204a884b91602fb081f039ae73c7d86b18cb09fb
microblazeel | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/a4d1150dd196b10c7c37f259aec2aec78dfef018
        sh4a | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/bd02e295ab1a00a11b36f6874ebfd47e68e5f899
      mipsel | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/bd5ff3486b9b5a3aba70dd296adfae47218dca3a
         arm | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/c6e7042fe0e2349523312d323b453010922e4398
        sh4a | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/00db49b8971b89d214d53cf11c0b0fd5e8997735
    mips64el |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/a61aa5329cc0031ad48e16aefce7e092c43faf1d

-- 
http://autobuild.buildroot.net
