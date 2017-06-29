From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jun 2017 08:30:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-28
Message-ID: <20170629063045.0D2652091C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-28
================================

      successes : 128
       failures : 75 
       timeouts : 1  
          TOTAL : 204

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 20
knock-258a27e5a47809f97c2b9... | 8 
linuxptp-97c351cafd7327fd28... | 7 
                  cc-tool-0.26 | 3 
                kvazaar-v1.1.0 | 3 
                 sngrep-v1.4.3 | 3 
                  cppcms-1.0.5 | 2 
dropwatch-7c33d8a8ed105b07a... | 2 
           libmemcached-1.0.18 | 2 
       python-smbus-cffi-0.5.1 | 2 
               util-linux-2.30 | 2 
                busybox-1.26.2 | 1 
              dieharder-3.31.1 | 1 
               gnuradio-3.7.11 | 1 
                     gpsd-3.16 | 1 
           host-doxygen-1.8.13 | 1 
            host-libxml2-2.9.4 | 1 
           host-openssl-1.0.2l | 1 
            host-python-2.7.13 | 1 
                irrlicht-1.8.4 | 1 
kmsxx-cb0786049f960f2bd3836... | 1 
                   libcap-2.25 | 1 
                liboauth-1.0.3 | 1 
            libpwquality-1.3.0 | 1 
                librsync-0.9.7 | 1 
        ltp-testsuite-20170516 | 1 
                 mesa3d-17.1.3 | 1 
                    mpd-0.20.7 | 1 
              syslog-ng-3.10.1 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                xapp_twm-1.0.9 | 1 
                     xen-4.8.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/fb5f894d88d7a972d48e50034b2c45dcb56bb844 | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/03c4e1e2dd7a73a815cd3ed6b3c66aced9cdd551 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7d19750bd0cce83f401f59a8dc9e00b4e69ba993 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c2b01be7151ce3ff31842e307e95893310731ead |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8c34f5658015d511fc60a2caa964a05449848a57 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/946c3ea61cb3376980bedd6209aa743eba770143 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/273ba504de31bc17fd41e91ee5d6c0b34797a4f9 |     
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/07bfe9db679ae3cfba96a971dc277e392963bc44 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/cad1080a8535760fd18d8f51e1e2ce5f8f504e2e |     
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/64bc78e5a73f072596e86182817618356c3db2d3 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f994f2511b2826ff3db87a4219e1ae7ae376c085 |     
      xtensa |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/6858eb8ebf2882098e30b121f7f33c91cdd9e506 |     
      x86_64 |             host-libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/e620b7ee0355e8a4c19386b60560a82d7d3c6880 | ORPH
      x86_64 |            host-openssl-1.0.2l | NOK | http://autobuild.buildroot.net/results/453da5c2332773f0a1dfcea538635662627d8ebc | ORPH
        i686 |             host-python-2.7.13 | NOK | http://autobuild.buildroot.net/results/62440581e28a9ffb93bff2b4ddcbcc29a40de5c1 |     
      x86_64 |                 irrlicht-1.8.4 | NOK | http://autobuild.buildroot.net/results/3c3cbab6887baa44d2dba088879f1af0e0132fd1 |     
         arm | kmsxx-cb0786049f960f2bd3836... | NOK | http://autobuild.buildroot.net/results/0077d64abacada674ec21b371bf380f8911e7bab |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f6a7a3e61a52d4083893beaff2a1ccd78f6ab6d3 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c9be5e9c9e461de2aa0e2acb107b690275ef08e3 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/12164dff2fae4d179eae6d1e584c18e0cc4791e9 |     
      x86_64 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/f4ce3d6a42428f397a73378c9496ea7bcaf16427 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/85b8782eaf2ebadf3b2cd997be3b36cd4f399620 |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/4e2b55823fd9080a7a0b87de327e3290b7a614e2 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/636d2043468f665150d0ec2f035123e53be57444 |     
