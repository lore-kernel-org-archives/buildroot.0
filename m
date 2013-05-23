From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-22
Message-ID: <20130523063006.D307152C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-22
===============================

        success : 112
       failures : 66 
       timeouts : 0  
          TOTAL : 178

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 4 
                libtirpc-0.2.2 | 4 
          host-protobuf-c-0.15 | 4 
                mongrel2-1.8.0 | 4 
media-ctl-ac40b79f002a2315f... | 3 
               sconeserver-211 | 3 
         host-gutenprint-5.2.9 | 3 
                  iozone-3_414 | 3 
                 pixman-0.28.2 | 3 
           imagemagick-6.7.8-8 | 2 
                  gnutls-3.1.9 | 2 
                 cairo-1.12.10 | 2 
               wvstreams-4.6.1 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  unionfs-0.26 | 1 
      gst-plugins-good-0.10.31 | 1 
                      gpsd-3.9 | 1 
                     m4-1.4.16 | 1 
             libatomic_ops-7.2 | 1 
               alsa-lib-1.0.26 | 1 
                  ne10-88c18f0 | 1 
               libglib2-2.30.3 | 1 
                 libevas-1.7.4 | 1 
                cifs-utils-6.0 | 1 
                      qt-4.8.4 | 1 
            qt5jsbackend-5.0.2 | 1 
                   mplayer-1.1 | 1 
                 nodejs-0.8.22 | 1 
                 qt5base-5.0.2 | 1 
                log4cxx-0.10.0 | 1 
             libfreefare-0.3.4 | 1 
                      pv-1.2.0 | 1 
                libsigsegv-2.6 | 1 
                lmbench-3.0-a9 | 1 
                   icu-4.8.1.1 | 1 
               iptables-1.4.18 | 1 
               binutils-2.21.1 | 1 
                  zeromq-3.2.3 | 1 
                 libnspr-4.9.2 | 1 
                  stunnel-4.55 | 1 
                   dbus-1.4.24 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3375358e96c1574b11b7acec7b9919bbeabed592/
       arm |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/4b72eb668d87f3e89a3bd788edf5ea305823ddfc/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/67d0c8c8ac4711a3aefe278f0a25a0ed2cf7e4ab/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/a761a921008fb971dbacbb90f62dd1417b8df66f/
      mips |                 cifs-utils-6.0 | NOK | http://autobuild.buildroot.net/results/2ea76f2521590cfcf1b436fc4154a7fa8a696549/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/fb8b61a7de1246beb58532c5c8893661b86c6981/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/0c9790df574f1bf7de24b28987a8b99d5b7e3531/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/2f975d5ec7fbf3730517e3c433b72a45adcde512/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/017044d4b720b07e46818a6fc5d1f98da163635c/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/fec48ba11b5e08ddb0e6c61e7d1a2c0c68bae344/
    x86_64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/5b2e6c027565327b5c453021bc549f70739b7a33/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/3535191a13c4dbf99db4ab77fff4c0cc70251604/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/fd3de66078d9d9a27879346ba272a8cbdc9966c2/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/ce0062d2f0990e89dcd1b270bc248d71849ff7c7/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/40186d955ab469bcc9bd2fdbcfb183993f2c09e0/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/601cd2e1bbbe0f7cc0dc4df57f3e5afa6ffaef59/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/cabc566bf77b768e64b2752eb9199c24995af8e2/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/bd94209b9b7b77d03aeaf6a0a1c81309c08c2251/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/8681482a036cc18ad2f73154c0352211967d6c8c/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/ce072d4c188e79340cb657479f2fb73fb83d21d8/
    mipsel |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/9a6d66426a45bf26e3b923730c9107fa0cd6efbf/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/8255472da79b84721c46a04aa29eae0f12cd4066/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/3c63676cd7e54d618a1a072a4c11c5631e2b082d/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/f1588cdc9b4bb4fd6fca69a695298acdd647839a/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/337a31eed140cf757bb408d004408e91c65c9f45/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/955e5815c16433f49de8204ce947e3c5af8118f7/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/9f97d6f89789161cdbe67f0025900ecf0238960e/
       arc |                iptables-1.4.18 | NOK | http://autobuild.buildroot.net/results/d37d9739787d3f4e4b72a22c0dcae045b53b3c84/
       arm |              libatomic_ops-7.2 | NOK | http://autobuild.buildroot.net/results/c8180e1d9af824b17ed64ff4b7cc050d67b2f779/
     avr32 |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/95161dff531acf26ae0ab861872d1460d1c37b4b/
       arm |              libfreefare-0.3.4 | NOK | http://autobuild.buildroot.net/results/89447beaa778d0b3c66942ab3deadb2039a957da/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/c8ef4e8d0de8fc55de5d59f8cbf0d805ff5a59e6/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/8dfc895d2274529b5231ed1f838775b7f151aa4b/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/526a32aa92d54914e63d3b59b3b346a596a4e44b/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ed37732ad2813233f4587453a01e94f20fccd5c3/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/eb0cdf4c472e2d30f1712045c5d73254fa5b0f55/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ebff109ccc20279a2c2fa59baea12b633244ace5/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/cbd1bb7984b65a6aa508abff8668f3b264c14a77/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/44961886e6ed4d1b0b1e8708210158d98fe875cb/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/095f4c0655d9cd3080afef050aacd75f67986c5c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/1ff8697871b2b4fd57d864f46bfd8509c62ffc4c/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/599b7e27308b0660eee3f15c66550e8cea68896c/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ddcfeaf814638554fdc5951464d4da97282c15ea/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8fa7d94c90416675e30904ff52c0ee83bd1ba5e1/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/18396d32e926bd2fd71bbb9f16d3c0dd2e75af39/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/4d00b2961c4721d28cf6a950c662fa579d4cc77f/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/8f7fd2174a222c10b0ebce15884073a7dd0d1adb/
      i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/6efb36e35551fa6d1bf174f88e50c35ef0ea3163/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/a6ef40c13ebf2d261e4f47d59fa66073f6ee0d96/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/a2acf55eaf5b691fbe693ba0a734477e93179df1/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/f1909ed5ddcf6afe14cf3667a609a610a5285678/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/38a63b4d3e9efc4532519f291f3e4b98ae4bf0a9/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/0a072cdac09970b7b3241b9afe21d92780016851/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/c9174fc5fe738284b56872601256b481bceccf0c/
    x86_64 |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/13002e53cec54af14a4e2e8f62ee0f644263bf52/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/34b8644269797a15ec7a7184de2dda610b13054b/
      bfin |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/4119231183d6bbc6086635045084495eab645e7e/
      sh4a |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/e93848015e4a20fdb8cc9c26816c6bae066bd56f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/fb12e43d302eed33a765dbcf8e10fa6a3a910d49/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/faa69608beaf61bfbf2c3443d530c4a5defecf6f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/0a67f941186ccbde8c36e07458a52a13af360194/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/0471716dc78cca7c83b062d456e5a5418af57980/
       arc |                   unionfs-0.26 | NOK | http://autobuild.buildroot.net/results/391829450caef8a57f64020703d0f207dcb8ae1a/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4b8438815fc0b130a3512e493596f5cbe1e4b610/
microblaze |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/5db6fe9ada731b6c53ae5a3407745bef3961882c/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/5b4ba40d9caecf485344ae659e1a21497abb45fd/


-- 
http://autobuild.buildroot.net
