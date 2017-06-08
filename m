From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Jun 2017 08:30:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-07
Message-ID: <20170608063046.880E921D87@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-07
================================

      successes : 239
       failures : 87 
       timeouts : 0  
          TOTAL : 326

Classification of failures by reason
====================================

                     gdbm-1.13 | 20
                 host-icu-59.1 | 12
                 lcdproc-0.5.7 | 8 
                  cppcms-1.0.5 | 7 
       libhdhomerun-legal-info | 7 
               gnuradio-3.7.11 | 5 
               libupnpp-0.15.2 | 4 
                beecrypt-4.2.1 | 3 
                     gpsd-3.16 | 3 
           host-doxygen-1.8.13 | 3 
                     php-7.1.5 | 3 
     host-erlang-p1-xml-1.1.22 | 2 
                  gauche-0.9.5 | 1 
             host-nodejs-8.0.0 | 1 
            libpwquality-1.3.0 | 1 
        ltp-testsuite-20170516 | 1 
                openocd-0.10.0 | 1 
          perl-net-ssleay-1.72 | 1 
                 qt5base-5.6.2 | 1 
                  quagga-1.1.1 | 1 
              webkitgtk-2.12.5 | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b0da81ba929802002100f1635cd52d78cf9afa79 | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2c44f655ef03f1a657026719c2891562fea3c7ae | ORPH
         arc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6ee1f8982239aede413542dccb9fa569efa9ee09 | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/eb99bfbf9d94a8fafb6126d6f548f318df2aa636 | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6d7feb98ba7028882c70766a7b91cd08177f1428 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a06feb46bcc1e3a19801fcd7dedfdf5dccb0006a | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/830987e6b2d3cb248247787c9b715ad3efcfa27d | ORPH
       nios2 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/041bf26037fe5b4b79b812b281a4e265bdd13158 | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/16dd4e3b94a77c527c6cec6ff45ce7689de101d0 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/44bdbc6543b22115c52aa9a78fcfbaaa9e4e4a4f | ORPH
      x86_64 |                   gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/e1b2ad89787c345cf8817f6d8436ff52a151c5a6 |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/2be258c620bfbfed17b567289bc5fe77066bd2cf |     
      mipsel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/3ec8f0ddadc442caef42195f48a538d387ecd75d |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/7b5f2a585b4fab1160be863f2872a45d6c932123 |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/27a671f7719be949c00ddca9527831ae9ea35619 |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/710c8e37d758e3ae026727bbca45fb8590f7984f |     
microblazeel |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/6a35d0d0f48bc904cd6c9f31aab4403910b3b3bf |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/538d723f56b5519a80fb4df9760339f58a4e5588 |     
        bfin |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/83d7d1e426cf257556b248914896318cf06486eb |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9db105bd4fb9fb20149011992976b542bf43b858 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/32e9bc8cb7843822f89914a0407877f8f956bbb8 |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/7b69a4515a09e0c3afa577a229af31e3665d19a8 |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/9a3cabc3a2d2525a8988feec2694c8b380a6b6d9 |     
    mips64el |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/225a38284bd75a1c80a4622cb8602e1eb62e7116 |     
      xtensa |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/cdd2adf60dc04fe4037e0b7b7558c718ab84e3b7 |     
    mips64el |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/e80fdd887100d4954320be11e065ca5b884fa09a |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/420a7184d491e80e5f154439e46d95b72af2b40a |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/a2d8b6f12dbba5aed5f2689e12e4cb3e3c46f8a1 |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/564d96aa0ff5b80706a422dc84ce23f3f3304c7b |     
    mips64el |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/ee83b0bf1be2653e5044d9d729b446bdb4a4be49 |     
         arm |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/31f4ce7df199453dfcfd81a0634581e914185cfa |     
         arm |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/2d7a7cea79f12008941f73aeeacbeb2a95ef687d |     
         arm |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/27b378e33dd8899b997f32e8d846b691adae1926 |     
      mipsel |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/429e2f29918a75129f61f1f6ccd0bf82da1d90af |     
      x86_64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/10c80343ad5114c4aa5d6ed199cbc7a64ff4e1fc |     
         sh4 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/335db5faef2e3debb4a1e8802cc3c9b7202c5306 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/5afc7c8db60b017ce87eb608881a0347e160d266 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3547a5ae87c3e90d3121056d8a9ec494711ac490 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/db0260e7657645b91d76081e2c561281c995670c |     
        mips |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/eb896b11915dc3286116738c1a35658f0ffba113 |     
     aarch64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/7d284c45717a6a1b2c615a8a3089d7d39dc5f787 |     
      x86_64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/6d13585e8485c9dfc93e28d22e1ed6c03e4b60df |     
      x86_64 |      host-erlang-p1-xml-1.1.22 | NOK | http://autobuild.buildroot.net/results/3b474323cb50d0d5d09611fa068a9d1bd3bd4bb5 |     
      x86_64 |      host-erlang-p1-xml-1.1.22 | NOK | http://autobuild.buildroot.net/results/475a4bd5919f7509e97a0a90227adfdb88ce5d1c |     
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/133aef7834849c3656293cf7b9d56b20369a0d6a | ORPH
       nios2 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/fdec9ec247e59a2966b4622928e2b9dc6af63348 | ORPH
