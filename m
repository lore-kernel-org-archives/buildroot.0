From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 07:25:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-20
Message-ID: <20200321072557.CD3378943C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-20
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  7  |  0  | 33  |
  2019.11.x  | 19  |  3  |  0  | 22  |
  2020.02.x  | 17  |  6  |  0  | 23  |
    master   | 148 | 128 |  0  | 276 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           mediastreamer-4.3.1 | 11
                   bearssl-0.6 | 10
psplash-fd33a9b3d68c89fa22f... | 10
    host-python-markdown-3.2.1 | 8 
                  connman-1.38 | 7 
                libtirpc-1.2.5 | 7 
                       unknown | 6 
          syslog-ng-legal-info | 4 
                     avahi-0.8 | 3 
                 binutils-2.32 | 3 
              bitcoin-0.19.0.1 | 3 
               erofs-utils-1.0 | 3 
                  ffmpeg-4.2.2 | 3 
gr-osmosdr-46698a67e7e06419... | 3 
               libglib2-2.64.1 | 3 
package/syslog-ng/syslog-ng... | 3 
        perl-crypt-ssleay-0.72 | 3 
                 rocksdb-6.6.4 | 3 
              host-grpc-1.25.0 | 2 
             host-pango-1.44.6 | 2 
              libostree-2019.6 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
                oprofile-1.3.0 | 2 
         python-markdown-3.2.1 | 2 
              spandsp-20180108 | 2 
                    brltty-6.0 | 1 
                coreutils-8.32 | 1 
                   dav1d-0.6.0 | 1 
                 granite-0.4.1 | 1 
                 haproxy-2.1.2 | 1 
             libopenssl-1.1.1d | 1 
           libsamplerate-0.1.9 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.0.0 | 1 
                  pango-1.44.6 | 1 
