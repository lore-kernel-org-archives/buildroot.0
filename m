From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Apr 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-16
Message-ID: <20160417063021.4B78F102675@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-16
===============================

        success : 129
       failures : 63 
       timeouts : 2  
          TOTAL : 194

Classification of failures by reason
====================================

                    yajl-2.1.0 | 15
tvheadend-cd9f07fb865e57001... | 4 
        host-gutenprint-5.2.11 | 2 
                  ltris-1.0.19 | 2 
      ca-certificates-20160104 | 2 
                   mplayer-1.2 | 2 
                 rsyslog-8.9.0 | 2 
                  connman-1.31 | 2 
                     vlc-2.2.2 | 2 
                blktrace-1.1.0 | 2 
               ipmitool-1.8.16 | 2 
               opencv-2.4.12.3 | 2 
                xfsprogs-4.5.0 | 2 
                 lvm2-2.02.150 | 2 
        lttng-babeltrace-1.2.4 | 1 
              ptpd2-ptpd-2.3.1 | 1 
make[3]: *** wait: No child... | 1 
                  cairo-1.14.6 | 1 
                 rtptools-1.20 | 1 
               valgrind-3.11.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  ffmpeg-2.8.6 | 1 
gmrender-resurrect-aa3d02cf... | 1 
make[3]: *** [code/CMakeFil... | 1 
flann-04b4a56533faf8c8228d0... | 1 
    xserver_xorg-server-1.18.3 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    cups-2.1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             fxload-2008_10_13 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
           linux-zigbee-v0.3.1 | 1 
                   tinc-1.0.24 | 1 
                  stunnel-5.31 | 1 
                 jack2-v1.9.10 | 1 
                  boost-1.60.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5d01674216721fa1e6150a60b71c3cc51041e65a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/51e10f32294d589458ac79b87d6556418eaf2584/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/500f4b422c1bb43c0a840d6e09e14b4c2ee51905/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/46f3aa946e352eddb0fdd3aa622d51cc61486a88/
      xtensa |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/05b025d655173d86600f204c24f52293aecd9730/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/21b072188763c98675e3d296e49e6d1274c0d5a9/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7b5c51263daea5d8b446cbf118ccb1e096a3ad65/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a5121cf900a2deb9f05ce9c685c8a06d14c9b474/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/8d4f3c50342688e4908dd75a4c3af0eb431f5ebb/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/a16100d5a9d4e21ae8c136d848053ee45783edc1/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/23602b5bf70bd90216fa7fe75c5364635052cc88/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/bd7558b4f7c8268c12a051cf113eeee6bf12c6a8/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/98fdd8592f93eb738643e3f6261e7fbaa439f2e4/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/c6d36012f3848d3f8d52853ada6c6e97a6cd28f9/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/9a6a7f6f59ba237b73a7ea1e354c6608b152f258/
     sparc64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/c76737100b1a1059f25463374b3e116823aa41a5/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b89cb8c0d47965567bd7be048d6db455bea783ba/
        sh4a |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/c8999376f8e27b55dbc07aa823e9f523372a79e6/
        i686 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/499174d94dbb907405c008e8ff8c94f6a52b02a8/
    mips64el |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/b0845ce15cce22ef3d043af026e2d808e52ff36a/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/ce14a0743ca70ea19c08f73b6d217027ff4ef520/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/85a4a7ee4cf5c0b65e4543a524909d9c0422eea4/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/b2d7479dd3eb96bdab8a58e67470a385781f7304/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/73c98c9ac7c84ce5b1b8d343d777169313f763af/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/3777612b21407b7dcf81a52ffb29cce546b5e896/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/0321472bc4ab0c601d7fd6a81b8dceb6e3663f26/
      x86_64 |                  lvm2-2.02.150 | NOK | http://autobuild.buildroot.net/results/2804d7d588be6cf650833b21cd70328b2b076f73/
         arm |                  lvm2-2.02.150 | NOK | http://autobuild.buildroot.net/results/2a93d8a7323eb178760d09c45a11b7ab71c3daac/
microblazeel | make[3]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/c3aa39bac472bb22d083f338c66a42ffe4fda2ec/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/c4c991ebcd7b32f883a5d8b4bd6d6ec0f9bd7c90/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5e40f336412612793c2369f5c2209cc98533e650/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/675c1864c0ffe4a52fac988a6460a3cea23442ff/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/0bb80261a2b17bb65646d4d17fcacf4d4770dfdc/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/17a3da56002c8289644b22c1f4e3cbb865056acc/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/796f79057b499d746da7017bc290ad246a7ee480/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/83fc3084eb0dfbbf3adbf342c083e8dfbd3756c0/
         sh4 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/6629614b56eb06b0782868fa94c0a4bea26fac5c/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/f6479554f3694fcb00c51d41a4aa87507e2317c4/
      mipsel |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/76e2e1fde0ade8de2862b5af3300079778d38abd/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/00109927714c78d5bd43803cfc78af4ad2b49f66/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/bf694c39082405477064a62aff1d0314f698d80f/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/c28d700e379b8a2fd7252129ea312e14cc137313/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/553e28ef17aa7273b9f2328a22830c656d809f40/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a226fd114c567ee6432c752e27b2d48f0fd1e059/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/a21d4ccb9173cf080c252e1d4bd6acd760e00128/
      x86_64 |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/0429681c0938dbb9a83a6f1b41af5e92036da290/
      xtensa |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/01428e2ada3e2752e1b715de0a34956b3c526f99/
      x86_64 |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/d707c581e94e3dc67234389b5b69b5904e422668/
      x86_64 |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/f771a3cac40a31a6078c8d52aed296a68dbd51f9/
     aarch64 |     xserver_xorg-server-1.18.3 | NOK | http://autobuild.buildroot.net/results/4b2b5acc2ac757116f7be8825e72bbe9223c48bd/
      x86_64 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/954be0b96f1aa12111c0b91c14ecfb93c0a04ccf/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/39a687881b191ccbe765200710ae44adc12ebc56/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/c623cc7a22f45e73e5f7f71cbc589ff60eb7944b/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/472c4348dfbd6f90e9f94f2a192cbf399d2ded5d/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a914d0dc6d01e89d21743beaf82dbf9beb59ce32/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/23686aea36a16bb22d2bd1f0d8e61eeba1aac068/
      x86_64 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6c110710a7f98ba3bb765c610584fbbd4fee8321/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/fe40e701ba2ad807ac2d6e527b4560c2757c966f/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/22fa774b4d40fb368e7f82c8ecae5d31c263abb5/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/a794ed793b9ab09bf1cf4fc3022b214ef3eeb346/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/558ace1f07fb0e0fe55cac42d8d6dfa78d6be349/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/cb48adbdb56d75ba155eeb27c1de428651a5ba34/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/af6a680025570674f6bb96a2bfb68cb83322f498/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/d0228412da4c61e4588299b2d07c1147e0da6ef6/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/5f2e8fe3c6af48650790c9e597521aa6331d81e4/


-- 
http://autobuild.buildroot.net
