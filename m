From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jun 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-16
Message-ID: <20140617063016.0CF6C1010D3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-16
===============================

        success : 99 
       failures : 26 
       timeouts : 11 
          TOTAL : 136

Classification of failures by reason
====================================

                    sdl-1.2.15 | 3 
                      qt-4.8.6 | 2 
                keyutils-1.5.5 | 2 
                 haserl-0.9.33 | 2 
make: *** [core-dependencie... | 2 
            host-omniorb-4.1.6 | 1 
                 msgpack-0.5.4 | 1 
                   perl-5.18.2 | 1 
              libsvgtiny-12121 | 1 
             armadillo-4.000.4 | 1 
             berkeleydb-5.3.28 | 1 
           host-cmake-2.8.12.2 | 1 
                 clapack-3.2.1 | 1 
              host-bison-3.0.2 | 1 
                    ola-0.8.33 | 1 
                libmpeg2-0.5.1 | 1 
                       unknown | 1 
                     nut-2.7.2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                host-gdb-7.6.2 | 1 
                libcurl-7.37.0 | 1 
                  libnl-3.2.24 | 1 
                 cairo-1.12.10 | 1 
                 dmalloc-5.4.3 | 1 
              host-erlang-17.0 | 1 
checking for unsetenv... ho... | 1 
                 binutils-2.21 | 1 
                oprofile-0.9.9 | 1 
                     apr-1.4.8 | 1 
                  boost-1.55.0 | 1 
                pinentry-0.8.3 | 1 

Detail of failures
===================

    xtensa |                      apr-1.4.8 | TIM | http://autobuild.buildroot.net/results/89230dbd7dcb954ea3ded53102d688ba3fd9061d/
       arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/543b13d601290767717bbe99cc4346017958e12f/
      i686 |              berkeleydb-5.3.28 | TIM | http://autobuild.buildroot.net/results/13009ca02f2f55c0798dc7f22655b1bd9860bccd/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/6ec18ae04c5a161031d15696e656795004ef713f/
   powerpc |                   boost-1.55.0 | TIM | http://autobuild.buildroot.net/results/969675dc9ab90ac9dc493671bd93b4ea30629915/
    mipsel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9f6480e898a0c122fce638ed70dd61461802c0e5/
    x86_64 | checking for unsetenv... ho... | TIM | http://autobuild.buildroot.net/results/d6b8e86ff28bd1828fe51d2886947058c5daeabe/
     avr32 |                  clapack-3.2.1 | TIM | http://autobuild.buildroot.net/results/05c60c3e6cab3c6713dbacf0a8e08d4331c91af5/
   powerpc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/cad0b0a0675917f2d2150c414e2fa4f9da0416e9/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/683dbbc6e13a9e6084ade17863b8c6ba849b2106/
      mips |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/6a6fc1c56c79ad6b30c875ddb444082a8cf0a0cb/
  mips64el |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/1fc4d586ef8e4fa574c8704dc306e170f94cb14e/
   aarch64 |               host-bison-3.0.2 | TIM | http://autobuild.buildroot.net/results/f37ec72cd623c6000596f4c2f25da3b28dab0954/
      mips |            host-cmake-2.8.12.2 | TIM | http://autobuild.buildroot.net/results/7a67cb23c3ffe177dd482d2b7080d33864d5a44d/
  mips64el |               host-erlang-17.0 | NOK | http://autobuild.buildroot.net/results/77cf4cd819d5800b747346520569681c8b0ab15e/
      i486 |                 host-gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/f8112564e40e59a03d591d970428eaaeec01532f/
       arm |             host-omniorb-4.1.6 | TIM | http://autobuild.buildroot.net/results/db5c87296760ec491c24701d1c01b12b2810871c/
      i486 |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/0b0b6b60c2d2dcad8d470682bb58e2a57acd1cf0/
    mipsel |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/8316ab201ccc2b785f07a981ec22c4981c0a2744/
      bfin |                 libcurl-7.37.0 | NOK | http://autobuild.buildroot.net/results/0acddde8909637eca44be749b7b657c3643a1cf2/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e2b31fb2dfbbf7778a889e959647771cf749ed37/
      i686 |                   libnl-3.2.24 | TIM | http://autobuild.buildroot.net/results/ff4f358227b280e38ce6cbbb92fe7485e965b686/
    xtensa |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/5feca450d70a8de48fa2463e55c9e84db5d755b0/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/9c64d8cb5a3f498df4f9da499efb2eab497760d2/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/3a80414ad5b9ee41beab42d53d0b377518c38921/
       arc |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/8292e67354602738cae12d8ebea83b513ba35482/
    x86_64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/8ee145dddaf3fc2695ba0889eaf829c04a2f3c82/
       arm |                     ola-0.8.33 | NOK | http://autobuild.buildroot.net/results/2acdb9cfc3fdcfcd57d27cc4ebe776b5788af4c7/
     avr32 |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/5579f73b1d892c14793ac24b25d84447572518d7/
       arm |                    perl-5.18.2 | TIM | http://autobuild.buildroot.net/results/0e12edfa26563168dadbdc084d5c7a082ec105c2/
      mips |                 pinentry-0.8.3 | NOK | http://autobuild.buildroot.net/results/6be109ccedec603a67cebdb31b55865dcce0e128/
      sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3e60fae0d3d64367753b65f8dd0a8dd1cf70a620/
    x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/69ffbfec9415cdc795d95d03a78796d8a6ebbb13/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/c6191fb4b87524f484a9f8d6c9b3edf5fb636e46/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b2c01b7cbf07d0010a7d9c26c7beb395f3d21bc4/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/4ec0cfd97064f81ea827296650090321877bc103/
       arm |                        unknown | TIM | http://autobuild.buildroot.net/results/94cb967615c5087be09985c5abb397e4c09d310e/


-- 
http://autobuild.buildroot.net
