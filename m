From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Jul 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-04
Message-ID: <20180705060022.5EF5320750@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   2 |   0 |  22 |
   2018.05.x |  14 |   0 |   0 |  14 |
      master | 140 |  18 |   0 | 158 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 host-rauc-0.3 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

       nios2 |                  host-rauc-0.3 | NOK | http://autobuild.buildroot.net/results/a2dc0a6efe7d5b4310039a5f4224288fefbc05e6 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2aae2d6d83a81b845cbd5e3c2b4534c30e8edba3 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   wampcc-v1.6 | 4 
                    host-rustc | 2 
linuxptp-303b08cbf55096aba5... | 2 
                    brltty-5.5 | 1 
               domoticz-4.9700 | 1 
             gnuradio-3.7.13.3 | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.6 | 1 
               mono-5.12.0.226 | 1 
                 opencv3-3.3.0 | 1 
                qt5base-5.11.1 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

       nios2 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/de99ebf7b79e40e25ee8a3d907e916657544fd97 |     
     aarch64 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/9b4034e2b076a832eb55d25020d01adbd2939b21 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ce92820c424f10c6d9d2262cc35b83c97aa2cc03 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/45cdf924321a42b81f029071a9dd2f4d60368b82 |     
        or1k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/b4240bbc5c6afc64d4fea02950aef38013e5dcef |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/60f27e94a183540f63d32496f59cebc26105effc | ORPH
         arm |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/d2b36a5d978d813d7f0116d16311ff75d3d2f32f |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/72f48b4fd2be28c72b8359273fefdcec73f90816 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/f93161c50ca8294864b79c574b982f99a16a09d8 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/016d07503b06d09b6198992df20904fb0d1c441d |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/daa0b52064ba3fb08588527ad653065c789194fa |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/88e34008ce1651e3375b8356a72bdf60af768664 |     
         sh4 |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/0b81ac40974a0efe0bfd011f43c3a672ea3d6d76 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/c79b0f2430484556eee9a1ff0a3f25f17d59e3ba |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/0cc8c1a5ad6df5e83ec4249d25431f8f0f102220 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/1c18f2cb7f84467c68459e4ca49c78eba77d2eb8 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/76d692b00e26ba86874a29f0eadee828047593cc |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/048e1914d89d7893f12b90b66a7aa1dbf41b820c |     


-- 
http://autobuild.buildroot.net
