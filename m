From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-13
Message-ID: <20150314073020.DCA2E10140A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-13
===============================

        success : 296
       failures : 90 
       timeouts : 4  
          TOTAL : 390

Classification of failures by reason
====================================

               tcpreplay-4.1.0 | 28
                  uclibc-1.0.0 | 16
         lua-periphery-1.0.4-1 | 4 
zmqpp-36413487f05b165dfc82a... | 3 
                     vlc-2.1.6 | 3 
                host-gdb-7.7.1 | 3 
softether-16b713b98da8dba29... | 3 
                collectd-5.4.2 | 2 
         erlang-p1-tls-53f0478 | 2 
                   systemd-219 | 2 
                  cppcms-1.0.4 | 1 
jack2-ab409a65df95bc261ff72... | 1 
                  python-2.7.9 | 1 
                    wine-1.6.2 | 1 
               sdl_sound-1.0.3 | 1 
             fxload-2008_10_13 | 1 
           heirloom-mailx-12.5 | 1 
              wireshark-1.12.4 | 1 
                 mplayer-1.1.1 | 1 
                   mono-3.12.0 | 1 
          host-gcc-final-4.8.4 | 1 
             alsa-utils-1.0.29 | 1 
   libnetfilter_cthelper-1.0.0 | 1 
                   strace-4.10 | 1 
                      qt-4.8.6 | 1 
                    neard-0.14 | 1 
               alsa-lib-1.0.29 | 1 
                  vsftpd-3.0.2 | 1 
              xmlstarlet-1.5.0 | 1 
         xlib_libfontenc-1.1.2 | 1 
                   czmq-v3.0.0 | 1 
  toolchain-external-undefined | 1 
               host-qemu-2.1.2 | 1 
             python-lxml-3.4.1 | 1 
           libmemcached-1.0.18 | 1 
freerdp-b21ff842ef3de583751... | 1 
             host-thrift-0.9.2 | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/6764d307b21c8333d109d5e00db6eefc18197031/
      mipsel |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/6147568fb8ed2f021a9a1ac73801b0271da77a62/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/6c7dc23ebe1b33c3ecb6a599903370ffb153b949/
microblazeel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/5ff9769516e877ad0c33d02b50bb818350131113/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/0dc03a0ab20c64d604ebb1bab8e605ecba00aeca/
         arc |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/ec414b52f9cdd8d7d365283e21479519e63c7d97/
     powerpc |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/fe42fc09809f37e42188d80cd1cd003d54b02c2f/
         arm |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/87cd2159a3912806318760f3122f22a23c6ff991/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/06410ce8284cba7068b496d6b7c672150204746e/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/2c74c72b06548c4db2183c8a374c762ee6165bd9/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/b74010b669fe985623feb948ee11e070749fee9c/
      xtensa |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/585355d97820f26d6646aae67a2831751ad4a0f2/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/1f265c40d9dbaae8a172ad03f46058754221eecd/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/524ebba039d6cc4efa0d0deb3a3a19091070899d/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/773e5108009cc0d82b505a0152e946bbe12ef964/
     powerpc |                host-qemu-2.1.2 | TIM | http://autobuild.buildroot.net/results/594b08c7cc06f96c1afb12c621c48d68b4aac1b9/
        i686 |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/22eb46d47466b003f2c7f4c8a345526e29b930a7/
      mipsel | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/689c183fa1d8b94f1090792ca9c3f22d2a360dea/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ae28f37f3fdad32b6666c69a3c2270852f19e64b/
        mips |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/73ab6aee8f5c88bda170fe7693d7c483a770d608/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/3f4274d975a5be0f693ed876518e313f0783b7f4/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/d37972e5bcb95740d58fb27af0f9f78746ba9cbd/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/ca2cdf1dc7c8615fe8e7bc42e20985255f7766a1/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/161f6fadb46244e0d564eded37a0a501188f748a/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/0757193c4c72d56534343dfd80c8a50b288b101c/
         arc |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9208ec1e70b9f714fc9749b1a6253ed3ed8220fc/
     powerpc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/a5a8031a2cc7e984d11a1ac3b05fc280ee3a8556/
      x86_64 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8d6a11cf7b753ac2cdc1f7277201b83c1be5373d/
      x86_64 |              python-lxml-3.4.1 | TIM | http://autobuild.buildroot.net/results/17c26d321c54c6056489b44f112709748fcc08e6/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b8559eb350a47cb88473a9a025b2ce82d8f35d2d/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/777a6c154c1253bacf5f8aac1fdff9e76e7217cc/
         arm | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/1e4af4642691ea9681b39eb1ce4f8107e8c3ff5f/
     powerpc | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/182e658723d654d45c683dc2bc0b959c82c37826/
     powerpc | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/4467fd6aad86bf176625fdc74f5802f35519f157/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/0e9eec69c483a6312ab1f119affa7185bb18e873/
        i686 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/03a96697aa72b69546d61e56d1285bb50b0633d9/
      x86_64 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/60943e2a69eb9c3a0a1a7adde31547379ddf5f03/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a7d66af1496a5a3b7c1cc7120c7fa9ec4210be79/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/ca9d71419a698a72ca4c6b93a57834cf5679dcec/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/b90c2b07005b001701d93b1217ac41e640c6bfc1/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/1843daf08de3fdb87c48da904e2bae52cd845cc6/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/9d65ef8226344e3e46193c6d3b0c53e5f20c3b5d/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/8164db684258736c91bcfeffd42b52cbf77c9f24/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/c345053103e5ac7bb5397d2e2990bf36cd9a1d68/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/c29f035cabcf59f30ac830b0c107dfdafd5e145b/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/84fd5d14e7cb600623e7d1fb29d65d5d08baa190/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/70b74be31fd84373289a3e4855ec60ac9c378f2f/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/4e909a17bd3bd1d0bc5cda19be7c07eb9583fe08/
        mips |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/d52afcbb2871738b136ef38aa825c66573642653/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/0e41f23c47547b7bcb4465d022d597befc9e86d7/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/690c44c1cb5ef3570664d57a0e5edd8fa7319cdb/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/f0106069687958b9dcc3ce44d52868ac7efbb43f/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/5987d54adaf3a88ae0213c5ab4362a34d542920e/
      mipsel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/7d2efddacd5583a8f46bdb58eb8d538b79ea6957/
        i686 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a69aa9e082e825932daced501da4b9f400347439/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a4398eb4e179d73ced8cc07abcf71c554f0e28e6/