microblazeel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b001055c6ac0a5f54b416b9bc58a370cb85fb0db |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c27dd2aa36ef28f5b68e49a283f789d96b211f19 |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/f24bedb8607b7a94ddf38569b01b634b52a7f06c |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/2cf12bc7dda4230817395af24db7573ae2955c53 |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/54dee890915fcacbe4821870a319bc22536ff3d2 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0bd11933bf517e5e76b2989e72d6d38f502c7957 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/13acdd31f06f541d9af442a0b1b72515072c9a9c |     
     sparc64 |                 liboauth-1.0.3 | NOK | http://autobuild.buildroot.net/results/d02fc9d27c01083ef9cf9eab4b42844d06e3f8bc | ORPH
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/c7db29fee3f3f719e4929b460465971964e7daf0 |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/d6990db37867955a50b28c6d0ad8d61b0a822453 | ORPH
       nios2 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/08d10003d125664eecf4cdf63dc0da0dbc138af5 |     
       nios2 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/c49fcfe9bdc7bb41cd23315e9b334c9f0d79e195 |     
        mips | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/89e3f02700765c60f2bfc4ebc0452fa10372248c |     
      mipsel | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/aee72a939849d36e394bf4db145e53d6184db41b |     
      mipsel | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/57c00d1bf25478f62b9065f637447b2d7ec978bf |     
       nios2 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/b21f7cecca43abb0aac07dadfdff7c8695920525 |     
        mips | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/cfc58a87e6f2d61523ef5ed105da42a555b1f640 |     
         arm |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/9ee7050bb2a5c83551505ddb2cd2e4d4fdbb1fd5 |     
         arm |                  mesa3d-17.1.3 | NOK | http://autobuild.buildroot.net/results/bef9e722fc36c5a31f5546d5af923fd513ed16d8 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/508d251efb07d161936a8b9734b1d0b772593118 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3d9045f18c9964c2799d784140b526dc472d4cc8 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ad6907c302ba2e1f0375e9519f54dcee45b35fd5 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d6dbb55b25314a14b459d777cdaff8f197fb4c95 |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/64702c5d8e27abd073eebeb001b9e363ab26e378 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2783ed5f4b9a5bf21f6e79f1abf59f3b83284db8 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/57bf9a4639c4c22b1b98d0c76e47592b6eb44db7 |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1d7d432986d7b8706728245199ea5842aad74486 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a5f9113fa1914018408aac311a6690f269cebe33 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/abd5b5dbdbf145ee9707f67524f18be3d3589f71 |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f509cdb57f9c5c94b1a4e233b3d8222012f8d1b2 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4b762e55fbcff3f9787a16665fca0d232ebb030a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cdb74fcdaa290b353a93701c453e15ce4dd43bf0 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/05d50fbcaf35c0ea1e88329ae50446ac32d1ea7f |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ab0738db35b1095bfb572ec90c667cc845a4e00a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8cec27211e29577e6880826d63877b45d0e6974 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50dd865fd0ad5e11ce6c4faacae94881a319690f |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1dbc563ad21a8e39a777ae77c25c1f92f913ca12 |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a262cd5432a31478e4a19c3159a8899dcfee312a |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8332f289daa10d4254de18e77a2ed571cef75e7 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a5007b5557df92186ae97a1126aef645ffa7f70b |     
        i586 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/455a94ee95d4cfda047640a1abaae1292066d123 |     
    mips64el |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/0f3e04b98cac569cc4989d995caf2d3623c8288a |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/703bc71dc0761fd9189325da28bb1470066c28c1 |     
      mipsel |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/4c1d3a16df62abc5d03eb5fc6d4eef028f53e9f7 |     
 powerpc64le |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/1c5efc7371a90ab5a7ce452e5cf2ca5dfa47083a |     
      mipsel |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/a716a4efd11793ff6969041d8cbfcf13266045ce |     
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/30369e328189cfc5d0e281a479dea48e6dcf9903 |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/40920995b1b98bb5bdb148a68867e59a5ca83f36 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ecbaeb0ee2de6fb01a9c634b3a5ae46d0c34e44b |     
         arm |                 xapp_twm-1.0.9 | TIM | http://autobuild.buildroot.net/results/9c88d2150dd8d4a862657017431cfe6094aad94c |     
         arm |                      xen-4.8.1 | NOK | http://autobuild.buildroot.net/results/3a03c328bc6a6c30cc4f619925608d735632211f |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/bc5aafc1dfde72a60d1cf6bde4b5c49e044aec29 |     

-- 
http://autobuild.buildroot.net
