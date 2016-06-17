From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jun 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-16
Message-ID: <20160617063030.E8662102687@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-16
===============================

        success : 157
       failures : 165
       timeouts : 0  
          TOTAL : 322

Classification of failures by reason
====================================

                   efivar-0.23 | 17
              e2fsprogs-1.43.1 | 10
              host-libxcb-1.12 | 8 
     python-pathvalidate-0.4.1 | 7 
                flannel-v0.5.5 | 6 
                  boost-1.61.0 | 6 
              freeswitch-1.6.9 | 4 
                   fwup-v0.7.0 | 4 
                   assimp-v3.2 | 4 
                  autofs-5.1.2 | 3 
          libmicrohttpd-0.9.50 | 3 
               libcap-ng-0.7.7 | 3 
              librtlsdr-v0.5.3 | 3 
                   glm-0.9.5.4 | 3 
freerdp-17834af7bb378f85a3b... | 3 
          host-faketime-v0.9.6 | 3 
                   libxcb-1.12 | 3 
             rabbitmq-c-v0.8.0 | 2 
snowball-hdmiservice-f75c99... | 2 
                   lua-ev-v1.4 | 2 
       liblog4c-localtime-v1.0 | 2 
         erlang-p1-utils-1.0.3 | 2 
luaexpatutils-88c228365b084... | 2 
bullet-19f999ac087e68ffc255... | 2 
         erlang-goldrush-0.1.8 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                openssl-1.0.2h | 2 
                fcgiwrap-1.1.0 | 2 
                 log4cpp-1.1.1 | 2 
libdri2-4f1eef3183df2b270c3... | 2 
                pinentry-0.9.4 | 2 
                  libenca-1.16 | 2 
                 opencv3-3.1.0 | 1 
                   luvi-v2.7.2 | 1 
               gst1-imx-0.12.1 | 1 
                 mplayer-1.3.0 | 1 
                     vlc-2.2.4 | 1 
                    lftp-4.7.2 | 1 
    bandwidthd-v2.0.1-auto-r11 | 1 
               linknx-0.0.1.32 | 1 
                mongrel2-1.9.2 | 1 
                libmpeg2-0.5.1 | 1 
libcofi-7313fbe12b0593034d0... | 1 
libllcp-05dfa8003433a7070bf... | 1 
                  gamin-0.1.10 | 1 
                  openjpeg-2.1 | 1 
                 libv4l-1.10.0 | 1 
                directfb-1.7.7 | 1 
        python-pyinotify-0.9.6 | 1 
             tinymembench-v0.3 | 1 
              gnuradio-3.7.9.1 | 1 
           erlang-p1-tls-1.0.0 | 1 
libwebsock-3c1615eeadb0b582... | 1 
                 ipkg-0.99.163 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
       gadgetfs-test-undefined | 1 
                 jack2-v1.9.10 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                blktrace-1.1.0 | 1 
             libseccomp-v2.2.3 | 1 
                    norm-1.5r6 | 1 
                 lvm2-2.02.155 | 1 
pps-tools-0deb9c7e135e9380a... | 1 
     input-event-daemon-v0.1.3 | 1 
                harfbuzz-1.2.7 | 1 
          xinetd-xinetd-2-3-15 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                  connman-1.32 | 1 
                   mraa-v0.9.1 | 1 
            libopenh264-v1.4.0 | 1 
               libupnpp-0.14.1 | 1 
                libiqrf-v0.1.2 | 1 
google-material-design-icon... | 1 
             bluez_utils-4.101 | 1 
               luaposix-33.4.0 | 1 
                   libsha1-0.3 | 1 
                    gdb-7.10.1 | 1 

