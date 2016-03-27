From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Mar 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-26
Message-ID: <20160327063023.DD5C8102354@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-26
===============================

        success : 209
       failures : 172
       timeouts : 2  
          TOTAL : 383

Classification of failures by reason
====================================

                     tcl-8.6.5 | 29
                moarvm-2016.01 | 13
                libldns-1.6.17 | 12
                  connman-1.31 | 11
               linknx-0.0.1.32 | 9 
           libimxvpuapi-0.10.1 | 7 
                blktrace-1.1.0 | 6 
                      qt-4.8.7 | 5 
                cgilua-5.1.4-2 | 5 
                    norm-1.5r6 | 4 
                     qwt-6.1.2 | 3 
                  stunnel-5.31 | 3 
                 jack2-v1.9.10 | 3 
                 mesa3d-11.1.2 | 3 
                collectd-5.5.1 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
               ipmitool-1.8.15 | 2 
                  gamin-0.1.10 | 2 
  getent-buildroot-2016.05-git | 2 
                libpjsip-2.4.5 | 2 
             lirc-tools-0.9.3a | 2 
                grantlee-0.5.1 | 2 
iputils-3a86a2542c6fe29413c... | 2 
               libgtk2-2.24.30 | 2 
              gst1-libav-1.6.3 | 2 
                 copas-2.0.1-1 | 2 
      ca-certificates-20160104 | 2 
                busybox-1.24.2 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                    yajl-2.1.0 | 1 
                 setools-3.3.8 | 1 
            lbase64-20120820-1 | 1 
                   nginx-1.8.1 | 1 
              luabitop-1.0.2-1 | 1 
             coxpcall-1.15.0-1 | 1 
        lttng-babeltrace-1.2.4 | 1 
