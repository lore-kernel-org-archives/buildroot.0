From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 08:23:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-30
Message-ID: <20201231082330.1006886CF6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  |  3  |  0  | 26  |
  2020.11.x  | 15  |  2  |  0  | 17  |
    master   | 100 | 59  |  1  | 160 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.25 | 11
                 uclibc-1.0.37 | 9 
        host-sentry-cli-1.57.0 | 8 
            quickjs-2020-11-08 | 5 
                  boost-1.74.0 | 3 
 Makefile:753: target-finalize | 3 
             p11-kit-0.23.16.1 | 3 
                       unknown | 3 
              asterisk-16.14.1 | 1 
               belle-sip-4.3.1 | 1 
                 dc3dd-7.2.641 | 1 
              fetchmail-6.4.14 | 1 
            host-libusb-1.0.24 | 1 
                    htop-3.0.3 | 1 
            lttng-tools-2.12.1 | 1 
                  ndisc6-1.0.4 | 1 
                    php-7.4.13 | 1 
                    qemu-5.2.0 | 1 
             timescaledb-1.7.4 | 1 
                       vmtouch | 1 
               wireshark-3.4.2 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/73d38411577a92ccf2d02633448741cf2baa7b33 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/83fd955dd2ce12ea747595798a5d8bfb58459efe |     
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/49faa32e08fc60df1dace6ae28694205a9a95737 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/05538cba4282fff08430797afee5abeaf24db744 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/4499e7a69a6458ac7bfb40bf4125dbfb687dd7d8 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/18e883f626c9a06d845048fcedec2cc5b77f5fee | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/0badac5b50322ba9d4af6abfc355cc49fb0fef83 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/86c918662395a017cd31d021dc1631c58f761d7c | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/848e0c58d2824397c7702274ff3cb9706a208a8b | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/fd06f9636d406ee8a6a126f2fbc80e6e4a1a2623 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/11301ff353ed225eccfab78edc2e49f307ec8f16 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/9bff33dff855aa66979dd71807e22efffa419940 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/154c7cbe0235c97dc1669f3f770a8102d2ded9b8 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e7091e057b0965952d38895aee9204d66ba0c5e0 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/d0207da334fc6a351393627fa1db6a01d7e76381 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6715f71ccff2dc518f57baa2f4089a126b6c1b7a |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9f99feb0c06d3269a4ca9ac07586f970aad59399 | ORPH
  mips64el   |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/ff83cbf2d58b3b6f10ec9b421383a6647f3a844a |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/89301cf859f71aadef6892c7f8068b3a529ad997 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8c28b414ed7848f9ee03fe0fd774eb2d2c9cd9c |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/eda316119af2aa7ffdb76b83b8a138ed42bec2fc |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/088c0cd35ed801e719ebe6545b48b24bbaa3a71b |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ec97d3c73cff2c38cd1ff4075920359dc5839f24 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/65d20d2ae1e0310bba71390e6152a1dfd108990f |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/601dbca89bf319a671ee16d0ead65524e64883f0 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ca39577a2df42b26dfb4594bab119b576d886c6e |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bad0913a7c6048971dd44851d014378e25e660c5 |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/0f91663d7582dabc8f7f6e4a7f2af080cbb44374 | ORPH
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/9faaf2721abdade7f45d840ca293f91561a043a7 |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/6a469f68bcbfd4efbb5045f243f1dd95872ea8cb |     
    arm      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/0276f7c4c3c3e5797b0c3f2069e90d8d664966be |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/a41a51335e961398c9b33e52d1927f41b1478ce0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8fcb5a8f38fdba02d223a54e5e017f3d174687ca | ORPH
  powerpc    |       p11-kit-0.23.16.1        | NOK | http://autobuild.buildroot.net/results/152b9803a54fabeb01e56b00de0669d4632b0664 | ORPH
  mips64el   |       p11-kit-0.23.16.1        | NOK | http://autobuild.buildroot.net/results/528e72cfe70cc89a93a154e9b2ce484c5d11716f | ORPH
  riscv64    |       p11-kit-0.23.16.1        | NOK | http://autobuild.buildroot.net/results/e7f68205e1b776f9af34e6017f6eb17f46aa2f19 | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/c058adf0d268028101cb8ac9c8b73b37a0dbe417 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/bfca201ac10913a0bcde0528f154a464757da74d | ORPH
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6397e55ca401b3b46c2d2963b44b21f1347692f6 |     
   s390x     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/3369c96fb1413d9cf4685cf6ad2eb85fdc98c30d |     
 powerpc64   |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/1a34925a81c6719172a7f1e124ef19a45b035acf |     
  aarch64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/c4046403e409d5b0b756a0b6450ecca358cc4545 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/27b8423b74fddf7aad8d101f76411d44a77b5248 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/edcd752e73de406a050423bf60f0315fd41afa0b |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/fd27dab62e360b3a4f0f40f39a6b699239676578 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/4e8aa0612b8222a9b6b35fabd1ea40d6821e84ac |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/90f447b1759badc6bedbd6ae6255953881e59e69 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d9baeccfd959616da8c951266133f2f526c093e0 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ec902918a48ea4e4ad1a931d726b7e5a6680c311 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ba89497205e3e5ff6392231fbf5f6691329ec835 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a80483604c27f92741b9f07cfcebabf1b8922a37 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1b7d07e5abacf47e06fe371a3f6f2713797ab398 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/023d28077b66da8837392066a0e861458f77e0cb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b616bfaa1a5154e07b08b17eaf4c913f0059f677 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ea7cdef875748def564b7a8bae17a5236bc45237 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/44d655fbb57e61e7bc344e0498a54aeb24d4f906 |     
  aarch64    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/acb7fcb0c85a368447cb27f083434f336571511c |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/0bcf7938aa4c745fa94b51604d088186c93033d4 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/aab09cd18883100725510a1c9b729d2e4b069be2 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c1ad83b70f645a319d8a21b19b7e8c61b153207c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libopenssl-1.1.1i | 1 
                   sdl2-2.0.10 | 1 
                 uclibc-1.0.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/297984706ae46baae8ca537aa521db29812ec8ae |     
    sh4      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/d7faee4d06dbac4cf4344f0538950af841f43084 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/51b1d378b72b3a62d8b308a269afad0163793244 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd6f7e4d811b9e71a9158a855e0a6d3a1b8cc201 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e454c846aa64e3cd61bc3dfbe04cd631c5b1fcd |     



-- 
http://autobuild.buildroot.net
