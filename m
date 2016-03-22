From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-21
Message-ID: <20160322073023.CC980102FD4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-21
===============================

        success : 191
       failures : 188
       timeouts : 3  
          TOTAL : 382

Classification of failures by reason
====================================

              gnuradio-3.7.9.1 | 37
                     tcl-8.6.5 | 15
                  connman-1.31 | 11
                cgilua-5.1.4-2 | 7 
           libimxvpuapi-0.10.1 | 7 
                moarvm-2016.01 | 7 
                     dt-v18.32 | 6 
               linknx-0.0.1.32 | 5 
                    norm-1.5r6 | 5 
  getent-buildroot-2016.05-git | 5 
                collectd-5.5.1 | 4 
                blktrace-1.1.0 | 4 
             coxpcall-1.15.0-1 | 4 
      ca-certificates-20160104 | 3 
                 erlang-18.2.1 | 3 
                    yajl-2.1.0 | 3 
hidapi-d17db57b9d4354752e0a... | 3 
                    cups-2.1.2 | 3 
               libgtk2-2.24.29 | 3 
              gst1-libav-1.6.3 | 3 
                qt5tools-5.6.0 | 2 
tstools-08f6be304040e7b8476... | 2 
                  boost-1.60.0 | 2 
                 qt5base-5.6.0 | 2 
                    ruby-2.3.0 | 2 
                  dado-1.6.0-1 | 2 
               ipmitool-1.8.15 | 2 
           lksctp-tools-1.0.16 | 2 
                      qt-4.8.7 | 2 
                 mesa3d-11.1.2 | 2 
                 jack2-v1.9.10 | 1 
                wayland-1.10.0 | 1 
            host-python3-3.4.3 | 1 
           gst1-validate-1.6.0 | 1 
 make[2]: *** [all] Terminated | 1 
       openpgm-release-5-2-122 | 1 
                     fbset-2.1 | 1 
                   ushare-1.1a | 1 
                libgpgme-1.5.5 | 1 
             lirc-tools-0.9.3a | 1 
                    mosh-1.2.5 | 1 
                 lvm2-2.02.146 | 1 
                 copas-2.0.1-1 | 1 
                 igmpproxy-0.1 | 1 
                  ffmpeg-2.8.6 | 1 
       lua-messagepack-0.3.4-1 | 1 
            lttng-libust-2.7.1 | 1 
         lrandom-20120430.51-1 | 1 
                  prboom-2.5.0 | 1 
       gadgetfs-test-undefined | 1 
                     lxc-1.1.5 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                   perl-5.22.1 | 1 
               libsodium-1.0.8 | 1 
          libwebsockets-v1.7.3 | 1 
             ipsec-tools-0.8.2 | 1 