piglit-ef761094be04d14e258a... | 1 
                pipewire-0.2.7 | 1 
                 powertop-2.11 | 1 
                  rygel-0.36.2 | 1 
                   sdl2-2.0.10 | 1 
                suricata-4.1.5 | 1 
                   systemd-245 | 1 
                     vlc-3.0.8 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/43394ccb49fcf7e5da6d74a741dd7a67b908c871 | ORPH
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2a8d05a3b0bf56f87388ef735c52db4a0dd9ba53 | ORPH
  nds32le    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8915afdb076e965a441ea3f439f39cf28c34d7e2 | ORPH
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e9c397db5564024cde97e63ea71d3e84f44623b0 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/608a3789019d692086ad839a15bc0c3c4f6e55b2 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/8b2e8f3866f5ccfaad5bee3bd5ef1d9b9bbc9120 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/b6506c86783efe7170b73662f3e7a26c7a5aeb43 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/5a7a8dde667156da1265c0bfd1ebad79e5282a32 |     
    arm      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/2e31fade61d7e77e3338b9f65f6cd09fe1407bfb |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/964d0c63b03cce6924484467729e0cf8c9d8d048 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/52b89bb998a5296f0ec73f5765eff622b7bd6f57 |     
   xtensa    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/1eca10cc621c85b8c2539511791857b85f915d3f |     
    arc      |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/a8cb421b6212adbefac6991d3a1fdd20388aa4e9 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/5340c250518417318e0e137cec4ff9c9f8b40b7e |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/94cf2cc810aba91820327a212a5050b4c8458cde |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/8889120176ff60b312eb02e42b3d434125fb9ad0 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/65ff87e01a40fb9c16cebdef03af56951f328b55 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4a97dc9d894bf8652b2cf31991979eb73478b5de |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3d13aa2e53ecc82cb3cc7491516d9986b133c505 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dc053c4f9b86aa93a9b7cb5390bc82c0fe809b03 |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/001986c7a1f36be5495de331383d747c43b7f196 |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/2febbfde251f560689abecbbacda2baf6c47ec14 |     
    arc      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/a177996f90bed8d63c14cfb73d439ac73623ac2d |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/403b360548c72658a94c1cd6b785954ff0cb3646 |     
   xtensa    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5ab3e0f72c0ef34a9e1618529df83018c941b35b |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/bb807178d2a0bb67161f15aae40492f0bb0f3c19 |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/2c11734d35f517c2d1ca232badb8730558876ead |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/b1c6e849bc97c27343037f6ef325e13e9921bb23 | ORPH
    arm      |          dav1d-0.6.0           | NOK | http://autobuild.buildroot.net/results/3876e2c3e8904a57d9b468effe9a824df38da88c |     
    arm      |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/1227af113a9957fcea95f58240ab7521d18e3a1d |     
    i586     |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/5746949036e32be79b85b9796eae5e8a3b063ed1 |     
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/11889317d3dac9a97320025accabdcab25b27da0 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/8444ea5ff9a515a23e0cc03d030726e2368b3cfa |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/2a253913e0e1aab9bdf6198cb15be9f308b319e6 |     
  powerpc    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/fcee9cfdb78a673325bf757c78c48579aac7a981 |     
   x86_64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/af493a673fc831569cf65a09e4b7e26f216fe4aa |     
    i686     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/73a3d627bc9ed207a927b6775f7494f959ea2452 |     
  mips64el   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/ff0abfb69b34fddad1a12555c7031dea7415f0fd |     
    arm      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/6c00cd059a7326b0e7d108ed94494c0c6e7d53a0 | ORPH
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/0f789f1085c2147e7aec84337d535693de20d36b |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9acae807c6d9a6e34b39d1dbcd454731428d27e8 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b487eac72fbc1164705eb444d18c2bf0ddf5205a |     
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/03d2fbd191c505bcc6cce11be18fd006d348e5a0 | ORPH
  aarch64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/9246378f10f9f6cc3696f140c81f726943e447d6 | ORPH
 powerpc64   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/12fe61f9d5e3ac895d4401eec0712318d2302cef |     
    i686     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/38fdbccb187c40d5fed2e4dcf3d5249491f6a9f5 |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/5ac1db2f275d20cb33805a15dfe29e88d810812c |     
   nios2     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/6bbf120caeadb98c4976d640a029085832c804c6 |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/1479b34f565a2295501086c3e67cbb998670a2b8 |     
  riscv64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/78f0e99704d35be5fc0317059182fc32550ad6ce |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/2827c4dbe8036235770c8e8a109e1b83659aa069 |     
  mips64el   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/634a2efcb8090c8445141119d30635cf6abc308c |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e4330274b772a94889309ac948db4931ca3d5b82 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3828eec14d0b8de2e987e53584a093a3112a7443 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f9181b3874771f8c89381125ca56a98cdca342c4 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/396823aa8d42266dc1e65c2ddde23989c51f6b3d |     
   nios2     |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/1322384a9b9956f97e9e56e623f4f54b008c6e16 |     
  riscv64    |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/7a7e5fd0e61a3465ea1e06a4960fc44b535fca1b |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/7ee18829ee3fc944722fa2ecef3235c8489c963d | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e7713472294abfb13291cd271cef7248bef93139 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a91089da710e3ba15a542dd8e09359ea7e056491 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a138b0c97721801b6998440527bc861abb0060d1 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4947ea8fefd1eb478ba3d140e4befb94c4c6111a |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/1ceb6411701ae74dd33f067ae8ad7d03dc4f78c5 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d4a9e18b182235c9b52d06601c36527cf98ead1e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/fec20c7008051a75b37ed1f208c73cc7b9210e54 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/85297294ff70e175aa3074bf5b541fa0558cd325 |     
    m68k     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/b5306c404c7eb8c79c0a7b4e3440aeb592928e7a | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/0486358796ca7e068460a6e409a53d94627dce16 | ORPH
   x86_64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/b1de6967109324d1dd971a70ea85bf4ae00d0fa7 | ORPH
  powerpc    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/ce8c564a91d25c40cfaebf0ace13f57bfa598e21 | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d06c869dcd894861bded008e1918eb28651d2dd9 | ORPH
 aarch64_be  |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/1beae12455d7d584e2dc94de593e645c285940b3 | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/812a2e1a1b861f407ada98881cd0743e2982e366 | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/704b0c496dfc20154d70a1804abb834d712a5f40 | ORPH
  sparc64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/bbc9999d6a848de3aedf3fd34d77ad792492be36 | ORPH
  riscv64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d878d25a9bad6ebb20c73fb6ac1a25eb71e0ea22 | ORPH
    m68k     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/003327ab508dd63fa3de19e24cccd7da35ff814b | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/d003d62b1ab23bce2497ed379d944fcafc7145e9 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ff86560f93f6461948707d3a59f8a749cffc5eeb |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3f117f8c75e4f24fb9ed32883be632f0576dbd23 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/141c4628182eb066f16719a73ff7d19c85760447 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8e52fb5134c53de180f3676dfa6a98a5c979d86b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/fc29525b5b030214fc8d710d88cd2b4d01cc700e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/2f2f5d49d42196485b2dc67928f4c01abb37cca0 |     
  riscv64    | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/f6c267d9fa148afcbb8a328d1a296709753d8c7d |     
    i586     | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/a73075993b04357acc9f6ac8895b3e761d6425e7 |     
   mipsel    | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/9bb33e4787ddc52733f346a39ee1ae19e9b7526f |     
    sh4      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/910cc809004dc2cdec9a8c980e40a1e2160b8305 | ORPH
    arc      |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/d8fb8cbcd614987457dbc5c389888c78116ac771 |     
  mips64el   |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/e13b437c17d843fbdb146ac153f87a3d49828a29 |     
  mips64el   |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/3f65af04fc56f28e74e10941e08dac3228e976d0 |     
  aarch64    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/eab383e49c6ded67e284d973a35526a88e2d75bc |     
   nios2     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/5efc4ac96a921ed40a52479fdaecdaf5a2174b05 |     
    m68k     |         powertop-2.11          | NOK | http://autobuild.buildroot.net/results/ac24c97ca6ddeb454d3c23d8d49d8750a7dc5f3c |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5354cdff547ff0cb1534c2dd3822af40dcef1503 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/53f89f42aab626f36d147c21516575ddab3819ff |     
    mips     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/58601d59e8f099e5ec59446060f4367e49c053f5 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/101618330dfb103ec38811cf30803159ae0ed7ad |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2f31735e2f85e367ccc3a5f60ebf53d1cf1a1919 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1521509ba47dbf0218568b98f1a85a4097bdef76 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5595f8786763f449c5bf6b96aa8c5f13aba353b5 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/255cdba35ec2f07c59f9508d40b5d09d7db32db2 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/12cee1e35d7c22ae3f609be167bd23a2685720d8 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/47624916ddae72c1dc06a06d141bf5bf8a23b933 |     
    arc      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/4bbaf4fc5260b0a7db449eda481b3ad5d5f6669c |     
   sparc     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/1190600521fe3d9592282b29bfb968e99598f753 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/fb5e4dd5017362b53b485e1c828466b99cbad36c |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/78103056e5e88727d5dd3941c99f593f03d85146 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cd76166d3bc092c2a5a53e1a17cc374c04ae0eee |     
  sparc64    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/4dfe903765bfcaef2ee8be2fbdad6eccc34e2072 |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/cfca11238431a2ed28882077bd46bb925aafdc28 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/b71745be15adad68f298d7201c4ca339de20d9fe |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/e4cf11e20d2f200e1e0ea9d98ba98e07ccfbad06 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a877087f42038c66c59fbdb49a33d79d73253f95 |     
  sparc64    |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/35154ad374ae7dce2bc543b51a7fcbddff43b798 |     
   sparc     |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/758c6d0ba6e36dd4055ee30ab590e996a1e1af7f |     
    mips     |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/d43090ae3f26144cf2f01f889efa2c1e86c2ffb2 |     
   nios2     |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/6224b7ba2916282bdb7436c6d6b3e0a7e6e8c414 |     
    arm      |          systemd-245           | NOK | http://autobuild.buildroot.net/results/f5660b2711627fcee4086e096e4ec4d9ba190ab6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5ec365b3f9111081cd296290f5aa7b8134a93684 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/413581d4f22aaa119daa95ae01c7c1915bb58421 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d2a7d5623057c3446849fd1fa16cabff5f3001b2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/06dc30ee8abd2ca45378431c94f6b8dd69419add |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4455e56bdc0909a64535c9fc47a9bdcd2bda848a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/fddb65cafd772825d4e2bf035474d86a043e0ed4 |     