microblazeel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/9965db9497f77a29c701006f6d93845b263671a3 | ORPH
    mips64el |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/05286e431a43293732e54ef68d04aa02072e1f5f | ORPH
       sparc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/040984f584e04ba6df29b7179e2dcf46945933ee | ORPH
        or1k |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/c27538acbdfa67ebc745a0328603f9c076659c76 | ORPH
        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/f7f6d39228c52b99922ac949238b12a1998587ad | ORPH
microblazeel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/43517cc71ed54ac4061665f8d76b4bbff5946c2a | ORPH
        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/9c0295db76f1900489dfab2ce9139e940ef802f8 | ORPH
        mips |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/8ba014443a76ea496d4aaf05800d0fbe7e59ffe3 | ORPH
         arm |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/41d99ed8e360a4aa00b1f278bffecaabdd16b9af | ORPH
         arc |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/2b6032a59aa4eee5db55f47a6c0d1490fe92cf2f | ORPH
        i686 |              host-nodejs-8.0.0 | NOK | http://autobuild.buildroot.net/results/8801109c1976e1c7a08dc4036c6a38efdbb8cd7e |     
       nios2 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/e47abd85deb93d5fc292fbcc532f61e7c757d830 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/6db7aae6c19d576875cfb2fe8e83f38fddeaef30 | ORPH
       sparc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/db8980cb8cf000a3fca3c4961d9703bb0f6ac08d | ORPH
        i586 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/229a82ce18e62b81fc768d53eb739ef148c4c0fa | ORPH
      xtensa |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/bc148b37deddad64277012cbbcae0a9daa9ef4b1 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/f856821a1991bada96fe5fae59c2d22853d8880c | ORPH
        mips |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d899440d38fb9a95a0118f519cc26f13d6e9a34e | ORPH
        sh4a |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/8df41963e3453f27f2337572261fa764a8801c73 | ORPH
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/bbc4d1a816149d99c7b501af14fd0062f6e2550c |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/8f4120b234b00a84ddb6104aed622b96722235b7 |     
       nios2 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/6c8dfc089cc7f6c00c24574621284ea9bae9f39f |     
      x86_64 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/b73af175030e24685f620c7f841c072e950d697b |     
   powerpc64 |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/8d189e116508da4b4d40da62b0d78067697d92ed |     
      xtensa |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/931eae73c6e0d19cefbf5bc6319321ca433eaf08 |     
         arm |        libhdhomerun-legal-info | NOK | http://autobuild.buildroot.net/results/ee93cf75384f85e90f6d1799fe569cebe7abe06f |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/413a7426729c8cbee22dddc81cab89dac9ff5b8f |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/2fff3426a8444a3cb5a3bcfcaba1c3a3dfd008b4 |     
        i686 |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/8d8278208278d47b4d53326314a4e2658d2666c9 |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/b16cbab66aef4995255aae3a84d676ff38c0fce1 |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/54a982d1a25b064dcc24c43f7696a82859c595a6 |     
      mipsel |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/e7303c425813f9c2bde76ff19db257102fce1719 |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/a53f0d6bfaf3ea23ff5eb7e616625f0e2f671f66 | ORPH
         arm |           perl-net-ssleay-1.72 | NOK | http://autobuild.buildroot.net/results/e175fcf17f69defa62579624edb2127416b8e7f9 |     
      mipsel |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/efe7e743651543fab8a25e16253a30984dd17a26 | ORPH
      xtensa |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/c846aa04d603cc3cab51b5bbd1993061f56c2cb4 | ORPH
       nios2 |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/050a57b77d3ffc7f8e6c909f0a484f85958dcebb | ORPH
      x86_64 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/8a389e5e09bfaa9f73dfa0fa37e8ef0d04775daf |     
         arm |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/8ed04d54d6bee2c6d7ec11772e2e7ce0129dc434 | ORPH
    mips64el |               webkitgtk-2.12.5 | NOK | http://autobuild.buildroot.net/results/50474cd7d1dcc6384531afdf6c30c79624e47c54 |     
   powerpc64 |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/d62854d3e01b39db851d7b6e0eb7c3af39c8d2ed |     

-- 
http://autobuild.buildroot.net
