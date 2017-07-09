From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Jul 2017 08:31:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-08
Message-ID: <20170709063112.D7FF321D8C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-08
================================

      successes : 187
       failures : 79 
       timeouts : 7  
          TOTAL : 273

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 31
                  lshw-B.02.18 | 5 
                  cc-tool-0.26 | 4 
make: *** wait: No child pr... | 4 
                 sngrep-v1.4.3 | 4 
                  cppcms-1.0.5 | 3 
             host-aespipe-2.4d | 3 
             lttng-tools-2.9.5 | 3 
                     gpsd-3.16 | 2 
                 libv4l-1.12.5 | 2 
make[1]: *** wait: No child... | 2 
           python-pynacl-1.0.1 | 2 
       python-smbus-cffi-0.5.1 | 2 
                      qt-4.8.7 | 2 
    azure-iot-sdk-c-2017-06-30 | 1 
                  bwm-ng-0.6.1 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                    efl-1.19.1 | 1 
                    ficl-4.1.0 | 1 
          host-util-linux-2.30 | 1 
                 ibrdtnd-1.0.1 | 1 
        ltp-testsuite-20170516 | 1 
                    mpv-0.25.0 | 1 
                  nginx-1.12.0 | 1 
                openssl-1.0.2l | 1 
                pulseaudio-9.0 | 1 
               qt5webkit-5.8.0 | 1 
                  screen-4.5.1 | 1 
                  tremor-19427 | 1 
                   trinity-1.7 | 1 
                  whois-5.2.14 | 1 


