From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-22
Message-ID: <20160423063023.B5E441024E3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-22
===============================

        success : 163
       failures : 79 
       timeouts : 0  
          TOTAL : 242

Classification of failures by reason
====================================

                    yajl-2.1.0 | 14
                 host-go-1.5.3 | 10
           host-cryptopp-5.6.3 | 5 
glmark2-499aa81a68fb4c8aac1... | 3 
                  connman-1.32 | 3 
               valgrind-3.11.0 | 2 
                blktrace-1.1.0 | 2 
                 qt5base-5.6.0 | 2 
             stress-ng-0.04.16 | 2 
                    cups-2.1.2 | 2 
                 jack2-v1.9.10 | 2 
               opencv-2.4.12.3 | 2 
                    ruby-2.3.0 | 2 
                   tinc-1.0.24 | 1 
                grantlee-0.5.1 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                 setools-3.3.8 | 1 
                   nginx-1.8.1 | 1 
                 mono-4.2.2.30 | 1 
        ltp-testsuite-20160126 | 1 
       openpgm-release-5-2-122 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                   taskd-1.1.0 | 1 
                  ltris-1.0.19 | 1 
               wireshark-2.0.2 | 1 
                  boost-1.60.0 | 1 
                  ffmpeg-2.8.6 | 1 
                moarvm-2016.01 | 1 
                moarvm-2016.04 | 1 
        lttng-babeltrace-1.2.4 | 1 
 toolchain-external-legal-info | 1 
                   erlang-18.3 | 1 
                 lvm2-2.02.150 | 1 
                     mtr-v0.86 | 1 
          shared-mime-info-1.6 | 1 
                flannel-v0.5.5 | 1 
                 raptor-2.0.15 | 1 
            libreplaygain-r475 | 1 
              freeswitch-1.6.7 | 1 
            lttng-libust-2.7.1 | 1 
                iproute2-4.5.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/56ffa026204c3ca2241fc402f03db956f2e5557e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/02eaac25bf69c6d98d8588a4156cc23bb36f2fe4/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4b55913aa24024e2381c8aec824466fdac89b0e8/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/0d9b74ec6c87341abd9e0c3042442f357d4f5692/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/03c3f9704e2bdc8e00085b9fddcf92135c10be4c/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/a970b6f6fe8a3079e2005328cfd6c59247f7657c/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/e06d2c5ec30a09b8d969533553020fdf93f8a6ab/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/853184159e8806ba1fe8e047daa5fae962f71ecd/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b679752baf2573a3fa03ead817bccfd65d0e5996/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6886a90337347e16e23c32dcd3fd793602fc7cce/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/31ca920029b0fa449e93f45d9788360f572722de/
         arm |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/7c12dbd06419afb7b5a764718204ad987ed43add/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/b8251a40f5eb5e1124e1a6e1abe407db83c75371/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/667b7847e47b1d272d028da4a18d77e70ab01875/
    mips64el | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/c712af468012b1e23e3048207611f0da78fb1ae0/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/dc9d4e223d97db352b8dd2a8c736df9dcbe38807/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/4c03090620683a690f280db4a2d76567c8f10f24/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/70178b83737555d361eeaa6f336739ef5efaf99d/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/f84f331b832903ca53c5fd45d092b27ccc2731f5/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/ec26d6a69f47f313719f7579b32de29590d64355/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/228dc62f00ea3857dd5145ae6c3e1b4bea7cbbea/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/4f7616a348a46f4a770b2349c30c478a9bdae892/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/cb8ac4ed0b1bdc2b9525b495ba18523d3e98ec4b/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/4e274f78dc5f382b84efd0ee449a291d94a89818/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/9c6bc68a39cdc7abfdca391721d11f2dd1302e30/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/90b271b485ffe199b9209156452d72016476fa1f/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/14bd5cf020286409d2e1783e08dbd63743373ba8/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/b643375216d48a85acfd585e64785f46b357f819/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/a2f61f6352214c19a644b00d25907110faab49f2/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/cf339614ee7895f667ce823135a0d812eba9c12f/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/700c6a7bfce4d06e5474494fc0dfa2c4fedb9058/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/f632c161c4228d8ceb690217ce4f8ee2a7e62d94/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/0870a427f11fb1b9f3ed9e489ce6524a1ba06e90/
     powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/63caecabb1102ed9099379b06465de5884a3bee3/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3acc3977ed728aa2aaf24ec2dd5ff6a5e4b61f8a/
    mips64el |             libreplaygain-r475 | NOK | http://autobuild.buildroot.net/results/638974d42ac8a2c843c547c3aec2566a6ba8ad83/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/c5e9d826786a99f78b024e9d7badaaab3b8c756d/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/08519bf339e661fbb6dc3868cb6a9c4f15b1e8df/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/bcff94bcf885be3a164494ec5f324f2fb83edb5b/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/d6422124a2b26e4830548081d8ac5c03233eba35/
         arm |                  lvm2-2.02.150 | NOK | http://autobuild.buildroot.net/results/22af2d0c1460c87c8826f64b4e2bd65736306daf/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/1016c7eb3400d7bff1ba5066842d752e91c8216c/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/160e3d4e61cfd516802004afbf7a91a8d69bd07f/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/ca28755f5cd715e7f1d7899aeb59ec9a9dae3ca8/
         arm |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/a7c1fe7475a24ff154bc39153207d02fe48ddd5f/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/9f56c1f8fbb8e2261b74efb9631580fe4a554d12/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/08d41780f1fff3e8dc99d5170457730d2f6e42a2/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/daa5583022dae8a7522995498508248cfc0fb690/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/6fb5cceebf699375714d293c0b1b5a6ad682bdb9/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/8e7ff74abdd6274c257a928113e50f534a142650/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/3d26c5ae8617c203ff46bbb1f435c7198ec42ae0/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/676d5f8a57437eacd6756e799ad034bb26677703/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/90d23c1886079671a55987531ea0712fef5397c0/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fb5e87b21e841ab52839a0af45af6a997c1f8bb8/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/f311cceab62146e9e603ba64ac89b5f9f7562a58/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/aa13d6799c2a3bc4de18740d43b6fe4a67dfd43a/
     powerpc |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/bb29c8fa5c44eaa575ff641958cba4736d9b2538/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/f5c6583b89a11006afa8085caa540a77cca15660/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/859c4ee437b4f9da3cadd8f9234e6f60d8f16e76/
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/e56f6ce12b4c32ad4548b27522b6f6512c6c64ba/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/299492a3d7057901486b33c4911506906ace135e/
         arm |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/9a88aa81782c9a34f1304685bc7b99e7d65ea7b6/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bfdc2d683ad0ab2d31480bcbaf774ff9ef061ba4/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/afbd54b3d8af37f9e6ef6a8114febdcbaf0245df/
    mips64el |                wireshark-2.0.2 | NOK | http://autobuild.buildroot.net/results/cdc074d8b19e9d21eee25211f2feaa236e22f8d1/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/dc5819ca6bf6e79d2e4cbae84fc9edcaedf8eed6/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/4d01009b7a060716047e66d0a5d21b4ecd90a522/
      xtensa |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/cdce818971e9a779489c4a8d1661ddfc2cf0069f/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/8de5154a3b420b4ca71072c249d9425a52a973be/
        i686 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/15d492d483b7afd23a7430fabacff6f21b7273a0/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/5137e6f2cf3a213245c59a92f5c0054040cb40d9/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/e62e3eb983c8eb1eef37a9ca7c5c1a3d919d93cf/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/3fe02fb34f0f2a2856f8714e03c333fcf212fc33/
    mips64el |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/b9c4dfbe3dd85501429f720606c3aab4745ca79b/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/217878a7f10a1ef18a8773379665adf1db031eda/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/77056d1b7792f5ffcf7dcbee2c54b0335e4b5d71/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6592dc569186a7d43d261711f80b59860116fe29/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/4c69559064585f455d1cf778713b558dafbf6122/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/260251732e986b0bfbd3135ca066dd934a6d25da/


-- 
http://autobuild.buildroot.net
