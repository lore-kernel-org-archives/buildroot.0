From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 02 Aug 2019 06:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-08-01
Message-ID: <20190802061729.7B3902049B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-08-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |   3 |   2 |   0 |   5 |
   2019.05.x |  13 |   0 |   0 |  13 |
      master |  42 |  58 |   1 | 101 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-bison-3.4.1 | 12
                host-mtd-2.1.1 | 11
                     mtd-2.1.1 | 6 
                    mpv-0.27.2 | 4 
        glib-networking-2.61.1 | 2 
     host-imagemagick-7.0.8-53 | 2 
               libgcrypt-1.8.4 | 2 
                     mdadm-4.1 | 2 
                   mpd-0.21.11 | 2 
socketcand-df7fb4ff8a4439d7... | 2 
toolchain-external-codesour... | 2 
tvheadend-8f1de1621d78c9143... | 2 
           can-utils-2018.02.0 | 1 
                  dnsmasq-2.80 | 1 
                harfbuzz-2.5.2 | 1 
               host-efl-1.22.2 | 1 
           host-harfbuzz-2.5.2 | 1 
              iputils-20190709 | 1 
                 libv4l-1.16.5 | 1 
                          llvm | 1 
toolchain-external-codesour... | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/7ad02fc510106a51a1b760c8847379caa99905cb |     
         arm |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/b7e0f5dc2e823afadc972ecf9bf9582402bc3516 |     
        or1k |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/2debcf59a53d826f2b57d54667534cf462e8caa8 |     
         arc |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/4a5d6a3b8533317cd985d821bf20f23837d9ac9a |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/85ae4b31b55fb6700b4ba717433633c09dc385ff | ORPH
     powerpc |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/3ffeb8c03d91b4cb815360339b7a6c4cbec9b565 | ORPH
microblazeel |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/8ee9539e3777360eec9bc39ecfac1696dbc76a4d | ORPH
         arc |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/fc3fa27461caa6133b37f97c4eb5424318322aad | ORPH
       nios2 |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/b1f1ff00c226e5e8ae59e9240a41480144835135 | ORPH
      x86_64 |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/b01dc06d62718e088993518e76fef3aeeffd3754 | ORPH
         arm |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/e9262ec760a895faa61e79c6012e50aa9fcf89be | ORPH
        m68k |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/5b0ceaa2bccdfa77d905964c23117e7e427e6b1e | ORPH
         arm |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/ef07d083b5a9325a741fb2f127f4f492f8b7c796 | ORPH
         arc |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/9ed9f12b79bfd99b7ec6ef67d9da6d5aa4f5b305 | ORPH
         arm |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/75bbd0e1b107b94eda0f6a51ff7b8fb6086bcd37 | ORPH
microblazeel |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/a6ac189f8d20975d8c3fdf80606afc45fcf75f30 | ORPH
    mips64el |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/cd35f94252fbdd70a0eb522ce826251eb315712b | ORPH
     powerpc |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/5674f6352cf8a6d2db7f21bed078ad63cf5eb820 |     
         arm |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/0412332aa4d294012a34e86de7979a600cb60bc0 | ORPH
    mips64el |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/1d75015ae8424e603dab6e617302a6d057fc68c4 | ORPH
 powerpc64le |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/70ae8127cc0dc9cf4fad267a6fd2689db65703ff | ORPH
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/67bc22bb487df9416c968375cc38145660d6a54f |     
         arc |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/d52340b8334f3d9e1e4291d12b40b107d1723f14 |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/9902b0b1e8ca90cee193fa29cf51fa7cc08ff231 |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/8f81d853adaa9bf65dd1807449b2c2dc79adbfc6 |     
     riscv32 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/97bd0012b484fe50c11d2d1e738542cf8949871a |     
      xtensa |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/3199cbf187e14d0e4a16412a3fab00af5f15f92d |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/0d5b9fd47011f3ae35337408fc9e4c5963cc2ad2 |     
      xtensa |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/7c639a1289f9cb3418525eff16a8d5fa3acd489c |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/317d928d02b1b346c9641437c41e7ed7b1ab58ca |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/ffaad66044f28138cbf6d7bb09804e6b99d7a835 |     
        i586 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/d1b876221de3656dcfe8750caf7ca469978a724e |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/2e170e149b293d40978e158d55dc0102315b9d86 |     
         arm |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/04c2252cf9e6cc4c09a5ff74d76919909a2c47cf | ORPH
         arm |                libgcrypt-1.8.4 | NOK | http://autobuild.buildroot.net/results/79ca59e3dddf4c8d3835fc4fe99b85e3da91590a | ORPH
    mips64el |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/422d38b0ded6c0770bbab89f2e9aebd885214b31 |     
     aarch64 |                           llvm | TIM | http://autobuild.buildroot.net/results/a216dd1dd60f2019dfd4b900f9254271226bf171 |     
         arm |                      mdadm-4.1 | NOK | http://autobuild.buildroot.net/results/697aabbd714de76052976d65d81b7c073731b0d8 | ORPH
         arm |                      mdadm-4.1 | NOK | http://autobuild.buildroot.net/results/0119540207c2154d6338e7b4d18b8d3ae3b7e15a | ORPH
     aarch64 |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/546deee21189664fb61e962c44d0b41979e2aeeb |     
microblazeel |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/eae2a760e16ec60c0e7ce3181681e47d8e060a1b |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/febcfe3f7006fabb1439277b6d0678d190b2fbd5 |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/f0b9e1520783be84c5f341148681c24585300d0a |     
      mipsel |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/aa3164eef690983df3f030ee0d81964496639a31 |     
  aarch64_be |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/283b6ed8e9dec63fc308a522b2a2253551097333 |     
       nios2 |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/6b99f124e6355acc54a0b35a059e59d9e4616367 |     
   powerpc64 |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/ba4692601309e19bb978fd9112ffbf20090fe2a2 |     
     powerpc |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/0f92336c4a8a097e471d1e237f8e8b498f47bd28 |     
        or1k |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/29723e1366400cf73c8dd55af8cfbfc17a24e553 |     
     aarch64 |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/3260151a6f8a49f1e8eee977951365e08ebdf307 |     
    mips64el |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/99baf1de106f9c80a32e665263c1e4278097643d |     
         arc | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/0d2d81f44a6cc22159f167edad424b7f081f3405 |     
         arm | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/ae1ad9cf85cc53f56d258b632ba0b390aac29f8a |     
         arm | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1ec462be0f13deda8af7e3b9868ead34ab3141cf | ORPH
         arm | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9284d571668148febce23d96a9c0a97a6b2b43dc | ORPH
        mips | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f43d0ae9e77cfb995ac4deb7723135cc9bda2d37 | ORPH
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/1a68ca21b104b72c7d3b2c7b79d825e8c87be2c3 |     
         arm | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/8aa427215f99485310058e308b1fc581001fc870 |     
    mips64el |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/f785f12b24926e0ef4f57fc86526c5cb9066f1ad |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   dvblast-3.4 | 1 
              webkitgtk-2.24.3 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/c8648ee6f288f53735f342672c74e546f6a43085 |     
     aarch64 |               webkitgtk-2.24.3 | NOK | http://autobuild.buildroot.net/results/4d7bffd20344f06ca719b7c8083b81053b255aa5 |     


-- 
http://autobuild.buildroot.net
