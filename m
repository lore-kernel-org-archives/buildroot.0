From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-13
Message-ID: <20161114073015.24C9A20BE0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-13
================================

      successes : 220
       failures : 52 
       timeouts : 0  
          TOTAL : 272

Classification of failures by reason
====================================

                    mpv-0.20.0 | 4 
tvheadend-50a370707aedf5c12... | 4 
               libdvbcsa-1.1.0 | 3 
                 mesa3d-13.0.0 | 3 
kvm-unit-tests-5731572b2ac2... | 2 
                 libnss-3.27.1 | 2 
                    mpfr-3.1.5 | 2 
                 xenomai-2.6.4 | 2 
                coreutils-8.25 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
                   erlang-18.3 | 1 
                    fltk-1.3.3 | 1 
                    hans-0.4.4 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                 libv4l-1.10.1 | 1 
                minidlna-1.1.5 | 1 
                 mplayer-1.3.0 | 1 
                oprofile-1.1.0 | 1 
                   perl-5.22.2 | 1 
                 php-zmq-1.1.3 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
                 qt5base-5.6.2 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   redis-3.2.5 | 1 
                  squid-3.5.22 | 1 
               tcpreplay-4.1.1 | 1 
                  tremor-19427 | 1 
               trousers-0.3.13 | 1 
                 uclibc-1.0.19 | 1 
                xfsprogs-4.7.0 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/14276cf2c5d6a55b2c9c2a7000b01ff78448930e
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/53179b7d367bf274cf24aa873c6806f651ed543a
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/e1c78498bce64e4c7e1b8edbc829c80db04b7297
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/25bdfdbd6de73a5d3d6d0b0c7298b32a143439f8
 powerpc64le |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/71555f63024338a740d139e905c53af5ff03f235
        i686 |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/28ed230e40cc154db9274f9765085cd7f0eee85a
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/aa348f61e926a41902e7383d758dd1ab02ae2f98
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/921819a9372ce243b89991cc4f7a3d89c5e26d60
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/77b1b200d7bbc904fa36005cb6a39844b264b7c8
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f8ac0541db55e04ec2b471dc7e25d2d02df67daf
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/e29f11747830b13bc83a46c5f7747c58dc76c0b9
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/93f361816e1c7d4fdb13366eafc9d6ba54ef0764
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/90e1493caf383c71dc0a4cfd5985399c6f5c5aa9
 powerpc64le |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/cbb2516fd0e233447d97cb664ba92e40c523134d
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/dca040714b8f13e50a43a659f14c0fc216407260
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/c62e3760f16339d73ace6e5294e50ca697d3fc2c
       sparc |                  libv4l-1.10.1 | NOK | http://autobuild.buildroot.net/results/68917e44ceac85677266a639a2d07332d37ce1b1
      mipsel |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/9b6035c8edb578216e328e1d7e4ec2a1a0ce83d9
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/cee45b61c5b1dcf30bd2daf44dfd84b43ef2ca59
 powerpc64le |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/e2593f2dde0f7fc145dd6bae06e31d6dd106bc00
 powerpc64le |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/c08cf1e710dee5f4d118e98957ed8c009ca88152
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/e0917ae218f27ec9e565c0df1af73226f2a3e129
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/2048395126f0cc205ff2b355455a9fd40278c204
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/49e171b10395236f599f78c439234a44a1745dd5
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0bb8491df93703abe42be7dd9801fcae00f4fec3
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2f51efe104b84bcac2780d176888c7078eb600f2
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/737da53ec2e56eb6a6b1ca04cb9bee4a11d957af
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5d2312e8216dbbbb897851461450356a7bd68cd0
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/05779f0c3fc067930865760b4636afba486872a4
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/2824433f541e122d09f4658781a25afe95be6ded
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/60fdcb5caee0ebc53bc06e6a20cfbb501af63bdd
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/8a72a2347bb5f025600d3d7fd75cc3b26e493585
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c53b41601e098622e6955a9b8e921ae97d54be5a
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/81d37ca84e9cb45c4bcb75f2a87deeccef845543
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/6203c8ded2fcf6734b6f62b61e5a39464692340d
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/ff02857536bb68c9d93eb28dbb4e6b849a00f730
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6f0ff905251d12e198654b8ffe0ea5c15186371e
      mipsel |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4dd81213a748f197dda3f5f4d4400f2fca7caddb
       sparc |                    redis-3.2.5 | NOK | http://autobuild.buildroot.net/results/572977b6c4df0b26fa5837c7df244c739d601981
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/6e71ac912a83f32ad0922c0c372793f5d5d4b4c3
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a67b6468d841f44824940252477456668a30427b
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/054f1c77b0e5d46b2dc53769469c0ed03e6b79ef
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/73da6045c388754de5bbbe6d87cf0aa788f2c321
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6394311b2cc073116ed796ec20297a03928d612b
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/1b8bd8c60e215bf6ad8414fd3ce8daef033dd3b0
         sh4 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/7db9324203e8a62b031b85655479430d1d558343
        i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/e101ebfbd82b6ca18a0ba0839250f75e4053035c
      xtensa |                  uclibc-1.0.19 | NOK | http://autobuild.buildroot.net/results/0fbcc4475545904bf88f25a3bdf3ee552bf4960e
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/ca6a63594121e59f26c9938f2b1c3a8e6b529d1b
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/b0fe8c0781b422494671e0ca8378da127d367f20
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/b2ac6cffb1f5c3018986a58b0edcb27db3a01841
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/7c8b33168b469787be9b0df137c449c3ddaf227f

-- 
http://autobuild.buildroot.net
