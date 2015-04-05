From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-04
Message-ID: <20150405063020.CFB1D101402@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-04
===============================

        success : 216
       failures : 82 
       timeouts : 2  
          TOTAL : 300

Classification of failures by reason
====================================

              lirc-tools-0.9.2 | 7 
                  boost-1.57.0 | 6 
freerdp-b21ff842ef3de583751... | 6 
      libva-intel-driver-1.5.1 | 5 
                ipmiutil-2.9.5 | 4 
                libtirpc-0.2.4 | 3 
                collectd-5.4.2 | 3 
                     vlc-2.1.6 | 3 
             armadillo-4.000.4 | 2 
               alsa-lib-1.0.29 | 2 
                    webp-0.4.3 | 2 
         lua-periphery-1.0.4-1 | 2 
                poppler-0.32.0 | 2 
                  libevdev-1.4 | 2 
open-plc-utils-1f6e7e372b31... | 2 
                 jsoncpp-1.6.0 | 2 
               libecore-1.7.10 | 2 
pulseview-19be0af16af83ca10... | 2 
               libsigsegv-2.10 | 1 
               libgtk3-3.14.11 | 1 
               host-ruby-2.2.1 | 1 
                 cdrkit-1.1.11 | 1 
             host-thrift-0.9.2 | 1 
                host-ola-0.9.4 | 1 
                 mesa3d-10.5.1 | 1 
         xlib_libfontenc-1.1.2 | 1 
               qt5webkit-5.4.1 | 1 
               ipmitool-1.8.14 | 1 
        portaudio-v19_20111121 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
             ebtables-2.0.10-4 | 1 
                   zmqpp-3.2.0 | 1 
                    fftw-3.3.4 | 1 
           host-libxslt-1.1.28 | 1 
                elfutils-0.161 | 1 
               sdl_sound-1.0.3 | 1 
                cifs-utils-6.4 | 1 
               wvstreams-4.6.1 | 1 
              drbd-utils-8.9.1 | 1 
                host-gdb-7.8.2 | 1 
               arptables-0.0.4 | 1 
                  snmppp-3.3.4 | 1 
                 rsyslog-8.8.0 | 1 
      host-gdb-arc-2014.12-gdb | 1 
              libarchive-3.1.2 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/7a2f5b70be5ff1fb27c4088b58f7c31d865fe424/
         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/cfc0b1f9d6c80a45be453205b47cc1b66f5f3cb8/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/5b350a6a9735490aa7094b82b0f183ae2962ca6c/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/b2e72680f9e854859ea359951f1412a408c7f126/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/7734cdfc28ec862594b0a8f4200100d4a06ebfd5/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/2ce84fbcb6b3fa7fe983b5d417fcbe6ffdab7330/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d6906852712e508691a0814707e1749e0a61b18d/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4ce961a54b6c2275b1cc3f5c4c281a9d37692b62/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/86ef0546f8f8359af6cd6d4ba2afba59be3df58c/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/a174e86d7324a0c2e82bb0b25c12894779e6649f/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ca1acd30e83e39d3fe93acd7c2c88d20c8b03a7c/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/37a07086c370ac615495762534a8cb108e0d0f44/
         arm |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/9d16a4892b6961f4f450ed70508f3f8db3097945/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/d5b1e9059aa76c0435e0237e424becfbd340657c/
        i686 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/9a6619fccd43a6e47b01a071d9d3d582b39d56a8/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/e22aaffa196ad3944248d5ac5292ff66918bed6f/
     powerpc |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/67d887d941ef5bf3ae63e5dd57a9a2b4bdd63d12/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/d1703ad0cfff97553c05ed3823562f43afdbf536/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/b7573a539af61931c5b361e9bb3434492dc7ac93/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/8e18b6f5d17efbd0826b073fc8e2e0b1d0dea34d/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/518a016d6fada5c4bc8d4516614bed36c0dfcc68/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/0c9dcb197591a4fb46282fadca19d5f748426fbd/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/0b71e37b8891b3b8810d1e74445177a1099b59f3/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/c5fc628727cef0e634863b9cd01b2ffebcbb5159/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8c41393c06aeca41dcdced4f239350e9ead50c66/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/5f6c71d2a580424ac9bbabe8083322ae287eab4a/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/90facd9428ecf8310b4c418ff70fb84d9e4bc935/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/f60efdea01bc6d65e9d293a10769e3fb0e68f8a4/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/4e549d24d62d03558e7207102489d184872418fe/
         arm |            host-libxslt-1.1.28 | TIM | http://autobuild.buildroot.net/results/917a2bd7a45590f50621f9ddd754dc17ca0e5943/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/e0bed498bd660b740e03349e4e2202b33bafb3bf/
         arm |                host-ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/b8c6cfb81daf517f0151f5c013c32194b5f02aad/
      xtensa |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/b89ffc2bff699eb10bb6abd92369a43d4900354d/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/9a592ae1402b1735dc0ed5ece5a8be6ff3d2202b/
      mipsel |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/64bc8c9e7b613f286009887af0c0b4f1cd77eb68/
        mips |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/92f54495f7f2a4b70aff18c094baa71adb0f5985/
         sh4 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f63a25d6faca407da7332b2806300baadbe33326/
    mips64el |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f21958c19f145baf83ebbb02b8526f1a58ea25ec/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/a0f60a1df243bdae875f12668011a53a70071ee6/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/f8885520b5892d49164c88a974e7dffc1c3c2ce0/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/d1355eb6cf6061d280514c1bf7152df0ba339776/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/fd399957414b9dee4df7227a56e988071e348127/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/39cb4d6e020d0349e884acc3399b26d6935c5151/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/a6ebc3bd7604117bdc562d8a51ac1603746fca70/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/bd276f210a36691a2ec312a21dd2272cd5d6d291/
     powerpc |                libgtk3-3.14.11 | NOK | http://autobuild.buildroot.net/results/b6271409bc014d05d2cd6b95adbeb7721fb7e5e1/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/dd8ec0bfe3a103ee721163f5cba83d0e55ac270c/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/746e027809885c9e21fa88b13a07c5ab52247231/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c9496736de72f0fe1217431d7cd203458f6700ea/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f1e66550ff10ea4e9ff9f313de5ae9c06c11e06b/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/eede75e2554cbeead8259694bba174799ab30057/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/f2344cb008fe172ef5c96f33fea8a22e824f0351/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/363618c994d7c9a0453d759988b3b178fb8506d4/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/57e63bc7e67818385e12d7966aa7660f578491c0/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/09d4ea996f88d4748becc4b40cf4b965a1fbd63d/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/d272277df82431567cc12e2236b3b3506ee4cee7/
    mips64el |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/37add1eef0414ee0855efca5f26cc743de1694ce/
     powerpc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/6925f9522f6180f441271779eaed2de776c4942d/
      xtensa |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/8faccde0b127498858a9199d91774e4f84e66367/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/763a814506ce0d0c95a942ccf12e41b5c751d1bf/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/82e511b79183d4a35bd7c9301d6a0a96aa0975f8/
     powerpc |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/1c3f98fe99faf51983171284ed19b39aa2ac69e7/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/c742a0b9b554d42b07b356931c9170adb919495e/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4ff8859aeea8af05020ae909b269ff7c43c03467/
     powerpc |                  mesa3d-10.5.1 | NOK | http://autobuild.buildroot.net/results/829fd90134b015aab0e1ac02fc1ac67bb8908afa/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/532a11827b68cc0a7d097f16a5e46de3b31bf991/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/463a22e725d7fb61c848845c60cfd3133bf6edac/
     powerpc |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/6b9d4ce15f54683670af3132ab21a053d9853e6c/
     powerpc |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/e17193604956cc61d47a9913632144601ef72656/
       nios2 |         portaudio-v19_20111121 | NOK | http://autobuild.buildroot.net/results/16aeb360875f139bdc977031ee05531d5cf54826/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/e15f21612f442a2f720383aa5494d69bdfee3e48/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/bcf122c3d4e0afd64836e9050e6ef315700c3788/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/30b6db1c2389205b08e697cdc66c181c66ce110b/
         arc |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/d0fe409d23117ea2cea640b8d7ff6dbb7c33943a/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/8b4ba4b2920c9d79ba512aa54590ec664bab27de/
    mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/49335dc365d5f2d58289c73edef88bb2515f0240/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/88a0e180de119e21507123f6ab02ebcbe3caa222/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/02acaffe66545b6930abccde100f10c8f2452b62/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/1627bfcdafe4defeca894e332f21648fddda15ce/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/7db54bf6b632e044ac1306ec2c5ba1010a743d7d/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/b6b46443ccce6816fd65a154322f40eabdbe8231/
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b964dfe7ec99d40d939ee8003e6a02ca7f747f5a/
        sh4a |          xlib_libfontenc-1.1.2 | TIM | http://autobuild.buildroot.net/results/3259a4767ef269984d4f33aca7db9589523303c1/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/efd9007c7634c4da8f7d91b3d2c0cc477435d5e8/


-- 
http://autobuild.buildroot.net
