From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Jul 2017 08:31:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-04
Message-ID: <20170705063104.8B96A21D46@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-04
================================

      successes : 130
       failures : 198
       timeouts : 0  
          TOTAL : 328

Classification of failures by reason
====================================

               skalibs-2.5.1.1 | 61
                       unknown | 31
     python-cryptography-1.7.2 | 22
               util-linux-2.30 | 7 
                busybox-1.26.2 | 5 
             host-aespipe-2.4d | 5 
               libsigrok-0.5.0 | 5 
               linux-pam-1.3.0 | 5 
                elfutils-0.169 | 4 
knock-258a27e5a47809f97c2b9... | 4 
                     gpsd-3.16 | 3 
            libpwquality-1.3.0 | 3 
              alsa-utils-1.1.4 | 2 
           argp-standalone-1.3 | 2 
                  bwm-ng-0.6.1 | 2 
                  cppcms-1.0.5 | 2 
                  libzip-1.2.0 | 2 
           python-pynacl-1.0.1 | 2 
       python-smbus-cffi-0.5.1 | 2 
              alsa-lib-1.1.4.1 | 1 
                   attr-2.4.47 | 1 
                      axel-2.4 | 1 
   cache-calibrator-legal-info | 1 
                  check-0.11.0 | 1 
                collectd-5.7.1 | 1 
            devmem2-legal-info | 1 
                  dnsmasq-2.76 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
filemq-3dc89932903b0320853d... | 1 
                    flac-1.3.2 | 1 
              gettext-0.19.8.1 | 1 
               gnuradio-3.7.11 | 1 
             gstreamer1-1.12.1 | 1 
     host-erlang-p1-xml-1.1.22 | 1 
          host-util-linux-2.30 | 1 
                 jack2-v1.9.10 | 1 
                kvazaar-v1.1.0 | 1 
                   libcap-2.25 | 1 
                libmad-0.15.1b | 1 
                 libpqxx-4.0.1 | 1 
                 mplayer-1.3.0 | 1 
              pcsc-lite-1.8.21 | 1 
                 qt5base-5.6.2 | 1 
         qt5connectivity-5.6.2 | 1 
               qt5webkit-5.8.0 | 1 
               ratpoison-1.4.9 | 1 
                 sngrep-v1.4.3 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/3bfee548f69d2650f7523507e615316f6da669e3 |     
         arm |               alsa-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/4225e5dfb6bcf590d9c1068112472ee82bc87d6b |     
        i686 |               alsa-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/15ff0aa36675a32696d0e0dc825bbfbc89d61c24 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/3c38d4813b516ad781f156943a4f5e2d5d9998e3 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/896f6b5ba5d6e5d217e76b155edf80c1ea1e327f |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/8f387eec9ce5a4eee2cc11e77842e617e6d8b71a |     
        m68k |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/972d10a2c1108776862d2e9520d324671b9ee2af | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c23259fd9afc141c23dd91114af45adec9230bfe | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/cca0593b6b891b44e3372106fdf66370c4ff0a0f | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/5e87f4bce2ed591f64cc6309805e78fbbfb956c1 | ORPH
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/7187225d4824e8b0b1521933500019d0617743a7 | ORPH
         arc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/4ba24ebd15d819a52db67969ac8c38990c8c18d0 | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/38f8e1375252ae92dc2ac7d1a0a176d0e18b64bd |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/cd49c4fa9ed8a672faca586730c2b5445ab9ee74 |     
      x86_64 |    cache-calibrator-legal-info | NOK | http://autobuild.buildroot.net/results/a2160d14a0b2ad789701bf43b4f237460ad22f2f |     
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/ad6333148f70475859e0fff6adc63075d6dc135d |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/f57729ba2ca3585958068b77f4d262f26ec2c897 |     
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2908d51757e8e1c39d16c702bc6600e835589570 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d595268889048e5580fdd8e6eb388da8a4e2be6f | ORPH
         arm |             devmem2-legal-info | NOK | http://autobuild.buildroot.net/results/52e78a26ad614ecbf62368bdb0d15ed6117a56f3 | ORPH
        m68k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/6fbf2306caf7313df98404008501a117eb33de4b | ORPH
