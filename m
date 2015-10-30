From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Oct 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-29
Message-ID: <20151030073019.761A9101B8C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-29
===============================

        success : 145
       failures : 95 
       timeouts : 0  
          TOTAL : 240

Classification of failures by reason
====================================

              host-perl-5.22.0 | 20
                   mplayer-1.2 | 7 
                  ffmpeg-2.8.1 | 7 
              swupdate-2015.07 | 4 
             python-spidev-3.0 | 4 
                   dvblast-3.0 | 4 
                  vsftpd-3.0.3 | 3 
       kompexsqlite-v1.10.12-1 | 3 
                 gnupg2-2.0.29 | 2 
                  qemu-2.4.0.1 | 2 
             host-nodejs-4.1.2 | 2 
                    vpnc-0.5.3 | 2 
                    ruby-2.2.3 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                    iperf3-3.1 | 2 
                 libpcap-1.7.4 | 2 
                directfb-1.7.7 | 2 
open-plc-utils-1f6e7e372b31... | 1 
                  connman-1.30 | 1 
                openssl-1.0.2d | 1 
                rt-tests-v0.89 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 mpg123-1.22.4 | 1 
                 sudo-1.8.14p3 | 1 
                busybox-1.24.0 | 1 
                pinentry-0.9.4 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                 jsoncpp-1.6.5 | 1 
     openvmtools-stable-9.10.2 | 1 
              gst1-libav-1.6.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
                libgsasl-1.8.0 | 1 
                 sdl_net-1.2.8 | 1 
                elfutils-0.161 | 1 
                  boost-1.58.0 | 1 
                  c-icap-0.3.5 | 1 
               util-linux-2.27 | 1 
                      x265-1.8 | 1 
                  apitrace-7.0 | 1 
                mongrel2-1.9.2 | 1 
                     tftpd-5.2 | 1 
                pulseaudio-7.0 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/fb7d7a16e2537f175a9b1889d261d65e4a9eaf48/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/07c2f2ddf142404a658dd293ac09d2426717df87/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/86430674cb66a3944b12c523bd937474e6e49391/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/567ec08c1f0349148d923ddc7058490a1720cb02/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2403e588f85a1dd69199f56b7190a5e64b6f7b94/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/9cfde17e6580c043b18402147934721fc03743a8/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/14e3a2531686c5c39d21064bcf27ea484e44f523/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e89855dabb577847f8f25c4cdb5c22144c9cd8b3/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/0647b0180ac9a6bf6172742e388df9a9e584d91b/
      x86_64 |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/a434372d84544116e7bb4a88c0ee437ae0578007/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/dfa75de3b37aeab2f0edda9e3911c1a80014400a/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/1f02f84fb926839a1adbe3af457bb909fdc44433/
     sparc64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/5a0681737aacad554a2e05d6d6ec713c9800d39f/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/7a46fb56b9dfdaede8102c76c45a0d939fd354a7/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b17ffee4b25c1a8872edfae24f27c039828e7185/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b52e01b87d92ad2bff26e5d02675eda07b7eb6ae/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/487287fe1dc960ca487465b6fd1498712f58244e/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/50a59aabb603f2c96b2365ab417f40f70153e67f/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/60c01051ccff6ccfa669951a5bf399170afdaf67/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2ba3fe3a8515df5b506b44e73aa878363256042a/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/5d1ea3607f8e6993ff6306666cb8a7c0a177af9a/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/4c00e9cf3fbea0b6a406701a4a0b22c1dea566ec/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/b8ec4269ef974b8348ceb305d2ae73e4c581ebad/
      mipsel |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/aa52f6cf13d7d2a4b0ce053636e2f1d837a8daf1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/843076e5d798ce762833c665e8b4b07d98834538/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f5bacf3c5532c64182c8120c9260df1e1fcc2a27/
         arm |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/9b293f28e632e3430907f89d64838f54c7e3ad0d/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/7adb96b45cb539c46940908d4ce9ca78b6a84d81/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f7ad1111a1bb5643d33e71e17f7c59e1aea1a72e/
      mipsel |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9775cb190a86cfcc7f775cac3ccd1cf18213c391/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/bb36e41c565644b9e3202fbe091d90963a3ef007/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/67e668d7ba2cce32cc990465e41c2666a82f9e5e/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d236a3997b29f445e9851bdd5c271330abf1f95b/
      x86_64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/35cf6ed876385a84a2b5fc8277919e9ee94f523f/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e2a51576726d9fe31929b7a7a6e0ad362f287fbc/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e7cf862b279cd39993eb1a2eac200d1febbf882e/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/ed7a704229a22e9692885f66fe5af4bd4dac45ec/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/e265ec4ee47b4281f7bf0865b507b1e83340fe71/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/d58020ab3c022c0c1fd9beea2307b29219936cdc/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/83744880e90545017595baed7a2aa01b56b58aeb/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/ad1c9dfeddc3263160b09a943265910a55d6859f/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/59394d642694f047e292a6fbb91ca0cfae3ba5c9/
        i686 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/7d737bba518821a7b2c0839aff733f1735769dbc/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/375be063f1fe59b9471b69a377f5f6acd2aedf3a/
    mips64el |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/4896c646eb28a9e8af642b9edb4f60615c15ad04/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/f8c7917866a77a0834606f490a7f98d69060de5b/
         arm |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c4309610a4565759c6a805664b6f57e46ffdc85b/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/dd4ef61a298e2a7e5cad33fa624a59cacc868397/
        sh4a |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/4a2e12bae1d1591b2a4a87cc08ac6c305d7d377d/
       nios2 |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/f41e349597cfca5731813e7a5a9503a51fac0f1b/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/2a3d512eb0b267f47e3ed2deb2328c0de9862ebe/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/85d1fe22bfafff8fb67325724ad0b8607d1bd11b/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/bae65fb0c54422d5bc4b57bafbc0d8b68eea5b75/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2d2f4977a18110e704d1d812214e6a5b94db94dd/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c06fbf38172b210533ed1f922241bbc798bff998/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/ddd797c4ccb27739534e8de42d059ace1c26acd7/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/ef92ed589139cd47f105a3846e96dd29015320aa/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/8bf4dd3dd4cb3398297e5909de6774163c00a92d/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e035c1b6f106c4fc4824997ff92d39c946ae75a6/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/5bdfd2aa9de568d0f7be27ffb18d4541b0e1be0c/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1c8ea24229ff3541b3fcbaa286cc1bd569f01d2e/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b41ea25564b58f2db7792bba700fb19a36c6aa64/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7c5a83caf0c2a230891cab138204b428feff236e/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/571bafeec2969a9f869d0eb826d6ca108eb530a8/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ae25c691c5a4355f7dc3f0bd1a134b6a4911927f/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7e77b20ad3e6f11dde2ba579aeff9ac8dde0bea2/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/99b71257913500207e0bc4eb7493b4fdced3be68/
      x86_64 | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/5824f101d21698d562e9836c571ceab6fdfadc29/
         arm |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/410a420f392ff1f958bb633414753f950fb8e41d/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/4d781212f5953d6e10ab4be825c22559ea07bd5f/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/02f52cc7a83d6c9df267d01f0478925ebaf1fdce/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/1770f3b2e3e2715ad0da3070502b3d838ed8630c/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/3b3f265ab79a987a0b06d065b7c4bcc88c7d416b/
        mips |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/abca38e3e93b609c1040c1152de7cd59940e2c88/
        i686 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/654e9be2ae6f4925db3307b956e35e7f16c92783/
        sh4a |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/61ca523bc59063218a75715c3d6bf7afa61fe172/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/0c76a68dbb3b567b633d4bbcfe2e0a5c78634fa3/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/cdd4fba9533b646685f7a8078cfef7d6f8196b43/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/45fffb85479a2db54067f31979921d67e2619023/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/af4ebbe694aaef27a63f315b394dd036c2847131/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/5ad78c2f53a6afebf1e349656ecdb1a38bd86e08/
         arm |                  sdl_net-1.2.8 | NOK | http://autobuild.buildroot.net/results/ff50c2a17f522abf0e885eb46f05bb0299d9e813/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/bdd3e5352aa283b96717202a794f9762d15cc736/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/a1a52b12b7d2c4a6568c0de00d626c29bd2e539d/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/777949e4b55de0ec1cdb1101a3a45801d818e719/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/08ce4ff6aad3c5161eb36fedf5431209d7937784/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/208243a52e07c9f319d4720c178b747b68cf9f2d/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/0dd6c15b2345b4bcc6538d79362e3fd6a7aaa3f3/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/5b7eb4b0d2f7d9b4774c205a8c3f9278a986a80e/
         sh4 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/97e39d59adf3797fcc7519d15e6be58e37f2862f/
     powerpc |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/1fd102da247364302aec3abd29ed77ee5f10fefe/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/bfbdad71cf43c8873b8a9fcd310d3617ac6f547e/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/33ede4b0fc2e0050f8a5797c43e41909abe118f1/
     powerpc |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/0b7e7b20b4824eda514d428ad2e8b0bbe080e168/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/a5e3425d5ff5f320ad5e71e71a7d869087598c09/


-- 
http://autobuild.buildroot.net
