From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Apr 2015 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-07
Message-ID: <20150408063021.AF5941011E6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-07
===============================

        success : 213
       failures : 63 
       timeouts : 7  
          TOTAL : 283

Classification of failures by reason
====================================

make: *** [espeak-legal-inf... | 7 
               libecore-1.7.10 | 3 
                  boost-1.57.0 | 3 
                host-gdb-7.8.2 | 3 
                libtirpc-0.2.4 | 3 
                     gdb-7.8.2 | 2 
                libupnpp-0.8.6 | 2 
                numactl-2.0.10 | 2 
                      qt-4.8.6 | 2 
                 leveldb-v1.18 | 2 
                    fftw-3.3.4 | 2 
                     vlc-2.2.0 | 2 
      host-gdb-arc-2014.12-gdb | 2 
      gst-plugins-ugly-0.10.19 | 2 
         lua-periphery-1.0.4-1 | 2 
             xlib_libXmu-1.1.2 | 1 
                elfutils-0.161 | 1 
                   erlang-17.4 | 1 
              strongswan-5.2.2 | 1 
pulseview-19be0af16af83ca10... | 1 
                   czmq-v3.0.0 | 1 
                  cppcms-1.0.4 | 1 
                  samba4-4.2.0 | 1 
               arptables-0.0.4 | 1 
               expedite-1.7.10 | 1 
                       unknown | 1 
sigrok-cli-198487f611d8a7be... | 1 
               mongrel2-v1.9.1 | 1 
                 cdrkit-1.1.11 | 1 
              procps-ng-3.3.10 | 1 
                host-ola-0.9.4 | 1 
checking machine/param.h us... | 1 
checking how to print strin... | 1 
make: *** [target-finalize]... | 1 
                libevas-1.7.10 | 1 
                    php-5.5.23 | 1 
             host-thrift-0.9.2 | 1 
              postgresql-9.4.1 | 1 
           qt5multimedia-5.4.1 | 1 
               kodi-14.2-Helix | 1 
           heirloom-mailx-12.5 | 1 
                  guile-2.0.11 | 1 
make: *** [qt5multimedia-le... | 1 
                 clapack-3.2.1 | 1 
                poppler-0.32.0 | 1 
                 rsyslog-8.8.0 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/baffbd77205c305b35180867e588521a24dfa30f/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/24f3cf4c56f1f75f81fa6ab1de6fce56a9cc4f9f/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/99e20f63172ea270256f43e5d0ec486b965359e0/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/57e052a2990f1faca17070186233725864423642/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/671cc16da3f65dcbc8b103b7431a97b7e2d5d279/
         sh4 | checking how to print strin... | TIM | http://autobuild.buildroot.net/results/6162d30eb9b74139cf53c438cbc10a6f36c1182e/
         arm | checking machine/param.h us... | TIM | http://autobuild.buildroot.net/results/20fb99806bd5fa940fcc03f072d951fd8b9261b8/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/dda7e25d3106cac16fea6b808e2d30d7bfb3a239/
      mipsel |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/442c27e015f494a209d0dfa71e36a7010936df8d/
        i686 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/316e7cb4c40e8d667aba5766948e5776b24c82f0/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/f097280f5eff6fb50aca86051f932d4807e7ccb7/
     powerpc |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/899144ede3ea4b3be9fe1e53be7dee0d3c2b0afe/
      x86_64 |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/765536c33737e55368aeb6407f627c5b32129421/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/871b29c9bbf94aa05034c442f35c8771f83abe1e/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/dbcb0a42369763350c2742df1d2d3ce17237ff08/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/5276a9db9da057d92206c7068a91ce044893cfe0/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/3ef479baaa54719be0ff7ba4811ddf909df68024/
     powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/9b94b40857fa2bb734ac2fab5929ce704d1c445e/
     powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/901eaffc5081e0d904c2a2402e563af996507202/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b2746679cbdef9e369e1e6b90530630c61501755/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/d90c5df57783411e6d65db78f71099f3898cb163/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/26fabc0565a79ee22421a56258a910e6189a107f/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9cf9ed55c21e643f52ce23d71414ed9fb671bead/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/b25093e4a25418a48ffcc13a83f53ed18f9d6d25/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/f79df8c9b30b6d396975adc807ebdb9a059c5ff5/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/8ae35aa9602331df68726df7678971310859f88e/
        i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/7838fb50e995cd68352901a0db8c5816ba60d8ab/
        sh4a |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/c6ecb5bf9974a223f4401a6281376e81ed7198a2/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/1803aa8bd62e4fc126d0a791456804bb9b036e6d/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/fa1958192d9736f29f6cb0f2c166e0c368fc1736/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/72b0eb0ad53c366dad194ce65c71df2ed39cbf83/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/6879f16de73c91773aa4b0403a2dcdf3abb9e12c/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/3e2c77515f00845dd14e171e31acca8aa6553703/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/ce5ab0505b0531a52673af5c90d8d0c8d34dfbeb/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/f3e242f6e768ced73e27643aa1dff93f2dc20c63/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ced910b2296bf15ee5bf8f42c1fd5b0f8c7e4a75/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c88adfbfaa0165ec13ff8feaddc5c33f1d20687d/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/1fe6b1573e0159e90501c2a017064131c18a5b3a/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/9cb9d64335a5e7aca05d312a88b3516fd7312ae3/
      mipsel |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/d934871d1b192706cd9163715c5ebcd96deff2b8/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/9d57179a22c81ca67f6024a775496d23b603edd7/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/156e1fc155ed7b6fdbd21abf9241d63deec7a83c/
        sh4a | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/dee9b1f2b14694a08063b2d2bbb9a74e89fbea24/
         arc | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/3ca9b0823003f1d09d5f898a381768efa043d610/
         arm | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/512a03b5c13b568f8cacea2095dd9f53c8721696/
         arm | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/a8b2b93e96901fe4fdfb64e1941c5c45bd52c742/
        mips | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/dc1bb1952abf5c6a5b070b2686701d4d9f0c8294/
         sh4 | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/36c24858fc3f70197d82a462da9b5471b36da0a4/
        i686 | make: *** [espeak-legal-inf... | NOK | http://autobuild.buildroot.net/results/b53b3a19629f3bdc3cd3e66b09c259cd910f33a3/
      x86_64 | make: *** [qt5multimedia-le... | NOK | http://autobuild.buildroot.net/results/ce4f9844d1169768cc808285893e59d65685c3fe/
         arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/e9f9060fc58a19cc74bfeefe26d8da055421acc7/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/e8a7b77f334dfa6e47a323ad279df51752bf2db3/
      x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/d56e3cbea08f513a9d78cc66275aff8823e13a15/
      mipsel |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/f72b2812375444dad6b2880710f172f43bb73d61/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/8f57b87ebda88f35b1f1fd823c700c01f65ebbef/
        bfin |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/580efffc5e740d95263cdf1b62e714a23dee9a30/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/3f73ca7cc8f59bcaeae39618355cadb8c9ae60eb/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/89578581c46f9bd96bc7c532fdbeebcc0e5d466a/
      mipsel | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/444af01395e9384eb2b708baa561a9f32bc9ebd7/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/872f105934c68190a648c6cb367c990331fda3e7/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c2889b74ac683fe9bbee849c8977f7a9034ec340/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/43caa5e22abb2e07c144088bdabab3e8e2763b33/
         arc |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/6bcf2d78ec63007d97dd146b34cff1bd4898fc35/
      x86_64 |                   samba4-4.2.0 | TIM | http://autobuild.buildroot.net/results/8e6d274f5d3543155f56391268b9210a732ee3d9/
      x86_64 | sigrok-cli-198487f611d8a7be... | TIM | http://autobuild.buildroot.net/results/6fc81668496dc366cfb616e83af5d7858e86e0e7/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/32c9d99cb2b9c99022ef9a8fa072a7b8f41921db/
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/31f90833ea97ca548a84de6a8ac7a280fe8a4626/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/44d7bbd4cf17b3682b80bf89435cad7e9b8cd10b/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/eea6b1623d9968540ae7ac17216d2bf5f5c46bf3/
     powerpc |              xlib_libXmu-1.1.2 | TIM | http://autobuild.buildroot.net/results/ab2fac878b86c36c5ef2c546bf0f8379f62c5fc8/


-- 
http://autobuild.buildroot.net
