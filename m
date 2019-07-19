From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Jul 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-18
Message-ID: <20190719060048.1B4B988072@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   1 |   1 |  15 |
   2019.05.x |  20 |   1 |   0 |  21 |
      master | 130 |  40 |   0 | 170 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-10.15.3 | 1 


Detail of failures
------------------

      mipsel |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/7191d437ae97e41b7a93646dd7bcdf2e64b1a4d5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 7 
             bluez_utils-4.101 | 5 
             bluez5_utils-5.50 | 4 
     glibc-arc-2019.03-release | 4 
             gstreamer1-1.16.0 | 4 
        glib-networking-2.61.1 | 2 
                harfbuzz-2.5.2 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
           can-utils-2018.02.0 | 1 
              domoticz-4.10717 | 1 
                     gzip-1.10 | 1 
            host-mfgtools-0.02 | 1 
                libvips-7.42.2 | 1 
                 python3-3.7.4 | 1 
                 qt5base-5.6.3 | 1 
                suricata-4.1.3 | 1 
           tesseract-ocr-4.1.0 | 1 
tvheadend-8f1de1621d78c9143... | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/f07bf9e80e0de9fa69de275f5c597a0ff0b29d2b |     
      xtensa |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/a41fd32f3fef66961dc7f77ec43f358ebeafbad8 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/5b8c29bef028c0be0869f36cdc4cc413acd8f278 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/e3887b0420dbf622b46b5b2634f4c0f9381a239e |     
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4e3fd198ffd909bd9f52b9313adf19cc3986fd55 |     
      xtensa |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2fdcc28d692894269de8c9f540d196d5c38bce3d |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8728c299fdef20ec39ef15e0da3274a5aa28e81f |     
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8120ee599c9b5206dc7ce1fa0f61a20aed1e51b9 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/35c59d6f7c0e7a93a4ea4359bff22ebf4ed32802 |     
         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/d6b53c4ac9a43f0a0d48791283303a3b09535187 |     
      xtensa |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/e45ff93b42d767c79cfb7c2177eac5bde01f4223 |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/60037e37e020404485df9814f3f3ad4e3b2abdb3 |     
         sh4 |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/36ef5c306c6e71d53b3392b7c2dc913ae6ce20e8 |     
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/33c3894ee849b14edbc4f200227e85c6ac784b9c | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/7992fc3b6d7053d0b4210049a9c9267194e44ce1 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/2f9a323041b838f159759f7cf069702176737d70 | ORPH
         arc |      glibc-arc-2019.03-release | NOK | http://autobuild.buildroot.net/results/f42ade3e00281a2f79fe31667ebfec32586065c5 | ORPH
         arm |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/3ea4436412d55ccb094676de3c0b0e1fbad7cffe |     
         arm |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/d8e43284f01fe0bbbaa1cf56dc6ceec99c5df477 |     
      x86_64 |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/33789840ba8a2e9fe1d28e93f91d2d91b6fff28a |     
      xtensa |              gstreamer1-1.16.0 | NOK | http://autobuild.buildroot.net/results/ea7553e657c9d766ee20f3aea83d770ed65bb338 |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/ff37fbda64677aa6ca5c59d6e372f4a6651f522d | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/4fe83b6164afe5f52e358374d30a78b945e7c8c8 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/8dc1f597de5fc9cd6b1e1026655005fc505a0cc9 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/98bc20a9bb30046ec28f2ebf754b35ebe2d64ef3 |     
microblazeel |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/158455365932e512e5e0b1c11d2693bea7e11cb2 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/38bcc1c1df533669a845f5e422bef0818446742b |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/11e7394168fa5abed2ebb5e302e870d76aa52812 |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/7eb81b5f3de8b9cdd964788569e403926852c79a |     
      xtensa | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/eab0ab58ad634858f6aa4251c12f825d2af87613 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/dbbf1940012ab91585d5d23d414aab2ffe642e32 |     
      x86_64 |            tesseract-ocr-4.1.0 | NOK | http://autobuild.buildroot.net/results/e47da689b4a2912b626f5d31086f6414e3e53774 |     
         arm | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/d3ba1a89ef4b0854d5c4bd766173bfa8941adba6 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/98a5e2de02b982a873a81e8cfb21ba911533910b |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f831a04485a66d505fb4a373666b157d5a085fc6 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ddf14715abdbc6611252bff9dab245a7602b8aef |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/890b14251d87ad1a06d5f579098942143850b50b |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/0a8b9aee73c75ee7807ac173eab56c2f0c7c4095 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/0639057a1b2990a387f1aec8f30dad4336ff3d64 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/57a11d67cc841fbee3557b7e45e9e060bd61b5d4 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                         snort | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/7e4c3fcb082233d5a2186d3626afbe907b170142 | ORPH
microblazeel |                          snort | TIM | http://autobuild.buildroot.net/results/1c8e0ee3e4b061bf36185cdfc1eae126789c85ac |     


-- 
http://autobuild.buildroot.net
