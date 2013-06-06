From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Jun 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-05
Message-ID: <20130606063006.AE0F452C08F@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-05
===============================

        success : 74 
       failures : 120
       timeouts : 0  
          TOTAL : 194

Classification of failures by reason
====================================

             host-libftdi-0.19 | 26
package/sunxi-boards/sunxi-... | 17
                  libbsd-0.4.2 | 17
                   bzip2-1.0.6 | 16
                p11-kit-0.18.1 | 13
             bluez_utils-4.101 | 2 
             tvheadend-5513b44 | 2 
am33x-cm3-AM335xPSP_04.06.0... | 2 
                     m4-1.4.16 | 2 
                  gnutls-3.2.1 | 2 
                  weston-1.1.0 | 2 
               sconeserver-211 | 2 
media-ctl-ac40b79f002a2315f... | 1 
              matchbox-lib-1.9 | 1 
                directfb-1.6.3 | 1 
               wvstreams-4.6.1 | 1 
                 qt5base-5.0.2 | 1 
                libosip2-3.6.0 | 1 
                sdl_ttf-2.0.11 | 1 
                protobuf-2.4.1 | 1 
                 cairo-1.12.10 | 1 
                cifs-utils-6.0 | 1 
                      qt-4.8.4 | 1 
                libiscsi-1.6.0 | 1 
               libglib2-2.30.3 | 1 
                      gpsd-3.9 | 1 
            host-erlang-R15B01 | 1 
                busybox-1.21.0 | 1 
                  gamin-0.1.10 | 1 

Detail of failures
===================

       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/17ad1902ff3639fadbc872cad8c5e2803c33fc9f/
       arm | am33x-cm3-AM335xPSP_04.06.0... | NOK | http://autobuild.buildroot.net/results/3912883bfa7fffac7544ac93a0aeddde0d518f3e/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1539840b62a7701fb2046989ebd7a37c2818a300/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/eef0cb74157c5c1c5fcd9f040a60a8c702f975cd/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/760a874e5c385bae2f55a12fde7c2dec7af59366/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/d6d5c5df02d4a9adb0b56574bf2faf6d017b888c/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/754e39ff936a592722817bcd031a2e80d13ae026/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/fbb6dad60338b33e6b82bf3637dece3a3500f097/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/84e218eba97e17242574bf1d285272bed06a73fb/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/dbc81fc435f9e0ec449440ba35ff441d1c9c7c68/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/372f988004998805af17a0028d42e36e7c9da22a/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/56f79682cb6a527ac70ac0d3ec6104c4ea542e14/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/5d43f420fdf81a79280a519f64e74b61dee34d12/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/b755f07b1af8915503fac84dbc2eafb435738812/
      mips |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/f547d4164f8571d228562d5e6a91f372bd354845/
    mipsel |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/5ac3ff138120c7b77e6bcca7c6e79fcdcf02a09a/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/cec529d43314ac015587c44356585ebf1ea86050/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/5d375888364d1a60e74ba2b348a77c7c16e6e6af/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/80e232b8427aff47352105c918dd06b9a329ca75/
    x86_64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/80afff666c417612236e382d51d1beb671f6b62d/
   aarch64 |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/d67ef80a7478a59d8a7e0bc0e31dada16a5607e6/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/7fdeac8108b816c5820496a61ce66a5e1a8f723c/