Detail of failures
===================

         arc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/04697d84a727f05d2d7d818e01cf852885719cb6/
      mipsel |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f6452c4b0a237219b6ae28c8bb3cf665ad40139f/
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e9aed367394c6a4ac7b834139b5601e844ba4648/
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/747487c1612ca3a4906c9650c3accc6b8c1c4b0d/
        sh4a |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/5f76ab96ae6f65a3dd753e40832489334967326f/
        i686 |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/417a145d3f909e02ccac90e63eed19a806a87bb1/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/458cc4d832c8b83a34d4194956bcc9923f7ebb5b/
    mips64el |     bandwidthd-v2.0.1-auto-r11 | NOK | http://autobuild.buildroot.net/results/b8d1967aeb0059265f132162db98a14f48b49565/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f9902b92d4dddc2385f4afbcf60fe5863e566a07/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ebeb5d423791008e4817ea9d7bcc77b36391ba32/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c6375199b4494bfd66bfb5142b506592ece5cd79/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/6b84bbe89997f53fb64c71fe61d4b7ebbdbec642/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/c23ac7bad59a10cc688633e3a4d0371266623f8b/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b15a04062fb441c65b2183093842ed0eaf934a75/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3f68ccbcaf1690cb131fd117093b6ba9f2a3d198/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/71161649dd0bb1ba072e0c686806a612b0447556/
     powerpc | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/39bb344e3631e5f8872336cef981db5c6ec382c1/
        i686 | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/21a863cc12e08318fd39ac13644780321e40d2ab/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ae894bd168f999e58210eb6b81c88c158d9fd2ae/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/385a57aad7f2f903a6f31b78789419ef6fab84a2/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/47d9d236398da7a0a376602b51067ae1695a3df2/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6d7074d06c4044c3c12b23dbcadb9502c7123ce7/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/8c005876753f80b8dd4baa5cb8c1957caa08c5da/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/caf9165b3a4898ec1b481c131103e029f11702bd/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/d3a1d0301c1a9f22ace388119b8fd63bc5825031/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/d796b9d4fc892c7862b52f24242725dff2123855/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/eda4e2484f6d47038c03cbcb41f47cc61a450fe4/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/441104627e8cd316fef8ccb259c1abdd55c25642/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/4f0dfb197c9faa2d53d61b3ca904a98565fc2ed6/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e5f66b6e1e596b6025fa2501fc36db2a40aa0f19/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a510f00be64e0ae82c874b2e67d5e6ce5edbee9c/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7c0b33f724ccc8c277b83cf777b3026923e083ce/
     powerpc |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1d944b5ff92126305dac313dd32fec21e23c3857/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/83f70fe4cd17d6c49bc0dcb1efc1271524ec4579/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a5abeebfe4dd1f5b58d9f50397fde68541230fc6/
     aarch64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/a09b8c869f294e92215c58fb7268144619d7f149/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ada332bf6ce3a7412a6c2bab54edaeb4c16af324/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8c79eced421c83130e54cc1e6a9221d2c789e803/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/96f0136508dccee1a2a79dd6344c8746189b1524/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/faf0fb27598beac028442bb10e98926206201cc0/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7906b8e4375a2d2d17d1725eaf8a832829442e8c/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/02b659742f60337b20d98c88e344278d6fc43366/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/40db9a56c5b8892d6357fcef9233fe49b79809e9/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/40d25289f169f1effa9dab13442cde0771fb6d5b/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/766e6da6afd40029710ff48481867cbc93849803/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7e503f4dca9763646c5aced634a76a1f665eb6a5/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/34463cde38ffbfcb8faa8e8feecc9cde641555e6/
     powerpc |          erlang-goldrush-0.1.8 | NOK | http://autobuild.buildroot.net/results/07463f3478f334ab9c7dda2dbb2a02b4f29faca1/
     powerpc |          erlang-goldrush-0.1.8 | NOK | http://autobuild.buildroot.net/results/78e9108ab7de8834b285901581c1072f44910ff8/
        i686 |            erlang-p1-tls-1.0.0 | NOK | http://autobuild.buildroot.net/results/7093fa5966b55ecd550ef1bacaeef50556c40fd4/
     sparc64 |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/61f07db8bf6e14d2fb317931f8b2792914e9072a/
         arm |          erlang-p1-utils-1.0.3 | NOK | http://autobuild.buildroot.net/results/1cad536a6db915b04589172b898c4f35c7e2b7af/
      x86_64 |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/b6200a14da6445eb68915d52211035e326ec82f0/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/4f9004e95c6e05ece48bdc9e21a9f072e19860c9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a37647d10e98c00ef32c5cfe8043438886470d25/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/af9850bd2c7e94149ef5def5935c138dc70171ad/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c0ac7cdcfec7c307d41a6a59a7e0c8ad0f433499/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/74f3b3e394ee22bd7b2cb990b9c85982d090ea74/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/201b7840c6241e84713914cb84af88b7c57851fb/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2f30863abf86405014debc706739da86caaa8e12/
        i686 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/62b2dbeadcb93f821a27d0ff6078b38bdbc44970/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/1188a06b389072e101061f163f1b7f9fc3ecd092/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/f3c8346817e3fe9b995142bb981a3daa023b635f/
         arm |               freeswitch-1.6.9 | NOK | http://autobuild.buildroot.net/results/0154ae1adc7eab63f42849b267361dceb0f620ef/
         arm |               freeswitch-1.6.9 | NOK | http://autobuild.buildroot.net/results/e20c0b9a32f6bef5d43369437895058d44d0df58/
      x86_64 |               freeswitch-1.6.9 | NOK | http://autobuild.buildroot.net/results/08806842e5dceb12f37738864c65f2941539d53c/
         arc |               freeswitch-1.6.9 | NOK | http://autobuild.buildroot.net/results/aa4d681de85497c2cdd2b0488d9b4569160b5f02/
    mips64el |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/592d7813fb9f5db98f98b1c157289f5194760b1e/
         sh4 |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/25a31c3fc08a294e388f994aa6974c0ca668c4d0/
      xtensa |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/7e6af2617d755674c8c7ac40e8b1d0055bbf93b2/
    mips64el |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/54574c316b7414474b83704f4ef2e9407a748b9b/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/8a01ce05d61646a04a1d11bcc1de9601810ae79e/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2d9299f4518e04143886deb97e5c1836ead3cc10/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ff4786d52ed6f1a8f755b805ce64b750b793c9e7/
         arm |                    glm-0.9.5.4 | NOK | http://autobuild.buildroot.net/results/7c731ceb377ab8710c8afef2829b26f3d0cac0e1/
       nios2 |                    glm-0.9.5.4 | NOK | http://autobuild.buildroot.net/results/ff5058cb59282a8746396f21d700bbaefc859a2d/
    mips64el |                    glm-0.9.5.4 | NOK | http://autobuild.buildroot.net/results/2c308c9f63b86f75b4ce8293f8bd1211cb9f4819/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/cd4462a5b7ac25a477c88e468dfa96318b95fee6/
     powerpc | google-material-design-icon... | NOK | http://autobuild.buildroot.net/results/1de6b6af2e7757bbc575d175b6d822b92f485bd3/
         arm |                gst1-imx-0.12.1 | NOK | http://autobuild.buildroot.net/results/2d1b5077a7551cebe4b961d6ce1cf844ad83fb8c/
        m68k |                 harfbuzz-1.2.7 | NOK | http://autobuild.buildroot.net/results/aa5b91166dbe07f74e38d55287563f695b7f77a1/
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/8724d7335a699e162aee5f25d8eb2e71310b5c55/
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/a5f12f44a2b5d758aed5e4666897cb6eedfc1444/
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/cdb6a55efa0a3d86e213aba55ddaeb52d24cf1c6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/98fbbf4911d48c7a85856a26430ad38b31d5c8f6/
     powerpc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/1aa8633286c884bad39159d70b2fc37ec03a26ed/
     aarch64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/4c6d5817f7e9c33a7f6dec73fa1e162c8e568a3e/
    mips64el |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/3859559100fba42284b865190a2173359f0dd979/
         sh4 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/4f02caa0fad3689efc4b4d3e0de5f794e9943214/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/3b789a931d4a1726b95183049cceab27393458a0/
     aarch64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/51e57f9b2c507531673118eb66ec330279cb6ce0/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/a66fd89115e395f6e54cc40a3637920b86004bc1/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/3ea66082df54b27394a0791c1c5661cfe7d751bf/
      x86_64 |      input-event-daemon-v0.1.3 | NOK | http://autobuild.buildroot.net/results/3e19c1a6bd534c6c5a0be4e68fc272564685e8d8/
         arm |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/a336aafef0bf0347850f2ae1928c0d9aed1cabcd/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cc3590d9c602b38701398786741fceb612445b92/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/36b7f2945c0aaaa0b1e9cc0ee1c2549fe0903414/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/b64216fb1df7b6127a521f936a94c6b2537ebed2/
      xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/a8ee3adc7f4d83252932d30f44b421478899f04a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/f5722091165371f13c5f770b59ad6010606adcce/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/9f990f22bae4613d43012edd732a0e9986ca2287/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/da43e460290510200bd9296c35381946a1f35107/
         arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/a00f552d6638d3ab94ea020a520deab0cdf5b578/
     powerpc | libdri2-4f1eef3183df2b270c3... | NOK | http://autobuild.buildroot.net/results/be2d170dd74f6839fc15b625ee7a24acc74116f6/
     aarch64 | libdri2-4f1eef3183df2b270c3... | NOK | http://autobuild.buildroot.net/results/98f9efc226743100ac0411d797bbc59f42f345d0/
        bfin |                   libenca-1.16 | NOK | http://autobuild.buildroot.net/results/39c0016972f3894b757f272435c27a38ac075fcb/
