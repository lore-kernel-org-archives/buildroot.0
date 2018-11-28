From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 08:01:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-27
Message-ID: <20181128070108.D7EE7209A7@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   0 |   0 |  24 |
   2018.08.x |  23 |   1 |   0 |  24 |
      master | 191 |   8 |   0 | 199 |
        next |  22 |  13 |   0 |  35 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fdd92d9841f3eec299d7359aa22d01016ce4bd79 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
               domoticz-4.9700 | 1 
      gst-plugins-good-0.10.31 | 1 
                  mender-1.4.0 | 1 
                 minizip-2.5.3 | 1 
           python-numpy-1.15.1 | 1 
            qt5location-5.11.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/546d53121e6a1501e96606a1542ee3de650aed10 |     
      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/70a2acc91ccab8e623c0419b5bf37eae3a824ee0 |     
     riscv64 |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/57c0add9386c52504834b9fc9527cc69b4304e05 | ORPH
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/05f0e202ecffafa46de3539f5ca75e6f2dd759d0 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/f4fc2c1c7af37ab654c7906a2a32844b5ae744b5 |     
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/41671976c7be7883f31ee5f51ca0eb90b81262fd |     
         arm |             qt5location-5.11.2 | NOK | http://autobuild.buildroot.net/results/3a0affb73de831478a1fed6d5a726bcb5d0896e5 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/f22212ccfdbb6b9b189fade905ab79c9dc5864f3 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  quagga-1.1.1 | 2 
               asterisk-14.7.8 | 1 
               boa-0.94.14rc21 | 1 
                flannel-v0.5.5 | 1 
     intel-microcode-20180807a | 1 
               libiscsi-1.18.0 | 1 
                libmpeg2-0.5.1 | 1 
                 libv4l-1.16.1 | 1 
                  linuxptp-2.0 | 1 
                     nut-2.7.4 | 1 
                   strace-4.23 | 1 
              tpm2-abrmd-2.0.3 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.8 | NOK | http://autobuild.buildroot.net/results/3fe3b1d6fba76e73fba1a3a89ca3dbf3ca9585f2 |     
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/5c6b24048016598aec6047b00a26e25ecd44af09 | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e79bd816c5812ad3cab5aeaca65393eb3221039e |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/8a9476fad803c92e06be996ff860842b61ff08d6 |     
         arc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/58565bd8cc49262c5b10709d9ed0384f94520878 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/f2409dae374bba6f092548b55213e0ff5cf252cc | ORPH
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/9d1e33afb55edbaa63d84dc81339796f644f8e40 |     
     powerpc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/028a7906218ca962948194d7a4f9a07cbb6eac8e |     
     powerpc |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/2c5e379a06825bf8588bf070d733d2e1f98dab66 |     
    mips64el |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/d2da01d3f1a6e68445914956603ea5c965fc1ade | ORPH
    mips64el |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/7e607e3c1394054542e9c9c400d6b6a9d1f9b94c | ORPH
microblazeel |                    strace-4.23 | NOK | http://autobuild.buildroot.net/results/c97ac9b4c83fe0681eb44fd376b8e6266e25922e |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/76e74c9b3d24c61b93522f0cbee88fb7548f9860 |     


-- 
http://autobuild.buildroot.net
