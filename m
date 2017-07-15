From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 08:30:51 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-14
Message-ID: <20170715063051.B1755209C5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-14
================================

      successes : 172
       failures : 57 
       timeouts : 7  
          TOTAL : 236

Classification of failures by reason
====================================

      python-coherence-0.6.6.2 | 9 
                  lshw-B.02.18 | 6 
     python-cryptography-1.7.2 | 6 
                busybox-1.26.2 | 5 
make: *** wait: No child pr... | 5 
                 libssh2-1.8.0 | 3 
make[1]: *** wait: No child... | 3 
                   strace-4.17 | 3 
    azure-iot-sdk-c-2017-06-30 | 2 
                     gpsd-3.16 | 2 
         libspatialindex-1.8.5 | 2 
                    mpv-0.25.0 | 2 
                   trinity-1.7 | 2 
                  cc-tool-0.26 | 1 
                collectd-5.7.1 | 1 
                  cppcms-1.0.5 | 1 
                  dnsmasq-2.76 | 1 
                    efl-1.19.1 | 1 
                    git-2.13.0 | 1 
                   httping-2.5 | 1 
           libmemcached-1.0.18 | 1 
          mediastreamer-2.14.0 | 1 
                    norm-1.5r6 | 1 
           python-pynacl-1.0.1 | 1 
               qt5webkit-5.6.2 | 1 
                 samba4-4.5.12 | 1 
                 sngrep-v1.4.3 | 1 


Detail of failures
===================

         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/9996a6fb33cbd49ccfc5ca382044488552b4ed01 |     
         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/5daecc24c5dcc873fa77f4fb4917d1ad508e175b |     
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/84b89c40762a96d489a858dfdc1fe29c4248d5f2 | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/90144369ccea8c41ec7643a79a7ebfaa9b7db95c | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9f07ebef59af9ce696ef526ab4d2facd700ae1ce | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/8067da9274e799adcad9920488fa33355ae21f0a | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/be65cb9dc5f532876074b3d73d71ff033cbb5a1f | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/08563e1d7177fe54ea6d6410b5ef520303e11037 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/e10dde3aa37767ba9cd447ffe90d7d2a95d774db |     
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0311c0b53f3b57e9844dd7a6351f7ea3375184b0 | ORPH
         arm |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/d1b23af6433b8403bdd80f854939fe93084b3c8d | ORPH
        i686 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/535483d05ae572a1cb31fe37f8e6a466617f2408 |     
   powerpc64 |                     git-2.13.0 | NOK | http://autobuild.buildroot.net/results/e96d4938ec96228e27826a0e9c80f1c2ae7dd9f5 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/92f6b29e60862462dcc0705bbf17d46a3a0bad35 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/12667eb6f3f2f902b7cfc8baf8ec907ef395b793 |     
        m68k |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/2bff43d7b749b4daf32868bddbae94b510949bf8 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/38b36df065646145141a5bc3addbacf28a69f48b |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/9884814dbd39880fcf7bbed49bd526c4b12c371f |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/a09b77b9f6e52c7e2022382cb8459473bbbec5cf |     
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d34a0e5b2edf3f784778ccd3ffbcdabb9ca250de | ORPH
     powerpc |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/ac83f6d48248bfec839227302d9dc3cb46fcc7a5 | ORPH
       nios2 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/9725d16b9f51be4fed2def8afccbd7057b102fbb | ORPH
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/468d3171825ec61879ed779139fc9b2815a0af62 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/f46bad7e433f4c8e6939444b72f72138c8de3b40 |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/0d2ab3fcee7e1a0ca3dac035954941a31a00f0bb |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/f221f78491d2b34b47ac2911c679c4d96b490471 |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/cd691bd055b9d985be4724af6123ea686b8596dc |     
   powerpc64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/81f91f0031eab03b06f22122c83e76e8db49515d |     
       sparc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/bd4e75a01ff315820524934f19bcdb58d902bd61 |     
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/d9d333aca687d4ef038181cdda3b99983c8774dc |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/19a685dd075eb12dc65cd7563b41a7a3faf648dd |     
         sh4 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/c2e5ad0217ee6fe85b50eb9f8edf715fc22dc679 |     
        mips | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/22b2b93fa7cd23d50c6785d1ff9b4090f3c8d86f |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/cb258ffc10b83a71e4e4076da09e089b8bdbd68b |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/7b64ea159faf31030bf77e9afcf503719eb70c85 |     
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/bec8b0233a964453ef4e1b053ef6c5f7dd78873a |     
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/422a3bd18234b47ceea91d39ea4b3ac1298c0063 | ORPH
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/0a7b306ae64ca256d82938aa13f10fb863a05d5e |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/ff4985c44bb935c4d1ab7e7a979f7fbe540c4977 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c5cf4be9716eaaa6ea5a73c880d817407b75aa33 |     
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/51c1247924a93c87be5b1f822d35f2bb73d32904 |     
         arm |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/7eb606b043c72b6e24b0e7723f99fec13b12636a |     
        i586 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/bac408563cd9161d4d87984b6de8bd2d0d4122e5 |     
         arc |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/4b2cda4df1ba180aeba3c76c404ce66cccd41484 |     
         arc |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/329ef0d93da3f0b4e4867295975d9d984b474219 |     
 powerpc64le |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/2875d030fdf9f9bfd0f103e2a16637b312000031 |     
    mips64el |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/66f4c8b21589f66b0c7cf679703d2b8d38375147 |     
      x86_64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/58c6e9323dc0c84c70b491013486823fff2f9708 |     
     aarch64 |       python-coherence-0.6.6.2 | NOK | http://autobuild.buildroot.net/results/e9899d7117930a3d59647f3aff1d6de6346fac73 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/be09c6fc1a7cc7adff9c28cc7d484693ecf13068 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9cdf51b7eb1ea5f933eafbd8206479173c938e01 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/88f6464dead8db31c3e26ea64dd76fd0dc876f5c |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a915dbaedbdd26cfa5527be84fa215dbdccf7816 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6d0872cd13e770fa6b3b0ef96fa530ca7c7742ba |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e57157aa10e9145d7cb3a806c789b2bae7ec24b2 |     
     sparc64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/0bb6723a33a05b7afb13d8a743af68088949590b |     
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/3e8da8a7de3f1a79cb0b43c92f60df0aa6fd3af3 |     
        mips |                  samba4-4.5.12 | NOK | http://autobuild.buildroot.net/results/0c126ce03234080224e2ed4bcd496db8509ddec4 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/2ad2a0cb957bcc10e2c3259f1c12c297e5687080 |     
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/5edbe33e0680b7419c377965a99708bdba2bffed | ORPH
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/ae74500548eabaf4a14ea4902bc53f8b16de06a9 | ORPH
         arc |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/8be75df1b4d6737b3957cfc57c5a2487f2119fcb | ORPH
      mipsel |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/d46f933bd59bfa7ef14982da0d62ce61767e3080 |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/c53a033c726bf79474b7b5d724b18f2c0f5bbebf |     

-- 
http://autobuild.buildroot.net
