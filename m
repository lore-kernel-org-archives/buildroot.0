From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-24
Message-ID: <20131025063005.51B7752C609@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-24
===============================

        success : 69 
       failures : 70 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

                    mpd-0.17.6 | 11
    trace-cmd-trace-cmd-v2.2.1 | 9 
           uboot-tools-2013.10 | 7 
make: *** [uboot-tools-lega... | 5 
                     apr-1.4.8 | 2 
                   attr-2.4.47 | 2 
               libglib2-2.36.3 | 2 
      host-uboot-tools-2013.10 | 2 
                 cairo-1.12.10 | 2 
                libcgroup-0.38 | 2 
                 binutils-2.22 | 2 
                 binutils-2.21 | 1 
                      icu-51.2 | 1 
                  python-2.7.3 | 1 
               libsigsegv-2.10 | 1 
             alsa-utils-1.0.26 | 1 
          libedit-20130712-3.1 | 1 
                  aespipe-2.4c | 1 
             dosfstools-3.0.22 | 1 
                pciutils-3.2.0 | 1 
                 tn5250-0.17.4 | 1 
              fontconfig-2.6.0 | 1 
               w_scan-20130331 | 1 
                 webkit-1.11.5 | 1 
                valgrind-3.8.1 | 1 
             bluez_utils-4.101 | 1 
                 rt-tests-0.83 | 1 
              e2fsprogs-1.42.8 | 1 
                 libnspr-4.9.6 | 1 
                log4cxx-0.10.0 | 1 
               uclibc-0.9.33.2 | 1 
                directfb-1.6.3 | 1 
              cryptsetup-1.6.2 | 1 
               alsa-lib-1.0.26 | 1 
                aiccu-20070115 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/49ed189ce2158321d737e5843eb56d84b8cbc5b2/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/493fd811606d5c9c67d75880cebcb4eda2e2d0b6/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/42a7474dabfb92e4aec0a3b6c917e128adaa35f3/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/ee2a29856ce674c898dc966eb5c622be042c414c/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/7408f85d07e11e7abb069bb70c3136cbfdf1d373/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/e976f26ac2ac8fdbf24cdcd88400ba71739dfb62/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/7e63d1433856cc6d9cb180a62fe744611c1ab407/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/feb6a12e08961714b6c679ef225930fec63e79fd/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/1be1b2896ba06f20dd710dd4bf6ab4da23a48014/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/7b0798f139e81b054e72c08cc16ff337bbe36a2b/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/7806239e9e9161f03d3e658dcf18090b21eb8e65/
       arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9f030a8a506e80f40a8c41e3c8b40fa58f335e96/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8231df6d22a222a476348524a270841a7eb95745/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/16df6698bc4284d910569b168ea52cfc7976541b/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/1b62312a5a9a85833831e40997c18ebf8ae30c88/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/665259aeb968bced874cfbcbf8e1ac169de27c31/
      bfin |              dosfstools-3.0.22 | NOK | http://autobuild.buildroot.net/results/a5728487a9c1cd7bf74014ae659df942642d8149/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/a84bc9ac52201facf944398af8be7c7ea043054e/
       arm |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/3e187d9f8f4b511459844916566c58b10eebd76b/
   powerpc |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/aeef35d9be5292b5eb22a5b495919f38e5a1868b/
      mips |       host-uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/1f65289d5c284caa82a4e9137613f792797ee08a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d96594fb6200c8c8997c7c8a6fc48c1c274bd69f/
   powerpc |                 libcgroup-0.38 | NOK | http://autobuild.buildroot.net/results/a7738d6f99ba8189e6ffbd9fe245b1af7d28e3d9/
      i686 |                 libcgroup-0.38 | NOK | http://autobuild.buildroot.net/results/73dddcc1aa68999ea496de148497f80bdb02c874/
      bfin |           libedit-20130712-3.1 | NOK | http://autobuild.buildroot.net/results/2116ffb8e74073fd415bfdea748731b5b8a876d7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7d802798037dcd5ef47c9c83a0c9aeda3c9d7435/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1b0c043a89d07d44f066ff7dd0fef7dcfe9990e3/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/ee6d9272abc3bd4b6440963b00cad960fc9ed6ee/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9b5174c4edb193b13e9616855e44f27a47257110/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/68d742f6faa9c52f4ea3652fd28bcfd60a65a8ff/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/27e138cf803dee5007c481bb9f52f24f68043bb7/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/ae1290f91cacfe4b6f3888ac78ace4b43868abfd/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/18b4602755893c78bcd4c1795d1d684283c1cbdd/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/209da5749adaece6508c54eb1d5c2d8f8f1ca51c/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/69fc190fe7457d74e43045249a1faeddb7b80fec/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/799435972c4e1d3efcef16286f9a79c79c13d287/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/87d648fe37da227d33820517ce20d7fb53e55f85/
      mips |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/dadaacc3ba4244f0082fd9585f08c92063917d67/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/f7a9280e165724d1435248a8c65cf1fcbb9489c6/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/a8632e96a08e6bf3a67ea2726599834ac85157b0/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/cad1001b1b073255928587250c5b300856fc8e6a/
      sh4a |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/d3f9d5e103dfaaa30ce9699d2c036b2a7f9598ba/
      i686 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/b9cdd50e9857019b886d439318e251aa9508a11f/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/6e361ed8b81d6ab501c2b3fa7cb76c0e60f4f4a3/
    mipsel |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/4db26abaf267d9ea3d5055b6bdd5fee3c614d8d0/
  mips64el |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/5e7a8500e21824128c42c33002c5cd8540693ebd/
    x86_64 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/9d769b689e758994cd9711a1870bfbbe77b78aca/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/33845cd5e301cee21fa0520f9978da776213719b/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/7baa36d48e3937fe0ab8c9f59648116dc7c1166b/
   powerpc |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5996e3854a78f82db8ffc6a8657dd2600882c485/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c4e08bb1495666c43cf6adc84a3f004ae0416c00/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/334300eb7ea229aa04037a511967433d202ac3c2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/53ec59b854f4c1a566b147ca16e949cf540b9861/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5706811b462a279322833f19a375e86a95e5681e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f20c7f41245ffd514aef7cc97b07dd0694ec3f9a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4aea466b884370247d1ad2be0c4611ef6f7eea96/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/17013d67355e0e086b150ede837e05f158e55a42/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5566e4893e339e509add00c1645f52bcdd529923/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7c61787c2826af29403839ee537801e1847f97dd/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/d4b30c855ee23e25a22894188cefb190d3c8cdee/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/6a5f77483e908dc96d08824cf9113402431bace7/
       arm |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/10e9a676b94a40290dcdfce559b154eae5bd2314/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/a3b84c9a8830aee7589a55b7afc31579726444b6/
      i686 |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/500499abb9f9edf7d13741dcc80d86b7e28097c2/
   powerpc |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/8d7a68577f99e63cb75008bc429591171c45d950/
    x86_64 |            uboot-tools-2013.10 | NOK | http://autobuild.buildroot.net/results/7091d7fd48edbbf1d5fb8e314ed9d122dde3506e/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/93f8b100eb2773a4f51b7537c1e76653513cac40/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f086e65aca220bc9a5869f8fc8c1dca4d87ada7d/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/19daca3d98c22f2ef73b2c5d04fec52b5a24ee0b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/2388ca904ecb1786ac15babbf882f453a17b08bb/


-- 
http://autobuild.buildroot.net
