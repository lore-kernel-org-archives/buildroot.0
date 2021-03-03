From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 03 Mar 2021 08:14:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-02
Message-ID: <20210303081415.C641783A40@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 10  |  2  |  0  | 12  |
    master   | 106 | 40  |  0  | 146 |
     next    | 25  | 33  |  1  | 59  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
             libopenssl-1.1.1j | 5 
                  dhcpcd-9.4.0 | 4 
                clamav-0.103.1 | 2 
                libshout-2.4.5 | 2 
                 pixman-0.40.0 | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
                coreutils-8.32 | 1 
               domoticz-2020.1 | 1 
                     efivar-37 | 1 
          fuse-overlayfs-1.4.0 | 1 
                 haproxy-2.2.9 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                openblas-0.3.9 | 1 
                   sdl2-2.0.14 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
             util-linux-2.36.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0e22834d5d3633202ee0931922dbbbe01756e263 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/621a9c850c31cdc05a290bc7701753f90dd63afc |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/551d34b69654db9a5b37ff5ef8592e967b49bd81 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/55dec791c6245661a9ea8a4b339f8ee61e3d7918 | ORPH
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/f1d5b6816b6585c2ce32a10131411eb57b169d38 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/80879e56245f8f49eff07f667db171fc54a461ba |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d86271a1bb74cd941d3a542bad0c88bee84fda2e |     
    sh4      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/bbbd0b7145f246c94c8087c8ecdc6ec8a3d9d059 |     
    mips     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/475e4f123d7e2fc5837e7d2ea8010d33ef86b604 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/82bd87d8138512a36fe2dc18f937cef460d743fb |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/53862ed54537cb29d1f953874c31b1a3b27228e7 |     
    sh4      |         haproxy-2.2.9          | NOK | http://autobuild.buildroot.net/results/30cc4c04df21cee5fd68fd280c15e5671e0421e4 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61af4efae2fa18979cc7654ee254536411b1f478 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ffe93d4be10e8925081017ffa5f4bf1f29474d9b |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/edcd2e1a789fdea15cfcc896d0ce685698df6eb1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/097300880b7ef576158d07556eecd3186cae780a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/182da64fcb804cc4599e82ac2b4c53b045226acc |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a4de68c113cda2a602d114e9f30a2b030e15325 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/435843fea4e659295e97ce66e600e96a1134011a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/55d7e9e7e22be057e45bf2bbe63c0b7e72d0a5a8 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/83766b3104b6687609f0262a41ed20c9027cd358 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/503c472246926b21bb8c1bed9a7a40ac11bb7daa |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/da5e23d72079f3da7d5a324af2f19e1490c804c7 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/eb9a64d4ffae8569b5225083f282cf87ffa7c681 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/231a669dba8bd57109de365c0528a1bd1a10fbf9 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/6c3823dcc098268d777ed3739a0b1cc340999b30 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/38df19e4efb5c0698e69d037112b0b49827dc71b | ORPH
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/752adf95f52e32254ab0ddef18e5e77a4d698063 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/b24f04cceff19c3f58539d95d34c70992547c830 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e4402e22e77de00805a42f3ad32096cdd157e1fb |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/7e6b2b6f7603af43cb64b360c952ddf80fbb139f | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/41467ef993518449665586e61831981828658088 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/226cdb83aebe92e69533d21b745c77dfee94abdb |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5172a14c3e6e246ff52d6fbc351915e08508dff9 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5eed0116747648441e38fb6940f0edb279d9ddb8 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/83885c6bcf257506fede63950665a2ab8362b098 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/4b6fe1d5bb7a7628bdea992c203d5a73aebafe95 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/512261c89cd8eb1b85fe03c8fcdd9047cb5ceba8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3d2f904e47f98a1169891051b667b9f25556a5d |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/20ec1f4d671a6bb49addb521ea3738ad3fc4457f |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libnetconf2-1.1.3 | 1 
                   mimic-1.1.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/167b9e5b06370c25a492578a0e2d6a393f7f200c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/43cb14e4f2f23fbac564e272079a09562abad703 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3a9409ee65d941ca10e330254b87aefbf8b10367 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/0218758e74222127be6d42daaa3c8039fd7cc59b |     


