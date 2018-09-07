From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Sep 2018 08:00:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-06
Message-ID: <20180907060048.2D091207B4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   0 |   0 |  12 |
   2018.05.x |  10 |   0 |   0 |  10 |
      master | 121 |   1 |   3 | 125 |
        next |  12 |  25 |   1 |  38 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libreplaygain | 2 
                host-libsodium | 1 
                  mongoose-6.7 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5f6288e1e2ab651683bb324b66bfa08531841c63 |     
      xtensa |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/bac991847554cc2c3abc980edd8097e3d2be75ae |     
        m68k |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/ae44bbbf8fce2711cd96ab71c040572ad94420f6 |     
         sh4 |                   mongoose-6.7 | NOK | http://autobuild.buildroot.net/results/599920bc0a5821fd3fb0a028574a25a22e12430f | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                rtorrent-0.9.6 | 5 
               target-finalize | 5 
              ptpd2-ptpd-2.3.1 | 3 
                  boost-1.68.0 | 2 
            duktape-legal-info | 2 
         host-e2fsprogs-1.44.2 | 2 
                   botan-2.7.0 | 1 
                host-libsodium | 1 
                  libssh-0.8.1 | 1 
                    ncmpc-0.30 | 1 
           python-numpy-1.13.3 | 1 
          synergy-v2.0.12-beta | 1 
                     vlc-3.0.3 | 1 


Detail of failures
------------------

       sparc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a6f1a3db8f9790151248febfcf26eeca223bf2ce |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/031f22cbdd3dc0b8ea8c74a869d8a0a1a9adee88 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/cd574e4528c6adf189ac5bd4e5bf3277a8fa7cf5 |     
       nios2 |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/4645456f715eccfce940a54e41a34a299adc152f |     
       sparc |             duktape-legal-info | NOK | http://autobuild.buildroot.net/results/4ee6de3351c140bde4588252cebbf7cf9237e710 |     
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/21b39b8eef5719e1637cf7cd5bef45d5ce7c300b | ORPH
       sparc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/220002eb05fd2bb722ba17b1ded96a9fb52f0f3f | ORPH
  aarch64_be |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/2aca52072f512ae2d37c49fc2f85f51386dd230a |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/59f8351a600a36e077c16701fb209f6d6ff2ec55 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/9e6af3a58dd1c4f0562455aac8fd89e0671c7c3d |     
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/efe06eff8ebf75f3534f6cc1e12b0da46bad90ac | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6cce66b6ad1398a25550c5048c20b4cbedef24f1 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3a1c5efa7d142e92ea20db9fbe936d4db41dc6bc | ORPH
      x86_64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/75316db5e87a016daf723695303f911a9235fd42 |     
     sparc64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/cd7070d1c8bcbaec5187ba4a0da0bd87d4998c57 | ORPH
        or1k |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/3d87db25319a6eee2f41b91438491c42f2061e17 | ORPH
        i686 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4017ad58eef26609b6f2141c92a16946a35aa92c | ORPH
        m68k |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/3f162f5f6d20a523cc931e5491b6fe4fb0a528b0 | ORPH
 powerpc64le |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/44ebccda06eed8f70090fe2e68ab66d6f214cdb4 | ORPH
    mips64el |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/77f43b5937f102822a5b4644551222fda62fa129 |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/6c5767148567d6b751fd00af590af91520401488 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7d8d134ba997eb6fb43d38ceaa32276fec6b9a99 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/1f38de140a4a2b090cce9d5a18d9ba144247c30d |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/1b2c7b66e022117a25084a67d56f39e235182271 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/579cd5e4ff4796ad800edf01e4acf4ae2723f115 |     
        or1k |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/fe7e61defc856557fcacab5fd464ffe335e9557b |     


-- 
http://autobuild.buildroot.net