microblaze |                 cifs-utils-6.0 | NOK | http://autobuild.buildroot.net/results/1848bfc885163e2b5428a045e6c7903b0b0e6c05/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0f54072f64a5ac856eac7dc9135feb89e6df65d8/
microblaze |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f578bc582ca963c67ed4d89a8bcef60c5cf2633c/
       arm |                   gnutls-3.2.1 | NOK | http://autobuild.buildroot.net/results/418ce71eecc1db725e3b3f092131a01cb1666a60/
      i586 |                   gnutls-3.2.1 | NOK | http://autobuild.buildroot.net/results/d0178585f46451f6fe30cadcdc7c7708f6ef135f/
   aarch64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/8c0a67ce06dcc06854f22b6c143b9aa715e69551/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/237293470087a6de45a9a549a380b840b54a9938/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/be59b41a5e77a1af919db0b859ced0d2e77cceae/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/b34dd1bcf500b2ca6a0c6b6dfa5697fe9a688929/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/d182d6b508330ee4ee48b1e52eaa134a17041d64/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/2ff81ea231cac09eca0553f3dff89a0fd99dad8a/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/cd280bfffa8886990bda7f1180ac68e56844b4ca/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/e6e0ece599a35d2668d376b14f0e9e657ee9ced1/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/99d80d66c963150b25d72a6e8280f4e3401460b5/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/550fec9c9a189f16e91167f744ad34652e6c47e2/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/3984e80ef2032cb86ad1eece706e234fcc5e5a3a/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/d3090804149654e099d3bc9953d48fd920812bf4/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/0a3135d5216fddd5e1b5a49a8c9e0df4a6e86003/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/fecef5be809a97e096e9696135da2c12d598b8ec/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/5318df5d3aeca9072ff3fbe0bd1d86ba98a87523/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/ba368e98b8145c57335163e2bbfc9b3ad2991aec/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/91faba6760b610fe544b9ee3d846ed5b7752b712/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/7dc018bed3e5a43a289d1f74356963a18171a75d/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/05e2649876bb482950fbf1ada6b92361f541d14f/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/2993039d542f501717e146515d2b4d4f9d557dc4/
    mipsel |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/4f9088050177051ccf315b7a53f02a90f5ede0f5/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/edc16fe543c92aa4307c4fe8c92276c651973c9d/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/7758956e64591d378d15fff3998c676db84a4dec/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/46e14fff3cc7ff60b5211655c36827a32ad38be2/
      i686 |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/0b7b4aa16a01f0dfda8ab1815526b02f6de8c58b/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/df0a229ab0b3cc463bb523884f9167bad0333c78/
       arm |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/cf3913b524e203a47366564da7961573aa981a21/
   powerpc |              host-libftdi-0.19 | NOK | http://autobuild.buildroot.net/results/521749fec34f1ea5cc619789fae3e4b42086c621/
    mipsel |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/019091312ec547520370ffad967b53e23f54a14b/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/77eecfeeaeb8610be226c1c0bf95d7b1a9f139b7/
       sh4 |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/5891f539ce3f3ff2e3411228472c8833fdd0d7c0/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/3fb5ae8f7cdd32abe9a3a2a0a87356e064c090c6/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/8436550d74754ba66e36fc2a7d8edde6263d6269/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/febc242a096223a4af161f8ee26c0df560dff1cc/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/5c3a7adb8be6a83e1870cbeeba4493bc005bfa1c/
   aarch64 |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/87c3a8bf2248606d80ddcfd96132de4c5fe869ed/
       sh4 |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/3e38839551615488e0ed6c49ba3c333077e1a74b/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/186547a2efdb6e48428df5e33716485132d32cf4/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/dd9e2980f7179200624971655c259ff75554fd3b/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/d44a5cadf40defb10a5fe39250905eb95b57d8cf/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/dd2759744f7060170e3b9e421609435c882bcc23/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/e8cd4c50702cf982e001e3ef0e0deb81a8f88544/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/e9291d5fa61317e9f57002a198ff349080975b2c/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/5830da8c67f1379d0bb41b791e75cb259f85dab0/
   powerpc |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/7d28cc903c93147aaff9bf1e5842d0d4d5c2dc2b/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/087c1133cb56c0cb0bdc28d83a8a1b30928f6d50/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0e18e02e01148afb36acd2293b3fdc56c6bb8413/
       arc |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/0edab8c07334f2d74a045ddd2ff33cbc0297dd45/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/fda4fe684249ce96736146801947cb204623d32c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/722b2fdf4fd1c4f173517c3bec5462eee1bf801a/
      i686 |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/ebf35e8fe05505d2da292d9a886e3c157ba8abd4/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/d848af2d742e42401195a835cb8278b69a04d022/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/5219292ffb6e4ae216ee1310e559568ee8cf37b2/
      i686 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/08fc7771173c291bb9876ec9ece4a4c01d6d3765/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/2849ca9b197252b6a25ab9035b963643361a837d/
      i686 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/c7f65fa7febd1f6a0f99bc124822c1280fbfe8c1/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/3e5a374b2c4f4de6eaaf41fe8c5820a9db8c3058/
      i586 |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/cc861f5a034a0922a90fb6f22835a1fe8205d497/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/190c8024124d9d3361c4134ccfe1d40d8afa3186/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/9808f7d53fa5a0ef20f6a4a1c20fcb4201a9ab08/
       arm |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/0fe579cbae448d31a33a6005a22dd08dec7e834b/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/f13f170bbf53d5ba8f4a52710fd1be42e11f8c57/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/5639e920f179f04b4f095aa1fd9a0fbc6ce7ebb3/
   powerpc |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/bad7b1a60430f92375b5fdd081518130aeee9a34/
    mipsel |                 p11-kit-0.18.1 | NOK | http://autobuild.buildroot.net/results/a39fe81a356b922a891d4225a56ce2427ab5bca7/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/5e524c5dda0ccf43edb0d60661f381adcceb54ff/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/84816703714cf7bb2fd86cd055d55d75fe2cc875/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/ec89cf250db3c9c243bdc6f87c9641bea31f3441/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/eefbe526cf997bb0930cb9e7be8c58218f4bcccf/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/39d92fd355428a625c753a7665a7a6c38f31f78c/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/80d3b2e0cdb19c1e11af0f0562ece54cbdce685f/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/fce8ae5307dd97cddb39c11375d0c0f9e79d26b6/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/f2614d10a249284923a60e99411d0135e6a2a748/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/ad784124fa6011182493c38935dd55ed59c19afb/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/51d84e8a7a5395706f441559df5ed69ca89b859b/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/14a4dcd6c3a64ed0d1a5e2930fb5114046104d12/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/74616f56e2258af52d0624d2842d6e117d254867/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/7fa9a3c27c1576b6f046b5dc1a2d5292f424d6a0/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/b928edc07f0939531d76833a17c851889ae06677/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/21ced6e16a92c1bf00482f7ee5504b30471f3b70/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/43c534dafc6b24ae2cbcc07724248af2d1837ea6/
       arm | package/sunxi-boards/sunxi-... | NOK | http://autobuild.buildroot.net/results/4b2b28af0f3aeccc4206698d5efde0ad3d9e1c11/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/2bd3e3c038f767518f018497746903a9aed7c4b8/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/796c9cc7b10956b2a2141590b67a732ada7e5ed4/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b9c0b2d45bd873cfa7d0ad3272cc1af4095e28b2/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/26a4353c31eba4d785c5bfbad21c6f0fd40c3772/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/adb8b971f3aced6219b14abc879c41e96c2ac3b4/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/5491bb89e8b2028b8b38859dc91f0109ec55bd1a/
microblaze |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/9bafc2712b549e435b099555915ca860984447a1/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/d5e7fa3853ba9e52c55ac87de388ab2778e5001b/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/9c852b3c4d0d66e200fb28cc722ed5c7a5b55bab/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/40dfaf5800c33f0511c786bf2cb770087040eeb7/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5a54bcb19d15178beae767c6dfd21bd1d19be778/


-- 
http://autobuild.buildroot.net