make[1]: *** [libleveldb.so... | 1 
             stress-ng-0.04.16 | 1 
                    ustr-1.0.4 | 1 
                  trinity-v1.6 | 1 
                  boost-1.60.0 | 1 
                qt5tools-5.6.0 | 1 
            webkitgtk24-2.4.10 | 1 
       gst1-plugins-base-1.8.0 | 1 
                    cups-2.1.2 | 1 
                  lpeg-1.0.0-1 | 1 
                     vlc-2.2.2 | 1 
                    ruby-2.3.0 | 1 
                  ltris-1.0.19 | 1 
                   erlang-18.3 | 1 
                  samba4-4.4.0 | 1 
                sg3_utils-1.42 | 1 
              gst1-libav-1.8.0 | 1 
                 lvm2-2.02.147 | 1 
                   ushare-1.1a | 1 
            gst-ffmpeg-0.10.13 | 1 
       lua-messagepack-0.3.4-1 | 1 
        ltp-testsuite-20160126 | 1 
 python-singledispatch-3.4.0.3 | 1 
code/CMakeFiles/assimp.dir/... | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/deb681461c9a7fb63ab25bf0cbe1ee0a41575f15/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/4044ce775b4b032b12883a10152b089b37398514/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b016ce0990a81e7e35ffbafd33c17fbb32fceae6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d726a782b0910a8338980e9c54b0696e533989fa/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/444962dfbbd329c3af34e2749ef06d63eb404d4b/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/250e7bccde2ad737fa8512e08daa36e6bb7b3b3c/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/abe834e3c3092a76764a8b96d418aa3bbe5b38d5/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/a09cacac7b615829b824e96ea6afb71ea40e7278/
        bfin |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/15c8f73cbfa96f40c1f5fe3759061875dc2eb07e/
         arc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1e2c5b2e42c83ba8cfcdfe96c7192ff09b6b5f1f/
microblazeel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/1782f6cd0e86302da27347230d09d57625386b0d/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/f293df0a7061ce1721ce8f5c6acaf7a5a01e95b5/
        i686 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/7dae05816bd1ab2c16ae565890d9c2c157526755/
     powerpc |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/b0d7c4becab59da44b92998f35f4e996a9e427d0/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/f788c2c20f31c48f2aa47cf023fc7819272a1065/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/6316d63799fbb263079ac12caed7fae5a1e8b8f9/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/a8a133630ad36171cf7a2d5f10ad4294b4e29ccb/
     powerpc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3960edfdfcd3b96724917149a68effc921812f40/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/8233ed0c2cac8d57a3e2ad8601e732c4f7a3f4df/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/3dcb975cadee955e7a3eb964e1aae1ccc54cf6fb/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/93e8bb2fedbdf773e1d44f77948edf100b01e1e1/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c36f22ea212a618fd7b67f3888acb5d0af886ba0/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/af26cff0ff8ae2bc40aa483944f8f66bf0e13160/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1290fa25da9697251dfd66f11e5d64f84c470712/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/2d1924d014873366d1552367046fc42f4ad90747/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f5e1d8e22a84280d45268063068fe94de6aa547d/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/35ab931f38daf291c4f71ee252af258456e47311/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7c1083a782fa0913efe169341993057326577188/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e4d766817a908982526b3d73f55c6a48a31f784e/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/fed85179ba764ed841083c6ec5640e7cc54e1d68/
        i686 |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/41dc924ef9dc97a7b53085f004bc81ed48a718ce/
         arm |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/c695cad25164c1040393cc80e5c54a9417f102ef/
        i686 |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/3119beb8cc4246aa4f8b241aebb3234ed6b159ca/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/395e72849cc5c77ea82e8d7f23ee7af9503e22b5/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/78270d205a067fad3f4464e27d569d08a8f71566/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f7e2cc98dffe14968322f87def3f7d2a9b5ed5e5/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/a56cfb5d96d5287cb7ce707411f6f0da7f60e210/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/e08b4145e59b113bed3e001e6635cb09909f506b/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/d70ef0d68031c597d9a980176e1c18676e1c55eb/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/54004f9eb422ff091546c324543e29b86593f1a2/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/6f129dec42193238dbb2fa09721d2d9a230476ce/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/50e1f4c8f7c7cca1165ff5b76d0857bdf040e8ec/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/a4c89fd5d69802424e9a7feba48aa5991186ff9d/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/cb1134793070b49b1b0bcc43f6d6b8a5e4f05303/
    mips64el |               gst1-libav-1.8.0 | NOK | http://autobuild.buildroot.net/results/98a82dd4ee0c9a67b14a6453a768bf7362174b5b/
     powerpc |        gst1-plugins-base-1.8.0 | NOK | http://autobuild.buildroot.net/results/474e4b9bc3a44224302d0576cf1c0de7ce709f1a/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/38b8b7cae0823619c7bcb72f0d74cf581cd36af9/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/86f380cebc05adaa79c1fa8b9035a3441ebab743/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/cf9606b5d3fa9773fbef628f96042245c0028769/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/63b370926a736179246889a35ad45cc0557bfb21/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/c1045882947ff7150c750088ae1981bd99134c54/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/febbe0e3855f87f37025df9ab854865ae2951ad8/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/df13099929d0acac68b0e88a1a1d3c4fc71d5e6c/
      mipsel | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/57c57242386dffe03d86ade278fe01b82d234f1f/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4da0e6de1f0fb2c0f4ce21a5a34e6ff242ed923b/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e8d4cb65176c846baf61829a262127de50c0244b/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/999e1adced8b307e0bfd1aea54d644b268cbb39b/
         arm |             lbase64-20120820-1 | NOK | http://autobuild.buildroot.net/results/d95b9bb24f0ee1f88bb7c6329eda09621b589cb3/
        sh4a |                libgtk2-2.24.30 | NOK | http://autobuild.buildroot.net/results/d61b5da1dfdeb09f46ac4e87dbfe542bc8a0b46d/
     powerpc |                libgtk2-2.24.30 | NOK | http://autobuild.buildroot.net/results/9051c8f10770f863af2a3747c8526cd5523e8254/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5d25d315ed168032187fb67d514121d82c900c00/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c63809f48df86086faed5890bd289ce6c1fc2189/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/61db2f6ec731e5c0def932fa7f74d1d8e6b17910/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/fa7a5faffd54b30fc92995dccdfb93679891acc6/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/e456577d7af0f5e6e77d4f1a17599da10205d9f6/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5640204ff3d5f5cb29239fc988f7cdf5c22f2a0f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c837adc82f779b9e1ad4ff69130c2ad5392d15ea/
      xtensa |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/866771dde5feb258502fdcba635cb5a78f930db1/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/2ce8225c5ba56915dbc715e419fa23c40223c7ab/
        bfin |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/ce3072ed6ea0b7a755eecca60e79974f0fe834e1/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/65cba145315e21ecaed467e087a152506680ce0c/
     powerpc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/2cb9becc69b16310ba02b599c509a645e8d3ca76/
         arc |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/3a1a8723c50fb5aee83bdad544e1579a311a3d53/
microblazeel |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/e87d2ec7ff8da74e48b645b05e6bf544a0ab0178/
        i686 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/dac9c1d224ad51c561b88f511fc6c710c5a10060/
       nios2 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/4a3f36805f310a18bd47dfb24e6afada6d8110d0/
        sh4a |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/6b43db11e44bc3246808d0281bc2ebc49de315c0/
        i686 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/dcd9d68c00ea4ff894beb68368f56696c4a0b750/
     sparc64 |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/85b107ed7fe408d243037c1e330d4f0ad15338ed/
      x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/49529c3a2a2a8dd72a70d1cdc4018ccb8a98da58/
        i686 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/9fcd5c682ffe1448bf01615189643610beef2bd7/
       nios2 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/1a84f5413c524a238f4bb6575172954658ef1f54/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/4cbfe95da296129e341f760ea00e26d0529846a0/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d7dc8a890385f036fd64836ec531891c62472f5d/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/8f983dd748881e15dab6ceb1b73ba96c4f59d2c6/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/99af631962ba3d2320ded1ca4da91bf5e78d5b3c/
        i686 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d060879e851190315ac5424c3a8b67792b755bcd/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6338980bd30c9b1fba7bf4f891caf591683e8a6d/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/9ae1e0275830b816fb536e2995fe0b072193b9ae/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/0603f6da54eadc59ec23705ad525efe58b813f82/
     powerpc |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/863b0bb977f8853238a328ed92c2726a4a3e1071/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/2f2d4b6818d5f0ee2f34b1f302f8453a276003f5/
     powerpc |                   lpeg-1.0.0-1 | NOK | http://autobuild.buildroot.net/results/2cf02eb1818fa0b92bc48a6120f842824ad539e2/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/625ed12ba5a2164ab618d410a70a3480b54f40df/
         arc |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/c15cebc942c2dc4947ea39e77b218d67779ea921/
         arc |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/406c689475c5ba932a6b341bb3cb8ce422a2cb34/
      x86_64 |        lua-messagepack-0.3.4-1 | NOK | http://autobuild.buildroot.net/results/6dc439c19eb149e28a741f38faf184b95150ca37/
         arm |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/c9ee5f16382ea703fcb6258749d55e05eaa963f1/
         arm |                  lvm2-2.02.147 | NOK | http://autobuild.buildroot.net/results/20619f181ca0f790ecced563c6167ff89b005eb4/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/e33cd39596807e65001c2b24b63ebfe77f14dede/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/6b5ee2d8d4f474013ca62002d75bcf4ccc82140b/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/4e43b671a1ea30f6c2367b54964d64cc8f603da1/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/cbb01522cc740444e786d27b9deb34c1ed1bf024/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/9f16ce1d3810d502693f370076b252bf71c85204/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b8234fd13f989653d9e2fad548e631e2cdaf5dfe/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/e89c82fc390e4d8317abc262f1d25bdd778ea942/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/ab86fe04afa9299f30532b9e26d93c1e0218fa92/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/99331ba5735c05cef5baac1778393be8c42ec835/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/e0dd354d80925fe49d680b642c420cbf3d930114/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/46f3ca4f2355ec4ceb60df17261c4103596d065c/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/f3c4591cd724b9d339d087238c08c5f536fc8ed1/
      x86_64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/442a64a9416efc887d1e9c7034dcace02e0a2f7c/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/2407a2662c0832e0f337eba1fb9ae9f9cdb66ae6/
        i686 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/8aa3668c4533673f6ae152c16558d4ccafda6e0b/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/ce541e26e726b3ad6d8c3cb69895eba7278ad58a/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/e4264719fc19c98acf515da0d092e0da52c5c662/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/f894d175008e281ece831a00afe6a93f342b917a/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/23fbab79ed2d106f258e784b3d5986a08ff4e87c/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/956b94bcb2cd35e83536559c24d54164aca0f36d/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/f5d36c168906cb1a26a012e5e98420a9ab8cb456/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/2bac2fd10f7f3263351e1123faad5d2ecfa34575/
      xtensa |  python-singledispatch-3.4.0.3 | NOK | http://autobuild.buildroot.net/results/269061049b5c41fe6bcce693317b5212eab9a9f7/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0c4848f7b42adaaaa8b239f00008e23291fe11a4/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e154fd6a2308662e2cd0e812273f1656c87d04c3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/eb5cf797e2efa090b7fc792b1cdc09a62ff16c5a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee0ac3705cb973ec6a108208dffdedb3f2b10058/
      x86_64 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6f541e61e970dea56570d0944cf6ac60f61d4ac2/
         arm |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/c6e0cb312f9fd52b501ddca0ea1bd9bb8bfd9386/
        sh4a |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/222c6d4013a328c9c072d71b9d989168583b5cc8/
      mipsel |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/a2ed82f4565bc1759d16d352803fb977fa725a2b/
         arc |                      qwt-6.1.2 | NOK | http://autobuild.buildroot.net/results/91afbdb09f2792ec675e875fa610e8f99b9bc16a/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/e9c4cf926bd34ff6fe50d58017a448a59d2d318f/
        i686 |                   samba4-4.4.0 | NOK | http://autobuild.buildroot.net/results/09f75f515b81a6e94f05f9ae2c4e2a5813fbdb30/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2a2091e507e2a6a7d92c57a8abf38ecaa7f84d29/
        bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/60f8cef555b2252cb5ad7147c119e2cb2bc63d02/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/895607bab2e81581eddf6a1f7571720eeb096c5f/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/898796276474a697233acb091d4a552fd508806c/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/afd591f04d851d65742f01a16b813128f04480f0/
    mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/5cbc75cdc2c57e16068130bd6d14d84a11f2e631/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/57c5b600953fbd2b26b91271245ff4993274804d/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/891ce0da00cfeaa5a3f8448a9a7cdda2fc8a0e2e/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a53deca958b087efe5d5cd2d51a126fa3818f674/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8e0829749a7488c33014ab687476ca49a856d577/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5bb2238540f5a2931f6932fe335934c8c2a97f9b/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/eddba9ee7eef00b883bc2786ebb5d4b7165f7218/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/81620b07aadd77fc3e453a83bfd9b6c7851008b1/
     aarch64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9c3c990221cbbb6f840de9c1b252a8d8ad206122/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7e9d337d6113a06f0d5eb5dbb5c6c4e7e98dbd7b/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9dc953ec3abcd64e7009a553fbbffa14d88e09c7/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/bf1b7bc15c7ebe20e00f63622d8d49d8c1d21751/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/6fb1e765a966c4360935c0df9f4e978ddb6603a5/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ce5b64a02b9f2de68b634d5b92c3ae9e34364835/
       sparc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/42a688de0703de5a53e474a4570f566c6a8d1712/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5c82ab56dc9226b8346f58e4d02de35f27f038ea/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/18faba6a38f49cc79bdb1564480137878ed208ba/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/55ed5d55ff8fce55da25de1fed54a66d8ccad81f/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/abbdee5982ff1882253d55516d054a9a6fa73c09/
       nios2 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/5b6b48938b0ea259d67e08bd8f2d181346c4c5da/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/61caa1f9c03fbd69b91e0dce286d9e055869b4e5/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d6a43ca1b8b4bcf9d310fd53a5bbbad9d465d6d0/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/94331cd11088766de7b71754c99afd5c246822a2/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7b5caf00975cc32d66f8d95c204cb2d99a39f573/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/a5aae8572f40903c1ad0e85094f11f808f2c0d8b/
      mipsel |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ced337770eccf23557df1616ac4b985dc7d91f8e/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9940def7367c4161ea93bbcae726978501b4d7e2/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/b073de87e8a72986142202c31529796161a00910/
    mips64el |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/ac9d739b7be4181ecb329b62b3b19f8c365ebfaf/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/f3f8a941f3c913889f22cebdbe997f8817f3cb06/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/677bdb0d4b15c1030eb073933c0d96471caf2000/
      x86_64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/913cd203ea71ee75a47f4607b2afe35e10f66d7e/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d016c024f53cf55ba611a089f6ced32ada8fb332/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/3d61821c6e30bacda978a8205463cac3ea227ba4/
      x86_64 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/ea1bf25f455b3da6eb570eddf65ff17493bf9f87/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6deba6bf9093b5f7e60fc8fea482455d51dd478c/


-- 
http://autobuild.buildroot.net
