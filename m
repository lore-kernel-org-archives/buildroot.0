From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jan 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-24
Message-ID: <20140125073008.54D11100890@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-24
===============================

        success : 59 
       failures : 58 
       timeouts : 2  
          TOTAL : 119

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 12
                   gtest-1.7.0 | 8 
         openpowerlink-V1.08.4 | 4 
                     vlc-2.1.2 | 3 
                   open2300-12 | 3 
            libvncserver-0.9.9 | 2 
                libnftnl-1.0.0 | 2 
                       unknown | 2 
        ltp-testsuite-20130904 | 2 
                 webkit-1.11.5 | 1 
  toolchain-external-undefined | 1 
                  libeio-1.7.7 | 1 
                    sdl-1.2.15 | 1 
                    mpd-0.18.7 | 1 
                     php-5.5.7 | 1 
                 mplayer-1.1.1 | 1 
                       kmod-16 | 1 
                  libogg-1.3.0 | 1 
                  poco-1.4.6p1 | 1 
           libcec-libcec-2.1.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
              gstreamer1-1.2.2 | 1 
                  weston-1.3.0 | 1 
               qt5script-5.2.0 | 1 
                    systemd-44 | 1 
                    crda-1.1.3 | 1 
                  thrift-0.9.1 | 1 
            vorbis-tools-1.4.0 | 1 
                      icu-51.2 | 1 
                 pixman-0.30.0 | 1 
      libnetfilter_queue-1.0.2 | 1 

Detail of failures
===================

     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/8b4ddab2807b6c3c0a2e54f4ece36c3937278284/
    x86_64 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/a7d3bb2b1135c7f27bf78c773d216b158ba90f69/
microblaze |               gstreamer1-1.2.2 | NOK | http://autobuild.buildroot.net/results/381a7d1f841d7186313147b99413f2c3e217e85d/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/0d54439e7a722680f1988deb035a0236a18fb41c/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/a92cb2ffe7232e7c59f71cc582c966524bc6b0f2/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/4bb7863476c673ec764f2903443437a9db2f55dd/
       sh4 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/6406219b3db8b4099a339442cbccc0cfcd38153f/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/261f3c6163adc5800ede942401411bb56f26aa79/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/f7b4cc58db8a8c503036f9f07cf8ff7ddf492ada/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/2723611bcfde02b6964a015a1e7e181c17b26e68/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/fe2de2c03b620b535482c4f148ccdd31d058f04b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2ab50852c11a90e15ee76b5e3c9bdeeb2cac7336/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/c50bb45b76c05260418cd620353d3fa65579179e/
       arm |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/348eb08954d4436552859331457dedefa2e1dfa7/
       arm |                   libeio-1.7.7 | NOK | http://autobuild.buildroot.net/results/2c87118802ee6856843efc975fa99a94f3cb7219/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/c90ed5af2042c5e15785c3e09bc538c846ea58d2/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/9008cc41324032769588acecad863fe5c1166180/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/acf5d126cde72fde4f4f931cc1c9b37418067395/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/d1d29da3bbe2993c802e773e29fd3b0d76228da2/
  mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/30d0f24a3023d1092047d3bd367185f33a1a5abf/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/b6f805c9296847d86722acdc2484b2183fff7fcc/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/a6bdaec762407b46781a4bd2e6bc757199d28da9/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/2129d97295a2503a526a594a126718a91653717c/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/73b120637c15c05d7a9b200bd1dd0e7f2d993099/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/08a65e14515d487c590fe22f9cf29dd9d655eec5/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/9bd5c9df218d1feb8615c6ccc6805dd75fd00f92/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/fe0ec4db9dc8b630364e4f5ec0ea90767e19ebbb/
    xtensa |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/5d36181ac2404f4e373602a931749d908bf06d5d/
      i686 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/b33008d260c95bedc52bed48f191f76843612ef9/
    x86_64 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/0ec767e70f0c358006e16d5a24bed2c8b45d2f19/
      i686 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/0d396ffb86512dd1539fe8a01a51abb54d9d6309/
    x86_64 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/c464bdfb8edaaf69d49ade92ef9cc6f45cc73362/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/c0a57f765ada019f49276694d5ce3023ec1d4a71/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/15d174714be42497c17414ff4d60c69dad6afcc7/
     nios2 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/3ce9d6dc5c4e8fceebaa461e5085da7f33fda8a1/
    x86_64 |                qt5script-5.2.0 | NOK | http://autobuild.buildroot.net/results/040263f14c1a2c4489db9c13bc9dbdc52ffea6ae/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/887e7a066c3afaf44b5da2e343106d550c072f18/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/d719f91019d4e58c7f52dd0bd2f1103062a69802/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/7e659466ec83f289e8aed25d87c6ecb34ba7262d/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/77a5dc2158830bec20187c5d46cf207a0926df57/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/3ad33f6c256626da13217277dc5ad98299d3fb4a/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/a0ec5e9b5c65a7f2ad049f79f640cb9a571498bf/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c7284a7a138446a991132352eb941d9e2e334685/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/765b59a66c9d9f9134132a0b5ba4aae2f1ddfa5d/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/afb797f680790b22cb5616620aad6d3651d00a4e/
   aarch64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/78e634e35af01b1e8adc02e7ea12580dda2e58ef/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2c7c37bc62d163a7f9c06cc45adea25d773dfd0f/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/381c174821f924bc8a617d3cc46f5187eaa1c888/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4d4df2c61fa6544f4a25f514dc133db2b4a27970/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/bd9c485584938f4f80e1c4f19a362af777e40279/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7cc749de5b42734208652c244b2f2690c257105b/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c2924191b21e4df1473ddc9d0cf68c62f3a4e78a/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/6ba94c5c7453be0f89ec248dc5414cd1d8b91f35/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/fb8f15b7fa72c32334539643fa09914e3f7aed62/
   aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/7b6883377e6b76b3ce2021ebc4973a0c5cb8ed9e/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b637658aefb7458f548e0204dca400e6d41b8770/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/c7ee30dc6c9f03c035d8cc44de3ad83714de01cc/
   powerpc |             vorbis-tools-1.4.0 | NOK | http://autobuild.buildroot.net/results/5ab4614f11dfe15495252a4474c83fec413f5d25/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/53fc174701a655bf354056eea3e41c392a18b48e/
   powerpc |                   weston-1.3.0 | NOK | http://autobuild.buildroot.net/results/424622dae83853e1a19d86be857fc292521d0ef5/


-- 
http://autobuild.buildroot.net
