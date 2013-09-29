From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-28
Message-ID: <20130929063005.E848752C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-28
===============================

        success : 91 
       failures : 79 
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 10
                netatalk-3.0.5 | 10
      host-gcc-initial-4.8-arc | 5 
                     gmp-5.1.2 | 3 
          enlightenment-0.17.3 | 3 
media-ctl-ac40b79f002a2315f... | 3 
                openssl-1.0.1e | 2 
                  libnl-3.2.21 | 2 
          host-protobuf-c-0.15 | 2 
                  nettle-2.7.1 | 2 
make: *** [core-dependencie... | 2 
                aiccu-20070115 | 2 
                   dbus-1.4.26 | 2 
                libiscsi-1.6.0 | 2 
               ruby-1.9.3-p448 | 2 
                 cdrkit-1.1.11 | 1 
                      qt-4.8.5 | 1 
             alsa-utils-1.0.26 | 1 
               libglib2-2.36.3 | 1 
                 webkit-1.11.5 | 1 
                 omniorb-4.1.6 | 1 
                cegui06-0.6.2b | 1 
               w_scan-20130331 | 1 
                 libpfm4-4.3.0 | 1 
                valgrind-3.8.1 | 1 
                beecrypt-4.2.1 | 1 
                  sawman-1.6.3 | 1 
               minidlna-1.0.25 | 1 
                      pv-1.4.6 | 1 
                busybox-1.21.1 | 1 
                 zmqpp-31220ca | 1 
                    fbgrab-1.1 | 1 
                  libv4l-0.8.9 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  tstools-1_11 | 1 
                 libevas-1.7.7 | 1 
                 libnspr-4.9.6 | 1 
               libsigsegv-2.10 | 1 
               audiofile-0.3.6 | 1 
                 mplayer-1.1.1 | 1 
                 libedje-1.7.7 | 1 
                      icu-51.2 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/308087e1f85e822dec8b73a3ed892c7cd2376cbd/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/b03e7c718cee3727e56c18d8fab912274b46a940/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b1eb3b3be331a3d8ef527c28d8fe76b9e9ca143a/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b03e4b43311c8cbb57712bb0d9b946e9eeb1d960/
   powerpc |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/1954ce2440b80ee4463a44200c4f926c55ef67a4/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/e9c56bd7f658703270e97916ae12e7bd483dacdf/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/680ecea55bac4511d829da8d84f3eeaa252b36ba/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/f803bc8474bff1561186aabe1ee41427f101cb77/
    xtensa |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/fb35dc6457118868a9fa1d5c2b2ca648f6bed53e/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/06c5c520a015085a9efce221160b4856502ae316/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/98fb63c702b535109dad81dff8bb2d5d9dac78a1/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/975b0c2cb259343f20b00cd1b6a447497a43027d/
      bfin |                     fbgrab-1.1 | NOK | http://autobuild.buildroot.net/results/b6a101395219adab6adc6953c23ab9541af87e08/
       arm |                      gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/fa47b39b1b34d0873761f2368cf07b36716ef4bf/
       arm |                      gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/50f268ae54a91099433baa7f79c4d7b5d30608d8/
       arm |                      gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/e0823d0394afef15d11690414d46fc8b28b9ca00/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/6ec4b0474c170127b96bad0ff46411b074ba9bb4/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/fff7b253f4dd883a83adff4fad7e889e0bddbf0b/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/7c99fcdddd9519f635dd73b055e5013f47874c70/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ff63566fa8b358418e2bebafecedc4312bdcab77/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/317e3ba36e4f3add4a5cd379a93a9ab5597a70d1/
     avr32 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/1b05a00eb930693cfd3dd742450814bce9827c3e/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/3d0c5ab24ad8ff8d3836f6db49d0b154500723c1/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2d6eff1f8e91c6205d6de55ff6f96eb89d294031/
      i686 |                  libedje-1.7.7 | NOK | http://autobuild.buildroot.net/results/f824e58ab9c3fa12adee13b9721e04899c3c36b2/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/8599842f26c15971888f21d70b2b1c3aa5bae206/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4107e2420323a2a7611161e3e87041753992d0ce/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/413f95babdf2f8c3fd4faf6a43bb09a28d3995b8/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/716d6b616b6cd431c039601a5e0785e63a35ce7f/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/3a0cd6f1be17af92c62f3c471eeb424f358077b8/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/b36d78cdf3d665b737bfded91de6178f162f48c4/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/6368dfc7b1cf55af1de6cb735160ae49913ffb0d/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/7f205dc67ed5c6c9d9a9338ebd9ae78c257ace7f/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/c86c8e66f78a150823d335b132f31ff0888c75ed/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9c6420388fb3ad070a17f4f2b0e0b5887b942612/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/b5228724c8f971980a2e2ad9190ade88ba9f1f21/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/99eb754cfdc14b5b604d2847e6675c9c0326b65e/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b64a89b522b9acabc0d0dd388a9f037025ef080a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ea9b9790e2bf3c27c891c7b29c653cad6dd4a59c/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/23802b30b92a754bc49959520ca74abd2ab25998/
       arm |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/2c9fbccd4e0671c78b47ed7a04c9551bc29e6c06/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/b090ccf5557acba1f8b4bd5aedb63482100d2fc4/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/74d72b7233e20bd53a6b436273e9d27893598c86/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/7ff4960a6f7432f080d7ac01e04968629f92ef5d/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/be2a2466b34500e8784fb778d54449b1ede4d220/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/98aafa0cac9dfb7795e633cfb1e7bdcf141c9686/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/4a2b435d2aab2ad53065279ba87cf9a619a9f761/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/f10ee1eae1863471d0f1c60e24ac4640e2ea0fbf/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/e81bba82b1b0a7b5f58e3a367e8b30526cb22a24/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/f4c75b9396ff3f8eba203f668caf08da28ef52b2/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/ff86edef2d8c5350f62a78d7fe3737834abd24c9/
      i686 |                 netatalk-3.0.5 | NOK | http://autobuild.buildroot.net/results/7e99875a61c3efed047fb768eaa13c29085a3daa/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4390de7bc3df449519600bec53dab8c391a1e981/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/98d80c9bb275872ac20935452a77a2a6747975fa/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/f1c09bca750d697571cb3f4d0b200b3ac4742e3a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/47fd8370ddba3ceae8c0b353e5c0658bcfa5bd10/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4be2f543cdd9cb1ec0c1fabbe4e594dab49746ac/
   powerpc |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/dc620b3a52fe48f2a60880fe43625991e823bd1d/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3448cd13a5933ecb3279ebd81dc9cad087717bae/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/0a83f85479b7a98fa691d6a62a0d87cec0f01710/
       arm |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/e9d153024850f0e7522c20117b3ad6ffaaf37a3e/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/8a3fdfb14732e61dca7bc7ff990fbba51193f78c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/de1a5d15ac960a2eb7ededf602281e47961fccd7/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f80bf5aa9faba7be41e2a26b742e1f10ac4d226e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2e9f0e3e97a6e9596e0f557330c53fa786861c37/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ed283ba6977572a36862fc91b3885a442c5f2e95/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d955956e5fde4519b5af31e8f2a133e410e7ffbb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/55deeaca49f95353875adf816fe996d30339a427/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/be4cf3f81da298a5ad212477d5b6e8aa430deee5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/38519f333d8a1339ded8f9fd248e116cc7312ed8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/14d9bc55911f8df1a1a6bdd78d7d778799caa6d3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ef89981035e98759d383e5ce0e902ccd47e97716/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/5f2e9c36eb75eaa783225cad21b776c9533f5515/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f1c3b53e88e8ad93880bf59bd7dcc0d184bba8be/
    mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/42c3eaa07335a91df66abf3978ee0f80b3bce4c2/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/d7972098c6de641798f8c54deea1bc81625cb5b9/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/3e06aa65d60c9b0518996d0c3f29fa2d109f1a6c/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/ac741c00b300579d49768d260c67199760a59ecc/


-- 
http://autobuild.buildroot.net