powerpc64le  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/a293d74777fcb24cd3776b03c050456e5ecea2a0 |     
   x86_64    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/c51e2f34fdee51696846e7b5d3f4bf4aac11570b |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 5 
                classpath-0.99 | 1 
             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/852da52ce8b9c5d1141a0dec60cbb4880d4c3e1f | ORPH
    arc      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/0c4eafd5699c07260e825cfc863bd58b11c12b73 |     
  aarch64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/856e55302c5ab3b0f4ce7362837e849a286ce7ec |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a47342f1b855ea28ece0fb35cb661ed000517353 |     
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/dd6b80491c58a8cefa4e61e018d7976d9612deb5 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/5885cab802ded24598a75dbb8dc38a9eccb86f4c |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e64e09918c9340e8996fba799e583f0c9c97ffdd |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
                nodejs-12.16.1 | 1 
                    xen-4.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/64616272955f089a10b7719a0374d60bea47828b | ORPH
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/0e257fc9b29ec0150c776069f5619cb4ff6e4ba9 |     
    arm      |           xen-4.12.2           | NOK | http://autobuild.buildroot.net/results/fabade164fe6b6d9641d9ea734d933c065b4f5c1 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 2 
               libglib2-2.62.4 | 2 
               acpica-20191018 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/bfe74b9e2172a8d4cb6635f789efbf7f31b2d109 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/41c4accd5a490fe33f094d4bb4e8cbd78f61e1b7 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1f553cb0122298f37738b8230a040eb61366aba0 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/67cae03f4f6125796992677335c0a377b0b97b10 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/03d9ea713fadc2b8c88e091967ed9e3591c89b17 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c7a88a009890c56291e39d74f7bd1615d439cb9 |     



-- 
http://autobuild.buildroot.net
