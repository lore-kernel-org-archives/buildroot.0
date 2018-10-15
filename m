From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Oct 2018 08:00:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-14
Message-ID: <20181015060028.2292320728@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
   2018.08.x |  19 |   0 |   0 |  19 |
      master | 201 |  29 |   0 | 230 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/76a15b53a103884643ae46a617193fae0c15bf03 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fc1365a4d15a43596df936d388f6774c3e47cead |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-3.0.4 | 8 
                haproxy-1.8.14 | 2 
        ltp-testsuite-20180926 | 2 
               target-finalize | 2 
                  cc-tool-0.26 | 1 
               findutils-4.6.0 | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.8.0 | 1 
 Makefile:709: target-finalize | 1 
mjpg-streamer-f387bb44e6c08... | 1 
               nfs-utils-1.3.3 | 1 
                  ntp-4.2.8p12 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
              sdl_mixer-1.2.12 | 1 
          shairport-sync-3.2.1 | 1 
                     squid-4.3 | 1 
                  udftools-2.0 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

        i586 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/82230ce24ca127443fcb941c50dfc4727b30219b |     
         arm |                findutils-4.6.0 | NOK | http://autobuild.buildroot.net/results/0d25efeb09a6afc386eadf1a81d3a4a34eb9a989 | ORPH
       sparc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/9862c46b3c5f2a456fb5982fbcd23abd8e250519 |     
       sparc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/507a8ab0814494985bfa21188a5a9b3a53fcbc8e |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/9972c1dcbecabfcb82f02c94f15be1c8b7d2ea1c | ORPH
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/69566d0c728970a6dd6a793b08c5804df3cc00eb |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/3c53ddfaca70b490a401c9123602965f3803cd0a |     
        i586 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/2d41d091bb5a287c4bcd1700a5393836522cae7c |     
        i586 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/597e1cb094afaeccaa94707057b925ebcb158256 |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/630965251f3570641c0bf694b489c451ddc2849d |     
         arm |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/7c16101abd95c5ae9e9266f0ea507172c3b5f7cb | ORPH
         arm |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/ab9ceff1151b8b5e6b9fa77d39c0f9b0cac1a080 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/586adbd49ca1deb8116f2da04ab04069f3048536 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/06be43a887e62bf6e1a147d57489d14426e531fb |     
         arm |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/418910d2e009ab7b6e85bd4aeed8c6f39a7c3bea | ORPH
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/239327ff483d69124e32ebe8a76168166344d4b7 |     
     powerpc |                      squid-4.3 | NOK | http://autobuild.buildroot.net/results/37093f8d3395850b2db5ed645f60d1c2df92768d | ORPH
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1d0e171c717554e3996f543eff212addce1806db |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/04b13ddaf02fb65dae85282598271c560273993f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/33cb370ee80d0603974b6376f0364f914d150463 |     
       nios2 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/9f1dd8ef3849e9f21c88a2d4b6ae9f49a610bdb5 |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/988ac07a88fb8f035276a75a9eaf80fcca7d2c14 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/85a7bb1996b78dee037d5900b124cbdf5b66a6ac |     
 powerpc64le |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/bd1e58aae73903347571f8891de7875218094641 |     
     powerpc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/754f424d57ace9d36ed2dac5364c8d92f286104d |     
   powerpc64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/697c47c0db55b10c658b37bc097e9907a9b131f3 |     
        m68k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/c96b008c22a7da05c0240f0a818daf6af36f5374 |     
         sh4 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/b7f0bf334f611130ab0290eb7e10d65a76cc8d98 |     
microblazeel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/3ed6449dda97ba1a7e4583d39fa5509fdd81ad75 |     


-- 
http://autobuild.buildroot.net
