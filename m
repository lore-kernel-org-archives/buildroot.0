From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Mar 2021 10:29:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-24
Message-ID: <20210325102954.8DEF18486B@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  4  |  0  | 12  |
  2020.11.x  |  7  |  1  |  0  |  8  |
  2021.02.x  | 21  |  5  |  0  | 26  |
    master   | 74  | 27  |  0  | 101 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                  monkey-1.6.9 | 2 
                rocksdb-6.13.3 | 2 
          sane-backends-1.0.32 | 2 
                  zeromq-4.3.4 | 2 
                alsa-lib-1.2.4 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.1 | 1 
                directfb-1.7.7 | 1 
                hiawatha-10.11 | 1 
                ipmiutil-3.1.7 | 1 
              libostree-2020.8 | 1 
libplatform-a7cd0d5780ed80a... | 1 
              micropython-1.14 | 1 
                 openmpi-4.0.0 | 1 
                 pcmanfm-1.3.2 | 1 
           python-pybind-2.6.1 | 1 
            qpid-proton-0.33.0 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         alsa-lib-1.2.4         | NOK | http://autobuild.buildroot.net/results/e8d241954445ecc881aefea5479ae3c2f80390c6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7dd51d8792ec6edd1970de624786a290676aeff6 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/8079db51d542907d9749ba51b8ffff77a3b27e78 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/a0833347d887989567ae20e5fad138a1adecbf6e | ORPH
    arm      |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/f6049f18e20a7ca9a5048f8f4877d7b8250e4685 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/66b5fee7ae86299b5d880a157cf2aa432e0291e1 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/62bc4d060132d8bfdbb68ab611fb036a81097edc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/90f94a44ef6a37d05f3c35b14f3ec16f085f81d9 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e41df3bc384d11b3ac29005258f181016417cbee |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/47c2c3f337d76b543609d90594de3300a7663542 |     
   x86_64    |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/0b265e2c5afeb6b466375e0288c25d63833d09ee |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/994341ed865e3758d5e5b5631a0da754017ee03e |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/ba4b9fb67435861b9cb71941421c97b9df825557 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/09613058afc8fecb9a283b6cffa757b08aa6173b |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/79d10a2e82a3da90af98cc09ae8168b68e221e76 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f7e22147070719d540b43fa2a3be7e48cd01b98d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/09d65ebbe763c8b943f567342356209e8e9190d9 | ORPH
  riscv64    |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/69f4e5fa44208429b143011640971a61d709d5b1 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/66166bc54a06e01ea10641bd1d1c9aec4b4f0195 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/93f4271c61b7e6e111fc606a34cc9f9466696a42 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3fdb1a72b1c1ac80a4a8c26a94fda7935f6f930c |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b5a9fe7c12f4ac3d1e5b0d243a4320f10f9bdc34 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/79833c395065b640dd4cb5712c85c5cdca7722dc |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/62273c2b9cc712e9f8f67dd42122bf4aefdbc136 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f4ed4bbab6e11e8515925e07dbde14f80cf259cd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4f83bc49673a2d7f9d37d9ac88d49496741ba4ce |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6ee9e98eece3931e2a7e5fd72942b73f048c7cd7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
                    lshw-02.18 | 1 
                  reaver-1.6.5 | 1 
sconeserver-6b932d7d8dbb700... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/4950b6e2c56fa99023aa55388eb07e50545aa883 |     
    m68k     |           lshw-02.18           | NOK | http://autobuild.buildroot.net/results/73731db731ae6d0401a13aacc3f7755990df0cc9 | ORPH
    m68k     |          reaver-1.6.5          | NOK | http://autobuild.buildroot.net/results/2335a2094d7a86b542528af38222697096363433 |     
microblazeel | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/6f2740ae03e878de40e0f79b9ea87769aa943a31 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/c567e8830e4879b4562ff32046b2af61e88a78fe |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/048d99251a3b273b585d22efe5dfd3cf8abf142b | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a734c7814949d39c75737214bab599ebba33d0b7 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/989cc60b6e0cb90be840eba2e67fc63ca3230267 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/291a6035e4e2442f6a34a7528b91f624cd8bec6f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d80bef602cc0021a552987fdd94680e673bcab3e |     



-- 
http://autobuild.buildroot.net