make[2]: *** [code/CMakeFil... | 1 
                  gamin-0.1.10 | 1 
                   redis-3.0.7 | 1 
              rabbitmq-c-0.7.1 | 1 
                   systemd-229 | 1 
                 libdrm-2.4.67 | 1 
                  trinity-v1.6 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0766cd8cda81a9d4271f930aedaf4d55352e57e9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/eefc5b5085129e6efce950d88a2adceb3c115846/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/90bba92bcc423a596708cf03564256fcf49952f3/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e504dbce417d708facad84d774ff33e57fd592f9/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2b2156ad0b5dcad8d61943ed24078d3c26bfbc1a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/81e91878248328346dd96383f7e6ba8adfa81e97/
microblazeel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/601ce91a85e731cbfa1aea59efe8b85e8a316c1e/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/6bfb4d9d7142e1cf2218e23aa867c49f2e97c657/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/a40dbd139095070dc80717b4f5b3e0779755f25d/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/b50746d3a432d9893f620320cad5cfa7f99ed7d8/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/27f8b6ac127e0a4ef9c288c7b5b68f38436bb710/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/e112fc009819f7bb7b83830eaf47cd2db5c3ab7c/
      mipsel |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/e4985d8dd8066d777b3a371007050bf3992580e8/
      x86_64 |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/d797fff21690fec1cc6968fa5fa5304acfdeb9e7/
     powerpc |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/0c15166b7bd35c55bbaf3e4ea0ad70a8836ebcd0/
         arm |                 cgilua-5.1.4-2 | NOK | http://autobuild.buildroot.net/results/712dad3821a3c40e12809a14ea7900668f934bf0/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/712f521c5aace9da47ab211587f33c0ca2e266b4/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/befd63f4175dc0ae2d07b4db78edbe404dfed6bf/
      xtensa |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/9fe76765e102103e4d3af95d3352c0ed62cc2355/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/d7beedb1483a8f064fcb7e258e97db29d9f23529/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f7f3aec8f53285a39aa87e01b484a17f210ddeb4/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/49bed255af2f7c7c83995a45000b12fc83782b11/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/59b26cfe4b94c58295ab8130166814964256de4f/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4ea57ba6f2a64113f877fd7358e058704c6a90ec/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/dcc2427ada3fa96b60cf80368593da67a6f9ff6c/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/4e5283427217db2d726d5acfd562d95b75f4fd2e/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/97bd4312ec3eb630f76994192290e1a20d795e9d/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/86e35887179ff960f1f1cfd8af67112f01d26053/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e3dab823aeb1531b5b94742670b61a8e13f1a7b5/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/97624a4eb59d57e3628b08497ee017657186ef9e/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d238fc29e96a86096955aca26ab28b4a5a3e7b20/
     powerpc |                  copas-2.0.1-1 | NOK | http://autobuild.buildroot.net/results/2669c7b8a07003d628f325a58dd69da11dc7d934/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/a71f86ad548259dde3d26bec8656c59dc317d8ad/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/871dbe2af4825a1845eae97aa01b0c5c3b32bb50/
         arm |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/24e6c421e9e6bc9a235a5b050e71d59fc697a944/
     powerpc |              coxpcall-1.15.0-1 | NOK | http://autobuild.buildroot.net/results/1d60ecab626eb94ff38917cb2e9e678f1ee221e3/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c75ff74e1e529de905f128d57587163fcabacf37/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/a37b6aa27221716ba3b1102b71c26b5cba724b46/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/ee3903326a920732a364de25fc8b8a448a42130c/
     powerpc |                   dado-1.6.0-1 | NOK | http://autobuild.buildroot.net/results/62bf8c3bf48bd92e6cb001f990d9fc8393068799/
         arm |                   dado-1.6.0-1 | NOK | http://autobuild.buildroot.net/results/7806c67d6d888e9ef5b8af01cecaa38cd35c1b5e/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/e174b0983d918e4aa483634b5d03eac987534874/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/0f53ae47bd4ac50f247e39fee8eae7d75cca12dd/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/024003c1f0bf957ead407e85d5a6caebd8211df2/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/5c4b9d40621f216f2d3e3202fb632cb825000666/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/194a0e7798a967bc0a85dcae685083084c9442eb/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d525245ccc5457191ad64db5e27ab7a816d18855/
         arm |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/1b47d691c6f4701f9d15dc9e3c8cddbfcfd6802e/
     aarch64 |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/92323b8f836b061bf7977188bf22f2bde8615066/
       sparc |                  erlang-18.2.1 | NOK | http://autobuild.buildroot.net/results/c2a459fbb7084e7c5bc5911476c595e260e03f15/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/d72f494fff09c0c3b2ab4a4411813947ba3e28fa/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/537a7920aac147b44d4736638550ca6f7873ab40/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/eab163b6f44540f094588abd34c2ec3a4362694d/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2579b4332f0b00d48668e88f055117d407d09244/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/290fa4195327d1c647d98971465c0e5a788ffb02/
      mipsel |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/dbf4ed2068cef2b53ba49bb58565f379853265d7/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/5f96761de3a5dc3a847de7e7c41cf8eb56d8896d/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/af89b289e8ec5bd4941d8ed1d741767b775120c1/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/f4d2f59d9ffdb56b393d500899c07b0f19ec0b27/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e027bc85cedc00b05efb8597e5462a880b57ef08/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/63de844e6d52ed75501ea6c199778b048b12181b/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5206764a4841611d38cc01312a896172e42f43b2/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/294f4b610f5142015a14beaa96894453076f3a02/
        mips |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/54344498711168ac82770fae05cdaec1fad523b3/
     sparc64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/eb9439ba5d569eb32a19b49877e4e0017b742486/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/fdc7191f192205f8bcde9a626b9bd726e85f9acb/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1450d84f795e0f87c81324a448d01ca8ab537567/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/b81d1c13115cbcdcca20205b68a7c5b3862ffefa/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9cdafc6d3eb6c0ea2aa4399a5470100736f5ee75/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8f417e5bda7ce72241b0ce7bb295689a7f6cc456/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9b106670cce8e68a18751bc5bdb01b179fe3e38b/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/07da041973b984993953aa28e07a95f67ff8590c/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d0f312bcd80aae58fb9fffcb098757b4d5dcaf02/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c4c2a26fb7bda52197dc3da958da1191698f0a28/
    mips64el |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/24b954637b1ed3c085ca96344c9fc1a91ec65d24/
     aarch64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c22b36b57b1c6df520adef75f99831a749d749ce/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/00194e5de6dc023caf9ff015cffb9592d74e3b5a/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/7a8d4e9c1962fdcc285e74faf1172d89fc8ec159/
      xtensa |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/9a6c75c9f6a630ee95db17d071aada3c54c58d3a/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a262db00b62ec18ca5fa3782d021f6ad76dbbf48/
      mipsel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2f9d1671f4b0539cddd2c818e291239beddee350/
         arc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d732255c0062ab5dd1ec6de9599f0c9ec3d5cd0e/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d28ccc014794b3820f969c0017a0047ce4e6565a/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/015d5efcfe6ddb5347387717b879cf2157b22274/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/1f786742adca70d4264ca35535a69310538f383c/
microblazeel |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c095d2aa9de2adf846db67a814cf8c48686e1e4a/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ef4a85c152910f4b93d4b17edbd5a2e223a705ab/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/3ce32404b233c97b2aa01c4f56182f858aa6ed07/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c749620742f18cb516911af49ec7d1d5733e5e84/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d5e68e155181eb8605a34eaeb9b70f6c3b92b6f5/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/bbe8a6148c9d154035cf53eab7fe7f60a1ee966f/
         sh4 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a0b22acd122cc3e799ef13f02a4a722f22694a70/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/5b69b12ec753f9e4c4d11d5e87403bf99c811583/
        sh4a |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/aa9fac0518b97121bc0ad85206e578fe08e3b4da/
        i686 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/8a203dbe643dae7d69a707e07755dca0ad5d0e3d/
     powerpc |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/e7b52b01f9aafa4303c1517cee9312a85d0e203f/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1377023aa8bae40ed3d70b2c6bc1bf3e742e8e5d/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ba529275eee2ebb7d4ded6d5ad09394200f95800/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/f5eeabf9d7d1c757793d10d9896f58f48f56b1a1/
      x86_64 |            gst1-validate-1.6.0 | NOK | http://autobuild.buildroot.net/results/b483e09f59fed18f9c987c4531761d15e31a4725/
        mips | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/6035825e64dea67909db8e584604e9a0bb5be424/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/012506045f1cd48326950a908e943e839e893adf/
      mipsel | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9c836a996a7348e227f2da0084e3239628f002b5/
        i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/879dd23c6195b0df55961a6143f45217e34276ef/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/6cc7e46bf46d4a3cdeaa7ee1f173524b121d4e3d/
     powerpc |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/35af8f8d3f361e3706b3d36f457db049f24d5df8/
     powerpc |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/adf58352ed432605913da81ae568a111fa659c35/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9f1a08dbb14f74c3dcb2b8868383a9a7ebb725f4/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/30ef7ec9cb6604bf34aacc2881199da678b72c6f/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/62f708c64b7ef5e554045b02ca4239da3b8a7359/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/cde556a40eb25a6e287d3475a9b638e7108ec96f/
        i686 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/337589562afde66347532f436e37845315638476/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/1f7fdf64d8e383ac55e8f57169d7f5e4a32a9d75/
      mipsel |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/593d5571c30f1509e7e142e8d9dcf94970b6552b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/81a82411bdd3f264ec634addf6ee0fed61733854/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/360fee1c757712818fb942b5d6d8c7b51ea77ecf/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/88a9275dd37840a35e1cd8ec78517c9b5253193b/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/659d8888a0d888df852484d4d69b4d7df4f997c4/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/b6b8ecbf4fd5c61ad047639b2cc9601193e89e0a/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/a8db7abafe09668e1264e901b531967a2a8673bb/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/1c19720496d1eb0a42a6908a3b2afa1474df8a71/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/b3538985000bad44d636692b6d03264c8adde066/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/0aebba9bd30758ec1300f9703375d41b6f90c43b/
     powerpc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6b9ace8f95f183aefcf1013bf27e88e15f22de9a/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/78e82ca15589a1b3751ed3ed04979746fdb584e6/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/8df9a6d5581ebbcded71b114258613b024ec286a/
     sparc64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/64546201e5724c4542e23f6804f62c3d6178593e/
    mips64el |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/44b5e9def84195b6f1ee59f5a66d159e97e3e1dd/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/3a9ce34a3ced86a3459613499e3ba964ac51d66d/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/00b9089d45f791cfbc63ca22dd46e48d9b064ca7/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/319d10462dab3c6513e1a45972da2e56cb11eef3/
         arm |          lrandom-20120430.51-1 | NOK | http://autobuild.buildroot.net/results/03a248ffff2105b88bbe5489ba00e54d86cb0e48/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/30847e5bf2e1e1801bc6112537731f1d4c58aef1/
        i686 |        lua-messagepack-0.3.4-1 | NOK | http://autobuild.buildroot.net/results/95e9753cb12a80f801871b1ad0291da3c5e8cc18/
      x86_64 |                  lvm2-2.02.146 | NOK | http://autobuild.buildroot.net/results/a43489aa75832cd260c8b0acee64a99288067ea9/
      x86_64 |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/e5d29eb18d9b7b5407c8889695445740a17d2b7a/
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e1169d1787a057e900ab1282fd4d8fa006953bb7/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/6684dc14296f3f2a46f5d33496ff203960cb0282/
        mips |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/454020749bbd02dfd1b1ee54ff11bcb87f5c8059/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/be4288aceb842468d92421272767724a46ee7bab/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b14ba1d3f710424d26a1fdaaa1717a7015030f40/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/6dc4b832c18d4b2a611dcf3429fa615616302af9/
     aarch64 |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/ff8d3ceb0d33adf86a4267b1d8c941e8b900bff9/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/fda2581a00d12bf9cc2917a2eb590c9bfcf7924c/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/ce661d605d78ab0d44c0e7ba349c1c465cc2cf55/
     powerpc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/b381a906d416f56cbb05b7a6e2eb32535562ddf3/
         arm |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/97a4cb188a3e246a43f866f2b02af125628a613e/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/01959b0aa33481583805dde0aac165095edc90e5/
     powerpc |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/b272453f1bdf11c467af2de20b1a9687de31d3f8/
        i686 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/213f5a982d5476394bf74be517b3da4784f663b9/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/393570cc8449b16fdb5868bc506e4d06ec46635f/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/bffcdfdc44f608e97fa930e102262ec636fc2699/
        sh4a |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/1d47b35e08a5941a3f485b3f5629f3d2439e22a9/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2890f89a44516a418402dd7a714c357938a5b770/
      mipsel |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/20668dfdefb3f2c9f6c146a4071a519d1637e2db/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/232f343ad4a5b9f3a90406a5b9bbc6b43d4aedc0/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/df8019ae9d4ddaba322187e336ef218ffcb0ea5b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5f45d1682fcc872993bbf16f0af7e040a391690c/
    mips64el |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/e70e7c4cdb33b2e7455d86edaf26edd175150616/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/7ffd45cf6990a1756df824c07eb791bff2832ab7/
         arc |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/bb84b724f67e554e94be8e5c8c450a0ea056e49f/
         arm |                 qt5tools-5.6.0 | NOK | http://autobuild.buildroot.net/results/0005c965030a87dee3489c6cecee1d995b43ca15/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/1427466431d7a530f492ce732198aae429eeb52d/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/20279ac40f69ba394044be36f6df76ad395ab70d/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/315f1d3f0a5b9e8ce861cf41262b7a71de128765/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7ca233f25b59a90000a555521a3681bd2154fcd8/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/137a02afe9d4a10194e1707836dd04779c463ccf/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/4af5d224c183bd517e2371927aa73c4a0819ba55/
        mips |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/c66094e58b3cb69f91cf40ce6a28a3accc051fb6/
     sparc64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/0e2dcc543d989e20e289ce120549d58338d80fb0/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fc0b6fb56fbd4b0476ad842169fec1ed24cc2625/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/fec237ee1ef786128c1f925b68cf5949ffe7b925/
        i686 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/8970be50c40d11c6ab6ce41b725ffbc71390cf22/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7577e38758b5b8d9e24d2a112e718640cca608ab/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/9fd1f8da123f05e4dd47ae20b60d1bd11747a504/
      xtensa |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/4ff7a03cbfa8175023cba5568558f3b8770e4550/
      x86_64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/7d6330a96ed1efbf7581c8da9a517f64ab469320/
     powerpc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/2ca1829aff5fae0596c13b5307de7f911d9e0801/
     aarch64 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/985160a9f1880ca0923cc5c0477a1facdabf883b/
         arc |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/d5add592bc57c76f3b7a5856f56b483d0f1481ed/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/af3689d88b8967184b76744afa6463fc1ba5786e/
         sh4 |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/87fe99b61ee52508987e3277ebf56667b1e8e238/
         arm |                      tcl-8.6.5 | NOK | http://autobuild.buildroot.net/results/45bba0ffbead638986741351f9eab8260b0d2515/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/07157dd85f91602d099f598ec421cae6628da14c/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/ccfb4853c6f8d63976a777b0d840085aa1c6854d/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/2024b432f423c4c7024b44153c5a003af664b21d/
      x86_64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/e9e67a774a15fab115ef4d96693a51fa3c0bd564/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/22e80f863c136f11f04392d26db3ab1a6b2899d4/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6abdec95bd13bfa890eea6cf764910317ff85781/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/fb30338203138333e7ab4b77542e2558e6915b40/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/6cd5486d39b7b08eea50bbc0a39819958b3e7535/


-- 
http://autobuild.buildroot.net
