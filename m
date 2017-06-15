From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 08:27:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-14
Message-ID: <20170615062721.3AE9D21E50@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-14
================================

      successes : 102
       failures : 35 
       timeouts : 0  
          TOTAL : 137

Classification of failures by reason
====================================

                 mesa3d-17.1.2 | 6 
knock-258a27e5a47809f97c2b9... | 5 
                beecrypt-4.2.1 | 4 
linuxptp-97c351cafd7327fd28... | 2 
    trace-cmd-trace-cmd-v2.6.1 | 2 
                  boost-1.63.0 | 1 
                collectd-5.7.1 | 1 
                  cppcms-1.0.5 | 1 
              gettext-0.19.8.1 | 1 
               gnuradio-3.7.11 | 1 
                     gpsd-3.16 | 1 
           host-doxygen-1.8.13 | 1 
             host-nodejs-8.0.0 | 1 
           libmemcached-1.0.18 | 1 
                 libnss-3.30.2 | 1 
              librtlsdr-v0.5.3 | 1 
                 mplayer-1.3.0 | 1 
              pcsc-lite-1.8.21 | 1 
               qt5webkit-5.6.2 | 1 
               qt5webkit-5.8.0 | 1 
                 sngrep-v1.4.3 | 1 


Detail of failures
===================

    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6ae7746f92b4e584f7af84333dfd7954eaf3d63e | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e47dae496ac948ce2c3d969659ec96202e54d8cc | ORPH
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7e21794605a50828feb30149eca738c9a5279de3 | ORPH
     sparc64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2732ada99f0eead034f682b949422126d9594637 | ORPH
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/f4e8a3727f19f7df4a1c45efe3603422fafd4af5 |     
         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/36ad0bdb2d21ff9b556d4c51b48f575c2712eaa9 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7bb887f41fd0aa1b5966e6be87c1cc03e259393f | ORPH
         arc |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/3ad7586936b115279e86379cf4bd83c7600df30e | ORPH
       sparc |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/a54c619a67d74b6a52adcf1b04df42e117363316 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a9cf2801055acc173847597b5b695e3a2eaffd67 |     
   powerpc64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/aa48860755eec0c1b8a64452d92be7cfe23f4881 |     
      mipsel |              host-nodejs-8.0.0 | NOK | http://autobuild.buildroot.net/results/a8b8a781bdea668b657311c68b6f0ca0f74169c7 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/bc7d4ad6f4f79d773b6da5bcc2ee050255099ec3 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/dd6aca1a3586fbb8f5c2d94bad37354f18a7070e |     
         arc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/952bb834c2e47849419a95809ab8f91219e96559 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/750337da18efd438897a9c60079139c4bd997e44 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c014e992d39ff4e11c0ac471da6af51a451bb73a |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/54bd884a5e09a3e12e36f17cfe256aa140c77e2a |     
         arm |                  libnss-3.30.2 | NOK | http://autobuild.buildroot.net/results/66d31923824d34df3b20a363a1346df1c00ae222 | ORPH
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/e62f1c15acf9e709e1296e4e0f558978e7d74771 |     
        m68k | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/35683ad37b5ae0f61307e1a3713ffbb53d99e7c3 |     
         sh4 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/467de851db51f9d268b34c1e26bdbc5dd904c740 |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/a3a03b5ea1e81ed3ac174471d2f09703868a7c1b |     
       nios2 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/0dcf5db9696f83ba661d78665860416b512f04fd |     
      mipsel |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/994eb9510f1910a46a7158bd234e379fcbdf14a9 |     
      x86_64 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/6660a2877ea935ce1f237ce5802505735f5195d6 |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/9cc6a7d87e2ecaef82398b7df2d6f7b5a46b7a32 |     
     powerpc |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/2a42adcf7f02098d46fe14a4574e8ffd43220669 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7f6fb54a87a36f0e36b3a897b0925e40268f68c1 |     
         arc |               pcsc-lite-1.8.21 | NOK | http://autobuild.buildroot.net/results/5ed8d42d46da373d4e20952bfdbeebe4b9257893 | ORPH
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/add13ea09ad0d86ae66b295325d0737b14495fa5 |     
        i686 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/2326881801b086681adeec84fb25233df0febcde |     
    mips64el |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/b595d7436de951fcbd66f2e98201b92e2bdad5fb |     
      x86_64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/bd513103db919d238e30f77b7bc50ee81e267c84 |     
      x86_64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/453807aec57bb88faf438a8a53dd7611ef8c8fcd |     

-- 
http://autobuild.buildroot.net
