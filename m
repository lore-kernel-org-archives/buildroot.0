From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Aug 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-15
Message-ID: <20160816063029.D27C7102416@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-15
===============================

        success : 237
       failures : 66 
       timeouts : 1  
          TOTAL : 304

Classification of failures by reason
====================================

                     gmp-6.1.1 | 6 
                    ola-0.10.0 | 3 
                  ffmpeg-2.8.7 | 3 
                 jack2-v1.9.10 | 3 
              lirc-tools-0.9.4 | 2 
               tinycbor-v0.3.1 | 2 
                pinentry-0.9.4 | 2 
               binutils-2.25.1 | 2 
                   fwup-v0.8.0 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
                sg3_utils-1.42 | 2 
                  squid-3.5.20 | 1 
               main/rfc1867.lo | 1 
                   ncurses-5.9 | 1 
                  connman-1.33 | 1 
                 openal-1.17.2 | 1 
                 rpcbind-0.2.3 | 1 
           igd2-for-linux-v1.1 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                socat-2.0.0-b9 | 1 
               domoticz-3.4834 | 1 
     docker-engine-v1.12.0-rc4 | 1 
                   cmake-3.5.2 | 1 
                    gdb-7.10.1 | 1 
                 openocd-0.9.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  lshw-B.02.18 | 1 
             host-nodejs-6.2.1 | 1 
              libarchive-3.2.1 | 1 
               libcap-ng-0.7.7 | 1 
                  libffi-3.2.1 | 1 
   binutils-arc-2016.09-eng008 | 1 
                   ntp-4.2.8p8 | 1 
            supertuxkart-0.9.2 | 1 
                  openjpeg-2.1 | 1 
                  cairo-1.14.6 | 1 
                      qt-4.8.7 | 1 
x264-3b70645597bea052d23980... | 1 
               linux-pam-1.2.1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                alsa-lib-1.1.2 | 1 
                   ulogd-2.0.5 | 1 
