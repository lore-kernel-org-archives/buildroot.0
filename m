From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-27
Message-ID: <20131028073006.0379452C5EA@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-27
===============================

        success : 72 
       failures : 61 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 5 
make: *** [uboot-tools-lega... | 4 
                    php-5.3.27 | 4 
                    nano-2.3.2 | 3 
                    mpd-0.17.6 | 3 
                 binutils-2.21 | 3 
               alsa-lib-1.0.26 | 3 
                      icu-51.2 | 3 
                  tstools-1_11 | 3 
                      qt-4.8.5 | 2 
        gst1-plugins-bad-1.2.0 | 2 
     xlib_libpthread-stubs-0.3 | 2 
                    fltk-1.1.7 | 2 
                openssl-1.0.1e | 2 
            libvncserver-0.9.9 | 1 
                  python-2.7.3 | 1 
                 omniorb-4.1.6 | 1 
                     m4-1.4.17 | 1 
                    zlib-1.2.8 | 1 
               libglib2-2.36.3 | 1 
                 libevas-1.7.7 | 1 
                 cdrkit-1.1.11 | 1 
                  sysklogd-1.5 | 1 
                beecrypt-4.2.1 | 1 
                 mplayer-1.1.1 | 1 
                 libffi-3.0.13 | 1 
                 dropwatch-1.4 | 1 
                     rpm-5.2.0 | 1 
                sqlite-3080002 | 1 
                libiscsi-1.6.0 | 1 
             util-linux-2.23.2 | 1 
                lmbench-3.0-a9 | 1 
                  avahi-0.6.31 | 1 
              cryptsetup-1.6.2 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e2348d887ee73fce6719b860892a62bcf706111a/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/737879d0f51a82017dfcd7786718ecbadff31f57/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/fbb802dc07d010f2686307efd85c13ce115ba772/
    xtensa |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/3c88eba04a5a64f9336171701f486e8c5d288069/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ddce0d4e6dbc2c46454e34cdb929a783811dff49/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/6cdde58f274a692922354da0033b8b050dbf6845/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/dab0694d0ea46ef363ad6f5f0852757aa80220a7/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fe52607e675c20f528475038c1185ea0aa92fc3c/
   aarch64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9f166deb751394741f28603c846d3b9d9ab2fafb/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/9fa6b291abefcef91b38b7fd262e7557aeabeed3/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/651968d782ec9648bd455789774e1e9a58f9ace0/
       arm |                     fltk-1.1.7 | NOK | http://autobuild.buildroot.net/results/5195f7a8a38a5ba3ce5a0bf2a7649d390e461ee9/
       arm |                     fltk-1.1.7 | NOK | http://autobuild.buildroot.net/results/c2e225d491274d4fc394ef55b8ddac882a613927/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/003530b0ba33505732a4a5e746e4ede0869193e6/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/5037d4dd685963f4df4b9fa972da4fe6069973e7/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/4585751cb57258395bf9e09ab264b09fb5b8d7b4/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e1ffe664b0b0e162bf0baa15fb293606129696c8/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/77cc832e429ebf3e75e7497dcfb3f53f5fea4a99/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/9e7d09910ea40aefbb854a95f70217af156208f8/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5e5e597fc01d34c9defab29d2e7c0eae53e15391/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b8dd9183007279eb0ec961a975e7ce89a988cb1f/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/5a2e0716a2cc2cd0936f8b2bd16c05335b182d45/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/1dd711db2059f708a892eb07e53f72335110f9ae/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/f43efa44300f8fdcafa87b4bb67adf0d9ea57860/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/8651dca55758970521e7a341d06a16e1d51c8535/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/a77de4ce19e8772ecaf2f69569d8782b2a95cdcc/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/1ca36e1615c7d9ebec9a475764c27146e29b6cc7/
    mipsel | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/e56b3f1b2049d2299a3458839fec8f7ed4b00e46/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/784f9d1e3a8a6f4faf50c99d923546d3f6aef0e8/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/e054ddfd0a53a584e24894159ffdcda058f48783/
      i686 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/bb14c10a54960afc7005af94e6936e20e40b30bf/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/5aec8854d6eb63b614cb58479f107301bf273231/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/3b9ce154396f5bd957c58c1bbff026f818c8afb3/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/3177b7d6168eec0620e4a1ade9166c9c84929e6e/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/5c64038acb46d2f0271d08d54f281b723c0cb0e1/
   powerpc |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/be70fa00f3d75b4f93590aa9561b57a4dac8b5b5/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/2736eab128b3f91da483e276989dbd7a2ff89dce/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f4bcd545a18a2c01b4b66719f455fb7c6b64625e/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/7c7f942ad10b7c83f3e80e06998e5b85b7fd351f/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/b8240c7707e8c42b1d18d060017734d44dc8f00a/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/a2aa90de7ceb2cce24c824f10065c34b75db44e5/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/a80d2a4b83efb7f3f9cbb05a03742a39194f6f86/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/7ad16a2111dc206cb96d9ba41e5ba85292c22411/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/5feaef4531e58ac5a61cb6c44ac63791b1d79dac/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8eb0dc936de662f53b8639d4be77e50cf14f04e5/
      mips |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8551cd76442e48c89618b5112d265a20ffd8afaf/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/2faec794d8c2401dfee922d86319290b0ace1023/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/d3145d43b8645e4a5427dc77dcd74f8b7b8cc673/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/cfc839ad1b6dcd545583e19c7f60a9fec397d7d6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/da8d6e79436b15a681c31e76cf7f7ca07935a0de/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/60ed317d52d93ba2c087aa6ff4f422d760806d89/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6adc50bb3bebbe6ebde338cc82ce5224a340eb66/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/dd7253f9d020dc309d93c35483dd27ddb3ca99f3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a7c6058c6c509870826d613b4fc770001973df4b/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/f484f0a05084c54d50025a5c643238fffa4fb63d/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/82444de625a5f81461cf63e129fe69e814631518/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/6596b12b3be8795d6b51fae080c265ad2e8ecd62/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/e8006153a5ca0339420981cc32c8527bb144a5c3/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/c029f14b9ced0d4e770e35fcdf748dd5d89e89c6/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/93f4e821f1c27cb67c76be8322514e7edc1109d2/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/9ca840dabe77e757d097ff3e561f6d8b11bb86b8/


-- 
http://autobuild.buildroot.net