Detail of failures
===================

    mips64el |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/ad752cf47ea5841b069f125e699536bf1182756a |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/723e7bb17ebe6a44972a6a7d51c6151872d5927f |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/19db55171437e6117f20362ff50a4c82ae591fcd |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/308c97bebea4825e13205183f9bd91189170365d |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/caec50cc56f9b81974b85ff7000c69a088057417 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/290e18e3569678eec3ce8a22dfded72b2788637d |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7668175521a0904ddbff56a5437ae0c3e425a6c6 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d80cf04bf0ae04fe871591efbf273e7541c37b35 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a3f93ee8bf96d20bfba2a32f936e8523d75425b9 | ORPH
     sparc64 | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ca0e9f226a7ed3d6fd448911b5a7377d66f8e73a |     
        i686 |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/b89d85caae9988e6cff73ab9a5c3309521d8a027 |     
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/152afca76737e9034e2311c299b0b3c55a7ba2d4 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f34bd85841ceed4ccda2c02650c14b3665ce15cc |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/436a9e0ac9cbb478c91b3cfa335e5d53d8477190 |     
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/1a9041b06bb05285570e79f2c68d27c608415935 | ORPH
      xtensa |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/db626a087f954a12a09e227b68f1236ef3ab5034 | ORPH
 powerpc64le |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/58e89ebc5dc03673de21a73496dc924975b63211 | ORPH
    mips64el |           host-util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a0096eb6e65b83b2b0c7d38e5f978c3fe636cb30 |     
      xtensa |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/75bdb64e9df80c6c02d42e7dd38903276143050c | ORPH
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/845bdd70ddadd07d847aeba08a06545a8f2abe9b | ORPH
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/22fcb3c441e79916a236ffae6411424b93406fc7 | ORPH
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/98c3505a75dc12ee17a9c80d46653aba11fbbdca |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/7251fd0c354253754f9a64fe1b5fc8c943e125fc |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ad5beb629b3f92907fcf26398305bf6be0f86be8 |     
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/fc644080176960e8fa45ba7dc452680d071abd97 |     
     aarch64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/763077f806401ad6ca4104bd58706192e2e4f770 |     
     powerpc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/6f8f7ecaaa7d779ddb8d0e1b8eac16d312d0eb3a |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/dfeb35933a9e9c94d9bea02ea94a2e022bce08ef |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/e4413f5b6206564aa6e2803e0cea07dfb078c641 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/f9a4554d9532adfa3ec935da9d8b128c1555b2b7 |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/de1fb0a6c94715bd31b1bd55cb48ac876e6a9211 |     
      mipsel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/fbdec3a9afc9edf57d040fa41adf0491160e5330 |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/b390f48923bf4556f04668e2781c57e0aeb0ea1b |     
    mips64el | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/8c5c964ee11ff797311f31baa975934e5d1323cd |     
     powerpc | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/80fb04f01af51603812e1f2c664aa3cd182191ce |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/2cc79aa9fda40aa7291b21d73058d076f9353be3 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/54572935616c35e90cf205f4701add9244c0ba28 |     
        or1k |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/496cd97924bbf133b7f3761997e29e84968abc86 |     
         arm |                 openssl-1.0.2l | NOK | http://autobuild.buildroot.net/results/24d4ccc6da9d179635b71cdccd252415c69f73c0 | ORPH
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/78212d50e71622063bfe3e24a07f39b05b1c06f2 | ORPH
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/439b8e01c84177c1a33c1ea1552e6800c6320c54 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f9837ddfbccb88e598f9422afb020b009f74bafe |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/da191d9d2c6fd113529f5d74edc6287d5ec27cad |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ac833ca1d3f7e283c3387193c3e83e88a4d3e95d |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/490e126c2a78e1dc08a4338ac78ec6240f6ab7fa |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e534d8b5133b3b2b4b101f9ee39a58c849693602 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cd9c452fdeebdb79a9e62b3912178ef02f2f2a18 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/04c87b58b0ebb4ccdddcf8a8fefae6e9f7f58801 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7a5234bc0021372eca34173530ca514fc6bad195 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cdd5b430d229ad952ec2a648adc5137160397133 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/56dfdca8212b810e06cfe2f9e0e4f3527d5ccc20 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f7d348c0ebb8d328fe42194ae178a05860311fbf |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cdccaae60d5ca6227ca5271981b40e29a8899be8 |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1657bc64c6e78ba50f28b089d873387a112dc0f1 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9dab7604acf4d01cca154c3d6247bbbe2bde5227 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4d6016d1da597a1890d502febd254fc0bc9e4ebc |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6d2351aa13c0862f1ed5e3d03440bd0d49fa85ad |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/beb6ff4e2c3d3f6c0c6b709d0c3feb2f4468381a |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8e439fb1a2715eaf99bd33119f47647c614c34b8 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/164333ca327301f05ed4248e3bbc568b8853e646 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee3741b448250895886dfcbde0b1b48419ae7a9a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7bbcb41d489709436ea2fb685edc7832892d561c |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6fe6e29d82b7543dc269c9b1a9a559d6e1a5e322 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e6bb05756fbcee897b711d449de27ec9bc978eec |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/98b760c48e7028e07a35e40260faa313045afcf9 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/909c04558d07e727ec56d8ef3674e8d8bf3b6971 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5ec04b7a5f3f875b6ffcec5404b29ca4ee5e39c7 |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6b69c389cfe3d95e846e06072ff003660147d98b |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9f2c159a38675fb0a8ce53a7ec009c53d3b638e8 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0162cd3a95b931305c04767fb01190e0f5730f85 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e1deb29b393394d064e4de0a41a7f6e8e1a71689 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/d9d67ccecf5a5236e20abd6c1724150100eddb84 |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/85c2d790b9b61d4a8a66cff8a48a0b66f81cb24e |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/92179fd73517537732c1eb57a39df4f79c69459c |     
     powerpc |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/9865678ebd19c3c643b5cbf8e6f1e5e0f9049424 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/72bcb61c634d1f4fe62300fd7acc709d60f7f01f | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/704996026af570bcfd4d7fc58eca5ef3157c3745 | ORPH
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/eed3a314f943b081280e7716e53d0ac51653078a |     
 powerpc64le |                   screen-4.5.1 | TIM | http://autobuild.buildroot.net/results/d52d5b0cf668b94df20355036dcd8778509385c2 |     
        or1k |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/6f43c1598517130d264f2c320c9aa2801eadbc5d |     
        or1k |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/8c6e424cbadcc7b0d49f497f57f7f137e425499f |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/36553374c1dd44df7e08135a56907177af14d8fb |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/a6542f9c6f31689bf00b7b01e5da20f76662e76a |     
         arc |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/8ecc179dcde4c0b751d7ce9ab628fd9f78e8f2ac |     
      x86_64 |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/5fe72088a5f6de19d615aba4993d6ea76a74cddc |     
         arm |                   whois-5.2.14 | NOK | http://autobuild.buildroot.net/results/cdb3ca289106f9ca37eef33c7a2f22d9db887434 |     

-- 
http://autobuild.buildroot.net