microblazeel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/0a1686e0dc162496ddaa0340eb926fabf609dab8 |     
        i686 |                 elfutils-0.169 | NOK | http://autobuild.buildroot.net/results/98f7dc7557042ec7958312b536d4148f14ebcaec |     
      x86_64 |                 elfutils-0.169 | NOK | http://autobuild.buildroot.net/results/0fecdfe84a71f2622e4fb458957a1fe7f28686c8 |     
      xtensa |                 elfutils-0.169 | NOK | http://autobuild.buildroot.net/results/a4cf71c34dcc5c750ea87a16014c2cb2d28cdebd |     
         arm |                 elfutils-0.169 | NOK | http://autobuild.buildroot.net/results/174bee27509a97fc15bfe55d28d4625ec993fcbe |     
         arm | filemq-3dc89932903b0320853d... | NOK | http://autobuild.buildroot.net/results/43452430edf44cbcef6ea3a5ab80ac0ff406208f |     
       nios2 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/78adcccaa75aa776847d63d407fd8de5d75c64b2 | ORPH
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/39f382313cc3723624fde0fd1766200573fa0c36 | ORPH
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/a99256141f324474b330258a61de3b29bc3f71d7 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/dacda98dc9ca2e3fee8f8e6d7055bde5e649d2e9 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/f9d8032cf2f85039636526e1588e959854f5f1fe |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0acb7b8e73fd5aef13e3da255f31e214c27e04be |     
    mips64el |              gstreamer1-1.12.1 | NOK | http://autobuild.buildroot.net/results/a6b86866b8b4e8d03397165c89d88fedb752b308 |     
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/f45b6e8479d6aa0efdd64fac7637763951a09ee5 | ORPH
     sparc64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/da2b6ad553cabeddfe685a4a48f0e234ed748792 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/a6fe7eb30dae99203a80a2d8bb55f7dcb51e0a5e | ORPH
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/ecf44019f2d76f9f49298eb2b659891acae41aa8 | ORPH
     powerpc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/68b43cbcf4c796369da02687aebaa59a54874c9a | ORPH
     sparc64 |      host-erlang-p1-xml-1.1.22 | NOK | http://autobuild.buildroot.net/results/c0378fda2ad3d373438c694d5f65af25e1bbb129 |     
     powerpc |           host-util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1ad6b664dff23bb79bf1da1e65df94250769449e |     
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1130f33f61f0b0556880a7bfb6072fad8424e0db |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/64d45ca708994bb563bcb58795bed8f46e5c9079 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/4d4c196aa11cecb6a3bd29fc825b10a13339c6c0 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b2be3d08256de61b905f76e5225820743fcd9349 |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/4216db9d68ae915422c251f38c71f97e26cb4859 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c55b973502b9b88643ae9fca11447b547148275d |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/92517c2866ab10f5c4db68f0af7bc379f00e2959 |     
        i686 |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/6ae4ef5a0c08d47467b26403d492c1fe1b9ac42f | ORPH
      xtensa |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/bcb65ca5eaf54f11bdf1c098ecc949bcc50d15e2 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/cfb3a591391d90762a326d91af3ec502a6161ac5 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/04d27d212fa658d5d123f6cded16d74f12660e1a |     
         arc |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/27c945bb9278070037281a63c25ecb6d6e52fe0f |     
      mipsel |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/21a214739a38e51ba69c2379375c785fd5a9fae7 |     
    mips64el |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/6b3552a20c54a13bb2c4b1257d4c929b9b18c3c8 |     
        i686 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/13f14fd2dbb1f017b6db72e53b8c8be766ed9ada |     
         arm |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/46f8e7da4544128c962e0e786ee4679cc3d308c9 |     
     sparc64 |                libsigrok-0.5.0 | NOK | http://autobuild.buildroot.net/results/cf139432866339f65276bd23650d6513a6773321 |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/140bb32ff8b86fddd10f2d49f31551d69980fbcc |     
         arm |                   libzip-1.2.0 | NOK | http://autobuild.buildroot.net/results/52d6c5a84bc19b2fba92757d9d3d886116218d99 |     
        i686 |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/21183ae4980c4f30c16f814152879d9cb73d12f3 | ORPH
    mips64el |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/946be9bea5b43253f03197f8fe7dd2e7c3d299d8 | ORPH
