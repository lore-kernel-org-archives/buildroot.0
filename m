From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-21
Message-ID: <20180422060017.CC75F207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  42 |   4 |   0 |  46 |
      master | 277 |  93 |   4 | 374 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.17.9 | 1 
                   flann-1.9.1 | 1 
                      qt-4.8.7 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

        m68k |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/1d9552d6f82a93a49b5dc5d3964c336118f2872d |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ad9fb55b104a7bc2cc8dd22e464fadc65a13e969 |     
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8c470ff5586448b2cff6f9d67fabd140264ce0a2 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/c3e909d7c41618ecd4c48bf7d636a57b371eb50a | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 16
               libglib2-2.56.1 | 13
                 libuv-v1.20.1 | 8 
                  zeromq-4.2.5 | 7 
dtv-scan-tables-07b18ecef17... | 4 
                   flann-1.9.1 | 4 
gst1-interpipe-10dba89eecc2... | 3 
                    liblo-0.29 | 3 
                  flare-engine | 2 
      gst1-plugins-ugly-1.12.4 | 2 
                  host-go-1.10 | 2 
                   libnl-3.4.0 | 2 
                    links-2.14 | 2 
                  lz4-v1.8.1.2 | 2 
              pcsc-lite-1.8.22 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                  udftools-2.0 | 2 
                alsa-lib-1.1.6 | 1 
               asterisk-14.7.6 | 1 
             bluez5_utils-5.49 | 1 
                         boost | 1 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
                    efl-1.20.7 | 1 
             expect-2014-05-02 | 1 
           libfreeimage-3.17.0 | 1 
               libupnpp-0.16.1 | 1 
               log4cplus-1.1.2 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-18.0.0 | 1 
                     php-7.2.4 | 1 
                   qemu-2.10.2 | 1 
                   qt53d-5.6.3 | 1 
                       qt5base | 1 
                 snmppp-3.3.10 | 1 
                   strace-4.21 | 1 
              wireshark-2.2.14 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

         arc |                 alsa-lib-1.1.6 | NOK | http://autobuild.buildroot.net/results/0ede1ff09312f8c002eceef163dc53e24aa6f1e7 |     
         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/2f070e7041d792490cecc31b605ada18bdb1dabc |     
      mipsel |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/7212b6f599cd0d0685e193900ad1930506f8fffd |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/c4f5c52c250a682b806d3af61abae92f67d8a56a |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a8c1035f1a3ae1d82f3481408f4dc66023069618 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e00e71e05a316dcfc55fc5e90d8ea2439a2e99e7 |     
     powerpc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ad471c9dfa09b90fdc2a99f05dfb3e656e55cebf |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/0cb632339c94eb140a9e59bb59c7090bdf41a539 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/63aeada32d74398f4fbd0efbf0fab1b7dba19aff |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5114d4ffceacdabd774e22c1fd9ab84d5737b137 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/1a708ea037e97dbfe6961a6370c9d12cbdc7b3f4 |     
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/65508e4fac91a275bf61cd6689c3827e5cf880df | ORPH
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/dab8a342651c39444c234274cd59ba8abc22cd94 |     
      x86_64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/be76d20eb8d8431e137cc10b3837ce0756a9d3c5 |     
         sh4 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/663c0bd95054cc3f5fa1b573fb694ff475cc61ce |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/7dc3562dbd5999d88ea5006a341fe467d4b774a1 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/a8c2bfe84d280ff2a7fe04a8701f4ff690b402cd |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/934f1182f66253c2c83df3222df7e7029c9139cd |     
microblazeel | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/75aa8b3ee54986036c44613e0a1a019c266f1bd8 |     
 powerpc64le | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/3b4cec19efe714db160917a27be61681e4652c22 |     
    mips64el | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/aea2452c206d1f8dc961e5dc06bfcf55fa2b7528 |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/fcadd29e523e8ff50040b4814b2a3d9d15ced219 |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/e9aa7ead713211b37f9c27beacaa6c9c9b69e501 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2be332e4e2b3f36a70981996705cd8daf823e461 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d081d0f02aee5a10bf52dbb6d12a8c9270411bc3 | ORPH
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c4fb2f1579204d77551e26716254582f9d2dd30a |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9e1c3e2eba63c21f19badbc9af357d1a7d5f8ade |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/3658fe70557b668582e039edf4e67bbf652a6546 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/bf1896df04d1cfe8970782447d6df41a6803c4e4 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e8760d14c3f271182e6a63b5a5c589e05bdecfe5 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/b5479075173c10e31c0d97236fa63f7eb9a635cf |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/43dc7f001ec47d9ff486bf2a9b7433da690162a9 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/0e2b2074228398969fa3137f6780521930a12f37 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/4ac7f0133c16eddcee0daae9376df493e30f27ac |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/3839c3ef458a8c182700cbb5509372f0b2f0edc2 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/c939e3f85a3457ff4c57a6d0a6d5e44b5a1bea75 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a0814b10d633f02eeb5f152be91ad24093a636ad |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/1aee8b12c011da7779de72ed83b11c81863f9886 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/d21469c43c2cfa276d8afcb32214986a4af1ef0d |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/0017e131daa5141df0014cdba04fefc7678173fa | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/53739bf0eefaf4e8b40ebdece79ac904fbf6f35a | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1782ef86602f08c1fd938928c2f2f301b2ffce35 | ORPH
         arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/6306af459a49b730af1cc1e9d14072e66a82e6aa | ORPH
         arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/b599131afaacd7e6f6b4c8fc93977a99de11c2d1 | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/49a2b2f2a7b308e0b7c001bfd64b2035b9749086 |     
     powerpc |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/18579f0b77a128654009ede70e0688bc3c8842ca | ORPH
    mips64el |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/b8b3e0ecc06b8b588d31c5b393276e584265cbb4 | ORPH
        i686 |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/7447cca5a70bf0a2defc1eae8d03b798faff0235 | ORPH
    mips64el |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/e6e63ebd569309b6ad2c39ef851ca6a166d329ea | ORPH
     powerpc |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/12ee24492c897bbedd5004d62cda11c8f97e7d3e | ORPH
         arc |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/1bccdf203576ab3908f8b777e96de66c2b0e62ad | ORPH
         arc |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/207e6fba83417e69b8c53ac9329cff8a9e990cc7 | ORPH
      xtensa |                  libuv-v1.20.1 | NOK | http://autobuild.buildroot.net/results/52d1073dcf38180bc6dbe5426337c9823031dd57 | ORPH
         arc |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/05c1a0ce5dd369e03019507075f2103a4bcb6706 | ORPH
