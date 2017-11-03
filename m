From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Nov 2017 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-02
Message-ID: <20171103070011.3CAF521DB3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-02
================================

      successes : 130
       failures : 56 
       timeouts : 1  
          TOTAL : 187

Classification of failures by reason
====================================

      host-uboot-tools-2017.07 | 6 
                      qt-4.8.7 | 6 
                   libidn-1.33 | 5 
          usb_modeswitch-2.5.0 | 5 
                  boost-1.65.1 | 4 
             core-dependencies | 3 
       host-go-bootstrap-1.4.3 | 3 
                ussp-push-0.11 | 3 
             dbus-python-1.2.4 | 2 
                  ffmpeg-3.3.5 | 2 
              host-erlang-19.3 | 2 
             host-luajit-2.0.5 | 2 
                   mp4v2-2.0.0 | 2 
pdbg-77158819158d1d7053a737... | 2 
                prosody-0.9.12 | 2 
                    gpm-1.20.7 | 1 
       host-erlang-rebar-2.6.4 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                   jimtcl-0.75 | 1 
                  libpjsip-2.7 | 1 
                    mpv-0.27.0 | 1 
           oracle-mysql-5.1.73 | 1 
          qt5declarative-5.9.2 | 1 


Detail of failures
===================

        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c6098dc1fb81735efac6732c99aa4cb2954b4b20 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/bf7fcccedb1ceeebae81be8e06a9738814f93f86 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/497225e9f349213b18f38e47f74f7345576e6bc3 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/1f4330df60cb39c41cbed1c5bc8886e67e040f00 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/3519f76dfddaa13d42841288c302152f9c6166d3 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/da39a3e3c3583103d78dbfd301b94f0aad589f4d |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/d9de6c18d0ec5b7a5aa84e04a11bb209cbb6bf2a |     
         sh4 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/a7466b1d48e87b1a0d992cc5cd8b484bbd16082f | ORPH
    mips64el |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/726efde3e2f05661571afc2dda353b7ebeaf975d | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/acf62b80e8db91d5cc1e83e1e0694e0156fe37e7 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/8ae8d603959d6fdfe710a3de884a62c39486794f |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/47e18eeb274b36dc47aec2a11f7edd6551deb128 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/a9237af2f218aa33e3a33333c82cda23cd1e2415 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/9dce90e7b109c061953187a549a5369e7dad1d13 |     
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/5091e4c919127f8041af35453261a779754f0def |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/4a0037eb99b8e46b6ae5aa3ad2f73050edf4768c | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/91706e1a9f374423f76e0eee797536e3031c13f4 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/7e28280abc3f607aaf12bd7ad3ba7cc0891f16d4 | ORPH
         arm |              host-luajit-2.0.5 | NOK | http://autobuild.buildroot.net/results/a6559a3d180235d59fc63746411007966de96b79 |     
         arm |              host-luajit-2.0.5 | NOK | http://autobuild.buildroot.net/results/8e819c8b87ccdbf2694896b0825e0247ad7f39c1 |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/cb9e746553e2608e5da94c8aea1c33200d450b86 | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/ceac967ae95c120a3e3ea138ca317bd09c50165b | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3eaa37a5dee72186ee66fdc72320242175699004 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b66877312f2c43857fd40322a15dbd98c19c3ebd | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c42b442c94d5e1ab04f6aa38d10235202549573d | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/965f22807c1075dc8a05e39b4f06f7042c1dc783 | ORPH
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c95bcce4e8005f095c986d17c756e2813e0a6d4f |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/c6be8bcf21b4c4cf9925e784b5250118e34e21f4 |     
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/0c158aa3220fca35fda38833731d3d1eaef44dc7 | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/8a388cfe93800a4041265088b01f635269f1d397 | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/40534d798131690410dcbc77d229e7688b795348 | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/f7fc775584ad35349f0d66ed8632ab18f3859f9c | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/9b5543d3d6e1300e171e0b2b3a41b046b8a18ca2 | ORPH
     powerpc |                   libpjsip-2.7 | NOK | http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/8d4522e584fd73818644580236f2124225c50f1d |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/506b3d5e1559ad6dd11be11143bf8b753f98d8d1 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/1e654504a5ee12b62c6c0c366a75a4665895d1f2 | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/57422630dd49b9e6d243dcc23ef1f2d7c10e12f7 | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/0de3c263fae431e38241d9bd36ec6cd2f1aa5955 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/098ea934cf86726f675987f6f4aebdc68d2aff29 |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/6c567322a7595024ecbfd5cc094286857dafd8d7 |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/2739141f8ceb1ab6a245c513160dfecf8cbd4d2a |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c5ec935c52818f3541e9a2720551a760065373a4 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/12decdb41bf39aa0923c83df9808e8cc349c01c7 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9e628b829e5b81756e9fc7c6bfc374d3b6fa23a4 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ae314f67eba49b0e0ee3ef6acabec10f59ba3c96 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b8c3b47c52a8b4420d5e548ab7d877c541279410 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7ba429e11b2bf39b528ee6e5278e311c2fbb43b7 | ORPH
      x86_64 |           qt5declarative-5.9.2 | NOK | http://autobuild.buildroot.net/results/0d449cb210558e843ab7dbe578b830107a3ac944 |     
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/c9050d73c0a739c1d7cbd43f1c0feda32dae6c60 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/b8cf3e18f7336ca797f0e5aa7bc65dcf6c22e93b | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/ea03ad09080e8a8c0b173b250a8ae9672a62c319 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/a85c8f671247bcedbb3564f97256e4f708d54c58 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/05ee4f32e522c5d40084bf06285d692a10dc36c1 | ORPH
         arc |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/bdd932424a45399836f27c435d6f1f6fb8b97c29 |     
         arm |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/287b7d35d64d72cbc587192cce1271bda9647608 |     
    mips64el |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/82e1484d9a43df7387137a1bd679a4d74d460a79 |     

-- 
http://autobuild.buildroot.net
