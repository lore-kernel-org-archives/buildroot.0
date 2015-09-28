From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-27
Message-ID: <20150928063014.85E79102A48@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-27
===============================

        success : 215
       failures : 56 
       timeouts : 0  
          TOTAL : 271

Classification of failures by reason
====================================

                 sudo-1.8.14p3 | 3 
                mongrel2-1.9.2 | 3 
                  mono-4.0.2.5 | 2 
                   mpd-0.19.10 | 2 
                 mesa3d-10.6.7 | 2 
canfestival-7740ac6fdedc23e... | 2 
              strongswan-5.3.3 | 2 
            ibrdtn-tools-1.0.1 | 2 
                directfb-1.7.7 | 2 
                 dropwatch-1.4 | 2 
              libstrophe-0.8.8 | 2 
       kompexsqlite-v1.10.12-1 | 1 
                 fio-fio-2.1.4 | 1 
              libethumb-1.7.10 | 1 
                ipmiutil-2.9.5 | 1 
              gst1-libav-1.4.5 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                   systemd-221 | 1 
                 mplayer-1.1.1 | 1 
                   erlang-17.5 | 1 
               iptables-1.4.21 | 1 
                      qt-4.8.7 | 1 
                  apitrace-7.0 | 1 
             irda-utils-0.9.18 | 1 
         qt5imageformats-5.5.0 | 1 
            micropython-v1.4.6 | 1 
           libfreeimage-3.17.0 | 1 
               util-linux-2.27 | 1 
         qt5connectivity-5.5.0 | 1 
                   perl-5.22.0 | 1 
                 jsoncpp-1.6.5 | 1 
      host-gdb-arc-2015.06-gdb | 1 
                libnspr-4.10.8 | 1 
                   bdwgc-7.4.2 | 1 
                oprofile-1.0.0 | 1 
         conntrack-tools-1.4.3 | 1 
                busybox-1.23.2 | 1 
                    faifa-v0.1 | 1 
                 gnupg2-2.0.29 | 1 
                  ltris-1.0.19 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
            kodi-15.1-Isengard | 1 
           qt5multimedia-5.5.0 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/6ec731af30413e5d93f4e9420a43ff91ef30d594/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/70bf4a64dc4ce55615d025582a723809af3abf4d/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fb0eab82cab0d42520f196f9a77a918816c33d85/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9c46857b1f59e0d5543bd13a65fea3abe7188d57/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7292a8716ee1b26bab5831d1560060e8f41749f3/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/beaf05dc492f7ae0354caa140d65994a40225121/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/88ba88baf874b70e7317b6f50e059a1ff11218ce/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/1f649e5880266cb336fccd10e998802595b947e7/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/755eaafdc9a8e531068cc38da6dc536a7aec6d82/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c3a1139fbafd69d4e1238905eb6689110776513c/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/b242d4ec0bbe5e7a79e20c35cc3de7c13702d0b8/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/0248a80542cda3f96c67e811f77ec57c4b1d7617/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/c917bf65c904323c760564ff54f402003f606760/
         arm |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/3289bee6b4d0bf4851da248be798536df85f4222/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/61d4a95e7904d3bec876d58688a28f24c20d525b/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/3f35a4c4f13ffafbc5cfc5f179a8bedf55e995e7/
        i686 |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/f2e96c68a705330f3cde263798329b284de92455/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/b60394ce46f6b672a712f72c3f2ae8af01282aa5/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/937163f988bb3680630544f6c0ed45b18bc83511/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/2260994b0482a5e5e51149885ddb2a6cd361176f/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/1ae502e38e5af66af063227d2771b8dc69c26bcf/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/2dec8a2d22fa2cbe55c3c3ccc6d0530a7e30be46/
        i686 |             kodi-15.1-Isengard | NOK | http://autobuild.buildroot.net/results/72acceb1e6bc0510856b52b4abaa2a25eb4464fd/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/789b6f791aac266e7d62e126bfed0ca7d5336e92/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3294e7c5463e3e4554106f5be7004130d05b1f3e/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/b6cdafda1890dc7fbf8e30e0d1c005f2ef88d11a/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/7a20393a8b12333b501db2ddd83c8a8184f400d0/
         arm |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/63ad4158b8e4541ba90b0a7fe473dbee91a86e60/
         arm |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/64d09905ed1e00457848622a5e1132a1b70bca4c/
        bfin |               libstrophe-0.8.8 | NOK | http://autobuild.buildroot.net/results/b99ffa285993246736142960c98b7c1799fcca01/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/98d4ac01b2436b7f9540b34fab5c73eb0a564dde/
      x86_64 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/14140858d8c4837398d294f8660961369ddc675d/
        i686 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/62608c2954601c7145bc2b15532a795ed57b01fd/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/b4e0804066c8de904ddad4796877a1ba1ac9a8e9/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/8d33db133f8b2560b7d4131183741280c6d767dc/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e21d8cbf15fc1be1132dbb3345172f0bad53ead3/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/56c288b131c5dc13b7e0c772f2b2581a599f8f36/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/ae54241693b93f022f6fcca0b6522a6bffb429dd/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/80b2c3f1aecb9803d1571a8a09263d2384aa2b78/
         arm |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/d0d947a9381c054bfa6845a48b36e3eb3aeeb35d/
         arm |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/414522b6534094ec7795f9e93f7d103d28232c04/
         sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/c6b899500719d890408523aef02658bfeffc075d/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/773e293963ffed0e103b77c896a40c0c0f0e34ac/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c11bc396b8e27fbeda22debfb3f49739a8c28f9c/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/f88e602ac231ef492523e5589bd77aa9ae18fe82/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/11a4c19638ca211bd2a424fd92602166235c9433/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/0e1e747344f4cec566ce22daa7f4e79a353f4de2/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/68b67f7c601f5619211eee612425edb5be82bd53/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/4fabda1ae2915a63c8e5e27344bd0c1c92957ad2/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/d6c741e8af17b647365a86d38149c3e21f06a7af/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/7d494e7575c553b9224d97cb3489a0efbd51198b/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/954d4f13706767af62471ba6f3ea23eafa720bf6/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/fbdc72914f2ee995c4db269129ff9fd7badd2e23/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/1decfe1bf40fdf2786d707f8e2d6881ca05d1a5a/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/0b9a57fef3a2b3259722c2b7090e4db10132ce35/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/d8f780c907e0c8e86e996a2777567bf2e405a4ca/


-- 
http://autobuild.buildroot.net