microblazeel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/cf2f44bc6b071c8a3bec0b51cc6b84730ec10cbe/
        mips |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/2a997ddfc619653201988b136282473d5a8149e7/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/9b6df89c28a03ba072558632c861353f9d407883/
        mips |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/708bbdcad19170ebcca7f0c704d4696d7e7cb1b8/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a8f147f63c4a4c8123f51b74448ef525a1834ab9/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/788809e94e5839ab7b66e9b98328cf9a1ed52caf/
     aarch64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/e3022d7b659a0205dc09f7feabb4607f47f7decd/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a02a6bebb936050b7c5496122ab1ea687f845946/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/3dd827ea0230e977d19c1593584473a78729333b/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4e58ac6f280166619d5b314546e7ce1f224b3228/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/5c46725c375ca5fd4b4887f4dabc5333f3cfa62f/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/9ceacd59ba249818bfe69e1a729eabbe3b25406c/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/7a654be796484b0b18544030af7babe98a3b440e/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/dc22077855ad37a2dc14bf95903f87297bd317c0/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/c5d63b59171431dd8fb9cadccd42944eaac6297e/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/867edab1b6915e8033d553a90e7f5ce261ed9030/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/03a69d6b505a751cd963469c601364b160ee85a3/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/91f6c47a0b62af024524675032bae4557c994155/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/3513c7d4fa5cfdd069fe6c696e5439dd75040c11/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/5ec2235e0f93c5239e28a6d4f0804ebdf46ee31d/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/4afa9a224c78f4763fcbeb06e594daf4e5cf232b/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/bff6fba566968fe3125f55d0d58ede70ab00fad9/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/934fb24ccf36bf0dd8305ed0252db4b5a821fc47/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/599fff400ffa7b66a31d8cfac39582a72a668a8c/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/0fa708bef0991ea31222846eb8529a86d000fc05/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d283af3bc1fe86632aafa2d78f7464b0dfb71185/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/94d639b8246edd7e6b5b5440a09deb239fbde523/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/2a413d972a2e70ead68d992c29fc9c9ca34dc9e2/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/fedce9d871c53b46b75645f965c1e5f1c9fcd18d/
        i486 |                   vsftpd-3.0.2 | NOK | http://autobuild.buildroot.net/results/05faf6862a5059acd4cd2c7bc15c6ccdd9a56b5b/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/22c197c7e591e5c073cb069618184434439ec1d7/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/a4a1f8a495f43b7b20032d6a3a6266ec4652ff1f/
     powerpc |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/4754292d8fb2b0f281efb61a6d88e10b72309893/
        i686 |          xlib_libfontenc-1.1.2 | TIM | http://autobuild.buildroot.net/results/9e2afbd515aa2274dcad22240d05c4aaae33e3da/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/84092ef8fcd5321b201bdf61e74414b2bb8974ec/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/4c34ce881e3eab47994cc893898cbc9129ce67b5/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/9849d492d403cd9ab2fcb127eeab97589c6580cf/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/299a8b29116a9e3a70b9c61449a7194a879c28df/


-- 
http://autobuild.buildroot.net