microblazeel |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/5426c1c03b54a910eb4465437d7730db446fb620 | ORPH
        or1k |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/ed21a57e2360791ecae49985a059b051e910522a | ORPH
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/cb9ae18295b21b3f9399be6edd82273add375656 | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/54e7ac58c55d835970f8ccf81f31df4937169a8f |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/00eff509cb37c564616de9fa16eff8ce97de042a | ORPH
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/16f731d966bebffa6a76d1559b66da681ae2b4dd |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/b36bb514bb8650b068863689248b325e7a0f4b0e |     
   powerpc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f8fbd0cb63b323c2f7e3c86551a8b60fd1b9e154 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6a2c0b5cabca72a4592bdddcd5ad069cc11d338a |     
         arc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2b5092d9b371226ff59a3796d5f2611047aeb18b |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/86a40fa3558a526be34dd31769d6c2cd602e010d |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ebfc29dc0c801c3832276552347422cd3d3cd3d5 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/22eb9921c6730e72066e71cda5363d8c69510f28 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3ef16df3f654b331d872c7fece3abf06afcbaeca |     
        or1k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ba906784ec24936b8c3c3ea1f2c09767ab23bab6 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/5f7a25d321de844804fdab762c7613227d5840ec |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/153a7d463250b4b842eee25220ea10396e160ebd |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/588306605bede4b8adb2d298b176f0603aa05bfc |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/40b6c56a42ab97900213791464f2d82977eb310f |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1a408cec36cdcf49ba2bf8ee9920a7e790f5adbb |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee0eac854d075f7f7e909e12aa7c1406d3de9ebf |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/249e73de061ff2276aa0a783dbb183d47711aba0 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/fe452fb3b7716f72a03222a73f3c9f1cc2d7803d |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/eee4e2861c352dfe9b18f3be82a0741b17ed3ead |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0d8af0e2e00e76f0b2569877be65ef3aeccb056f |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d8f067631792d983d83c639f137fda6950bdda25 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8d6cc8bbf0dd3b8e195cb783d7e23eab7c04f896 |     
      mipsel |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/6118754d1f3c6c796e72cf53ec7b469d39097760 |     
        i686 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/38376afa9727c893ca3d7cdd94f50c2fc444a2b4 |     
      x86_64 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/cd5d1acfd00aceb242d90177647602296497662f |     
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/da0ddb0663de51ce0d02622a7a92b935661e5283 |     
         arm |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/e5219633c0cd758fcc76c298961bf6b554b5bcf2 |     
         arm |          qt5connectivity-5.6.2 | NOK | http://autobuild.buildroot.net/results/a5fcb22a45342f325e10637e91aabb05f72f23d9 |     
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/ba845d3acb7883638f21605ef1323ac5a873f438 |     
        bfin |                ratpoison-1.4.9 | NOK | http://autobuild.buildroot.net/results/10c0a41275ba53473c89881990ba608b7550b23a |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/30891f5928fb3d68a36e6ad41ff7dcf6c25d3b80 |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/9fffe84e0386c232802d6a126691007e9cea6d24 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/c1b1f6ca5fa1621c0588010fa0d247e4a3c53907 |     
        or1k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2c6f3c93c025a253ba6b98e6584f8af2d8c4346d |     
        m68k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/fc24104ed0bcccb329fcc3ea2a074d8232de049d |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/80fa7e6197c2c7af1a40cd0232221e5332de488f |     
       sparc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/df340b80a8a71fd03f285cb62ea8476cca310c04 |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0660edf6dc9efe28af120a2b7c0663b79a9cb6e6 |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/23cbe0ad5962539a15b3fafcbf257fb147d3cd65 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/aca700a234216f0cb49c3611c990fc6b5ee936c1 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/32bdfda6e4eede03a8358d32f02c029015b24a53 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/f31a59077ddc2ff341f878180fbb7664a62bc684 |     
     sparc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/126edd80f8e8d11d83034067f01a107c0f92b434 |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a136493e132b031ed271eddcc4cd2dda3bdb2df6 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/6c57eda2f41e270a20e7ac13ea98acf25aaf686c |     
        or1k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/7d8642fc304ebefb2b244427e4875366ca3e2d02 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/f58483f05fcb51e69ee19dd64621c3ca7e2dc6ce |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0412394e71b3a393fa76ce8d7ae5547e9c593ca2 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b9d9238ac702c0fd9490293203c034fadc6b926e |     
        i586 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2759ff9ba68b71313f97a8bb18c625a9d89d276c |     
       sparc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a7b4f2c1f3588f21e46a938470f1619bd952a9a8 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/1dec9530d4a0f4f5dbcb2781f92384713c880fa8 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/85c2e456c27c3408d943115827f656a972a5e5d5 |     
        i586 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/4171b1e7fa4061347dd3b8c04342662976924f13 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0541b911eefd144135b74ae95594bd7d65cd3e8a |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/bda763bdb485c7e01c09f25b70e467620e9d9d6e |     
     aarch64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/488ce1b66339c71ba7317a087b485cb35e34025d |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/bc2a8d4126df78b444bfc6aa3377ecba49772593 |     
