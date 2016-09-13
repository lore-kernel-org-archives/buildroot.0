From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-12
Message-ID: <20160913063030.2CFF610473A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-12
================================

      successes : 206
       failures : 86 
       timeouts : 3  
          TOTAL : 295

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 15
               libupnpp-0.15.0 | 11
              buildroot-config | 6 
                blktrace-1.1.0 | 4 
                    mpfr-3.1.4 | 4 
                 openal-1.17.2 | 3 
                   fwup-v0.8.2 | 2 
                   glog-v0.3.4 | 2 
                  libcdio-0.93 | 2 
                  libffi-3.2.1 | 2 
                    mpv-0.20.0 | 2 
                    ola-0.10.0 | 2 
                    qemu-2.7.0 | 2 
               wireshark-2.2.0 | 2 
                     xen-4.7.0 | 2 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
              e2fsprogs-1.43.3 | 1 
filemq-e59951489045825d6fc5... | 1 
                  fio-fio-2.13 | 1 
                 jack2-v1.9.10 | 1 
libcec-2c675dac48387c48c7f4... | 1 
               libepoxy-v1.3.1 | 1 
               libglib2-2.48.2 | 1 
                libxslt-1.1.29 | 1 
                 lvm2-2.02.165 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** [libavfilter/a... | 1 
make[2]: *** Waiting for un... | 1 
                 mesa3d-12.0.2 | 1 
                 mono-4.4.2.11 | 1 
                   ntp-4.2.8p8 | 1 
                 openssh-7.3p1 | 1 
                privoxy-3.0.26 | 1 
                   pugixml-1.7 | 1 
                    putty-0.67 | 1 
                      qt-4.8.7 | 1 
          sane-backends-1.0.25 | 1 
                  stunnel-5.35 | 1 
            supertuxkart-0.9.2 | 1 
                     vlc-2.2.4 | 1 
              xmlstarlet-1.6.1 | 1 
                 xorriso-1.4.2 | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/672389460d8c3dba1c9d20a4a1e1bd5ab94ff3cd
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b78edb93c161e704c6f8fe3eae886cdb06dbfa73
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b40aa7cc962b019fe56f6207e5569759bc647295
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/50feb4a65ea812ebb457af115dc1951b3a9da4ea
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/7dac290339d70549429f28dc36deace7610b8e8a
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/a6765a91e7367ebcd0a59ebfaae096c57414ee5f
      x86_64 |               buildroot-config | NOK | http://autobuild.buildroot.net/results/526678e897b187663e5194b6aaf791cf8f986302
        sh4a |               buildroot-config | NOK | http://autobuild.buildroot.net/results/a772003ad2309d9ba8ad1bc3d5f78b0b7b2360aa
        mips |               buildroot-config | NOK | http://autobuild.buildroot.net/results/de65e46a44fde83e428f347202f28c47141bc7ee
    mips64el |               buildroot-config | NOK | http://autobuild.buildroot.net/results/34339662359546c1d425a81f6f9f3ba6fecefbf7
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4db8d90f67bf3f8733dbe59edddb930847d8a93b
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/975a3d9d12145512a46441b27f35954479058516
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/9fb0989af55419d84d0222a9b2f9b070e6677878
       nios2 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/cc709b9579f2871f83884651004f5c573fb7889c
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/3f4c28792e85856d1e51316d7bc11566823d3989
      xtensa |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/8d5e09815017cee237a48c5444fa704b35ed0e32
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/59aecda55771514c53a92ee3b3d8073247e43ab8
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/6112c163691a0d01d1d154e193597b627bc28728
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/02348eeab8399431749f428e0e8eef7cc3333b87
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/7805b85af2d9af7c4f9d5933736e22623ab9dbe9
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/1062dc1fc8d87770cd68c49e9713cde02c46843d
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/29a464fdbd9b7b6c61116e9f146431e2173ac7a0
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/f1bde2789351d48522a4eaab5e9bee53022dbbfe
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/59bbb40c514938f9f8e45a6b23455cc9a2daa7a2
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/909ea7001338485552e7b9b2ba014aef16cf6f52
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bd37172223c090447b9e408a6e7976438bf4bc4c
microblazeel |                libglib2-2.48.2 | NOK | http://autobuild.buildroot.net/results/6a744ac27f7901d99615334e4139f80348dc5bea
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/f8eb38ef79160e1f646dae0be19f27fae82a58bc
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/158e0ceeff009146b78a0d2bb278c76479bafc34
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/1760cf53c77e16bb2b5bc795bd0ce5eb65f258f2
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/5b73e52495aa1bbb2c704492237da784b9d74bc2
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/6d922a1bbace024fcf040beb49bbb119036865ef
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/bebb8983e7579ee4b4bcf18f037c7797ab86f8db
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/0f1a5832ced2a6ec2e18f9f14197446fda6af692
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/94a9cc349f23a47246b06619a019bcb917493415
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/19fba094098af5c1ce1e1371e5e88393c4a6ac9c
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/578935b5c04005d1f096059387d16911f953ec6f
       nios2 |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/2ad698f1665b7b886141672181cb76ec3c40a743
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/4d5b8270a0d08e173927c89b05aed45ed88e71a5
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/65b6c9558e7083bda12ce66cb3c2b7bca19677e2
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/7414b9f7cb642568e2c566305101adda8ca49475
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/21184cfbc42c3792569ff2e794f15802a3e3cc06
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/562f0d68bc31e118436ab645fe56e712276da66e
         arc |                  mesa3d-12.0.2 | NOK | http://autobuild.buildroot.net/results/7f67a9fdd194e73bf9c1a9d04e12592046140f07
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/3d4598627c1c3728c2a526805459019f35d43bb8
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/9c158ce92f93e31f19f70fe01bbdcd34b0ca5214
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/ae8bab903991dd0e270760ad5830b4f685b8fd12
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/38a21d50a410ddd81f44dcc64e16daabbbbd3731
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/254ad5f1931123f84eff6267dd6a195dfee614f7
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0df45ef7380a95885b5f984ecf015446ff591a66
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b4b54b63fe5eeadb3cc480f6cfabaea6fc17227c
        bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/e40ea02f14517f5536542ea232931f63c1167bdd
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/fbfed3be9ac9533326059328991ef6a0ce0b7262
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/25287b3d48198c5f0b7c3cf4850506e31bd86d55
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/1276464bfbe6a4d2af480380bd9249d6508ca090
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/1df7ae3976f8511ff30158f3da29f2fe015be4ab
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/0e8815b79887f9abe04af844178c0ed788767d39
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/cd981da8999d945f7acfd41cc002621eec66c5c9
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/ad2d6a3e106bffbb56517f395b86f839379339b0
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/fd3c2abd36f8feb87ffc28e2ff5ba6a7c7da1c36
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/1e7db93901b205c576e3ef4ac84948b9a295f904
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/6b5a7816f50699d041675aa87c478dc1ec67e309
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/0962c5eb4942c1561c57af63ca10c66568c401fa
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d107293dc70ef451f17e9c6afad6087bd8ec203f
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f656521337dd07d33bcd7dc9ca75e06f60a9dd55
        i586 |                   stunnel-5.35 | NOK | http://autobuild.buildroot.net/results/20e18607cfa44fc4780f6837150dcc7b8ab838e0
        mips |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/44a96dc980eb96b9082fd16c0e87837caaed65da
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/292da220c352e4087e97ffaee21fe726de2a5aeb
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ddcb0d044242d7d973a84d2160c19d5ee4d2d496
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5ed16284913e69a3cc031401cf4a1564723e70d3
microblazeel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4a945e4ce148b5d98d9cb7e39b1f89a605924697
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/28c3aaaba66d516f4ea6777dbc49a4b3c706dbce
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0ef7cc09706591243ce9f528cdfa4ba9aa0af629
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f2140eec2abe6857bd36043fa1d2a86a1c09ce96
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/69c8ca077e4fb522f5dda9b23fbe26cf0622b00d
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c138a7f0b2339c7daf2559c8ed63d6a577c788a4
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/721d8942e9c34f641988c4e1fae7f35b8bbad70f
         arc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4ed1e54946b246206df0a0c58f51e5ca93f1ca10
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/342dbbc0a8fe500d15d1424f524a2f3f61c00235
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fd683fede5c2f42226f501b9a70772581f856dda
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a4a436eb9cda13d0649d05042646a44252fa51d3
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fb6eb43272c9ca912055ecf20c58965b3dc639e4
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/58ce1c9559d3ba01334fa253ec4aa7fdf38664e7
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/3710804ad6f854bf122cddd20ef656458c378d1e
        i686 |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/e23bb5f8fe818ff9ca421a4f5d2956771921eb2a
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/1ec4fa92899cf635a67c6941d036d6f73616e5d2
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ad7de82aa740e3e394fca3a58f08fe931ab31f46
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/247b3671c23ede40c5e5bd029327ea92787b6c34
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/a9a3ec03a30e520b61016e35ae469ae5308b6233

-- 
http://autobuild.buildroot.net
