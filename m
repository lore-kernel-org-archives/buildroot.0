From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Nov 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-19
Message-ID: <20151120073016.1DCDA101493@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-19
===============================

        success : 130
       failures : 32 
       timeouts : 0  
          TOTAL : 162

Classification of failures by reason
====================================

                   mplayer-1.2 | 3 
                    sdl-1.2.15 | 2 
                   bdwgc-7.4.2 | 2 
                 mesa3d-11.0.4 | 2 
             lttng-tools-2.6.0 | 2 
freerdp-17834af7bb378f85a3b... | 1 
                  ffmpeg-2.8.1 | 1 
         conntrack-tools-1.4.3 | 1 
                 dropwatch-1.4 | 1 
                iproute2-4.3.0 | 1 
                   erlang-17.5 | 1 
            xapp_sessreg-1.1.0 | 1 
rpi-userland-b864a841e5a459... | 1 
           libvncserver-0.9.10 | 1 
                   open2300-12 | 1 
                grantlee-0.5.1 | 1 
                busybox-1.24.1 | 1 
                  connman-1.30 | 1 
                    libuecc-v6 | 1 
                   zmqpp-3.2.0 | 1 
             webkitgtk24-2.4.9 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                      qt-4.8.7 | 1 
                mongrel2-1.9.2 | 1 
             host-nodejs-4.1.2 | 1 
           libfreeimage-3.17.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/49443f0e9c20ddeffb82456a9ac88e8c8e2df5af/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/2f981033ca53277090d2d0679ac0723850a5e503/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/b3d7f730a40b3ecdbfe36df674ce9df8c2863906/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/e685fa4315287a4be66e762f1a3f7caa54bc2bcb/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/4addad6be0fe4e164015e6ce79b20774b8d90481/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1daf6c87036cd931759b498dba159fe320e44f43/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a99344bfe406494f628ccd8f1d6f5939920feb4f/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/7bb8cef166313ca63e57616d8a8f166e84604ef9/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/cbb2e2242f32a744121f445030af27b43107889f/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/131d8f1b8c9260d396fe485ab6eff830a49cf8d0/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/72b80a434547931e1deb6f0ba793a6d68accc9a2/
      x86_64 |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/5d3f8c2242e9a89bb545166fc7d70429d2cddd42/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/ed410283871926f61175326dc7f2b48fee9038b9/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8bf35bff1b73fcb133eb3420f8abb152732c6567/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/c0d91fc0fa28fda0ffd1c9a236bde5435222bcc0/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/4e6387eeb41ecc09d35dd9834d18b6ef2eeef951/
     aarch64 |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/fd6b58e9b34fb771643c5cd8e3f628fa3c496c83/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/2b6aa8bc4597697fa560bd5e735a51a36cf83340/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/fcce75610c04957202868e2ab97cfdf7729faf55/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/efab65f50ff58519651cdbbf18574c65ede029a6/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/b7f86bdda094de96633e9921e0e5895eadc89217/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/52b8c026677ffa526fb94c2bf41107e8b4ef3437/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6fa7ecde0e1badb32e561d0bf4edf57ef66b4426/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2adba0a1f43e0e2854ba0bb560d6a3fad47b6aea/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/2e8ff27ef5e80cf664d453ba3cb23e96910fc4d9/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/57d5cf3424bcb1286e95e11bd87a5af320ff6592/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/e950bff6dae90084cbcc7d60e247b7a502daed1d/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/cbc600ec168a5f3ed991f7ebb157571af27bc564/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/0d24c89b950e0c61141717432a959b9b669545b2/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/32c3c31527b5fd2713c68b230cdfec22d8bf2b84/
         arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/ec01564854f0738df05b8d995d9f0db396a0e5a8/
         arm |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/ed4508a00663b03632a4eb9411ba05852d02fd88/


-- 
http://autobuild.buildroot.net