microblazeel |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/ba0ef7998fa7ff6ca50462864a1787e952998534 | ORPH
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/a4690fd3e46354776f6d6addd17226622c5f4961 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/524a439481ae174d1da76f0c6ec3662d56d5058e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/336dc0210528f79704d656942b110ea415445164 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/9be6da322abd3d56444fcdba2ba2ccb9f40c1f26 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b4fc9b73ee669724c5acc32f13f1dd7fb8e2ef04 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/60e56647b238bd10baa4bbd8420c62efc8ee4b01 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fa43635e48da099acbe79064e980b77b239a9ba9 |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f398d020cfc98c39cd4e6ef038d1985f89d378d7 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fde9ed78084018b77cc1133c0ba52f8bed1e9fc1 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/95c2a39bf11c5e2b4720d215eb8cef4f1aee40f4 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/138179a6623324cd7ceea2d76d0acef5655a1c31 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/49e8f8f398b229214fc87f22f6d6ad5603f6c398 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/8e6030e3bcba82583665ea45dafde00692bd6573 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bd8848bf1c1265c875db8401692137abe13dd48b |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/83aaf405133b0a98a738370bda37129a7d3d9f2e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/179cf8d71f9dc8d1e6b9dde9b62521d87c303d8a |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/822b2d116e28241f560f691408f64b638d21590a |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/0329a1153d869e345a7e425a6e011f49877c04de |     
       nios2 |                   lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/2bcfff27766e165c7da5cee0164e80a8107a8f01 | ORPH
         arm |                   lz4-v1.8.1.2 | NOK | http://autobuild.buildroot.net/results/a8d956ff420f6a265c5c00b33646dbbc24ce2d48 | ORPH
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/1ed4591d22c12473f23a03336e66dfea527de212 |     
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/6ae7bb771146b96b2957a43bae85d1bc09e813c1 | ORPH
         arc |               pcsc-lite-1.8.22 | NOK | http://autobuild.buildroot.net/results/8134eec2df9bfea16284a5e5ead8e2fe14aacdf5 | ORPH
         arm |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/52ed90f04efe383b69432de3e8d2e8fd1d7664a6 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/88807a9cf10e61c334c322646868d6b8201c3dd2 |     
      mipsel |                    qt53d-5.6.3 | NOK | http://autobuild.buildroot.net/results/dcda696794310e84eeaf2b9aaf9dbd2c64184d2b |     
      mipsel |                        qt5base | TIM | http://autobuild.buildroot.net/results/bc007265c856c276732b4a1c56e4989ca4fe5a4a |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/a13a5944a206d32a8f9ab913255d29637d0439db |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/0a1e563a418a46bc7fcae3bc7efb600873387155 |     
         arc |                  snmppp-3.3.10 | NOK | http://autobuild.buildroot.net/results/d5160593c084aad35fcf99acc5188a0012455dd0 |     
        m68k |                    strace-4.21 | NOK | http://autobuild.buildroot.net/results/ddb7616991468bc45d85aa1b56bec2cb5eb897c4 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/113a94049d89b8f065112e5d4482667a7b7fb843 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/04187aa6c57c8eed69b927235180474fb4423066 |     
         arc |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/cbc31e7d2ca5da51d321bd983e2645df5953d0af | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/655c26c0a68f9ea540c9f60c8dd7dab9a3c76964 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/bf02829a980136bfe33ec0dbacbe281dcca67278 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0accfa1a552b9432f18feea9441ad0a4c611b2d9 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3f22afa8a0e81aead7b8f1484e391546302e8b76 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6c19f316111701cdb42e63312a5e40913b0643db |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/97ac43c37167226039c2b4f16ce326e32bfa35b4 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/888b6c906898def0dc773c44e4eef7b38440558d |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ace9d51769ab816ad6228c71c9b652f964cc7f41 |     


-- 
http://autobuild.buildroot.net
