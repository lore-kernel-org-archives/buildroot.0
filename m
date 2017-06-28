From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Jun 2017 08:30:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-27
Message-ID: <20170628063048.409E62090D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-27
================================

      successes : 114
       failures : 77 
       timeouts : 1  
          TOTAL : 192

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 22
knock-258a27e5a47809f97c2b9... | 9 
                  cppcms-1.0.5 | 4 
linuxptp-97c351cafd7327fd28... | 4 
       python-smbus-cffi-0.5.1 | 4 
                 sngrep-v1.4.3 | 4 
dropwatch-7c33d8a8ed105b07a... | 3 
                   attr-2.4.47 | 2 
           host-doxygen-1.8.13 | 2 
               libupnpp-0.15.2 | 2 
              syslog-ng-3.10.1 | 2 
    trace-cmd-trace-cmd-v2.6.1 | 2 
                      x265-2.4 | 2 
                  bwm-ng-0.6.1 | 1 
                  cc-tool-0.26 | 1 
              dieharder-3.31.1 | 1 
                     efivar-30 | 1 
               gnuradio-3.7.11 | 1 
           host-libxslt-1.1.29 | 1 
             host-mono-4.8.1.0 | 1 
                irrlicht-1.8.4 | 1 
        libnetfilter_log-1.0.1 | 1 
          mediastreamer-2.14.0 | 1 
                 mesa3d-17.1.3 | 1 
                    mpd-0.20.7 | 1 
           python-pynacl-1.0.1 | 1 
               qt5webkit-5.8.0 | 1 
          shairport-sync-3.0.2 | 1 
               util-linux-2.30 | 1 


Detail of failures
===================

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/829457683efef6fa7967db73572b68d8edc19a1c |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2b673ba69432939cfedd124d465b4dbc8f2502b0 |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/bee2d80ee5308d64b2bbd5e135f73a99d4e2b98d |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/721bdd433f6d7d12c9153b23d8e109200315a615 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a3f3a866010faa88237e6de9d122ba4e29ffbbd0 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/dd8faee98546ca97db49e14d688695e544a81efe | ORPH
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ee0a1a2a6b8be79523a10278b0016851ee6baaeb | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d7df13d68d31eecb6deaf8a3861d29e7276e1a24 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/bd93120ee7cbfeb4fe7cbcd7f845f131743caf05 |     
         sh4 | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/fbf4a1e059afb6b24c88f98d424a4248b0581d4a |     
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/4e54d703752140fc7f27e558ee3b37d21d26a693 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/dd2d66cc1bcceefd7c7b0b4538e8e14efa5d53bf |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/c507814191d2decf93548dfde3fbd2705f518a71 |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/f24c7541d918377efd95177d8619a3b75e057835 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/98f5939ad095d8fefacbd88663674ba79e9540fe |     
      mipsel |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/18fc6ad77cacf4cc766dc459f92352001df4d13d |     
   powerpc64 |            host-libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/6937ca9d02b351082f6895ebc30ff36e1a518339 | ORPH
         arm |              host-mono-4.8.1.0 | NOK | http://autobuild.buildroot.net/results/c3f8fac24b3b5653a1e37c2a462b9a833b8f3633 |     
    mips64el |                 irrlicht-1.8.4 | NOK | http://autobuild.buildroot.net/results/eeb6bae5e23eee089076e665fe753a63e9e69fd3 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/d65305a27bfc769ac9b1e92fed62d0f8d4cb4115 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/823912861ef18231ecfaf8f7678095b451caf8ef |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/cbc7b94a20d937ded6fb510ee3348af0a6841bd0 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c604191eb8c0269205d0f9a258d689aa5c5c47ae |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/050003fa371866f092333c2a379d13025e417b7d |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/0b2541715d48555e74a52e00707814e99f3f6096 |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/3fe1777383886de8f3e2dcf2c88639b13cda890b |     
        or1k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/4f7447d2e5c316624802419f32cadeb4f30672e0 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/bfc5adca76d36a52027b0861c046de200dd7eddd |     
