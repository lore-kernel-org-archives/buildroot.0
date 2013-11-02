From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Nov 2013 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-01
Message-ID: <20131102073020.33CC652C701@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-01
===============================

        success : 77 
       failures : 67 
       timeouts : 0  
          TOTAL : 144

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 10
    trace-cmd-trace-cmd-v2.2.1 | 6 
               alsa-lib-1.0.26 | 4 
                 qt5base-5.1.1 | 3 
                 libnspr-4.9.6 | 3 
                      qt-4.8.5 | 3 
              fontconfig-2.6.0 | 2 
                      icu-51.2 | 2 
libwebsockets-v1.22-chrome2... | 2 
               w_scan-20130331 | 2 
                  libnl-3.2.21 | 2 
           binutils-2.23.2-arc | 1 
             tvheadend-2b64995 | 1 
                  ltrace-0.7.3 | 1 
                     m4-1.4.17 | 1 
               libcap-ng-0.7.3 | 1 
               qt5webkit-5.1.1 | 1 
                 omniorb-4.1.6 | 1 
                  avahi-0.6.31 | 1 
                 erlang-R16B01 | 1 
                host-gdb-7.5.1 | 1 
             tinymembench-v0.2 | 1 
                valgrind-3.8.1 | 1 
sconeserver-d58f2de88c68193... | 1 
     xlib_libpthread-stubs-0.3 | 1 
                 libpfm4-4.3.0 | 1 
                    crda-1.1.3 | 1 
               libsigsegv-2.10 | 1 
                  iozone-3_414 | 1 
                coreutils-8.18 | 1 
                 binutils-2.22 | 1 
               audiofile-0.3.6 | 1 
                libiscsi-1.6.0 | 1 
              cryptsetup-1.6.2 | 1 
                   attr-2.4.47 | 1 
                  poco-1.4.6p1 | 1 
                     apr-1.4.8 | 1 
             util-linux-2.23.2 | 1 
               ruby-1.9.3-p448 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/11667548b1dc822ad843f0e3e6bb32bcc383e05b/
       sh4 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b9749723dbe8c27e3d154fd19196cb8d09c90dfe/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/34b630380ad5e17176f6e507841de7d8fa04fcb0/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/32099827a5f0d5935245c7233f888cd6f75b39fe/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/fead1a633319dc7340b256f68b5ac86b62ee263b/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/62bac45b2c6398c58ee737815774ded865d043f4/
      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/4bce8c3ba8bd1b803fbb1f165ee124df7246ca9c/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a9a5d892daefad6260174dd52c885270e01bf758/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/6f209b4e3e6eade884eb37c5c761b42e83e3da74/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/620239999ead2e65e63832c12cc196b59d7988fe/
       arc |                 coreutils-8.18 | NOK | http://autobuild.buildroot.net/results/21ee5522042111ed2d7d5ce88ba147a7c109db1b/
      bfin |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/cfda483860301bb673ffddbd1354cf15184ee6e6/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/50694cb5320835a099d704d1a365b13658276314/
microblaze |                  erlang-R16B01 | NOK | http://autobuild.buildroot.net/results/8d603e98fc3e92771d91f1587b1b4d9a47467b48/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/ce8174a14f299ce2f23107264f573a5aa5b36caa/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/8d881f2ac16a9320925c5f27d3a49f4a495e1408/
     nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/16582455ae4f618012358fb63703a29744960b3e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/dad2b871153f8740328dd4c48a27a6fb51c89a94/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/87d8b4f91d19f1a5d7411d8d6967c1ee9aa8b8cc/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/76bc887f15fd799b06efa8c08a6e4a54468f3179/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/e971c4e2c551e06d9f884d4e2980e60a84008581/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/78c8d9a36c53d7ac36389d9782e32a5e49df3e86/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/57340b9bd2db3a523836e02e01cba6f7c17c8ca7/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/f66ad4afca949d9db304ca9648660cb06010a23c/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/193e55938c6e5cf39cf73f7408d2dbf8fa9219fd/
     nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7292e688f88c5493315ae13a172d2e8a381bdea7/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4c1d77a71abe5fd557b3837c37adef4ae3f974ef/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/c877cc5b99b61fc3dc11a93c0f27ee99b5d5a6f8/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/564dffc7df519c547d61a72dcbaabb03fadd459d/
  mips64el | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/512e12ddb1239d891e66480510fc76e66a8686a9/
      i686 | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/5e497a691fe6035909b59660da8d02b11345dfe1/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/fa2d87a28ea5e1091194405201e68ad68ada6509/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/25120f888d081f6f4c4790e15f6287b135656d6a/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/cd3ec63f75d3d48721964e7de2c56752109ea7dd/
       arc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/75fe21269924aaa42d9bab0b25b33623656cb49e/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/eae88e185cd11767b434401a45f9066245e5860c/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/ab00484f0399ef01f0af74bde17f3d911c4fe43d/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/16d3cecea3e0b9f57144cb5ea2053bef74940647/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2051dec5bde6b33256b410d5e9358305fa13c2f8/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/e0f3ed4f816fa97d0b43de18544db1f00ddab972/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/e6aced409de16133992df9fcc7539f96e95fff69/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/ca0c55a178a55deac2294356ff42ac18347ac652/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/997c3a284466780ad824eac1da7f2f6563fee4d0/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/1c43a3e236d6efe54864c6130dc16e6391b6ec52/
     nios2 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/d3a4535d9732f6913ac643bac683e571cdd794a0/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/7bb7ac3f770b35b18d610522cec1f88c5a9a0b2a/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e5f9e4099b2b463aad01fcfeb9ac2c2be2e08d89/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/b19e2fe0e61ee9629474a4cf99bb9fa6848694c1/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b165989cf017b7926bbbb7e6bd940b7ab73c4373/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/fe89f502f06e3eb40e0ca6b8f6eb50bf836e48ca/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/4bd28ba391188a2f6e9f553f6ac9c2be0e19a940/
      sh4a |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/6385d3c398325044586917c71cba04810f4d2e18/
       arc |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/df0a558cb14d425c5240216dddccfd98a66bf6ea/
      bfin | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/7c364a45dab43841ca8b0832bd6a1b3c5db8626e/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/c281bca306fe1b7eb77f2f7a562b7a3d1f22088a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/818a6599b6ff2e6366233546dd8e026006cca948/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f2ff7e45c264a110bb64bfc767be923c100117e2/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/01bd4bb71751ebb37c6796e08af79fc15df4076b/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a5988227b8612c1fc69ddd22375a43545b91d831/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/bb8190c9371cb25370951f66abe208ed4aadba00/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4f7e5b7c328fd6419aa5c266591de4c90f8730d5/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/0269efebb7280cc3650d2894e698adcaa55ef2e3/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bc41a3fea20181526eb247ac910244aa2aa4c4c0/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/34fdcae132f340c7946c0892f4a9bf0f48742dd7/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/689f54b75e4fc8e77adeec238e068527ed33e996/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/dac446bd7fab1ebde8552ebab78e46a3e9558c1f/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/031afb0ebad256a25109fbf16d722dca912bc5ea/


-- 
http://autobuild.buildroot.net
