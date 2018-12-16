From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 08:00:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-15
Message-ID: <20181216070020.612BD2072F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   0 |   0 |  22 |
   2018.11.x |  21 |   0 |   0 |  21 |
   2018.08.x |  19 |   1 |   0 |  20 |
      master |  99 |  89 |   0 | 188 |

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/37721f8e84be337d12536779d45fbfc2caabb150 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 28
                   netsurf-3.8 | 12
                  linuxptp-2.0 | 5 
                 mesa3d-18.3.0 | 5 
           xapp_xfontsel-1.0.6 | 3 
                xapp_xmh-1.0.3 | 3 
               asterisk-16.0.0 | 2 
            btrfs-progs-4.17.1 | 2 
                  ffmpeg-3.4.5 | 2 
      libva-intel-driver-2.2.0 | 2 
                     pcre-8.42 | 2 
              swupdate-2018.11 | 2 
               util-linux-2.33 | 2 
             bluez5_utils-5.50 | 1 
             bluez_utils-4.101 | 1 
              cryptsetup-2.0.4 | 1 
              drbd-utils-9.2.0 | 1 
                fwts-V18.09.00 | 1 
                  grpc-v1.16.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
gstreamer1-editing-services... | 1 
                    liblo-0.29 | 1 
                     lxc-3.0.3 | 1 
                    php-7.2.13 | 1 
                qt5base-5.11.3 | 1 
             stress-ng-0.09.47 | 1 
           xapp_xditview-1.0.4 | 1 
              xapp_xlogo-1.0.4 | 1 
              xapp_xmore-1.0.2 | 1 
    xdata_xcursor-themes-1.0.5 | 1 
xfont_font-adobe-utopia-typ... | 1 
        xfont_font-alias-1.0.3 | 1 


