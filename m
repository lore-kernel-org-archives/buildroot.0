From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 Nov 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-03
Message-ID: <20161104073023.D962F20D8B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-03
================================

      successes : 143
       failures : 54 
       timeouts : 5  
          TOTAL : 202

Classification of failures by reason
====================================

                    owfs-3.1p1 | 8 
net-tools-3f170bff115303e92... | 6 
              bridge-utils-1.6 | 2 
kvm-unit-tests-5731572b2ac2... | 2 
        lttng-babeltrace-1.4.0 | 2 
                 mesa3d-13.0.0 | 2 
          sane-backends-1.0.25 | 2 
                   sudo-1.8.15 | 2 
tvheadend-50a370707aedf5c12... | 2 
                     vlc-2.2.4 | 2 
                 xenomai-2.6.4 | 2 
                alsa-lib-1.1.2 | 1 
                benejson-0.9.7 | 1 
             berkeleydb-5.3.28 | 1 
          chocolate-doom-2.2.1 | 1 
      docker-containerd-v0.2.4 | 1 
                     exim-4.87 | 1 
                flannel-v0.5.5 | 1 
                  guile-2.0.13 | 1 
      kismet-Kismet-2014-02-R1 | 1 
               libcap-ng-0.7.8 | 1 
               libdvbcsa-1.1.0 | 1 
                libmad-0.15.1b | 1 
                libmpeg2-0.5.1 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
make[2]: *** [libavfilter/s... | 1 
                    mosh-1.2.6 | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                privoxy-3.0.26 | 1 
                    qemu-2.7.0 | 1 
                      qt-4.8.7 | 1 
                     rpm-5.2.0 | 1 
                   ser2net-3.0 | 1 
                 weston-1.12.0 | 1 


Detail of failures
===================

 powerpc64le |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/b83fd2b497f7343399c69afd1ecbe39a23a2dac5
      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/e0d914ca4dd004791ab9d5d27adeae8518f75482
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/886aecbbd664d11383c11c6cd9434a52f9c82b46
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/4aaeca4f1fca1794b039d7255a1828ff724f2234
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/069e1678911567ccc7e6a85c813f473077ed82fe
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/3db9040cfda504eb5796110ce866cb0f8c5c49df
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/7d134671b672c8bc603ed6fa954331be434f7a91
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/5057ac58b7d00fbb85b2f63f9f619e8301004689
   powerpc64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/43726652980ba028c91ff52155eba20fa5dfe988
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/e7a4dcf03a88ea2a96606c645e38871c3eee350d
     powerpc |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3d9a8eb1cb522842b7aa7461447c9d3e3c9f7071
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f91dd08a98828a5b1db62b4d07102658b0dbbd61
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/19e8c5e4929342e6f5f77ba4dd23a7b49fb4a9e4
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/11520c46bec6209e647dbd0cb0b2c418e86973db
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/0bc923132bedf71074175d6bfc8ca86bf04ae64a
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/cac105a5af90d2f5f97010122b2461af034d598e
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/cfaef1f2ae8885e3e95c342f8ecf6c04bb4eca40
    mips64el |         lttng-babeltrace-1.4.0 | NOK | http://autobuild.buildroot.net/results/73d32d7b0247662d08a4f1538f0152958b8b7317
         arm |         lttng-babeltrace-1.4.0 | NOK | http://autobuild.buildroot.net/results/989f074d7c51045eed6422bb83c0bbbdf63db02e
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/b47fb2ae810ada475fef215c1efb54a9891fef6f
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/a8a1dfb7d4a7a6babe665214030e2245d572d1d3
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/248c58cd20686497c4dabc1a19b2c8c7c76b33ab
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/3641092f62551bd41c24eafdce46804f9551b761
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/f2f65106c3e9dcfd546d5dad7cd0f7cd7145420c
        i586 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/4629ee4813aa36de884bba2576612f909c007264
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/c50b2139f967ebeeb0689fdb32d47f5e4724b256
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/8886dcf91dc7e0dc51dea843d05268640ffc461f
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/ee643704abadf63ad57ac76f92a472cab6bcfcf0
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7c994c36121f8df4a55ff16b6b96ff3a6ab57f05
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/40c099753462bf8e6e2e6222d8184b3b7e5268a9
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/9f1a7458adcf153cfb2062b6d23b0a940519a48a
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/f137ffae878d8f5dee47813e06627bd3488a5cd9
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/576a67541d11ce063f4b7d2aa598f7dea3a0a8a0
      xtensa | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/9a2671771d5bcb077b718ae2d247e22840d701fb
       nios2 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3556a14db0feee212e25dbb230986f37d17a0247
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/a996df8cf8c9a0e6df57d0bc73f84cb9c61f3f51
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/041ac07d3f20c9470508424adb11de1230284f26
      mipsel |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/02a3fb0cfc537db54743e18f01a3c0ba64822b17
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f5796304a52b925383e86be897d50c6b4f6da89d
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/793f540b38836101c02acda5d9d5f4ce619eea34
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/d6c5ad793ce6c32173a61779b98e739c62333924
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/0aab15f5297fbfcafd2e96eedf0310f24f5fb365
        i586 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/94ef2697b0011225654d1cbdd5205ee5e9e995ea
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/917850a6ad617841dd7c41dc3fa385bc6b9937a3
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/5ca0fda0af599fb04d9236be138182f56660dd13
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d0a03a895ec731af2ed8b70b3567bf5e3f8fd199
        i586 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/14c844705fda4b2178a176fd6468cd7d60618144
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/7578d27fba6032d2037ff584bd10d8eee6c44063
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/8a2e8856891e78d8a479ec121407455d4ead5b93
        sh4a |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/f03e258402bed5c7500e791b5c39aa7de3f2fafc
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/978fd604ccca6050e6a9a98856717d0864196296
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/248628d8eee609a46efd5ace07ff292c4b30b34d
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/601d7ebd69fe710f153388bedc9302dbaef287ee
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/53f337683be01f8c4091cac47506cba4b8baca5c
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/5a86832c74867d7316aa26d47563e94c9670baa8
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/313fe96325464e269ba0fc4d736745b7e63c085f
      x86_64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/d0d31fe7b5dd1396aaed6c97dc292566ae032e0e
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/1c60da4a42ed9c3c878d409b9a8e6c8480907993
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/73484e03bc177b376cfae3d00959d9afba0660dc

-- 
http://autobuild.buildroot.net