sconeserver-bbb384404575f8a... | 1 
qt5webkit-b889f460280ad98c8... | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 lvm2-2.02.162 | 1 
               wireshark-2.0.5 | 1 
                   perl-5.22.2 | 1 
       poco-poco-1.7.2-release | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/5a6932113be4bf044c1ed595510cbc7053eed1a7/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/31d3ca4977a6c94935b0a21ca43c046f004041d4/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/a8688eca9c5a07785fefb74e06730af7a5201ff3/
         arc |    binutils-arc-2016.09-eng008 | NOK | http://autobuild.buildroot.net/results/d1cf4957928e6c117960133a038c1284caaa3016/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/c6d3b7aa665932eb84f98c6a626e4234f5d10e26/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/172a23009ca037d1710efb751da752dfb8a4f870/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/8e60c784acc55e94a46fab466098899f74602d8c/
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/d826085f51b2eda312fcd0fbdabed8296301aafe/
      x86_64 |      docker-engine-v1.12.0-rc4 | NOK | http://autobuild.buildroot.net/results/dee59151a85abd23122bfbab4e8531aa467be662/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/663650edf84d026047c74c22884c92de2d245d24/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/cc9eee5bed1c202c7b503d96030563b9dc1fb592/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/bc8ca639d1fa36abbdc81d7f291bb9a768425183/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/bc56bf37253ffaaa6daec352823a0962275601eb/
    mips64el |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b9526069f60271853d33517b12fe61362bacfb23/
        m68k |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a25d846a5df8d764a421b0f2c3ef033c6b2dfdb7/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0448657e61e83b6dd9c570d7511ab3761af36b85/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/d0d0df857e4b1ae3d7821f3a15d6d8755b624553/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/c7e2b19c7c386de11692e0793a24b0dffde3eeed/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/4c58f163c1aa62a744de4a759b5379b45892688f/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/ee158ff4ca5415a6f910e65183ee0b27c1fd7931/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/e9501849cf1b8154f6898fcace5a03d46fe5ed79/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/c9143eec0834017d57d5352d6fc95b5fae38da00/
        i686 |              host-nodejs-6.2.1 | NOK | http://autobuild.buildroot.net/results/73f3fdeff9917c9865af99221aa80d3179f8b0d1/
         sh4 |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/15b9518e80158d3fc86200312120b96e672f2bbc/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/9e96d7e1ea3973eb8ee5550764febfdf4a030b12/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/606d4e6904cded6ca13343d4dca8b2e374c7c2a0/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3e61ddb351d570a4e19ae41ed9189ff0159af8b6/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/a6f564b13b960023b32f954043ad2bd64ad44c4b/
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/bb613cb69d4643dcc34da4d63d1830230187ac47/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/a366b48fbe5b033ef6c30085c9f54bdbd7e03436/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/982a7ebe885e4654a36c38aa3f2ebc0f52039690/
        bfin |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/fc2275392f145d6b4641330ad1cae8fa7ec14f2e/
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8a433077d9cf44994f8e31e60ca9067a7245a36c/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/57ac605eaadf475517a3c4ef4e7b868eefa5e3fe/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/7126c1e945108ea6530b13aecc426f643a517b65/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/d4ef3d857d9ef1d889e9b0516d1ded3793283c33/
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/08d15a082e5f43b2ae03225e4b13687962f91881/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/47d2030c4ecd793a088e284afe263abc183eab4d/
     aarch64 |                main/rfc1867.lo | TIM | http://autobuild.buildroot.net/results/95a17f08882a094c29e9972a7fc51ab8eec07e3d/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/6cd495ff36768e1122d71fd461c011fdc884e28c/
        bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/0aa3216bd2785e8024898244a6d2a5eb2e40efd9/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/49db98f6c8d6fa041df4b9d612095b45b7c9c9f1/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/b5512dc82c9f81e4d771975b175c8b3ab0d01d9f/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/083bae6dde8d30e1054fc89080e9792002efa6c2/
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/dc7e182f322c1f7e69ff27fef3b135a4ba3e8d73/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/9997cbd9f9f780eaee74700491eb03f0647146bc/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/dc5410ca270bde129cc3c14cfd60d192c659c905/
        m68k |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/446f42a58cd0b9a37fcb1d8e0f8cbfb216936057/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/947573f2b93aa748bda2a04897d6441598cbc9d8/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/4468412b0ac87174e373a1960b652a514515ab41/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/70bd880b033369a2ab3265654411774dd2b16728/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/807337642c041b1e435d6375f8c54665e541c5be/
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa66ed86ce5a846e9f3aada9e03e4387f69c81cb/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/9e450ca8c2fddc33d166d8426b2724b4fbff362c/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/846f96e57c5af2b9e6f39472f56a723c3355ef40/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/0132f1f91b970eb366672d0f5046d39b3c17747a/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/4aa874d316adc0dbce9b28b06368bf77ca940d5a/
        m68k |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/df6a467e58da263b9c7555f903727a325a46379b/
         arm |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/3dcf94dd4dc6c57403251e3b92ccb3b67fd42315/
        i586 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/eb6b41dfa6fd48dfa7e04f8569e422ee5a0ec73e/
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/de7d69c0e282a2c537300f5544d06e67826a2885/
     aarch64 |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/655f046b3bb5f7a4ea492328b608e409d6769689/
         arm |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/253c2efc9e12361bacf7407ae1e9dedef6e15e7f/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f4d15afb44f471878dbdee7c67cd836bd2b79904/
         arm |                    ulogd-2.0.5 | NOK | http://autobuild.buildroot.net/results/c42db6f8c89df87e9b55d6c7aaf6098d64d8ffdb/
      xtensa |                wireshark-2.0.5 | NOK | http://autobuild.buildroot.net/results/b5722cdfa2a4c008868f1d826d4dda45cf89338e/
         arc | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/9756b2fedee8dca95ba21a3670ff81b470a6b405/


-- 
http://autobuild.buildroot.net
