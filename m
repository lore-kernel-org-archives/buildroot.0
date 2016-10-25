From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-24
Message-ID: <20161025063033.847CF102749@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-24
================================

      successes : 200
       failures : 66 
       timeouts : 6  
          TOTAL : 272

Classification of failures by reason
====================================

              python-pyqt5-5.7 | 10
net-tools-3f170bff115303e92... | 4 
                     xen-4.7.0 | 4 
                   assimp-v3.2 | 3 
                 lvm2-2.02.166 | 3 
                  olsr-0.9.0.2 | 3 
                  guile-2.0.13 | 2 
                 jack2-v1.9.10 | 2 
kvm-unit-tests-0b04ed061003... | 2 
make[1]: *** [libavfilter/a... | 2 
                    mpv-0.20.0 | 2 
                privoxy-3.0.26 | 2 
                    quota-4.01 | 2 
             berkeleydb-5.3.28 | 1 
                    cups-2.1.4 | 1 
                     gpsd-3.16 | 1 
            gst-ffmpeg-0.10.13 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  lcdapi-v0.10 | 1 
                    lftp-4.7.3 | 1 
                  libffi-3.2.1 | 1 
          libmicrohttpd-0.9.50 | 1 
                 libnss-3.27.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
make[3]: *** [all-recursive... | 1 
          motion-release-3.4.1 | 1 
                 mplayer-1.3.0 | 1 
                    ola-0.10.2 | 1 
                  openjpeg-2.1 | 1 
                 php-zmq-1.1.3 | 1 
                    putty-0.67 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.6.2 | 1 
                   redis-3.0.7 | 1 
                      tar-1.29 | 1 
                   taskd-1.1.0 | 1 
             tinymembench-v0.3 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
                 weston-1.12.0 | 1 
zlog-6ddb9bbf3ff0123e701bf6... | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e3e52b63a5631548b1c016096e31d2d3c46ee7af
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5278a26bbac2fff84ce49390ef874845a5d9dd9e
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/01745a1b8affc7f754dfc34ad6d0734dfd17423e
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9b981dd0a1a64cc81c6e0b49eaf0448ff969842a
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/ddef9e755e58f39fef92b26d83a05986c7afafe0
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/e2bc318b95225bb1f8cdc69e58e0360845f96201
        m68k |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/63f39630bbd13ee6efb472c4ec70f703deaf3266
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/63d9e8d12d9df6edc99442086f6d5a9e639113ca
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/33ab719787fae68ce607e63f89dd622097ab9f37
        m68k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d5e764684922955e7c7043ede1e374dfe9599b40
        m68k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e2a777aa4e26398ae7a8118a8ffef1a9964086e8
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/7a94b474e0abdd0c9102784d4400c4c832c4e306
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/fffaa29de184f399ed6b5ec01df33f0a80243c2d
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/f35b0def71446788888afdccebe7513439d216f2
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/6e0ea70d6dc987b441c04f1d0b32bbaf9cbc4cd0
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/a3ac2d76b39a27f7d9ab7922a24ba43ac2f836ed
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f698387963a4bed693dc310c36f48dc0ec23d9b2
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/5762bfedcda57c1f2474494b3ac776d67d58eb2a
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/4244a78baf14478c49b1ed9f5c28d4cc2d40e3a2
      mipsel |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/d45dce8e01336f6b987c779b93e713f9f8cedfa8
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/3aad120b831f46725fa63b6d628ce19ddfc1672a
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/aec22b80726c6e29380e3866e3ed7807af739a7a
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/53d0205f6a46850f18cc823d56afec8fa69778db
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/bcd721012c55a13f03745fda210a5d1dc82ffbc8
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/24864c111782fee5f554dde4db87c3a82779e4e9
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/adc15c3b912ea443a279ccf7b39a6cee10eb0d72
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/edd1fff61ece06272ac568cb9d4c68ba4a5d67ec
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/74539cb2dc0dd5d0898bc502099aa8b3c85e2a0b
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/a9f75551f6645d1b2cbd04b067a56814e0c82de2
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/075278f66b75487ce7d2c6c1984f088ce2e73030
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/221c49486708573ca7d713d47d49a8af679c2045
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/a40b05e44f2a2af1e3c4d060b16716043ac0f5df
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/fcedbda92fbf2aa82651ad04d3580c8793b4fe5f
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3fa9bf22037cdd7abdb397df97a6a5f59c2ab037
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/32072e309ec6a9a283f72892e624538f6536080a
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a5f2c79d8d3d534bb93195ac94127b25fccab49d
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a24b1c115dd4a66868f1b39903b6bf20fae3d659
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/d0a795fcda68cd39477f906ae5202dd8b9aec475
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/298e66e095bf6e8480c8d1e2fe5e78ab13e4d7df
         arm |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/9ff5c679cae011568b4f313d21110dea9af8d561
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/cbe349046e9fac928a00c6393395e620ee0173b7
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b2622be05b58fde5ab99b782bbd9dda2652ac74d
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/ade567542f7d02e7aff64821e1e4c79d7c21b202
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/253c9d48eb5d8527b9a33ab8da810a99ad03f317
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/ff9b5c0bbfd5e2e798e83419368d9b8a5fa51d91
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/6710efe31dfd3130c289a0b32820551a3ac4742e
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d2a69989d4a487bf1fd1b01e4e5952b535a04f50
        mips |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/dbbce14e59f53a1ef7cbad3946987d5772f02c74
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e6c228c8ed49b5744ad363a446ed478ddc3c490d
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/4578af1fd12633be4f5ac59e472322b807a8e0b7
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/0e13779b22c5e7e213e8b517ad9da113e6d6b10b
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/c1988db2a5596e64c15d83dba82c34e7b2cfac47
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/5b616734e6795356afeca7f95bf6438f6d5c00ce
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/eefe5d39b27cb9da81d4d3ca01275de724b57b3d
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/50350372c57725da46d302cb2f83135d090a7e6b
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/b883ae878de112c4edd95fcf47a501b4cba660ca
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/8dc32ead80e65fbdae67cdd383649952e2bef638
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/ffb96dc644efcbfed3cc39a187a2a8d6511af063
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8226f7e21f8f7b68c20bb490b51b95bbcef00127
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c070481243bb0fa09a40d63f44cfb6de5621164b
        m68k |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/a88b1bf5fc57beb8346cc0222ed06bc1ef118c71
         arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/fa83bbb873d34bfdded46601b87799e24b88d2fb
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/db464153779316ef5f393e9fafa0973749a1004d
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/323594534028b8e9ad0ea7e9c5dcbf74dffd39e8
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/51c359bcff892bb24f5bdb0e2943b9321d5ab34c
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/cf8b4e6eaed06d770ea366dda01ad205662d779d
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/5a97970deb33f9cd053031b1acd4bea8356ed542
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/abeb7a86e31b027696ccd99f2cb8eee4599c8d9f
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/3f8d62f44fb0e683ad3db2d6280efd3692f490ff
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/7045cbdd7decf6e7c74a5c8b39f1bf7fe51da8c3
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/27720c7cc9f0a9ec3685e2b8e3f100dafe090654
microblazeel | zlog-6ddb9bbf3ff0123e701bf6... | NOK | http://autobuild.buildroot.net/results/46f74272811fac92bc300ad80e662decb76ac619

-- 
http://autobuild.buildroot.net
