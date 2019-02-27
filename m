From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Feb 2019 07:00:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-26
Message-ID: <20190227070053.9E846855D3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   1 |   0 |  27 |
   2018.11.x |  15 |   1 |   0 |  16 |
      master | 186 |  29 |   5 | 220 |
        next |  30 |  30 |   0 |  60 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   qemu-2.12.1 | 1 


Detail of failures
------------------

         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/258ec3013ec8c30938bbfd1cf26b7aa9313b5682 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                    ruby-2.4.5 | 1 


Detail of failures
------------------

      x86_64 |                     ruby-2.4.5 | NOK | http://autobuild.buildroot.net/results/ee45924d4b221c3a1b379621603269a923e72ab9 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 5 
               runc-v1.0.0-rc6 | 5 
                   glm-0.9.8.4 | 2 
       gst-plugins-bad-0.10.23 | 2 
           host-cryptopp-8.0.0 | 2 
                   netsnmp-5.8 | 2 
                       netsurf | 2 
                   netsurf-3.8 | 2 
                qt5base-5.11.3 | 2 
               fftw-quad-3.3.8 | 1 
                gerbera-v1.3.0 | 1 
                        glibmm | 1 
                gnuchess-6.2.5 | 1 
                host-libsodium | 1 
   openvmtools-10.3.5-10430147 | 1 
                    postgresql | 1 
           python-numpy-1.15.1 | 1 
              spandsp-20180108 | 1 
zbar-57d601e82089f2f31de9e1... | 1 


Detail of failures
------------------

        i686 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/92519e939a08fd21f7650935d84a238689c1c780 | ORPH
     riscv64 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/567bbbb8514f99619a60147db82bf3733adc8ab9 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/16bc8f3e20f9e5d9d37c25f8aa602168de10d02a |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/e3f9820eeeea0045fbcc45c727a32fd304458db1 | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5fc0df2be7aff82f375753d6492e1207d0b39fdf | ORPH
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/3ad8244214f2178c3e3b602bbabbfba2ebd075f6 | ORPH
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/210f9d6cfd7d48a503ae0ed32f990f40f1300f44 | ORPH
        mips |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/b6ff7ffd31a3e5efcb9cc5c544d1f4583ace0c35 | ORPH
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/0a26265961747600388258d32ba7dc9226c9249b |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/e8fad6fe97391276df0bbb3deb9d4ab90ce043d1 |     
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/cce5282e64ace09ab124daaf13af03607ad0ee7f |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/4551b7f3847b0a5411aede4eb8d055cb3ef0b432 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/bc6d5d8dd07bb0056e8141fa41878ca088197966 | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/1044e6c182102d1fb5b1fbf9deced5f0600b41f2 |     
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/ec023fda507f3a02f8d7ba926dc817e038236bef |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6cb935ec8b74bdf75d3bdc168edb091bc6a7e69c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fb40f51d218ceb50c0e8c7bdac4738f8ea6cfdc0 |     
      x86_64 |    openvmtools-10.3.5-10430147 | NOK | http://autobuild.buildroot.net/results/4fa6fa03cabd6e53605a4a77c5213fb2d9951c31 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/cfcb94584d45f55f42f2de7a0d9f51f07920cf20 |     
         arm |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/b22b7b062792476a62fc939ed9d3a088288e7bb5 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/3be68e189ef84e1432fe97c3fed1c7507dddc151 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/b30e526522b587d67e67fdb1e023b17b8cf42c8a |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/b074dc36c86e0ca0d3da42f669be34329b2b2a53 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/49a86b80e543fefabd2cfa5f65ab8918e4845d19 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/9d5d410bfef2ec0997396bbc16e7f6330965e4fa |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8561d31d881f1a863ab37b41c425fc658e5dee06 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e6fc60d7661adc45f6c8d60efc4b278606396ba3 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ad015e0a06d898eb543e4f4fe640ff84931a4079 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/03aedf2ee0a2fe4e5419d9876b251fac495d27b9 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d74ec470caf6795d953076ba4d17fe819630ca41 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/31aadb27316d44128dababc798931ff2dac581ef |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/f48e6e20d44d7d455595e1f43f23da749dce62ec |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/1ac6bdf223058b60242b199349c9087bb5746525 |     
         arm | zbar-57d601e82089f2f31de9e1... | NOK | http://autobuild.buildroot.net/results/7d544275756f655f9d42c05562aca653923155b1 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 7 
host-imx-mkimage-rel_imx_4.... | 5 
           uboot-tools-2019.01 | 4 
            optee-client-3.4.0 | 3 
                 qt5base-5.6.3 | 2 
       gst-plugins-bad-0.10.23 | 1 
      host-uboot-tools-2019.01 | 1 
              lua-curl-0.3.9-1 | 1 
                mongodb-r4.0.6 | 1 
                   netsnmp-5.8 | 1 
                     pcre-8.42 | 1 
          qt5multimedia-5.12.1 | 1 
               runc-v1.0.0-rc6 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/59b8e2628e0270e666766afe866213380efd11df | ORPH
     aarch64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a032f8fa0a5176cbe2379ba9a3d511ca95ddf25d |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a7cd142fd1f0b46b5eb405894d94747aa10b2659 |     
     powerpc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/bbce9fdf644732b579f46f5da09b259216952020 |     
         arc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/f46386ac50a389ce59ed5b4bf7981bb5104bb13b |     
     powerpc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/a5b80c8bc6ad63df13afbb59c3c06da279e79f56 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/32a3edffd35778c2f73d213808464bd8005a3382 |     
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/44509d202716be642c79f3b645c5e13df04e59e9 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/611d1e86e4f584234fe7ae87721e2d39b173b032 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3ead910423a30e35b25d0e0c824674390d42aa4c | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4bd8d3b6928c65b40df0be12a9362583df6041e0 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a5d3afa580af7ed50e239dd24ddbadf6bd426780 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/bebd685b2d4f8a1067d4b2a08959b97086fdb32c | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/da4867c55aeea360a2173904d4af7d42ea3cfa8e | ORPH
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/1aeeaaf43cc7e3c85989c51eda8068939bf45a17 |     
      x86_64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/ebd8b5592229519db051426d72ed192332cbdb39 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2df72c2c8be7d2cd1d794171a1fd3e8a67e8b3e2 | ORPH
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/87eaced89123e2c28e1b613ffe9b0350ce24b08f |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1fdf00e8f7e3c4cecc3848ee260054bc77f72717 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3a0abcab785466bb56a69653f95c6f5eb91aae09 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/d4fb4c670bf6a373ae1f79b30a41a8d5efecd250 | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6f96ef041ce21dcf52a1f1e767c7054ed8466cff |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/219af0f76e5f31ce87b4cd761687054ac95a5127 |     
    mips64el |           qt5multimedia-5.12.1 | NOK | http://autobuild.buildroot.net/results/c8b7b0ac2cb61c420cc3c15e2fb6dda8552cb162 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/acbc8158a4c8d53fffe9cef6d06adcd44bcbdf41 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/34d507fc3703ed80a9f33b220a0cac5908e95e9c |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a38d980fd62a9697208f7d15492148023b7239c2 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3b8fcb9bb6e191c7ed96449afae65628aae31f17 |     
      x86_64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/bb2b17ebe8a7f1077151873a49afdd3a7c19ce53 |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/fd0924a45bd10d141d6d2c75f82c92c6c36153ac |     


-- 
http://autobuild.buildroot.net
