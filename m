From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-13
Message-ID: <20130714063005.8A67152C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-13
===============================

        success : 93 
       failures : 57 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

          host-erlang-R15B03-1 | 8 
               libglib2-2.36.3 | 4 
                   cups-1.3.11 | 3 
                  zeromq-3.2.3 | 2 
               ruby-1.9.3-p429 | 2 
                 libffi-3.0.13 | 2 
               libsigsegv-2.10 | 2 
                   dbus-1.4.26 | 2 
                 rt-tests-0.83 | 1 
                 libraw-0.13.4 | 1 
               czmq-cb9839cf90 | 1 
                    acl-2.2.52 | 1 
                sdl_ttf-2.0.11 | 1 
                 libevas-1.7.7 | 1 
                 qt5base-5.0.2 | 1 
make: *** [/home/test/test/... | 1 
                 binutils-2.21 | 1 
          host-protobuf-c-0.15 | 1 
              e2fsprogs-1.42.8 | 1 
               binutils-2.21.1 | 1 
                    systemd-44 | 1 
               bind-9.6-ESV-R8 | 1 
                libiscsi-1.6.0 | 1 
                   mplayer-1.1 | 1 
                 libiconv-1.14 | 1 
             tvheadend-5956233 | 1 
                poppler-0.22.3 | 1 
                     m4-1.4.16 | 1 
                  opencv-2.4.2 | 1 
                  connman-1.12 | 1 
             gdk-pixbuf-2.28.1 | 1 
                  xerces-3.1.1 | 1 
             ipsec-tools-0.8.0 | 1 
                 cairo-1.12.10 | 1 
               aircrack-ng-1.1 | 1 
                host-gdb-7.5.1 | 1 
                lua-ev-458165b | 1 
                  ne10-88c18f0 | 1 
                 libpfm4-4.3.0 | 1 
               qt5webkit-5.0.2 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/02acad231e65c220800df30477044e5f10b9c88f/
    xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/4863d0ba6a1cb1ec8935de26a961499339ab32e8/
  mips64el |                bind-9.6-ESV-R8 | NOK | http://autobuild.buildroot.net/results/6aa987991b3d1cbaff9d4bc80231479d5578edb9/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/665017d529c0349420a70fa4014e50043cc29d63/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/0e1afcadfb26468b98cc85697ff82f297e8f22f1/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9378d3e73108a8b91f0ea399f3253f5da5ad4db4/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/c46b21038850005e1f47482e629c1ddfefa7d86e/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/7f880b23ba3376262fa8fa12689ab97c2c1ac02f/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/693ea676519eb859724639f40ee0ea14b003951d/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ae0bfcc66fb9dfdd2afc1980dbfd4b358ec0d50b/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/7afbc88e7a827b5c5c46606914d82d096d136ea5/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/8c5529a01b8a17bc826774033382bd9396e4ff15/
   aarch64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/81c2164e40aaf86921ed1c854ed7acd962f5323c/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/a5b24422025773932d3242032d6aad317db727c0/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/f9679c63ba23777efd038c1c8d4dca7d5e6c485f/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/df0d97fd8b49773d9ff694871fc0e3af65aa60dc/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/c3f9c6b251fa5ff05d14d4582799739b5dc0b8d8/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/2850de01abb7d445437ee81e0641bed138fedbb4/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/28352ba1a42afac104ad674125e507d3aa9f6efe/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/e4577c31a7e7ca50eacdd730bc0580f2e8df64d4/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/5b203b890829e098b6dc970b08d1029668ebd80a/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/299aff507e0742aa76111b369cff6431165e5f71/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/f79a28d89f82f0fbaf8d7a707b7a072282a3d573/
       arc |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/e872cd551d713f846d9633244f46957e8a2836bf/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cb041dcc32eda3c360ae6d2d6c27d07ac1d87ef0/
      bfin |              ipsec-tools-0.8.0 | NOK | http://autobuild.buildroot.net/results/bc6e7ac0ed592c8be1f14b7460819455f8df52d9/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/4f16deb7d6d2ace7d9af7219c85cd82147c2b6c6/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5d82635d79600aecdc95e47f2ff7b11d2cb0d31f/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/212b224a219c42ca3b2809ba6f7bb452d6ab13e4/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a21d1b569b6d4cee7a5337df035748a0932fd1c2/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e2828bdd10be8a6f0ee76b77ed9118ae3ec3c2ff/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1c647f39b920553833ff08818cd352eabd08b8f7/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/678784e40e50ba579ddc0d9d936dcdb529a703a7/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/743756609441d3c088ded75d1000051443e62b20/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/5e81b94251776f1be46761e681edfa883bdbc88b/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/5bddce6b2336f1e8579c88db7c8d9b7cb3481cc7/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/9291489533597a6250463002c38bb154f0ab98b3/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/940292ebe7643590f256d9ccaa0d716988546a4d/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d8539443a29d904c315690116b083d18ea4fb420/
    x86_64 |                 lua-ev-458165b | NOK | http://autobuild.buildroot.net/results/2bd47e4c5350f62ad207181d6a2b1277d2d54dff/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/c74034a45607fed1401c751c31ecb7c3781403c0/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/37d283b3250e95d8bbdfd13b847343f895b605ca/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/a2795bf59030a3ffa451b6aabe3161daa17b6cc3/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/f8e5c7172574f1d77edda73f0e893a1f1e0e9729/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/bc0ba98e44177f27efc57439e361a1f4eb873b83/
   aarch64 |                 poppler-0.22.3 | NOK | http://autobuild.buildroot.net/results/f22509718ab2d93ba7502f837038da40f501e7f6/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/279e77e4b5d6e8445e85b68f93b2a645d5d8f152/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/62c940fa6dc5d9baba6d98df364ebd1e4ff617d9/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e57e55a1ebfd5598560482253df1aacae12fec88/
       arm |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/e820f446d1110342972259e6dca881a21d78c9d7/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/8b6747981f07de2c87c89d4e1d7c2ebf0b65e690/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/f980c67bfa7df50a95117a0f5c961a1d80a57b26/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/082a4599fe5280dfc3da5c3e8edf4d684634d3f6/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/e74bccac33ed3f16bb4820d01c2b002498c70aa7/
       arc |                   xerces-3.1.1 | NOK | http://autobuild.buildroot.net/results/0fe0c9a1f8ab252c845ed5cad90731905d823f4d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/05d663f0154883e0cbc489d2977ea019d62253e3/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/c5cadd81ec78e23ee606a58a5b8468e5de71eb3a/


-- 
http://autobuild.buildroot.net