microblazeel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2e9a3a3ca9e9a6414e2e072c81b45b6639d2798b |     
       sparc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/e1077d8e2d484f975ac61a0128ef50d2355ed87f |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/fadb7b0ddc316780ddccdcd6907ce35cbdf320d2 |     
       nios2 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/2975bb2e4bcfc84cf4db018ec684e6b791df750d |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/4f096e2efb572fbac1d04c5e649bd2c11e79c55c |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/f45bef44273bd51d6b3ffef899b39e7b4cd3cbc7 |     
         arc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/ca3b2815747910320293cdf66b34aab05adf2827 |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/90708b9753f62b48c3d502344e3874b64adf49be |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/bd285891ae1c810e89ba29bb568964fd863f8dea |     
microblazeel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/51b432f4a1be91a3442359f9545ef703b448ca4e |     
        or1k |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/69ff4705245a6597c08760cfcfa190cfac63c662 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/69012d4837901a1f57410069f216dbbcd6dfdd9d |     
        mips |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0ab4dc2970cb4814bd6c267cdf77971e3dbf2c86 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/e1f958921742a97abfdcbc4e8beaad90b279bce6 |     
       sparc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a6bb913cea2ee965ac09d88b310e7b647b03a7cc |     
     powerpc |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/1d9fe191abad1a9975078df30a79f87e1c934b05 |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/38b8b6f7375c3c2708011aec58a4b82603f10ab1 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d35757d9657ef5caa6d2d585ba58cc075b62fd44 |     
      x86_64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/69a70ce500acb8a90a927ac0dd23b18cd18d7fe5 |     
      mipsel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/39b123a2943e61ad63ab997e3262d2ca3db50186 |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/6d6b5c43177ddf8e814a08e16ddae7f95b4b4131 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/f220a935becad28cd55dcd9d9fee5324ef3d3643 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/827a350432971a125fa4701a9c3ee9f0b4710466 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b68abaac922b4c853715bf52e84b7b65d845dfba |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/b1f5e8bdbf7c0fe03ddbe8da72513a43ad2a85ec |     
      xtensa |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/0f0a422aeec673bc5f9feadcae1ad17a4aafcd4c |     