Detail of failures
------------------

      x86_64 |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/62911579c78a51e6598bcdd9a4a4cecb78542ecf |     
         arm |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/22cee5b5c8f82765c3d38a4f7d2011c3d4145192 |     
       nios2 |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/4da7f0f0c0d65b5bd6016a2271a2f85a5fd4e049 |     
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0771dc2c956ebdf87de1cc54465538912301833b |     
         arm |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/c68aac4308f52dad0b6b5395b613bf57af87fe28 | ORPH
      mipsel |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/5d56aa1362bdda83c646324bbbd94684874908e5 | ORPH
         arm |               cryptsetup-2.0.4 | NOK | http://autobuild.buildroot.net/results/930dcd3e408106e01fa519058cd2677c867b73dd |     
       nios2 |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/158d669f62c662034d8d1572f974f5e5d848b4a3 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/fa8a7eda929f9b1a1a7e65081019d27cc369d4ed |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/bb3264661c182c124e89e9a2bcf41e556d40aeb8 |     
     aarch64 |                 fwts-V18.09.00 | NOK | http://autobuild.buildroot.net/results/ce1f72a08ef77edd1dc8b8d6394bae0f83f5de56 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ab2ef8d00dd11f1eba59af0174d0bc1a6db0b9eb |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7df5e3696468ba80f3b61e6951e0d52a7aa34c5d |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/26d09e5ff001c4fb8e340638f5bc33c2f6ec61bb |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5bae0a4f64d56f760c5cc103939096b7891f1620 |     
     sparc64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/da96b2a1faca557f939ee8ddca0215b3f7e714db |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5fe793c699e24d684039c21cdb484f60b2c0d239 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d8a9bf6ad4c249e6c56feb44673c4d01ba94f314 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/10b312e71f310aaccb3da939f97050b1a8f37912 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3a0687911f9da25fb36497b7abb2adb7ea3ef695 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8fb269ae3c36ad32812883e22b2ed97114517b2c |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b270bae0ece1b61d918f48ec9bd445679594d3e7 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1ff47dc63f43bb29c99dc7828d3546b57b99f5b8 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/15f816c404e2ba93a3ffd5bd6544b0e6ef421e4d |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0a2e794b629d47ae30dd6bed7265907d01c0cd1a |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d731ec5c9242276f826b19643a6221c67d83d524 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/877972eda4e0e70d460d80d618b702b78e7ded31 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/dfd16de411110759fbe83e61d964389bf062e619 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/848282be656809e26a704ff92842e6bde6875a3e |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e53be9c61b7b5d16a9f70080e185375b1e60490a |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/844548eba9ccb1fc31518272439ce3c5b5ac49df |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d17b0736007196166d3cd46cf2c58cefa7fd417e |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/78b0e4a8853e2b0709b2937159ae6cfc31c1cc4e |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d43becdd12cda89075e0db39f6d2af792800a4ec |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0f78cef6f09d6a7b584e8041d89b8b7508c03f8e |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a3de705962f284f0ac4c9182d088b217ace7662e |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e5fc3eb6e508b263413acc1738db007570b8b98c |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bb53f18b1cf35e18ae2eca84cc62d8bf669f2398 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/52d3e78ccc04f2c6716ec6bf4d964c89d06c5bb8 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/dd7d89fccc4b305b02c3276e74031cae2185a11c |     
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/0e94de98260af3f4571dcad9548c5bc7869b1f9a | ORPH
      xtensa | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/095f75be81b93db0ab45ea60b0dd6c34c99212e0 |     
         arc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/62896bd6a1a30facaffd07a7a763831996dc8ea0 | ORPH
        i586 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/de979493a33f7497fd1e0870ad9ef9a5261f38bd |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/4743e70144abcf7727e3c77d8d19341562f1745a |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c65be6095a7dc7348d91bf1ec1f9cc48dd45cc8f |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/cef84c156c033c84f23eefb1004a1182f7855061 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e3cd7d3a16dccb2f39d31f0daf23712a25037179 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e27c2b1f896b2258ea717ecf8936b97acbe82937 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/67931b2351dce9f068bad136b73a94ea4700de52 |     
      x86_64 |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/d99e5b749cb09adc04393e3933ba3defb6d9642a |     
      xtensa |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/84cb21e0eaba4eb742b2d04c2a96148d33345da4 |     
         arc |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/fe1a89785660e92f8aba8838d83c874787569d5c |     
         arc |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/d57d8ffd49402ca7989663065a5e422e2be44a08 |     
         arm |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/ffdf7b726a5a2a4a71b4fddbb6fbf57311200166 |     
    mips64el |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/53506ef2569907b04c3b0ae88b127ad2fd7c8f01 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6a3da1379052d32da631a64c614570c3d84ae9d7 |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/76efa51350fa601f5a2c4daec51657d5db5de860 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/17bd0f86ebbdb264b1f8d0931f752cbccfe39e46 |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6442db0c313a6d4741b9a07d24801a2dec9f5731 |     
      mipsel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7d3b2abb4b7380614e25d93ea020b7379fb3f735 |     
       nios2 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d5262c87c265be0f9354b26fed35a8671ad347fa |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a8480f2cee5bc21b0e0cb844f17e656a85a22d5e |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/52469235748e1080e120b65b0dd05118f244a67c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c9250a3e3d745cfc68ec7f84f56a73ba598de42e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a07e6e716de67a68e403f52832aea604c2716159 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8b839aa2ac5975e2bfb731964d31d254f4cf675c |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/192f625c268822335c62db3dc13723792d76c85f |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/e05522ce540f4ac23f9a3a8fec724694d9a23101 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/c5f7400834002c936e6ba12b68ff5e3a81a98f95 | ORPH
         arc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/99273997e763aa060ef80ce4d97392158d7e2b72 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/d44b238842a7bb3de0a2ec3ceda0f9646024931b |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/6fa609771d52d4f9bf896bb157f3e5693f5c00ca |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/bc5fc152808ab1c6ce65924faade7fccc4da0fa7 |     
        mips |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/85e0e3f86599bd324bebeba2ae1bf25d7c0014ea |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/d267e602b6de4d6cd5c8fc3e5562e5653b8396ef |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/8d9683bdb978a9f31b8aa9ed11a23381e63791ed |     
      x86_64 |            xapp_xditview-1.0.4 | NOK | http://autobuild.buildroot.net/results/9cc185083a61bda9cac2871a0e396b9296884bfa |     
      x86_64 |            xapp_xfontsel-1.0.6 | NOK | http://autobuild.buildroot.net/results/d1e1b732b17a2a7b1b2afec9e16cde993211722b |     
       nios2 |            xapp_xfontsel-1.0.6 | NOK | http://autobuild.buildroot.net/results/43a6eb488eb853ad5c13eceb91b91424048e64aa |     
   powerpc64 |            xapp_xfontsel-1.0.6 | NOK | http://autobuild.buildroot.net/results/a8b820a466cdd0b95131cd3c5293839a6d99a36b |     
         sh4 |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/85c5dde3b63ef10245ad4ce3be0e0c87385b5124 |     
     aarch64 |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/75cb79c38175b63882cb90e6247ce34b1b751d5d |     
         arc |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/9527de6bdd88aa6c6aa37e0f9b7aedd8dfacf843 |     
       nios2 |                 xapp_xmh-1.0.3 | NOK | http://autobuild.buildroot.net/results/a90b228ed4afdc15d97196ee3688ddb2e75ca038 |     
        or1k |               xapp_xmore-1.0.2 | NOK | http://autobuild.buildroot.net/results/7d9159c1691edd7fe86cd03a4d72f5251d8ab668 |     
        or1k |     xdata_xcursor-themes-1.0.5 | NOK | http://autobuild.buildroot.net/results/ddb6d634085e4e364b78b182c3c6ef9764420626 |     
        mips | xfont_font-adobe-utopia-typ... | NOK | http://autobuild.buildroot.net/results/0d524aab37b293119ca3dbe114900f401338a07f |     
    mips64el |         xfont_font-alias-1.0.3 | NOK | http://autobuild.buildroot.net/results/bfbd0df1fa77a0b8329738f40136cd53ef9c1dc5 |     


-- 
http://autobuild.buildroot.net
