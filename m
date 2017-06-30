From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jun 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-29
Message-ID: <20170630063058.3F17621D36@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-29
================================

      successes : 133
       failures : 79 
       timeouts : 0  
          TOTAL : 212

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 25
knock-258a27e5a47809f97c2b9... | 9 
                  cppcms-1.0.5 | 5 
                kvazaar-v1.1.0 | 4 
linuxptp-97c351cafd7327fd28... | 4 
dropwatch-7c33d8a8ed105b07a... | 3 
           python-pynacl-1.0.1 | 3 
                 sngrep-v1.4.3 | 3 
                 gnu-efi-3.0.5 | 2 
           host-doxygen-1.8.13 | 2 
                 jack2-v1.9.10 | 2 
                 mplayer-1.3.0 | 2 
              pcsc-lite-1.8.21 | 2 
              syslog-ng-3.10.1 | 2 
                   attr-2.4.47 | 1 
                  bwm-ng-0.6.1 | 1 
                  check-0.11.0 | 1 
           libmemcached-1.0.18 | 1 
               libupnpp-0.15.2 | 1 
          mediastreamer-2.14.0 | 1 
                     php-7.1.6 | 1 
               qt5webkit-5.8.0 | 1 
                   strace-4.17 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2fa9ab7ddd283ce6387cfd8dac94d047e735cbe6 |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/3ef2a10ac6223b94a025da6e0a2e637800e16ed5 |     
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/14a3e9ac1d3bf7cfb723e883051fe8484cef1d0c |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/dd28eb6ef7d2ee1d4183e721f09f1113503b9580 | ORPH
        mips |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f8614774677dcd1590c5bb735c96ddd3588f971e | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ec555fea3b30a9a289aed9dba8cd6385f522ab3c | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/34991c463ada4851f992cb05a9ec6c86cc9ee6b8 | ORPH
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/33f5967238c058c902e6767d4e991437d789c095 | ORPH
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/691d61d13849150c3616b1c74c964f50118ff1d9 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/2918c75e473c5a2434e72f2e409becc5b4d07908 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/9be9c30f9859bd896de358a5cb900355257990b0 |     
         arm |                  gnu-efi-3.0.5 | NOK | http://autobuild.buildroot.net/results/baed2f62f536de63c3173519b169a6317e35c89c |     
         arm |                  gnu-efi-3.0.5 | NOK | http://autobuild.buildroot.net/results/b00a0bb16b9cb96038fa3ab53796630a6926f347 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/af1d4ba7205daeee5a698b69c5eeb65e903bc000 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/5b47290d40459b244aede217287272e8b0459b8e |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ed61adad1a4778043b3030c6ce429d8514f3007a |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0c2cec51253f670b83235f6bdd8d4a717831468b |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6a127741378146e581797207205aa5141b56d541 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b134809d51c7093d8311f990a0532aecd31d6a43 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/255d9a2d6d52eb3e4dbe671c7d57dc34a5d1559d |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/0456e95ca60026c4baaf38b4c1c6b162bf2b9881 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/d5c776fc8731a94c3115a20d3930452c4a32e47c |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6aae797be8cccb0ab81f7456b80585d7c360a0d9 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/5db353167bbfc1c82ab4438da6af232b541a1b68 |     
        i686 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/66cca5e60af03e428f456e98f5f5770fd6f9857d |     
        or1k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/8b11c209060935029fbeac2b5245a6263f522bd4 |     
       sparc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/24de43fbb0a5a0072a68887c613344c1f062da98 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/337be486acefe9ab4380745e5355a37d8126f74f |     
       sparc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/b39a82a2e4106c5ec55c288415e73043a872a0b1 |     
     powerpc |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/d39948c554bd33eb51a6421459ab3a90316c1d70 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a7a43322bb972d9dc52d9951dc4627da94d4d60d |     
         arm |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/b3a9f482f66247fa2e1b601ca00d3035a5cc8d0a |     
      mipsel | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d686b766a608521d74639077097cfc7814ee684a |     
     powerpc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/02c99e0df451e7e2bc394ee7244b8abb0abf26d3 |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/a17d9b2bb63f706f824a88d7cebc1b01edf593d3 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/ea1e66c92506ea0576f5d8c6c8ce2998ced85857 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/dc038c076d2929214cd9a490963e50943662966a | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/50882f4bdee2cd6f8f71e9668e35d80610899a4e |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4f87a6ce18be8e5a175e5fb8cad08eaa1e59744e |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/7b210211eb8e6f8b8f82aa4aace1e797a60ad34d | ORPH
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/cbfbb29ee085c2752a5f3674a3b25f9f622d7eef | ORPH
         arm |                      php-7.1.6 | NOK | http://autobuild.buildroot.net/results/e564f947999e13be3130f3bdc2144d2e670b3772 | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dff73426617173e89cb2b440b4a9ff354f7343eb |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a322a9364310cd6332e3a861801f925ed5daa627 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/52fe6ccad2c42880b3fa404489bbbc001507f47e |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/87d16112362e752fd459bff56a2e65135dae4fae |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0182fafea02c66dc26bf092c4f2621af3802ee79 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b337e275de13989a9d5680915eaab07af1fcc182 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f6733e2032519c0c6a90648b065a5e1502f56f48 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/99d5bc86b1101d7367af5a7c592671488d3d312e |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6f5644a9cea6046405b77ac3760f9945ea4225fe |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1c0a4a9e92527f0b33e330d5bae7cf57c628c7ab |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/73b910b100561e8fbdfbc480806aa22af6bcf8a1 |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8e7ccd3fd34ac247b6fd31425d886e866116c4e5 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/28c1c21329fa79c8c2de12401fa1acee9fb7e81b |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a428c8498a9cd5bdd595ba1f5fdc1cadd23ab630 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8bee61026785386cc5241f557b902d2ef79dbc4 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/4f0b534d7e1a82c59a67ac6bad0cb116907bd022 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0e518aa1854412a4daec59f61d30b94a20503053 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a771b25b7141ab85348ee902032282149613529a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b0151d26a758a48bf456c202f762049d1bf9722a |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/45eeb8afac6d24256259b8b3da5d3beeed1efffb |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1589f3bf8984eeb15f94ef188d590c233651aae5 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/212b6ab6fe4cb954cabe1815cbee96b335ad655f |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8a939d693d4cbbe1f037c452a4ccadc89e12294 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c2120ae984a30a67abe92a3cdcda067e27ff072e |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2d7b374de0fa248aad4b8f69dd03c118cb32e8bd |     
         arm |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/0463654a83365be29de0969327dc7a5a5efd0767 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/98e2a76aee18d12212214c297bed05913301b730 |     
      mipsel |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/1b49c4a8fca1836ab22ed5908a5235a2007f41d5 |     
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/bf100bbcf9d7a1b7b9ccb7a51c7b3c48bd6e842a |     
      x86_64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/bfe223ae7f32d85eff75ec5053b835df746bb00b |     
        mips |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/a853b70a90a3fd62fa9e90a7b1211b2829436330 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/62490a200f1459e63679b662709f7e882b6fd612 |     
       nios2 |                    strace-4.17 | NOK | http://autobuild.buildroot.net/results/0a25eaa6debe701328c312413092af33eaa2c495 | ORPH
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/5c537c239c2c61b8764cdd96d03e8da402e7a9e6 |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/0009616538c1e50aac20f18c50a612685f4dc32c |     
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/21f6037df667918be5e4c8a91f01ddf1552915d3 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/5ed079f4ff0088e2474deb3998847d6a35c29202 |     

-- 
http://autobuild.buildroot.net
