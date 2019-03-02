From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 02 Mar 2019 07:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-01
Message-ID: <20190302070045.CB73186E0A@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   4 |   0 |  20 |
   2018.11.x |  22 |   2 |   0 |  24 |
      master | 176 |  20 |   3 | 199 |
        next |  35 |  25 |   0 |  60 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
                 mplayer-1.3.0 | 1 
neardal-33b54a55032b047fd88... | 1 
                   qemu-2.12.1 | 1 


Detail of failures
------------------

    mips64el |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/d4af78cdabcade43e116fdb9a6b33d742bb65165 |     
      x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9d1b3212ce4ddf72553f3a8ca2e87b480cd3ebcb |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/37cabfc9f1c07ceb6f45589325fbda1d01533458 |     
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/9fc97997eaa0e99122bbc8ea958a6302e28a02d7 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
                poppler-0.59.0 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/fa6c73167b545376d48d5ca01d5fcff0120968b8 | ORPH
         sh4 |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/08ae48a5cef0d1a3d8fd299da4aef258879249cf |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

       gst-plugins-bad-0.10.23 | 3 
                mongodb-r4.0.6 | 2 
                   netsurf-3.8 | 2 
               runc-v1.0.0-rc6 | 2 
                beecrypt-4.2.1 | 1 
                cutelyst-2.5.2 | 1 
               fftw-quad-3.3.8 | 1 
              freeswitch-1.8.5 | 1 
                gerbera-v1.3.0 | 1 
                   glm-0.9.8.4 | 1 
                 libcpprestsdk | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                          opus | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.11.3 | 1 
                 qt5base-5.6.3 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3c79cc68f1b088ad24daf7f9bd70718d702be577 | ORPH
         arc |                 cutelyst-2.5.2 | NOK | http://autobuild.buildroot.net/results/4299221429713ace25fc234abeb81697bc410647 |     
      x86_64 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/b5dd2aa702034db955ba49afdf321fc5c14c5342 | ORPH
      x86_64 |               freeswitch-1.8.5 | NOK | http://autobuild.buildroot.net/results/11a5f2154d587e7cc140a2d175656c2c019c5e23 |     
     riscv64 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/3f37ad1a94de30b4076a75b51db8063aa60b908b |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/590560eefc6c6edc718081e2ff0b1370387af5a2 | ORPH
        or1k |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/42f03a35a9b30a0dbd39228ed13ac036a2f3aad9 | ORPH
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/9070991791df48cbf81e02d88bb3f6e29a780bec | ORPH
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/bc8ef894aa5d4c8edcff5c1fba2e6fdc8e2a432c | ORPH
microblazeel |                  libcpprestsdk | TIM | http://autobuild.buildroot.net/results/303115d5940b88dffcf35326dce93d78f305e464 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/8414ee1f3f8e2b7d0be0066de7091f8bb8db2b19 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/a683969867d8cdc5d3db1e93583e3024da4ca85a |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2c4e4a695d7d794e5a17e4224266696293b26396 | ORPH
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/13825fda43a86c03e6a5713ad7dc5b9ec6e4c64b |     
        or1k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/012f03c406e05f6222cded9a37cf8463d838ce7c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/78bd5bc5bfd6d6c8adc642b717cec16b85f7024e |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/6897ef674f53a96693daaac878557d25d45a385d |     
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/457e72e31c33eeb6e6e737658d101e117b61ca33 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/d4f6d81c7725279375789e2342a73bcfd7b1478e |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6af8cd8e254514004c37b22b5e15defc5fe930b5 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/8dbb0ae42bc7baf21940164a36a4a40d2f749237 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/482c9f530c31d39ae707c249d8c3083620d063e7 |     
     aarch64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/2f0626e1df46701d3dac8332fc942588de06758d | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

host-imx-mkimage-rel_imx_4.... | 6 
          imagemagick-7.0.8-27 | 4 
               runc-v1.0.0-rc6 | 3 
   host-imx-mkimage-legal-info | 2 
            optee-client-3.4.0 | 2 
package/imx-mkimage/imx-mki... | 2 
           uboot-tools-2019.01 | 2 
      host-uboot-tools-2019.01 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   netsurf-3.8 | 1 
             stress-ng-0.09.47 | 1 


Detail of failures
------------------

         arc |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/d27277318eeb04b660177dcf9fa3fa1510defbce |     
         arc |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/49894c247af77e4a2b152aeb15f44b1a9e73cbcb |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/ada9b4b34cbdaca9daf40ac0990f4ec0eb06ecc0 |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/dc5bcac4647f0714ed073ce0364c4cb975e7f658 |     
  aarch64_be | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/19e584b9955ce1248b2da678727abbf9c683a8f8 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/90965bd420563eea7133f3dde06a4007edd30c3e |     
      x86_64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/91b36c8827de9774c42cba25af020421a42a0a3b |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/33bb44ad0e2c4be1173fb3f400d38829e36e5f3a |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/538ccc4b9f17062a55f5e64ef10ea4772b98bc80 |     
      x86_64 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9da36785730e2a3fd0405f358ed850f3306e8f27 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/66e60c956fc8f52af1296da7c66c75b84b59e39b | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/93226190231ca74f734e1144e512380dd58cbfdf | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5b84e458c9c24aa89fe19665482074b38f7be342 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/444db4701c88bac8a288d36c8e3f1a40ffbedead |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1e8b8c88a993bf6d2565e0cb8a4c2292711f75af |     
    mips64el |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/077d56087c591e4a2298f6c7c89d16666207f098 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fbb3e19649405e6abe82e5a71df97bec1808c939 |     
      x86_64 | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/10eeb6e68af6900128122683af4f03599d569193 |     
      mipsel | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/49d08ff6e8fa0d49086ac03e1fecad6b17d020e6 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/5893fd1c1bc398a5a5e32fb03f9f4540d9569b54 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/caabb064ade8d358be1a7dd9174dc9b8a6b3340f |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c11a80c4ab878d5e30dd28bf6cd57eb06f79d754 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/3059a5041b63058bbf596498c03ab9793a835645 |     
     powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4b9e7f2652e5b2b4361ddaf452d797fcdd8e0505 |     
     powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3a6543768c164dd3e4c271212d8bb26fea5f99f0 |     


-- 
http://autobuild.buildroot.net
