From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 May 2021 05:45:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-29
Message-ID: <20210530054531.1DBE740381@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 29  |  3  |  0  | 32  |
    master   | 123 | 40  |  0  | 163 |
     next    | 11  | 20  |  0  | 31  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                  lvm2-2.03.12 | 6 
                    ffmpeg-4.4 | 3 
                 pixman-0.40.0 | 3 
               capnproto-0.8.0 | 2 
               pipewire-0.3.26 | 2 
                   strace-5.11 | 2 
                       unknown | 2 
            erlang-jiffy-1.0.6 | 1 
           host-libcutl-1.10.0 | 1 
             host-lvm2-2.03.12 | 1 
                libkcapi-1.1.5 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.70 | 1 
            qt5location-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d5b2e333bb6b2e3ff7d5e99a899b475b7085ba32 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4c24b6984041e6b2e5bcea45616ea2aa02f1b8ad |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/aa6269b4f37c0552ffe91f14c09e1bf71eb15a46 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6a2191797d8025a84d1596ca3d2784909b68cd7e |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8d1a96d419f0737599f2ae545abadfcd55a0eea0 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2258c8d1605a11c4249ebad15ef80d6fa9959133 |     
  sparc64    |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/e47e56f0b77c41ea984f1e16c70b3eabddb2c7ce | ORPH
   xtensa    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/62afa6df8871d809dd9ff922b341709209436fd3 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/808215032b6e2e5adab19d5a949bdf05c8b32872 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e7c4681629fc3995039114d40bd55c468abacdc |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4091917371dd5dcab619b4a7991674da312213c8 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4021b2615d0f279e2f6ee2ed050bb6d009e80098 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/091453b1500f35ccd06533f751797f68a7b00547 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d2b22336500844ea922d2ee864139a8ba7c3ad7c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5ebcb6b6a59774a5cd5e593874dcf2fa9e7d45dd |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d28d9d08fb6f9a11b76c5a54bc8de144253e3fbf |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17baecb2a6efeed6ec8e4a74246ff4007bfcaf1e |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f90ea114a9d3946271d251c093215623e7bf8a31 |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/ba0d880aa126badf0458cc9c4db6a446ce157dfe | ORPH
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/a71ebbe5bed16fb99c2adf1ab3c80e3fc9321508 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/09c18085048d90139642cdc7b16af2794e7b67d7 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/e8cdf6a713fcd18eabe05e63f7c483afe9fd1d5f | ORPH
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/fb726cf057fdf4ee7627a74c26ef36269c707e8f | ORPH
  powerpc    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/d50406130ce38e0b6cdd9b53dcd5345e96ace1da | ORPH
   s390x     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/baeb55ec5944808612b2a44868dd1c02a91bcee1 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/d83b532b4c69d3bbad45241deb6d6883358a5220 |     
  mips64el   |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/76f548bf642b090bc6877a94b2767cfc46a747f3 |     
  riscv32    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/42f729b9690de06f4a5bd6b5c338007545a98c17 |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/7c34d96d88f21e7e9d896b37e610f56caad844e2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c0b50d5e5649e5fcf107a06eb5b70e4f18635d39 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/83f26639abb8a8d8d952992aa493faf406585488 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8f32512a51a6ab1d24f9af63769740a4611609bb |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/772a622f1c375e2a44741aec3d11ff1bda8cb95b |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ed9891c8d6d54cb2d248fe54e72a80fd9b823a02 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/7afb786cb65d53867b07940b7c82a688532e8a0e |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/33f027655769f85f9d5de75a8e32ed57025fbd08 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/fa179f7a8f0909509fa07511708cff6987423006 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e6363dca2103821771c8f1944a7f013ad0ac794c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f2032331587a390459bb8a755300de7d91fdcfa5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/025115d60a87bf2fae09780fe8c1098e6c7a93b2 |     


Classification of failures by reason for next
---------------------------------------------

                  botan-2.17.3 | 3 
                libsoup-2.72.0 | 2 
                 freerdp-2.3.1 | 1 
             host-flatcc-0.6.0 | 1 
           host-libselinux-3.2 | 1 
        host-sentry-cli-1.57.0 | 1 
                  libssh-0.9.5 | 1 
                 libssh2-1.9.0 | 1 
             libtorrent-0.13.8 | 1 
                  mender-2.6.0 | 1 
                qt5base-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
      softether-4.30-9700-beta | 1 
             transmission-3.00 | 1 
                       unknown | 1 
                    vtun-3.0.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/8cb7be5a6cd0e3b17246fca2ec9bb6739fddb5cf | ORPH
    i586     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/22234620f1077ad8b6ceb20b6953bd15d59776f2 | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/45327557d41153d0fab51c9b67eae23a1c0fceaf | ORPH
   x86_64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/d010e79c31e22f94e47f92367dfc9267b96393b9 |     
   x86_64    |       host-flatcc-0.6.0        | NOK | http://autobuild.buildroot.net/results/94239c0a70708e39481033f30df5038438c26834 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/b7025c8998f7d9c19e9e6f8ca44d85d6753b76c0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9b3ce2f43fb9d10d948cb2bca85ee9df67ec53de |     
    i686     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/7ae01ba63a311c5a3aad87216f2837d5fe3b5920 |     
   sparc     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/f61f8b26ddedecc9f752e575b6a132d44516b4d3 |     
  riscv64    |          libssh-0.9.5          | NOK | http://autobuild.buildroot.net/results/c3ebcbb9b5ff502e7acefb8b2426bd544913d415 | ORPH
  powerpc    |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/a457bf27dfc0029cbfc2fdbf371aad1e2efa5b83 |     
   s390x     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/c1d3189dfd63197fea00212020b160dece37b58d | ORPH
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/d8dcbb3a90cf940e88b4c43adcb14522245993ad |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/906492b1c6c66fcf78cc841100ad29e7a2c9d0be |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/445549e251f928b57cecd38ab2b28f621c052ec2 |     
 powerpc64   |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/28413ea9c08ea41d05afa34d2e45df9a2db336c1 |     
   xtensa    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/9b1b01d0c57e08e8cdf93d9e83968d6b81b38084 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5310e141c5d695da83bbe759280398241ab41cdf |     
  riscv64    |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/04905d26b3a379c736c209f5e7f35a575efdbbcc | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c13b6f31069840c9205c08c300cff02282524ea5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
             libopenh264-2.1.1 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/590a49eb4a0fe93ca9dc8be32cec91dec905870a |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/857f51b4d3584b3d147ab27762b9953f8688d759 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/22d3231b10659b7da2f9c1e9d48d1f77917488e1 | ORPH



-- 
http://autobuild.buildroot.net