microblazeel |                   libenca-1.16 | NOK | http://autobuild.buildroot.net/results/dfca1c20a34397bb65d65c3307d3e0d16d7d30ba/
    mips64el |                 libiqrf-v0.1.2 | NOK | http://autobuild.buildroot.net/results/e7adbfcc963ee3a76368b0f4af7ca63e69995546/
        bfin | libllcp-05dfa8003433a7070bf... | NOK | http://autobuild.buildroot.net/results/d157e77cf948d036a9e36e67534f7b442c0e8bf4/
         arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/bc929854a4e70aceb0157bed0d8be630da61d9a0/
     powerpc |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/21e2c68e5f1c76fc35b08c7085f3d5ecb18a64ab/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/f5b65e6cd2887a6778fbe6793541574aba72ca56/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/bcbc42fd21e30d4e449ebd1f874b606c812c7949/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/fc2174046cbc866f261f267ea612187445eeba68/
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/393be6030e6f7a870bf71dae3e2c979580240974/
    mips64el |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/5627385f6e4a3dc7a38baae4cd13ce7974446056/
     powerpc |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/c814311099ff930c961e637b843a8591e8826b75/
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/5876ad1b367b7a0308dfa130e53ef5ff17e6c020/
      xtensa |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/2a0e3d64aa1a9a8aaf019c411377b2f4e3c51aae/
    mips64el |              libseccomp-v2.2.3 | NOK | http://autobuild.buildroot.net/results/07fecbce8ca4b0a69e86b93021df80dbc2c45497/
       sparc |                    libsha1-0.3 | NOK | http://autobuild.buildroot.net/results/e6d539a2c47428d1af2529069297af1279c8345f/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/aa1a9c314877bf54dcb9561e26c77256fac55c5e/
       sparc |                  libv4l-1.10.0 | NOK | http://autobuild.buildroot.net/results/9c39741726bc6d6698f6f8ecd4da0a5e87398b8e/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/59e9e56b5c86003afe6f812e2d5e59d351a33c05/
        i686 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/aa6b81f5168cc2a61ec1d77d48450f10f5dac330/
        i686 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/eb8321678b066c015e8042a5cbebe9444699c777/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/f700d0892f43b34d41ecf0ba190d425dcfe3b28f/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/71e9e2fa3aa96016d4bcd49d012e109c0f081946/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/95a7f449527569e381379caa00e364a4104d28a3/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/4f446e4083d8a9ca2b46b37bc30176c2266f9551/
         arm |                    lua-ev-v1.4 | NOK | http://autobuild.buildroot.net/results/f9ad296c1293afa44ef7968e6aef0b27450c043b/
      xtensa |                    lua-ev-v1.4 | NOK | http://autobuild.buildroot.net/results/e731ce0b0f2c9dd562cec549a1a8bf375bd49adb/
         arm | luaexpatutils-88c228365b084... | NOK | http://autobuild.buildroot.net/results/4f6439f421809090c874e24055348e3f30b2e2b0/
         arm | luaexpatutils-88c228365b084... | NOK | http://autobuild.buildroot.net/results/bd4a1db0136ee65f325d1fd9826dedb23986134d/
      x86_64 |                luaposix-33.4.0 | NOK | http://autobuild.buildroot.net/results/426f85021498611e43cdc2af693099b0687de52c/
      mipsel |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/700f974fdf5579e50e687c7da01440f98c50ab0f/
        m68k |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/94d52736f4b234d8164c425f5def83b907b409c5/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/22041a87040fa1bfcb777353ca4bc870e951138b/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c29bc6d60714e26e798c4c16ba1f0701cd0593ea/
         arm |                    mraa-v0.9.1 | NOK | http://autobuild.buildroot.net/results/b84eb42c38c0d287547f442b1b35307418ff6425/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/99baf179f41da70e25a75779e24615f576ff8846/
       nios2 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/3e2e021fc1e1b835960cf56b00f56efa7d438c2f/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/731c1a16e5ff4c62e4a961a854b4bdd6b6835ee1/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/58b974b3b439239f9c1193f77a37693cfd11c06b/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/e08f21ea7f6e080134e225562785e639986648ef/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/0d430502683c7983631ee307c97e3dda3c7b5bd0/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3d0d2577d1a2eb7b724b0f71f13c44ede488fe5c/
      xtensa | pps-tools-0deb9c7e135e9380a... | NOK | http://autobuild.buildroot.net/results/00648b4ca73116933a44cccef3dbefbd16766246/
      xtensa |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/33b5a09ddb46e6d1a7a9f675f1157382cbf7502e/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/101165e9cbe011b85635ffb93b4b6cc39c0edc1a/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/48f89b712088cf15879ba77099673f6617d98154/
    mips64el |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/8a6f95fedb7b74626b20158c516e25e7f1b85c29/
     powerpc |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/2c63d1771d8ef2eef51e8d769138d0eb6c544083/
      xtensa |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/69713fcb1a54992f172976dab8ac1c04d0d0f870/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/4604f28369e4d26769e5f01c348967e8a401ea03/
      xtensa |         python-pyinotify-0.9.6 | NOK | http://autobuild.buildroot.net/results/0f7d666e307fc4f665bbe61cdce6c3d6838e73fa/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/948e43d20440869869af878e23e2a18199c79239/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/98693b7b2990c859ad7ce842ff0232a79da85948/
    mips64el | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/9986348b7f041971e43388fef260c56e2a4e3aae/
      x86_64 | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/b6d23c8f035dd947deb363c8577b1628e0ecedd1/
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/2dfc1441a3324d719f2d3537f3f5b39490685a79/
      x86_64 | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/554d234d309202954d8d22bec069da56dff75f12/
       nios2 |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/bad9b90db7e7ae352455205747a08e75e8e83376/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3bad59fab136b8817ebd4c29267519c0a8e18ada/
        sh4a |           xinetd-xinetd-2-3-15 | NOK | http://autobuild.buildroot.net/results/46bd79531f3e37e7de18532a4dd4f38ee7b4152a/


-- 
http://autobuild.buildroot.net
