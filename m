From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Oct 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-17
Message-ID: <20131018063006.B6A2952C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-17
===============================

        success : 97 
       failures : 67 
       timeouts : 0  
          TOTAL : 164

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 11
               libglib2-2.36.3 | 4 
                    php-5.3.27 | 3 
                 libvpx-v1.2.0 | 2 
          enlightenment-0.17.3 | 2 
                 binutils-2.21 | 2 
                 libffi-3.0.13 | 2 
                 qt5base-5.0.2 | 2 
                    nano-2.3.2 | 2 
                     rpm-5.2.0 | 2 
                 rt-tests-0.83 | 2 
                 libfuse-2.9.3 | 2 
                directfb-1.6.3 | 1 
               alsa-lib-1.0.26 | 1 
                 webkit-1.11.5 | 1 
                  poco-1.4.6p1 | 1 
                  udisks-1.0.4 | 1 
              e2fsprogs-1.42.8 | 1 
                 libnspr-4.9.6 | 1 
                     gmp-5.1.3 | 1 
                    zlib-1.2.8 | 1 
                openssl-1.0.1e | 1 
                 fdk-aac-0.1.1 | 1 
                  nettle-2.7.1 | 1 
                  boost-1.54.0 | 1 
                 binutils-2.22 | 1 
                 libpfm4-4.3.0 | 1 
                   squid-3.3.9 | 1 
        host-gcc-initial-4.7.3 | 1 
             bluez_utils-4.101 | 1 
                     m4-1.4.17 | 1 
                libiscsi-1.6.0 | 1 
                 libevas-1.7.7 | 1 
                 mplayer-1.1.1 | 1 
              cryptsetup-1.6.2 | 1 
             tvheadend-2b64995 | 1 
                    ola-0.8.31 | 1 
               libsigsegv-2.10 | 1 
                 libfcgi-2.4.0 | 1 
                  libnl-3.2.21 | 1 
             uclibc-0.9.33-arc | 1 
                  zeromq-3.2.4 | 1 
               w_scan-20130331 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c415f57d7a4b46440161ad56bc2b81a1079d1996/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/8d949ef07e8525d384bfc37ea9bbe3793b95e568/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/4bccf4e5b9e25f0497cb67289fb1857cf32ed944/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/cfbbae2f39385582fcd4dcf3d7a6f8d065208ff3/
       arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2f61f3a553c058ea00a4b0ec8faf5e96749f8c19/
   aarch64 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/7c7c793c16320cf4f897c1f8aa4c9fe18696c920/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/05bf6d20cff90e2370689ae83f88a8039c17147d/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/81855fa02b20a9070a7e1c698a3fc11299e0e755/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/bbc377c1a63a39c6024c90fadcab4ef6ce7e8e3e/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/ad50f55456c2421831a042715499a54c6baa72a9/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/4fa1835c22e69d9fa1e7430627af455c081ece44/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/46aa1a4b6805159fcc070aea1b52cb2cdf20fd70/
       arm |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/f5b4ded1ca8c880c936bf03fce875839b85edb01/
       arm |         host-gcc-initial-4.7.3 | NOK | http://autobuild.buildroot.net/results/93f0e4fdbb519c96cb3e3f40a276ef552c792add/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6887005633809caba3513bb255153d36b3ab30b8/
      bfin |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/ed6beb6ed760dddc05dab7386f4f3ef089b94bc5/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f78f2b19bf28c2b6bb52521e35838467d153b60a/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/baebfcd1fc14ff11d80be8c5f5eeeb11fcafd62d/
microblaze |                  libfuse-2.9.3 | NOK | http://autobuild.buildroot.net/results/fd0e489ea6404464d40d1eb7b52a7c7f019ec3c6/
microblaze |                  libfuse-2.9.3 | NOK | http://autobuild.buildroot.net/results/86063bcf3cb14c02e91bde1a04911b08676aa740/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0c6b1e7761f9df096bbd2c2b4fc3a1a5c735a382/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/77273597cc86f729a0197b8e78517a38f0e42e2f/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/eacd2c38ad2c8347b607be3ceac1b0723bbda555/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/68be87e4f48132128a38881f29f3be2900c131c6/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/eea3805728fd607fb552af15ae41834490381eb8/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/48bfe4e4da81555559ffcf6d194d7749702132f3/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/5c3677af03d9c3458164c53780f6214c01fdf132/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/c1747809fdf9b751097d79e64867205f0c3d17bb/
    xtensa |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/43339f55144ff318574979977db543419bc55201/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/459e21b65a256760c7065a62414b981b454edff4/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/f06ac7ec226af1b0db38c0a39153c0aae38f58d8/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/d8922e67f1c8497bfa991e6f0eb7f64f45e17467/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/d709f93fc5a9141ed91f16da5305e351cb1cf032/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/b860dffd19fa3802ef0a3a537baeb87adb46e9b6/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/c416732d6a18b081bd00ad3b946c4ec73a2dae70/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5d1e1075211c25a31af6586c5aca973f9820b02b/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/acc43dfa868e9d5deaafb7547446236d1fecb875/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/eb196ea1f533b6af5f1b1ce44345bcdef5cd2557/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/2cf660bac3702989f5b15e07c7523488e1cabfd6/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/279367e9d06af9946372e5be3ba72978a669758e/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/e6d7b7697dc03414a2ef593bcbbed32a6dafc676/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/71ca4e38b0f172b78dae1cb2838010946125f17a/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4f38e41973002bcfdb2d2947a4ed510e759b6371/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/85c22c4ea56930b049fa282a6de1012b2dc0e1d7/
      mips |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/7c9e7f146bf33b802aa271ec12059121798d212b/
      mips |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/c15611fbb7205aba31e0cc9a37e64e0338f5e25d/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e1e63230403df819a6937b1415615cc0b3612dd8/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/5875d714f4ee166ed78f98374c6f0be8cd8d9667/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/93cf3ac08c1b0c3d2ca5b8250d9f4338e3b348e8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/335d2599ad5b20800236eff475f8fea37a9c319d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e9f3f37f4f929e695b87fff9099f0b9fd7c9512e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/68d695f367edefee451b54291c3fa591101d55d2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/441ec173ce69728a65ddebb23e3160c29432e7d9/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0ee69d5a1a0574e891b6512d65cb1b178c7988cd/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9be0b48becb6acfec1c29c5989b54b37df34e2df/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/37aa76c4754d8d59734e198a7f11f8ff97b9cc71/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0519283943c9b305518ecc0cbdafba5eaba756f3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/849ffcb5805e8092b48935b0a9588560819ce541/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/af4fe345f6a9dfee94da4c443d852de3d612aba5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/912b032b987bcaadc88d22ab08b9258a52e9ac3f/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/686c41eeb3879edfb081b34a9fbf539f0dc0dc48/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/8b8081c541deb3bccb25ec29dcf49835705db763/
    x86_64 |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/6fc3ae40cd4ac92f12071ca6531704cd68829b06/
      sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/cea5a5f847cc7881406aa022a4ae2174870e524e/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e5c3aed6a3e258842f292a41a197db527548a82f/
       arm |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/cef83d8d70ce5815714f2d13b29196fa5c6a3c01/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/75a37aaf35215824afc52be6be64f33822c1d257/


-- 
http://autobuild.buildroot.net
