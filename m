From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-10
Message-ID: <20151011063018.DD233101FF1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-10
===============================

        success : 186
       failures : 46 
       timeouts : 0  
          TOTAL : 232

Classification of failures by reason
====================================

              swupdate-2015.07 | 7 
       kompexsqlite-v1.10.12-1 | 2 
                   bdwgc-7.4.2 | 2 
                    ruby-2.2.3 | 2 
zxing-cpp-fa34227d26e0b388e... | 2 
                libevdev-1.4.3 | 2 
                busybox-1.23.2 | 2 
                 sudo-1.8.14p3 | 2 
                   mplayer-1.2 | 2 
           host-openssl-1.0.2d | 1 
                pulseaudio-7.0 | 1 
                libedje-1.7.10 | 1 
                      qt-4.8.7 | 1 
               libcap-ng-0.7.4 | 1 
                 jsoncpp-1.6.5 | 1 
               libupnpp-0.12.1 | 1 
              gst1-libav-1.4.5 | 1 
                  libftdi-0.20 | 1 
                  connman-1.30 | 1 
rpi-userland-b864a841e5a459... | 1 
                 cdrkit-1.1.11 | 1 
                 dropwatch-1.4 | 1 
             lttng-tools-2.6.0 | 1 
               libglib2-2.46.0 | 1 
                  aespipe-2.4c | 1 
                 qt5base-5.5.0 | 1 
                  mono-4.0.2.5 | 1 
                     rpm-5.2.0 | 1 
                directfb-1.7.7 | 1 
                  libnl-3.2.26 | 1 
                  libv4l-1.6.3 | 1 
                openntpd-5.7p4 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/bccef5a71d1b125b6af61d148f80cc003b8806a1/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/836505966b36329b507527cb9aca513a1b99ed2d/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c1a5966576a692dc15255d57af6d802944d130f7/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/d5b8651e87f8e065d5957b20f2e639deb9450650/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/0a99aa03049c9f6e983f34892825f03b5f3e43b4/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/8e45395d6beacec1e03d2132925cc86dee32b72f/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/d021bdf1ea002a0e1fd40b6fb41e5588a65edf78/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9104b9d829d511f6d3b1a2f65a0dcc309c3b99cd/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0c1d6d20df0540bad8e698aa3563d914e4b92b9f/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/18835fad8c8ee516bd18a7e4a7d822af33bb0b49/
        i686 |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/a042e997bae8e58371104a93630778f8cfa441d4/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/30b98ac7362c27254218a6e521d29971070f8c3c/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2b2f6540de3cc072470722d5321c8a87c2070d4f/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c6315400eae1835d20f80e14350c3501db3856f0/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e7c8aa07e9a1ee89b813cf94e0c11819b3ce99f2/
         arc |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/be8a7f7bfe006688135ef5ae971ac07e1342c88e/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/0d0a987471ce8e9f76fc96e0ae8f0bfeadb45028/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/9392033f1b8d2c8e4e8791c90918dabbe28a7067/
      x86_64 |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/e6360386a0a99900b83494924494ec40552d8dbe/
      x86_64 |                libglib2-2.46.0 | NOK | http://autobuild.buildroot.net/results/0f6fee1a3d683ad387c0fe82f9014b6d7b3c2d37/
      xtensa |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/20e7e26ad4bdc2853e19eda596708133fae0292f/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/0225941bb21e4fe02b6e0c1dddbc3add505e6588/
         arc |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/ad7f516efeb2ea570282bdbed7d62d0745e21507/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/c24e14d45d8d1c52607d0ee76aa2b27d9aef7af9/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/ed02f41a005433c6221a754efdfec4cd5031b852/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1f0edba2c74ed995ea9f30215d210a857979186c/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5c294de897d87caad44bc09d4e28a4899d344d9e/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/767cb37d7c99f419778b798e58915d2d8d754de6/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/5acee303ce62b5f3380ce24368d785529ea2bdd5/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ab598c3c3df41a2c90ac52bdad6f757740498784/
     aarch64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/aec720e8ab05fabeca6d47daaba6f21644831ebb/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/8377dfda31781b87e23ffc7541a49e85b09c4f3c/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a476b21a09345d1b0996e65b9d9af7e09cf40c0d/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a38b1737e024da822006163d047c94fca196cc81/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/857c3ffa08b8702792527bdcd1091822ffa9cc73/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0793282e6fccef6f43429bbe7484bdc20a68f37a/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/f18ea6aa7b4f80c80fca1f3a6cfa5a05d8b6c695/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/ddf5f10661f97a5a1e8bae5349c539ae10b9d03e/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/68681b6beb16482d5691766ef96b108a6938dc70/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/5080562427b90aa6f045112b0db02aeb5caade53/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/7a770908246c7d75f233d96e8d3583e04a9f8d4a/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/c262ff22812aa2c601abe753f58e8413f37ab7bd/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/efdb9f5f7a5c1bc9f774cc1d83cf958804517056/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/65a5087f125d33424e22f752d2a3fff2c1028c1f/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/be2aa9f15457fd20e7c2fe19d8e1d1ed2118c079/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/24119f368d4a9d6a46fd6af90f83373f6e9b6762/


-- 
http://autobuild.buildroot.net
