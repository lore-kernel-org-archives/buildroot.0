From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Jul 2018 08:00:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-02
Message-ID: <20180703060015.50E9C207DA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.05.x |  24 |   2 |   0 |  26 |
      master | 140 |  36 |   0 | 176 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-libsemanage-2.7 | 1 


Detail of failures
------------------

         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/01930fd4dfee94d52168b8e1675c4ab4a05f40a5 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/9973d44b69e8a5fa35050c210c6d88851e3aa6e0 | ORPH
       nios2 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/77f2cbe27d4d88ec488fc3dd0e25568e65d49972 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 5 
               json-glib-1.4.2 | 4 
                   wampcc-v1.6 | 4 
                    host-rustc | 3 
              libostree-2018.6 | 2 
              mjpegtools-2.1.0 | 2 
               mono-5.12.0.226 | 2 
                  samba4-4.8.3 | 2 
                  zeromq-4.2.5 | 2 
             freeswitch-1.6.20 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libmad-0.15.1b | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
                qt5base-5.11.1 | 1 
          shairport-sync-3.1.6 | 1 
             stress-ng-0.09.32 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/a963f142879c3013924f27da7de37ff7c8a33412 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/33f0219546573c6cfc0369fa7afe29cc65f5d664 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/bfd01575edb327b699c0bb427fe0c13f0b705162 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b23d98fe712be0cbbdaf6983379c884784e28a41 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/173e97bfc041bb53b635fa9d0f17ae036a04f212 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b91f566de5dcc4dea8109920e76e80ded9ffee2c |     
     powerpc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/1ac3dc4876a7b21cd446cb182dff47974ce17285 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/cd32d12354ee37358ce95059ab2b56ffef2def28 |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/3b5f0f72601af7ccfd3cb5db4a49ae0710691e79 |     
  aarch64_be |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/c3bcc7dcf21c4e41976c65226be482fa354ba7d5 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/e817069a89401e022947c0100a7077742363a0ac |     
        i686 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/b3297dee658e3a560f49ef366fd647323e856792 |     
     sparc64 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/023cc6e1de6701ac5fab8fbebfe61e5653a211ae |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ad48464bddf4fb6491b87a8fe9da263e5e188bf3 |     
microblazeel |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/ba093c1c3c1c29887a057ce7063494978e87ca8b | ORPH
     sparc64 |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/e333bbdd59dfb1ca85818105cd091936046db094 |     
      x86_64 |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/6177af5d57e62c6d97ed090201e8fccda029411f |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/7fda958b2f02faf4b53aff9487ade305249cb9d0 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/30d2d588eefd850412ed4153aa89c787658109ca |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/846df94c4a8d4a63846c1424bf2fe05cc63d3424 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/0c748963457a3cb0bc2683bc1ad2dee5865739b2 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/58b299d16eccff1b61a7d31689ce937cdfcfc93d |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/019d1214186ab6078220802aad55e7236a879100 |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/6d89f399133ba00416b1e4e022b5bc9be3dcd049 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/031d0b80f0cb358fc2580b69babc0af52587aeeb |     
        or1k |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/42595a54644fd262a1ac6b36d8776b99a01465c4 |     
         arm |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/840810601fbb8a7957ea9dae175b959a7f9b7491 |     
    mips64el |              stress-ng-0.09.32 | NOK | http://autobuild.buildroot.net/results/cbfb80117840bddd5712bcda3caeaaff61745b0b |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/9754dc9d4e35bf963e89a9a1509337dba1e9f8f7 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/e7c942203526d814b2125a1eab7ae58b7145b1f2 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/83ab5beeeaa649c63a1d75be875367c8be604b82 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/a5265705aed364edc0f8c615ae947d8d151262f2 |     
        or1k |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/99e32ca52b1e05bae43191cb0087dade9ef3a835 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/502ba5ec0393d563a40f54c3dcb571d518c649fc |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8dd7311e9105a77363a0550a8968c2f87514a2cf |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b7893667573dd6bc29fe4b65b8ce6b5a71c3d0bc |     


-- 
http://autobuild.buildroot.net