microblazeel |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/04c3aac53dd2fe18739cfb83f53b6647a9f9c251 |     
 powerpc64le |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d738f07b5091d54e94fab016931aa9be308aa715 |     
     aarch64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/1ba456074f4d3bd73da4bc3e2cac548e077684a8 |     
         arm |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/918f9cd43a3c5996f42cb32b770280bec9985296 |     
    mips64el |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/536a63b3c38ad23676b9c421e19dc8069ddb49ee |     
   powerpc64 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/5dffb54351ae5486ed11a748a8ac07ef5b77652d |     
        i586 |                skalibs-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/9e15302b683637268acc7b780f9b1675b0e1d48f |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/4598223f5c62e82bce18c7a4edb52bd1d1940c9b |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/463aeb63394097da2090179a80d65a347aa479b0 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ea63703990071791186e5bc7b10b5af531ae5bb1 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/e127b3925dac5f85dd6fbf02bf3346612f2d37fd |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/1e71f926a621251767bc364b78ba38039e59ec09 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/d249a156049cec35d531a95ae6c646b46c631e66 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/403f08d929bd29d4ea497db3a28d73f0a507cdff |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/937bbc0dbe8b5e9fadaae1ee4be3d4b4d9c93488 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/4bbd9cbd265d1e1e2b13838cb9e639530b6e854b |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/76bf9d0ae3165edd368075647894ee476c73b74a |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/e35c9672755d5dd2b84b64ca50a1b4579bcf1bf2 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/dd3b1e4957e0b3636224b9b465f416acf7f0a435 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/1badf57dca5f1c735c6aefc5b22971254e82f5ed |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/6f779877d1eb36ac8613ae36c10973e3e4dbb182 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/1f1f5163d508d4bac4a8442594d27a793b0f433e |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/ec307c1e19a0ee669f324f69ca66d8c861c572d8 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/20ae84e2b3d74b2c7947891d67888029c1b4e3f9 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ea1204ca06f7f45e83433e1cbb4d74bc983965cc |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/e792a4a32c5bb3d69ae37c74ec1de12e80668154 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/39eecaeb87bc8be279f36b924d04e83fd8d29242 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/771027fac9b389dee3158d14b2576809d4181820 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/9bf4491726114e7a09d8757b1587c8971dfd93e0 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/a2a2e56f6a083f5fccc69d4198060ddc4b3a940c |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/c4f7b64b33b0ce1916090c2af62e64e53c864767 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/e09cd8e1208eafc181c6b3488f4099c9e1621db3 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3df77b066b84fdb6ce5e9ed29f862a4dbe1fd457 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/dc2e4e398c71f2f58b341e87812989955b2c2013 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/adc3fcdbc803485a1a37f4b26cfc2b7f303a0187 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7e3f4e1e9a6e1a63e1053c0adc52678a4df2be77 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/848157736b61b8d508acb76341585ac7affea755 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/6e7de85f528580147f5f0535f3b8eccbdbcab3b7 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/9f1e415439c4e477fb46a02f2e442a19b13ee618 |     
       sparc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/865124ac21f3a8493f50336799e25ad8616967cb |     
        bfin |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a068dc9207543d247fa7d04ffc44418e9283003a |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/13a45a77e3be0cbb165f4abb25fd1a048550ca91 |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/523b0cde15e9b65032ba5ac88e05933ad9d38d34 |     
       sparc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/975c11c743f8ac80a36ded03c9987a9e930bf06f |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1c32d829a750472369da03b8a16cd88360e19d3f |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8c6b1e69d04ab277fafdbf6fe5d414650fa58752 |     
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/0a7ec6971dddbde121f372cd6bc2b0b550aa7c96 |     

-- 
http://autobuild.buildroot.net
