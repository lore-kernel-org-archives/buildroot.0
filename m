From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-25
Message-ID: <20190226070051.20F0884D56@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   2 |   0 |  18 |
   2018.11.x |  29 |   0 |   0 |  29 |
      master | 143 |  39 |   0 | 182 |
        next |  52 |  26 |   0 |  78 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 2 


Detail of failures
------------------

     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/64cbe991216de3d2e43b6f0f23253c11296df06b |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/7afe2b0b6959d069d6697cfa77bbd919edebc933 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               ibrcommon-1.0.1 | 6 
                 qt5base-5.6.3 | 6 
           host-cryptopp-8.0.0 | 4 
                   netsurf-3.8 | 3 
                   mpd-0.20.23 | 2 
                   netsnmp-5.8 | 2 
               runc-v1.0.0-rc6 | 2 
                gerbera-v1.3.0 | 1 
                   glm-0.9.8.4 | 1 
       gst-plugins-bad-0.10.23 | 1 
                      gzip-1.9 | 1 
                 haproxy-1.9.1 | 1 
                  libssh-0.8.6 | 1 
               libupnpp-0.17.0 | 1 
      lua-cqueues-rel-20161215 | 1 
                mongodb-r4.0.6 | 1 
                  monkey-1.6.9 | 1 
               openldap-2.4.46 | 1 
               qt5webkit-5.9.1 | 1 
                   tor-0.3.5.8 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

         arc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/efa203e07c2dd5aed09c0ed23e3bd56fa2dadd2a |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5ec9489da2ffd9a1dff4356905f1c2389d4048d7 | ORPH
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/e0aa9cf17b5e4130fb0c51d252d48f282db497f6 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/9bbdd97979bc0c92a41d02dc64d25f2a59105b00 | ORPH
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/187df7c448f70a9799ac0c6233261acaf67429f7 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/584fb0ec37c2e1eff3287e200ddbc465cdfe7430 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/c7c15575f858954ffb66d392ee4a85345a040b32 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/5488995e9a9ac7268fceb19671f1aa3cd0ed5925 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/c4cc6e54d7ec1ef871b605226bac0a5127000c43 |     
  aarch64_be |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6defd655967bcea3a5b84e92d04b51806053256b | ORPH
      xtensa |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/48d26586c17239568772a32381e3d5ea22aaa826 | ORPH
         arc |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/2b5746c7d6675cb79403a658ee689116e34f16c9 | ORPH
         arm |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/069a07274e7002bd454164c38261737b2deecc38 | ORPH
     aarch64 |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/72aadeb29841878c01b3f4cfa3731149d07dd72e | ORPH
 powerpc64le |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/684b113bc9f28e6f957992e4c303e02d623fb255 | ORPH
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/b95b1939a55111fc6b90ef253a32402b87f9c4ab |     
     aarch64 |                libupnpp-0.17.0 | NOK | http://autobuild.buildroot.net/results/0dea1fac6d6ab38221d661bb5712c3a0d2eb4a78 |     
microblazeel |       lua-cqueues-rel-20161215 | NOK | http://autobuild.buildroot.net/results/63a7da19bbac66431cfd70739116003c188af0db |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/a4d843239c56a84fd86425edff4129fc051be3ec |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/31ec60f345b90eb53a3639e21244700c93971a8d |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/174baa803d041870bc85e74eb4516f05b1132c4b |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/92c49e9da0953bfa84f7633a66eb19803c534d6c |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d56dd02fb8b0fc3962694164b8d6a821d27d1338 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4f4d3d8ce1ad6ee0912ecf028b69da480e3bcd2d | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/05cd0d796197ab17483c04b59e9d160d05468c32 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c2a8e150c998f26e12a5119600cf76852eab501e |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/daa11c251e28f6280f3df4b5d2827554be275e45 |     
       sparc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/ff52b8e271d377e6906f1d77b14a386b0ff689b0 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2987f7dee9080fdc35b240df2e790badec438212 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/321c43b94bf18e37849d22ab8be13fc2d69621fc |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/5363f98091a77f4ccc142a89497bdc7ba8250d90 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7b34f07234bf72ecfefe55f69d00ae792b801656 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/10824640655305a45ffd1bb3743588ad7b44da0c |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d56c94af9c98f8018798fc43d191f12623f12e01 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/a73655ef3ed844763cc4bad5448b3137232633a0 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/8538cdab1587a1e9eb4356c44273dcd0230b2d54 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/e7e2189cc081669fd04a5d1ed0d494a6421671ae |     
      x86_64 |                    tor-0.3.5.8 | NOK | http://autobuild.buildroot.net/results/e4423e95b7540923a4ff5c909bd1b6ed87256ad1 |     
        i686 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/15de38abc0ce79838ec75867f5b8e816a5ab4366 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

host-imx-mkimage-rel_imx_4.... | 7 
            optee-client-3.4.0 | 4 
              lua-curl-0.3.9-1 | 2 
           uboot-tools-2019.01 | 2 
                gerbera-v1.3.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
      host-uboot-tools-2019.01 | 1 
                 ibrdtnd-1.0.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  monkey-1.6.9 | 1 
                 qt5base-5.6.3 | 1 
               runc-v1.0.0-rc6 | 1 
             stress-ng-0.09.47 | 1 
                   tor-0.3.5.7 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/83cb2ed868a5289ffb62a990092db42b1e0f7786 |     
       sparc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/9884c0b0fb14286dfb5c79fbfb4d14fc2c91b6ee | ORPH
        mips | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/757ec9d06fa8e0a67df406593fd4e4805de36a8b |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/1677dbcd91b7e1a229a2f0036687bb6079babe25 |     
     sparc64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/cf567083f896dfb64b852ce746580f4c065427f2 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/70829fe4d18179db7a5f478a92e2c7a0beb4b60b |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/553bc2c198f116fd3d4fb0277725323d31208345 |     
     aarch64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/15f50e6b567b80ce3966a42aa6f7315fcde687a7 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a646e2d08969b0d12140f3462953a28c4d6dc3ac |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5a0a29564d270ac9d7be5b262f8bca28aa135582 |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1ba1f06d99278798b18528c6f0e66001cff32e04 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/20fc2ec75a6730418310638926f21125db373e73 |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/705c8f578d3aa901f8070b1c3f076e8f1612f49a |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/b66677d39c2d5b9f991f0801d6c095d4121ad265 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/37f8ebc497ee3ee6157358fce45153aa4b066aa7 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bf7cc6031e09ec4a657a79660467aca3fa49935a |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4ea40526169e39a77ec6cc7a68dbd5ba0d843e22 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fef91629852cf80aa7ff0a13d9bd38f00ec627f5 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/378d7e805253896966c75fab6a10273045ae4069 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0c2bfad60fcf16259a8b8007bf807667d50d65cf |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/47bcaed400443a82f5be5d014bd3e50b95b52ba0 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/5d75eddffb41eb35fc98a40c17f1dde1240e41e5 |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/2a294586ad24561bbdcc6f2dbbc8995b40cc689c |     
     powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a81e6453f0d4db8793ce40b8c15f4ebf7cf290c0 |     
     powerpc |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eae710b56d177c4c4255e0c6ee7a2f2263bf3ee0 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/3f5a4c769a071901ac28171d178c5d9a34e05f03 |     


-- 
http://autobuild.buildroot.net