microblazeel |         libnetfilter_log-1.0.1 | TIM | http://autobuild.buildroot.net/results/23826d95287ee54b9f91b243bb25a8f25f3f751d |     
         arm |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/8b280f68545888b6500e0ab5502aa006c9dce620 |     
         arm |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/14c9480949b715c421ecd146bc27aa6c7f37ddfc |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/a426ece1add26dc7e77e1896c29ae8ef13c34c6d |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d7093c436701058e7346e1cd509b1fb73c00c786 |     
        i586 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/3a1cfbaf660d5a220fca106d9849537dc11085ff |     
       nios2 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/03c2dbe4d25cd7fcf3c00eaee0718f7a6c26e9d0 |     
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/25d031fd2821c8987fd9041137f7e193ecc93ffa | ORPH
         arm |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/df209c0d27c9c1d291a7e1eb707089a2becea9f2 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/3c8321354330e48371e34d83563958026c5e0cfa |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3f7e53d060e4b91b5343cc6b3788923fa2589192 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/40d485b5642e3aea91c524382cc742d3ed97b922 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6355316f92a98625dfd14e97de0187714874d0e5 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/52da12279cb04d749a2d0f6637e9d67d8e487cab |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ac03d0c6ec992fbbeb53c07249f4a037eb9acf85 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/764a68f1fa2381ee84c40df63171876decb3cd83 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bcece0262ac65fd2268b04dde1d8f75d8f3392fc |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c342208893c5524732bef28ac851bcbbc2e06f4a |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b703b6a987c0862f2e22e16b2d203bc7febf6577 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/35fafbd2aa59ec049bd6081e86decf8fb6d04d70 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e0b332b2f57bb4ef437a0a412d85442491b14280 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ffcf17f528afb7ee30cec61c637cdc93e72864be |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e52a1a5e30c52acf7ef0c0925b434aa674e20e0f |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ab33f6481094591cd94d4c59d43890c1d5a6dc2a |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/03fbb6f25f5a090652d76daed0ef9affb5561c07 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dec406330739952d0ee183d37378daa0ec1ce61e |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8e82fd97ae169b2cc641625f59c4e565ab8442db |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/638bdd313bdf601927ccd8a74ca95622cbbb1104 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/deb3fec84dae220d54380e96812026fae0039c36 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0d53946d0498fc928e5db5f86acddf844b72ec06 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2989f5fe543c136977463fd2a004f80701d965c7 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/13901d115137d717acb4a1f55a3163defe82e565 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/7a98fa42d27cd5343898c3797ec3860d3f32009b |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/3c15b5c93456c5fa1f5d4dd4900ae792a5d7d650 |     
     powerpc |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/c3f2b42db31882b9117db5b1d2ae584fa7c066a6 |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/2d6de04d9732c8707287d3aee8656aedfc1770c0 |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/2c977ca21c8cf63513a5fcf8dd827b6021fb29aa |     
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/9323db790f3467a9693346e800f17bb32f34ae6e |     
     powerpc |           shairport-sync-3.0.2 | NOK | http://autobuild.buildroot.net/results/9d3f6de1befb90062e73a2a302665e5ca8e398ff |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/acfe98c8122e9a4704a207137a2edf20ddfae69d |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/29f140db588170067d59eb05b6f726fefdc7f288 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/c462616514334375f3635ba627aed069a5eb2bb4 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/166068e8feb5ec13d1e2cbda170d2de67b0e06b5 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/c8f84a1368c2b1a9a473c68c84f4a45f4d663620 |     
     powerpc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/131c1c1dc63d11c29fcdd24982fc1e3025651705 |     
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/59ecb591c29c0c78842b4acaca06f91d77e63c58 |     
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/7eb976b9ada0c364d2c834c91b7a09e6cfc54153 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/2b59de16a4362cd731c2e1b435a66ca964c1c281 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/14447ab9aa4c9370687107bdd290bf1d22bc5d22 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/0e67e53e93399ca3be7987f927ecc87f592b8504 |     

-- 
http://autobuild.buildroot.net