Classification of failures by reason for next
---------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  perl-gd-2.73 | 3 
             libopenssl-1.1.1i | 2 
package/ruby/ruby.mk:88: ru... | 2 
                 pixman-0.40.0 | 2 
                      tar-1.34 | 2 
                       unknown | 2 
                  boost-1.75.0 | 1 
                  dhcpcd-9.4.0 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.4.0 | 1 
                 libgeos-3.9.0 | 1 
             libgpg-error-1.41 | 1 
          libmicrohttpd-0.9.72 | 1 
               libtheora-1.1.1 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                    ne10-1.2.1 | 1 
                 openmpi-4.0.0 | 1 
               ruby-legal-info | 1 
             s390-tools-2.16.0 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
              wpewebkit-2.30.4 | 1 
                   xlib_libICE | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/fd1d3b6983ed0d7c5ca9d321058619568d1fd0c5 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6fd4094252fb2d5941844076d6646920991ea331 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e058e165399de58995dd5a1a1627066bcafaed48 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/554d77fc39941de9c9141474e938da30ee5abfec |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0afa7499b100d62330f3240a9a1841daba0b3a3b |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e93256b813974aa69212c3a7065efb723f5d2732 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4d608d6f574f99bf29d1f3e395a41e4453cd0ccb |     
microblazeel |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/e606533c7381575e05bce128e10c0858b9d61ebb | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/d56ecd16f26539d4afcb007f9079ea6ea416fa36 | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/9eba84f64bd356af2429f14dbbf064fdf2d30a2c |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/3eba34650840136d7c92ca96664a08116307dbde |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/40b516031b8e3e3b09b73ed9df551ac9165b2f34 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6c87be004adf03955c832be72c0c59749f311f71 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/363e5d940bbeccd5782b63be63367149811e02a1 | ORPH
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/74e3477a2980b337c7c7a94dab84091f5a8aa415 |     
  aarch64    |           ne10-1.2.1           | NOK | http://autobuild.buildroot.net/results/309ec08fc126a86b300c25521fe1e96c447c1189 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/d2cc327fd09a3917b8d07eb88019e28c3e82c0d9 | ORPH
  mips64el   | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/183354f33bd0e70513af9ac4e6475826f9e7ad9a |     
   xtensa    | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/aaedb21cb9201ff541ff7b7265555018889ee5f3 |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/ba201d510aa08a691692d3d72c457983fd503281 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/b0ad3ca1e34f6fecd823c29259fe69a06729ba5a |     
   s390x     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6089e51782a111d351a76cdaa4dc3f565f608fae |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/06dd36bbdf92aa95b0f971677d5952236708b34e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/568bd0c29836da4adeaf9825bf9b75f5c8d9a4e7 |     
   x86_64    |        ruby-legal-info         | NOK | http://autobuild.buildroot.net/results/286edef106b79fe8250766827591756fae2feb07 |     
   s390x     |       s390-tools-2.16.0        | NOK | http://autobuild.buildroot.net/results/813860b92e5cb2fe3bbff1e518820f98aaa58805 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/da45baf7d7385f2f547536a91b8810b0da50befa | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/5e93f45bc9f99a7f93f923a930243bd1d6b01d19 | ORPH
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/801af861ca82f36079d3b8fcde2bf45a2d7b440e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ba1abc2ac21f7654a4d6eaa33da013ced0315f2a |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/1cf327aa8e189b6aec177a5c5cb4a1ebd0678e3a |     
    arm      |        wpewebkit-2.30.4        | NOK | http://autobuild.buildroot.net/results/2bafb8a6431cbb77f7f2875376ecd91ace915dea |     
    mips     |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/2dc9f3bf7163bbc131438ee6b044d5df6a5ebba7 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0a2ef9b38f633b38c6189bc091b8458e58428df |     



-- 
http://autobuild.buildroot.net
