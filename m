From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 06:26:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-15
Message-ID: <20200516062654.AB72987E37@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 13  | 73  |  0  | 86  |
    master   | 180 | 665 |  2  | 847 |
     next    |  8  | 66  |  0  | 74  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-ncurses-6.1 | 140
            host-python3-3.8.2 | 66
       host-gettext-gnu-0.20.1 | 64
        host-gcc-initial-8.4.0 | 44
                 host-tar-1.29 | 22
host-gcc-initial-arc-2019.0... | 18
                       unknown | 18
                  boost-1.72.0 | 12
                  assimp-5.0.1 | 11
                 agentpp-4.1.2 | 10
              host-bison-3.4.2 | 10
            host-python-2.7.18 | 10
                alsa-lib-1.2.2 | 9 
                host-m4-1.4.18 | 9 
             host-ninja-1.10.0 | 9 
             libopenssl-1.1.1g | 9 
            host-binutils-2.32 | 7 
               host-flex-2.6.4 | 7 
                    atk-2.33.3 | 6 
        host-gcc-initial-9.3.0 | 6 
           host-libxml2-2.9.10 | 5 
                     pcre-8.44 | 5 
                sqlite-3310100 | 5 
            host-autoconf-2.69 | 4 
host-binutils-arc-2019.09-r... | 4 
              host-grpc-1.25.0 | 4 
      host-libtextstyle-0.20.1 | 4 
            host-libtool-2.4.6 | 4 
               host-mpfr-4.0.2 | 4 
               host-swig-4.0.1 | 4 
                 openal-1.19.1 | 4 
               apcupsd-3.14.14 | 3 
                    flex-2.6.4 | 3 
          host-capnproto-0.7.0 | 3 
              host-expat-2.2.9 | 3 
          host-fakeroot-1.20.2 | 3 
                host-gmp-6.1.2 | 3 
        host-libopenssl-1.1.1g | 3 
           host-libzlib-1.2.11 | 3 
               libgcrypt-1.8.5 | 3 
                   libnl-3.5.0 | 3 
                    mpv-0.29.1 | 3 
                  zeromq-4.3.2 | 3 
                   audit-2.8.5 | 2 
              bitcoin-0.19.0.1 | 2 
                coreutils-8.32 | 2 
      dovecot-pigeonhole-0.5.9 | 2 
              exfatprogs-1.0.2 | 2 
                host-pcre-8.44 | 2 
            host-pkgconf-1.6.1 | 2 
              ibm-sw-tpm2-1563 | 2 
               libcap-ng-0.7.9 | 2 
                 libiconv-1.15 | 2 
                 libpcap-1.9.1 | 2 
                  libsepol-3.0 | 2 
                       libuecc | 2 
               libvorbis-1.3.6 | 2 
               linux-pam-1.3.1 | 2 
                 mesa3d-20.0.6 | 2 
                  ndisc6-1.0.4 | 2 
                qt5base-5.14.2 | 2 
                      tio-1.32 | 2 
     toolchain-external-custom | 2 
                    acl-2.2.53 | 1 
               acpica-20191018 | 1 
                acpitool-0.5.1 | 1 
atest-895b0183a89c15f5e2305... | 1 
                      atf-0.21 | 1 
               audiofile-0.3.6 | 1 
                  avro-c-1.9.2 | 1 
               bctoolbox-4.3.1 | 1 
                  bcusdk-0.0.5 | 1 
             berkeleydb-5.3.28 | 1 
                  bind-9.11.13 | 1 
                 binutils-2.32 | 1 
                    brltty-6.1 | 1 
                  brotli-1.0.7 | 1 
              buildroot-config | 1 
                busybox-1.31.1 | 1 
                   cegui-0-8-7 | 1 
                  check-0.14.0 | 1 
                  cmocka-1.1.5 | 1 
               collectd-5.11.0 | 1 
                  dbus-1.12.16 | 1 
                   expat-2.2.9 | 1 
                      fio-3.19 | 1 
                     flite-2.1 | 1 
            gettext-gnu-0.20.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
                   gssdp-1.2.2 | 1 
               host-4th-3.62.5 | 1 
             host-aespipe-2.4f | 1 
             host-dbus-1.12.16 | 1 
              host-erlang-22.2 | 1 
             host-gnupg-1.4.23 | 1 
      host-libunistring-0.9.10 | 1 
                host-mpc-1.1.0 | 1 
             host-nasm-2.14.02 | 1 
           host-nodejs-12.16.1 | 1 
                host-popt-1.16 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                libcurl-7.69.1 | 1 
               libevent-2.1.11 | 1 
              libostree-2020.3 | 1 
                 libpng-1.6.37 | 1 
           libunistring-0.9.10 | 1 
                 libusb-1.0.23 | 1 
                libxml2-2.9.10 | 1 
                minidlna-1.2.1 | 1 
                  monkey-1.6.9 | 1 
               mpdecimal-2.4.2 | 1 
                   ncurses-6.1 | 1 
                     nmap-7.80 | 1 
         qt5declarative-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                    rtty-7.1.3 | 1 
                snmppp-3.3.11a | 1 
                    squid-4.11 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           acl-2.2.53           | NOK | http://autobuild.buildroot.net/results/d8075ef35c54b2103fa796dc82f31b4a498eba00 |     
  sparc64    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/a28b607c2ea9a8b9b2198648abf9b33984d87090 |     
  riscv64    |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/acf5405c19218b244652dcc95577b40a2160e10e |     
   mipsel    |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/49cf75f08bc7f1d6f8a941f4c20f8935f76e4850 |     
    or1k     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/fa6ac108e8732017afb80694c4e50769382be671 |     
   nios2     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/b92d94b91e5ea59ea3f1ee643e52fada15909efe |     
   sparc     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/b18813d7e60e8b29fba4f56f00e15de82867811f |     
   xtensa    |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/99c0cb57b69daceb364b658c7ac98af02f206d18 |     
   x86_64    |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/8cd18731151338f9ea4d8137f3223fb9eade4aec |     
    mips     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/39ed56275196a958f763a117e0339ff924178615 |     
    mips     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/7d2fa859ea5e7eed92471d5129d38fa0d9f759ce |     
    i586     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/668891265cff72f504a03c85b5c581ee518e052f |     
    arc      |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/2ccab4b2a1452b3f957b44960ed61610e75f2778 |     
    i686     |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/d89eacf04d1dba9a4c78e73b3c49a8f6b9c4e27d |     
powerpc64le  |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/b4edfedfcbf09221804bf68eb308c3146d3bfd45 |     
  riscv64    |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/61685f2145577ec1cb812b71907de4ceac3a6bb0 |     
   x86_64    |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/a7b56e32e8fbe7adbaf0b66ff8402d870e88bda3 |     
    sh4      |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/99ca9136125bd4ccda4d65021fffd5b76da55382 |     
    arm      |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/33889e6a29760a0b91b912ec7969f1a2bd5ec18e |     
    arm      |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/5ac7e4c8392e5bf2459e42b744a9d8f26ed8167b |     
powerpc64le  |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/eb66be156fb3b46b0150f6ff20ab2d831d1405ca |     
    arm      |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/483c4634b6d3236b5a91ef73ec720718a779c751 |     
    arm      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/83acbe56fd2c2ab092608af528d67334660c3722 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d2e650f3a4e51358cb962d108a13211a4f14030f |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b1fd67e44e0d51fac88f857797c22452bff72905 |     
  powerpc    |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7aee5f9a4d7fd3b9234296a6de88a36365583795 |     
    sh4      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/3ba9feae4028311dbba70bed45aef800c7980b7b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5dcb5e6ff5f22860ab95202680b730a1b7b270d7 |     
    i686     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b290414e6a8381534de635ffc25406fa3c30202d |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ea46a5251f88d9a9d8d5479c2b12f364c2d57f73 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/90019c917bb39ccb8feddd2e0d9d47e714dd7444 |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ff2d804554981e13f75d6aab4f86a63fd0b44fbd |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/18347ee74f91266838717cf6c8a185831ef658de |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/53af400f2d43b36be1f22a45abb89f91e6b292dc |     
    arm      |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/41590a595b54b7651a7b53d8784cae57439c0328 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9fb36718aa15b2f7b777cd46f3fa8d995cbb6923 |     
  mips64el   | atest-895b0183a89c15f5e2305... | NOK | http://autobuild.buildroot.net/results/30195051704340567ccf1c1d0670d297aec1a8b5 |     
    or1k     |            atf-0.21            | NOK | http://autobuild.buildroot.net/results/6b877a8b014c097f3ed3eedb1ac0639eead205d2 | ORPH
   nios2     |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/de9c3e7be3795c16cb02b59d3d566a289982b27f | ORPH
  sparc64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/fe4faf3e3cd8c5fa5cb3550c88d8d5a8f60b24f7 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/d4dedf4448ba2c79ef6bb8f7841d76b5bcd0e9bc | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/34b6e83640e9b94cf84021fc079a5318a739ab59 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/fb4bbe9ee2921a2f8d52de123a612d2c7f9f273f | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/0dca698e48c4244e36f6f4fe9de28b5f899c0b69 | ORPH
    sh4      |        audiofile-0.3.6         | NOK | http://autobuild.buildroot.net/results/a848c39c10e31c2a5f1ccf23c7d4192f300c97ad | ORPH
    arm      |          audit-2.8.5           | NOK | http://autobuild.buildroot.net/results/e3c480daf581ebba7f71cb102b9ad6ab9648dc86 |     
    arm      |          audit-2.8.5           | NOK | http://autobuild.buildroot.net/results/325d0f8f38655d076c7614baf824e44bb5bf1a78 |     
   nios2     |          avro-c-1.9.2          | NOK | http://autobuild.buildroot.net/results/cde548fd705d6c9e16989b55e42e9ceff927cc78 |     
    arm      |        bctoolbox-4.3.1         | NOK | http://autobuild.buildroot.net/results/7b542fa2a9b022f5037e75fdd95cdb74e9f2026f | ORPH
   mipsel    |          bcusdk-0.0.5          | NOK | http://autobuild.buildroot.net/results/32db2174082281e42e2f2bf53b25886d31f8bafd |     
   mipsel    |       berkeleydb-5.3.28        | NOK | http://autobuild.buildroot.net/results/6d36220bd78c971c2bbfad65f0ffbf9c0fbaa32d | ORPH
   nios2     |          bind-9.11.13          | NOK | http://autobuild.buildroot.net/results/9c577420be415157cde19c7014502d4d5c5eb8fa | ORPH
   x86_64    |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/8ab377f50fc43ff81bf4219e5ba4dbe5fd4931d3 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/59ec3960b4b58252702ecc7af87a84dbab1abd64 |     
  powerpc    |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e1c2bc964a283298bbb4f07d8ac78906a86b29f4 |     
    sh4      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/4d52f9f415c3baa860e36add677673504c437a49 |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/f126d3a274d6e85fafd9cd494c6f774a2dac9340 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/55e8b1f81ec97dd76be623281de585a9bee23f1f |     
  mips64el   |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/31e35ab9b0294525799192034090ddf302e5a477 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/ecf5448099b745c10cc6d61b618350ac742125a5 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/fddd1844ca2ecf5b0d57f62189507ff7716bf230 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/ef8c92e32cacfc1b42ce804cf4e2c8d95a0c4034 |     
  aarch64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/b9779cc10192747a7924b323e67cc2dc8bc932ef |     
   x86_64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/dd61cb4f0e8563de9759e2d55c5fa488f875c4b5 |     
  sparc64    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/092317fde6c3604a7a3ed447a6bcc55cec1ee5b8 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/92d6a37c25e0c2bd0283f1a6672b0f8fc6de8edd |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/758cac5c765c8535a7e84de1b67200e9d5e448a6 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/3d0be73732ef59cabe967f0c8415fef1f2b8193e |     
    arm      |          brotli-1.0.7          | NOK | http://autobuild.buildroot.net/results/87843e9e55fe4d27704030eef7e78c919c8beda9 |     
  sparc64    |        buildroot-config        | NOK | http://autobuild.buildroot.net/results/45a2c69b382f942bda500be124e9c599b45fad91 |     
    arc      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/470bbe89e82c0beaa10c2b8adbb6d5233d29f938 |     
  riscv64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/f16e28379a2609c55d6771e96424e4b6e956fdc7 |     
    i686     |          check-0.14.0          | NOK | http://autobuild.buildroot.net/results/d526dcdb2c3b465001bc9d7957912e0b708dee9e | ORPH
  aarch64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/2b097eec58491e737cd416100052b6686f7b426f |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/35c1373de5adae4132edac3b4088dcd61e6a6657 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/2777016ffa6b95c3141bcb95c7e1beaf34d59a7a | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/25fd7c2c9ce09e7961bf3cd2edff0f40f92d2c56 | ORPH
  aarch64    |          dbus-1.12.16          | NOK | http://autobuild.buildroot.net/results/72982dc3b9b197f6ca8f6d2c75b0742d15b24078 | ORPH
  aarch64    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/09c39a14c9d33907e45a73376b4e7d76954dfef2 |     
    arm      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/c29c0fbe2d8c13e2b78e696872b918dceab55765 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/833d1b27538a7a447b2c0e8b3e43b59d26c67302 |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/146932dc166ea8c73dd61a658a14206408e5d3d2 |     
  powerpc    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/493876c2e7c8715baa9182c26a9360a9b5539408 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/f8879888d57aaa63c05a361f21ab5da70077d6a8 |     
    arc      |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/acd42b5f927c6cae6546831498ba0a051842bd12 | ORPH
    arm      |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/c5bf3d561f35938354626b11872796fded900c7b | ORPH
    or1k     |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/cb5b94b1f5bed8b5c0e440732cce5e62b2ce46f4 | ORPH
    m68k     |           flite-2.1            | NOK | http://autobuild.buildroot.net/results/0d0e9eb51f04e3a8b8e1502e6c5bea7f52f80186 |     
    arm      |       gettext-gnu-0.20.1       | NOK | http://autobuild.buildroot.net/results/9e966a00790a8a10a009b5712b1d09c9098f11d1 | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/55825dc26ca62a427d73871f1da670421ad16ac1 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6f399f4b8e73fe9fec6bd3c7229ec74cfc626f02 |     
  aarch64    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/90313de94f06aa38764d976b5e552ad3115c0970 |     
  riscv64    |        host-4th-3.62.5         | NOK | http://autobuild.buildroot.net/results/a37b21bea2af9671bf5508b78878841bffc26511 |     
powerpc64le  |       host-aespipe-2.4f        | NOK | http://autobuild.buildroot.net/results/733a67d029eb3343bf3a1c3b338f52023652bb39 | ORPH
    arm      |       host-autoconf-2.69       | NOK | http://autobuild.buildroot.net/results/924885324e1f0a352c0a8a37f9e03bcc31eaff73 | ORPH
  powerpc    |       host-autoconf-2.69       | NOK | http://autobuild.buildroot.net/results/2e3b90e0690244b29c387d2ef46c6b7642820873 | ORPH
   x86_64    |       host-autoconf-2.69       | NOK | http://autobuild.buildroot.net/results/9907345a12a2078632bd96a3085938ab7dc8986a | ORPH
    arc      |       host-autoconf-2.69       | NOK | http://autobuild.buildroot.net/results/ec34ca241ee12274f600f9cc41a12f5783b1e68f | ORPH
    arm      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/65ddb1f42980104c05fe85f1c9f18d7a2509936b |     
   xtensa    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/941f1ce2af84463589474a6e25d4888f434b069f |     
    arm      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/9e573b976adbd4ae8b9b211696889edf23a72be6 |     
   xtensa    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/82923988ef0ed8ed9798bc5702c8c5fe847a21c6 |     
    arm      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/11911dff70db65f5fba0adfc8c4ccfe3e24ad852 |     
  riscv64    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/49ed1a7095c88888ef091485a0ca11b0069610ed |     
  powerpc    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/7ac8201fe4b42d32d53a1fb2cf923ce90c8b58a7 |     
    arc      | host-binutils-arc-2019.09-r... | NOK | http://autobuild.buildroot.net/results/7eee1273cb723e7afe312accb2147e0035f4e130 |     
    arc      | host-binutils-arc-2019.09-r... | NOK | http://autobuild.buildroot.net/results/7f6cb7fbf12bc56d8bc586e1a712da77e9d69ce1 |     
    arc      | host-binutils-arc-2019.09-r... | NOK | http://autobuild.buildroot.net/results/ef3f290ce2059f2b519250b2512da57811cb62e9 |     
    arc      | host-binutils-arc-2019.09-r... | NOK | http://autobuild.buildroot.net/results/d011f1b8530e7041149cd09ddb2a43e5911221c3 |     
    arm      |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/192877e39c7f2feb511e63b837ba4c6042f7c1e5 | ORPH
  aarch64    |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/c3c58f7522d596136b28424306b0b8234fa02136 | ORPH
  aarch64    |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/3556c2a51b6bacb1138230c27252ab7423df23bf | ORPH
   x86_64    |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/c32d7e064d54cbf93387e6ac847fbdcc78db27da | ORPH
    arc      |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/9818a447cb301f32e9069e63810b5811c7d32fa9 | ORPH
    arm      |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/d1471ca88121af4ad7c95dad79944aca169a4f39 | ORPH
 powerpc64   |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/b5a57620a2e4f419e61b7854f4e7b25998c3f38b | ORPH
    arm      |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/0b038e698e690b8bf94d9141f4ca24de3c2bffc3 | ORPH
    arc      |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/a56a217950cb4411085f5894969f28377be1ed92 | ORPH
  aarch64    |        host-bison-3.4.2        | NOK | http://autobuild.buildroot.net/results/c49eceddf92b50a227838973f5480d3e84c7cae0 | ORPH
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/02797ead66c8b30ecc58b5a7c7b054dfea44d1f5 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0c8ced63d310b5c1d70d117cee275f90124f1bd8 |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/cbebf9eae296a44a50fec6b33fcd87c43e08d2b8 |     
   nios2     |       host-dbus-1.12.16        | NOK | http://autobuild.buildroot.net/results/ab23936434548360595b15b34c576d69e21f0bb4 | ORPH
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4bdcf187cd5259756d3642bbc10613a129fae3f7 |     
    m68k     |        host-expat-2.2.9        | NOK | http://autobuild.buildroot.net/results/05a6ac8dc221e75e16d2d1fcbcd2802897117298 |     
    arm      |        host-expat-2.2.9        | NOK | http://autobuild.buildroot.net/results/27577b34843bb5d7eeb2f4fc48d63331015e8acf |     
   x86_64    |        host-expat-2.2.9        | NOK | http://autobuild.buildroot.net/results/c973ed7741988113ba5815e3e329e690692b3e87 |     
  powerpc    |      host-fakeroot-1.20.2      | NOK | http://autobuild.buildroot.net/results/50567a6e5cd31d4c2a53a70a2f642b899da66d96 | ORPH
    arm      |      host-fakeroot-1.20.2      | NOK | http://autobuild.buildroot.net/results/044a9c204e14dbcb0335781fdd96cedd95c5224c | ORPH
    arc      |      host-fakeroot-1.20.2      | NOK | http://autobuild.buildroot.net/results/787d8a46f988da96764ceaa49cc63822d3649a7f | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/bc50d71bd038e57b643b1023d7cbb34a765e4629 | ORPH
    i586     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/9d193f2859993eba61d6506398d4f4928d6a4f60 | ORPH
    arc      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/87b4791fc9a9ab846bdee0223d7c5a47820ca014 | ORPH
   nios2     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/1a1ae0363b4aefa2c4bd9a5ca3ead096ad9cdd8f | ORPH
  mips64el   |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/b79c0296f490e643b842edb12e51626d026a8397 | ORPH
  powerpc    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/57af44b92ba87f28fc752b5de4c2e6bb798865e7 | ORPH
    m68k     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/566227acc89556b9b26172e945e0a0524adc79f8 | ORPH
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/494c68fb569445549c2068dd1e9eea5126c3da5e |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/44d68ffc04d61d096173d08ea9009374e265d309 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/f4ed577ac73b3890c847ff36166a55a9c963b729 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/de40eb789c7c8e94097d1c131c9df2995ac5f7de |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/2a52b0d2f449416f7ccff78939def13bc07c337a |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/d6f9ea73073b79dd6236a1bf65c46f8a87bad8b3 |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/33a7e9b8fe4720886ab612c807734177e70d5feb |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/4a6fcdbb170518d38e39f6909dd44143f2111978 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/b09f94754ce755b357fb98f12f81ed71ff045215 |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/d7d9d101da514cd588e8f3ee35b5acb12ff71960 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/81107a881462b3ec8567ba3503e7b7bb8bbccf13 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/8b14495eb957d75093606fca0ec27fab07e127ae |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/68aeb57e919a155e6863ba05808849aeee13966b |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/c9121660e21d4aef870a2542f6096f20e0e87d57 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/19d299eaafcd35b8eeacc67bbbdc0911e1d03b26 |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/19b0b7be2fe1e0cbd589cfd01336f1e303232278 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/a93eae05fe2e5bc8e0ae21f3372b53d712aec908 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/7878132c7767771da55dcd63743fccbb551bf914 |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/53a8e6503a8f4ba117948302bbe869c6a9b3fa5a |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/e59129af5b08c89424b3ce1b0dbed0878fefa7a6 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/007e16067f8191cfc06904a981830a2e818d0636 |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/e7f470b9e81a3a1663e8a44b6f4dd4e362ab8fa0 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/f0161f3af65c91ad56a3a10c3acc4e3f22fd2092 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/b9bc428ce6662138f29f55b0719b566d8f59b084 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/ac78d8e65ca43da7b879038e323fc4d058a80abd |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/f1f49bae72019461ae9f98776aca2f4010155028 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/b3c59bcdfebfeba36df18a4b276df53a4af2f48f |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/63ccc2344639eb8e5558fbc71ae6c78afac49ba1 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/03b14a8d933819eb5b743d07005e6ea69a30e7de |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/2d14a795f2aeab7ebf3cebb23491f65e53a17a25 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/8d0ef485ac9bd61b489858bbb78d08c4e016aaa3 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/6a71e25e365516dae843b6470f120874bdd065b0 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/7a3f752030972f9c27a0b2ab70cc0e23138882ce |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/abc9b608339016d707707b199f0e187ea0692902 |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/a44dbcb6e01951b04e3d88bbadb238fdcac56225 |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/718c43d43a66aacc78086e782d1d6b9630db255e |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/36f3b978b8e9951a1a25e492cb3d8ecd0a458d47 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/2a5ba732374b35ed08b1c62c87cebc4b848b77d0 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/3b54705b279cc0a328e18ffee4712d8e9315abdf |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/55a9a0b8df2d45dc2458404eb2b278dad3f23834 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/52654c7196fcc2a1307f80e94bbe309d214b689f |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/0ef7896de2181609634b65cfc966359add696bcf |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/5b7bb69c332446604faeb6eb718c8ac2b8afb02f |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/61d06f0cc9debe0de41121abc17a8fca176c58ff |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/7a3b37fe0d81377d330d42a3c7633899a544c190 |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/9bd197dec93d1171f1a17a4abfc5035bc0148e0e |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/72d84914a5b74a39653c44a5a48524575af55e83 |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/785d837e4487565071e65978303ae58da5be1679 |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/c596de1344b9dd0649031cf691a7736ff7015cc7 |     
    arm      |     host-gcc-initial-9.3.0     | NOK | http://autobuild.buildroot.net/results/cb91086fdd068af6397027e35acc60aa6d8f17e4 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/3639a5d1b4b06470c2cc75bc96f2645bce2acffe |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/77d24b0d4ef069a71dbc19788053b0a0d7473064 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/0f37053834a53db965e049b63dd9a86547fa9c12 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/f52354ecdbc4f095a37ed89fdc1e51e100ffba8f |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/c0135898ffc12c85c6a3b3e4c2ed59681c7de244 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/a838b30848c8173204cf8a6dd0a629b732ca93e2 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/22a1f606a18eab2dba9ffd95f0551fc2bbd60cd0 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/25bfbffb3185ef1971dd3d1b835baf02825e53a5 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/b79f2c2cf6452330f0e3b2bb740e830173e1ad91 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/6249cc8099f474a8d5681931e6dacdc7e9b687ba |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/1fbef643952e90266389f314dc384e50ed96bd0a |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/54a0269b3ad470b223434cc246ac527e2e053a3c |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/a345b69a1122f06b0282027a0a401e0d93e631e8 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/b2b072eba65d7bee6cc3aebc512babc8072d7ee4 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/30b69aa4f1617078948fec2083895a3cb4fce3a3 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/936a3f960ea4a948d640b6d77c0a10f73e2bc65a |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/6972a691ce03c0402dab0f823b16a77c839b9063 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/430ebaa24889f8207704e4d12eb6c36968aa63c9 |     
  nds32le    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/f4436191b11f76bce6dd6b0fb4bb6eacdeeadb76 | ORPH
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/8122d84bbf2d039a28c68ea9f99659617e28b1a9 | ORPH
  mips64el   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c10675b84fbed1d4cbf00a088dee03eb27fcd015 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/b961117f7f5d221c0e1428d6784be379122c3cdf | ORPH
  sparc64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/dc2c435aa02aff355273eec2e2ec782ce7024244 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/15ecbee170ddbebf860ad8de7390e1a515a64666 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/68d24f2c3b56825e029bbfb061b846e70a49f2f5 | ORPH
powerpc64le  |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/23caea89968fe6a50c43f8dd475804670949fddf | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/9846dc12aa157ba2b02decefb02c75eb5ee1307c | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/28364980cd46dd15d43c6996e9006a23b988cfb2 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/610c992ac45c48ae700ba862df380c2d76f72683 | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/0740d7f9037bc0c041ec93e04fa1d0a0827d5986 | ORPH
  mips64el   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/76d70022f9ed92db72820e0739468cb7f2ca282f | ORPH
 powerpc64   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/6a6cd5c6e92113f3e60ec3c2ea6380f69b148e67 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/7f92ecd736e5e784726d46e435a2e2f727a68273 | ORPH
    or1k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/074cec202597efcd36740bef6a887d16ee8316f3 | ORPH
    mips     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/63b8955f3c7023749e4905b0101a13d6bc83e253 | ORPH
  riscv32    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c10e580d594a85ab0d00f102fe7a0545b5e64b8b | ORPH
   sparc     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/e9bf9faecaaf75c56af919525a03faeef496095e | ORPH
  powerpc    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/daa552b9cc5e230cdd9839bc26781a83184a5298 | ORPH
   sparc     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/e10d7a7280b875bf047192f522af8afe82bbcc6d | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/a6ddae1e892748611cb8a0b64c687e995bb319f5 | ORPH
   xtensa    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/6104cd72d7893a1ff7bec6e1f7478c6d56d89279 | ORPH
    i686     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/037d716b812ed35dff682c5d4b04cd00abd2b9c2 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c979a53ceeb46b1ee1cdc16ee9f257ded8436a4b | ORPH
   xtensa    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/60ee882463fdf029553769b68ecf8accf2bbe283 | ORPH
    m68k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/96838e96b57ab888f172b895a6676208b8deac1e | ORPH
  mips64el   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/44cf14e5327ad8e5662d409add6f929b5f22c138 | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/e2e5fdea2dc6a8e419820166a60e3a069caaf645 | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/5abc49f0fa26370bde99916d6eb06d556f348d3d | ORPH
    or1k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/1458891c0a2a8e0565342c5ace7ae58aebcb1ca8 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/2ae4fad9e543b76583540a7d64545b50efe6db28 | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/ef959bca657690431b7fac7517cd3db378a74cc8 | ORPH
  aarch64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/a5fb209f888f40227a8179c8ca193530790337fa | ORPH
    m68k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/62bf0af38619d906a550191a4dde53999a2f20af | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/cc1bc4d2cd5138ff24c42b243f7d9341e192cfa5 | ORPH
microblazeel |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/5f43fc6b057da6731014d84541f94846f1c3ffde | ORPH
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/969b2cd1162a6a7629826a8d21da4661050b4deb | ORPH
powerpc64le  |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/2c0e9332c8d39a3992c65b10ec972a45c5c7e2c0 | ORPH
  aarch64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/55c1a54bd37c9f2c05602a2dcf77ac5c60a37a8b | ORPH
    m68k     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/74b8da1e8b11527ed0a8afb2102b2a245c5b1a52 | ORPH
   sparc     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/2c5d71f2ad6efb3802d6888e3c40fe6fb460a50c | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c244387101577d1eedac3a7227a95f9ef02bf541 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/6eb7a617cb193f98216fd3d93d3a7e55012a7177 | ORPH
    mips     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/94c9466489372051584812ffc8ea91d9e02392aa | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/12e8b4fef321377a0c7aa02b5b9615963e3b8b07 | ORPH
  riscv32    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/954db1ebf4e82b0eae30d58784574fe6a11d8ca1 | ORPH
  riscv64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/0907c8616a08176113cfd489a63ea60d3c458b45 | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/b63aaf82372915a099657f1e3228a1e03c23167d | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/7d2b3adad59fbe583309450be3af5ce80ce46f19 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/4a1e72de1c4e0665b809bd4130bc4dfb6e240d2a | ORPH
   sparc     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/ccfc726b1146c78c9046ac5d6ca5c232e96f3002 | ORPH
  sparc64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/930336e1a72c45733d2f6e75c0d9b8da6d03d8aa | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/2f9f8beb3e65083c64fd520b65a66f8905eb5bda | ORPH
   mipsel    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c0904ab10a856873fd1fde7550bfd3c47c679a44 | ORPH
 powerpc64   |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/8423cfc95d87e23f381d5873ecc6d334ccde0083 | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/93163d7860df8f9f85eded4d009d2cb8cc58a5e0 | ORPH
   x86_64    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c7c92d3579323fb3cd35edc76fe7e4722cfd3735 | ORPH
  riscv32    |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/96e95845c8b01b9d6c57bc9ec3b0df74dde71444 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/3f9cbb5c4c881f9e9ec96f04609558682202a2b7 | ORPH
    sh4      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/8abd3ed4810dda58bcd3de5680fc432f4d857896 | ORPH
powerpc64le  |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/127415788c4b726f14670aacfc4da93787e12c29 | ORPH
powerpc64le  |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/3c8fc7ccb510178e29f04f9ba81c5efb3f11fbf0 | ORPH
    arm      |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/8af6bb03c5ceeefba30d29dbc02e7744efcb270a | ORPH
    arm      |         host-gmp-6.1.2         | NOK | http://autobuild.buildroot.net/results/5e5a8037d362c937288d5a5bb6b7a8309b9c60e3 | ORPH
  powerpc    |         host-gmp-6.1.2         | NOK | http://autobuild.buildroot.net/results/f7f7ec08ac082e00a07016e53535b3289a49d22b | ORPH
   xtensa    |         host-gmp-6.1.2         | NOK | http://autobuild.buildroot.net/results/01b7a8e22be3d6e9eaa4d9de71a085bad341f33d | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/537cad6728765bc15baea04e9f57012bc15c7467 | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fb097d019d8433bb65ab8719bdeb607c204089d0 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/060efb471318771ef7b806818d4f9fb04b8c9a3e |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/740b93f64a36469efa39aea632e6726544c54ccb |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fe85b625a1b568b39d1bfafa5bfe406f54b35252 |     
    arm      |     host-libopenssl-1.1.1g     | NOK | http://autobuild.buildroot.net/results/d015eb67be2927a3cf638bdf90ef7d15cd020bf0 |     
    arm      |     host-libopenssl-1.1.1g     | NOK | http://autobuild.buildroot.net/results/508e725e6bbd98fead2993d8d0a736f68a43b0c7 |     
    arm      |     host-libopenssl-1.1.1g     | NOK | http://autobuild.buildroot.net/results/746faeafcff3971d9c62a44af47f4a941d0ef5ba |     
  mips64el   |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/06d1c25318113dc4c13e0e74c3740c866542855b |     
   x86_64    |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/494ccd0621068e6feabf09a383114279810b5506 |     
  riscv32    |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/efef9ddb00e4bce3e96a9a38bbd051065a02cf29 |     
    arm      |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/f4fd0c500164e4df2f9c184a6664c92a0dd7f7d4 |     
  mips64el   |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/18328d725769df2e282efed848906e92a79af3ab | ORPH
  nds32le    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/b03dc830df45ec533fa2787fbc169f0425a46ca5 | ORPH
    i686     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/ebbaaaa8189b08c54692434e9f54cf8e155e3b18 | ORPH
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/137eae6f0780df051e97e00b8c8c06b22d983c98 | ORPH
    arm      |    host-libunistring-0.9.10    | NOK | http://autobuild.buildroot.net/results/0f3f9fbc5825ce851069e3813ecefdb2c49eeb11 |     
microblazeel |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/962ea74f2e5dbb7974802fae8590acc965cf1b59 |     
  mips64el   |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/86817ff4793b9a28f0f2b3ee42edbdd0936489e1 |     
powerpc64le  |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/e5f88a0c952ce478e5cbdee99ec1a58b738fe575 |     
    arm      |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/310c12346f02b8f01635f2dec5922bfcca3ef81e |     
  aarch64    |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/c6b5e5d5cb157f7bc0576356adf93641a199bdac |     
    arm      |      host-libzlib-1.2.11       | NOK | http://autobuild.buildroot.net/results/795e659499e6b82842257cdacdee8c68da18495f | ORPH
powerpc64le  |      host-libzlib-1.2.11       | NOK | http://autobuild.buildroot.net/results/3698ada9b767fb604324a259bfb1ec353a2b7032 | ORPH
  aarch64    |      host-libzlib-1.2.11       | NOK | http://autobuild.buildroot.net/results/2344ceef8d2ca2794d31eba14eea8e44ede554fc | ORPH
   mipsel    |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/f2c75702d3ee0501b78a30a61ad368d53910bb54 | ORPH
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/06cd6e07d2280f18dbf7bfeb17867babeb113675 | ORPH
    arc      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/2bd1e2035f71c0145ec31cf37c4a1be00c2a019b | ORPH
    sh4      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/ddebf6626aa7499dfbb2cc9ed651e71b9fe85ea3 | ORPH
  riscv32    |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/da8a384d48f8e5a9b725add120eeb8951daf5858 | ORPH
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/91e9ea2fa80373333d3926ca57aeed9efc6b573f | ORPH
 powerpc64   |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/3b438c652ca47951644639c79d4b8f9236ce5dcb | ORPH
    arm      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/a656fe0013dc1007a4ca944018c1908649cab691 | ORPH
   x86_64    |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/fb3f210fec9984be77725fb837d0c27a1593a88e | ORPH
   xtensa    |         host-mpc-1.1.0         | NOK | http://autobuild.buildroot.net/results/f5ebc6b830b0e2c1d6c192999ed37074e1300f44 | ORPH
   xtensa    |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/c1e7f6a78bf4beef12c556fb21a5c669bfd6e1ff | ORPH
    arc      |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/e004fedb43b66fd5c6253ce33a7dd46ace60e0da | ORPH
   xtensa    |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/42597bb423addf80d7271daad0fd12d0337762bc | ORPH
  powerpc    |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/f575c3c967ce17b9a2f56eb7b4ba75731260a278 | ORPH
    i686     |       host-nasm-2.14.02        | NOK | http://autobuild.buildroot.net/results/f8b0c11401ebcf2002e9024d6d7bb471303bff12 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f3468e897d53bd6cc064bcb9390ffa27c8aa4c66 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/9e0305aecd5baac1c36e0b69951383f9cc32e778 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b93ee15e8821e17bd7dfe849b4c29daac47e19b7 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fb42ac775de3678ffd2694aa304ad2ad69403940 | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/c7c934184a897e0c440df3ab22c7ec0ec7e0eb82 | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/778366a1efbbe16c5bd3c45a15e8d46ebb0bd62e | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/32b0fab072898f3cc3d348311046284c2991a695 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5a3de3b0ac59c4f51be14512d80c7a1ba3bd71ea | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e29a3438d880728fe867b6201b5cd4aa6867479e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/616a3e5d3fce0b91275606d850ac84a146e06c66 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/719796c03c600c7fa7f8780261abfbdd5bfd57ee | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/024c5778309bd25166bc9c61e19a53a695377dbb | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/caf7be551538d6a29efe16756f8c2e9a7b8fec41 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4f75ea8421d5123b029c8c7f8689d93d24bba340 | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/66dd74a0e918b3aa656d4963e43c795991928f00 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/21e37dd0cb12ddcd9618b82fea15f96069c609a5 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2fc98ac103980681fc5d41d68cae79f98127839e | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4761516d6ca2ac85cddf7917d2a366e5eed29429 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fd836b98fbad08ec6a32f19eeead71d82d4a100e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/36581dae43b049e150dc53d892fa2483bfdaafb4 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/54091de37d9852e606d8ecf0b0e87770f06da451 | ORPH
  nds32le    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/cb47cda0377165b3f3eb57334ba988c09dfb58ce | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b0ed1568a4fc23f2862bd7fd677a8e63a3d90642 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6af8fc729a8afd526d1ca2f99b080c79cfefc3a5 | ORPH
   sparc     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/154504a8641a42f10de1c757061c00d50673cc6f | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1cc75e686ecc378926fc21ad4ccff7ff30fc7aad | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7b2e43e9bd49db0d5ca8ca2dbc3a6f2704527280 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d4a383687254cafa92eadc962c0f6f94c14eea11 | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ac6885c8e26612bbbf25cda1e35767faf53271c0 | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3096d56bab96ca6ffc81c03418509da358ca90c0 | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6c6feaed05d6b71f608eb8addf0e74aaa3394995 | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0229e9cdc1efd1a3c70343770546c5036c270312 | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a52de0f1af7d62dc8b6fe6d14e40406153a29a96 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/eacfe6412d54d986f0d990f5268ddf0fd4259365 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6542a553691d22297b2e895df12e9db0319971e9 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/92486827cfcf963ea43c0a9b0e3c9b201c5cd3af | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1089c4fbe3cbd98993db274bf7e696d6d9a17a5e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/bb02b7bde370aee6a12329134be4fea9760c95f1 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3e16974e0c560d5911a437f79273c15149aee445 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1bfb28c0d0ee353abc3d56f8bc47ffa97d82c896 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/bf4308db33be3ef3fb47a479f98af11108aec158 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/be86309baf7d4ad124242a3e423d729a54b368ed | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d0ea2988ffda4446ab054dc48d6f654255c18d64 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d58022bfced6062214061b5684adddc64142dcf7 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6ba25b15cb28c5c6975ac7fdaaddb65984db787c | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/99c13c2cdbfd7f1e1e46fc727d07553b51cc8906 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3a653298c30ab376bb39c09b31d7ac6adfc3c131 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/be1d1f0a57bd84b1dd3f4f113f133c801c2ac1cb | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f3cd37d69dd01200641a4c46e53aae72ab25af7c | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e40e57c26a09bb68f129eb26b490e85b2c89a4b9 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/cb3320c27982c385dad61f7eba33e298eef7bf2b | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/74861b07b9de578149ca8a56202f43993542d8aa | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d93d2388d0897aa0a6e8f9b72c914b5dca37d31e | ORPH
powerpc64le  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/33e3225ab5e72e6b38c89c5e935a2165d3a19f61 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e2b917f5a45f3f48a5718b44eac544597228dd9d | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/42d81deda698e5e8dba32579f83b3ff82c8f2863 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0cc90633b624ed606772b3cd8cfafe979a4b3082 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/975ee0d29c346034ae3db00ec3903bf554480738 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d7f0f9fa806c103ee97197a492e0cc434e89b901 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7e700a4e2eef1fda8088285d53dc39a9c530eb30 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d7f4cfaba8635ff5fefe7405201e950933c1e496 | ORPH
  nds32le    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8dc0f38535cc837b5245b6e6149d1c9e412eb96c | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e2b59504068db672c896356ba40b1df80f17f6d5 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e8699eb409132892dbcce1f8d94dd81f196ab5b6 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/9abf7e66612892bd4ed00f76ae6f82156a01e277 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fb53d9b3a16a0ed843f06732645ed6870e16fe5d | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0b487e9db513a9f7a0dced2afb26a4def28d058b | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/872807daba8b1622fef83bd0290d0cddbfb0ece1 | ORPH
   sparc     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6538c0d29ac32392b1c6bea89da8c7b37910ed1c | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/aec967b54086c69be7fa941d286db657b0041293 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/37770fe68ff51b01e1cb495e1e9c3a1cd422b188 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f04d24899455089ccf53787c47b3a14f91c462f9 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/06519ffe89871177e24e9cd884c6dcf2835c7606 | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b3630b34643d3f23b046c077497df66a428e7822 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ef1c196ecc7ef088fed93bf06a68b5090b58e3b9 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7fb3ccddaa8ce48a2078454f16b34b114af79b16 | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5a51219b397eef84c45841b5295ee958e5704b9f | ORPH
    i586     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/29a26569019e5ca65ea5ef4273139d0092459659 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5dd971356f5df12a69cc123fd52f8213a191085b | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/44139944f807d948199e9982bb4473369a881026 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/34c174ba52eaea889a76f6d6a9f93ebe248749d1 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7a8eb10947ff271e6c61673323bf18846d1a0816 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7aaa700e84a6fbe22061d41b6f926f322f7377ae | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/9206ef68da0a9f96fe9c047938bd02f208a1a8b0 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/517597a74dca870ff9adb558d8856405029a739b | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ca7942b5e727da1dd5c8d50800c9122eebc8bd14 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3afa519f86a19cf348d600c3ae9ff0e57ae64183 | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3618c3a8d1159587cafeea276dbd59bf7d78f383 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4e1b51efa57654f7d1e2da6017049c8bf663cf1e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ea6102716218d8c80b84e3231091924a0db6322f | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/cd1964aa131966e8e6c6c518529a1fe38d7538f8 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0bd3d5a1537f95aea0811910206c4b254da76f1c | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/47682e1f0956045b769c23e919edaa64260aa54d | ORPH
powerpc64le  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0a783044728990d0fa7c28d5d92113994a02d5c9 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/67b51da5963c036d04507ec89b18b1f545414216 | ORPH
   sparc     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/31a37d75d146eaa6f63c8258a461098c8ea57504 | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/87c5b2b0ce2a66d2b500ccf3863d1d7e07bb10d5 | ORPH
  nds32le    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7d918943580d2b3abcc6a72e2e55b9654c77a4fe | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fc6353accc29c521fac7ba03d5311623a8a6a136 | ORPH
powerpc64le  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e1e6e20c877ddae4b3b059645aee9efdda929d9c | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5d097bf8295c11af2549e8ceef27193107178256 | ORPH
microblazeel |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/60ed8939a5329b9c15d118af4d692352586b35dd | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/665197cbf3261982819677f0c4053e777341f4cb | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/73eecf44604bce44f26addaf6022be4addc7b7ae | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/448c781539bf16e03d87e820d8aba7aa56899c56 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0639eb4814bc1c3781325e1a28af167bc7c0886b | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b82239da4610dfe81126add1e5c0425d7abca10c | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7886bf056b254538983d614a014179ee7db07103 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/299ccbcb621b5459dcfcc4371af5a9f9b50c5f44 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/628bfd5a3ff49c85cc8f74ed074a8082d5beb9f2 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f6e8c1a6188f88455c085f6105c826cabfa9d4db | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/eb508072b0d2d17e61cc14f5c8f14d08ca642a7a | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2065503148257513c87752f50d2e4384ac3332ec | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fdb4626fa9f1917bfdc5e8c64806ffccf8e5f976 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/c10075d32e375e299067e77b77127105ca4863e9 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/44cdba6f6450de0ef07e01aaa85ea0c25d44f950 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f9225a1650c12da332acb6a0c43076a5a98ea34c | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8ba911a32ad6738cbc97ff9149a32f4a8c9cedb7 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/c0217331a353e1e5058c52e7dba96234295203d7 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/18ffb21d49986883b6dbec5952b60fd91264d5c0 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/43bd005035e4f40ce9b62b2bb57aff5559ea3a53 | ORPH
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/2820c0437cf2c9abd792f4a4e35dcfd609b24ded | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fa6e164738e3bd4d6da87d08512da46bc7d345a2 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/14a41cb7039687b8bd43e3532138bfa3126e19ad | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b6b7b4b8542d962e3083f3af3a964ef4057f5891 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/64fe89bd9a9725cc10732a808a08fc7dfe62cf55 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e9ba0c8d250be335209292a970980ece16ae0ab6 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7538d7c70077e258435fce05bb870e556c538eb5 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/616506d911bccb3f7e1ea91624c76b75719df3f3 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ea177d05e5937a9408422c28cd01d0d88ff2c997 | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ab5df80219150f43a391ff7e657da2eea44cc8fc | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b0d14a3cead4ff1795e1685f8744195bb7bbc50f | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7f4e47a392f4402adb7290922370685d638f899f | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/337bbb06f1c45cb7d6459738f84abfdb97c5bf4d | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/671d2eab3be87e96f8ae7564770b75e48abec037 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fe8d4b20649db58c4e448f5a1e3f86ae682a52ac | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/130df54c0a3a46888baea3bb0f928a77e7d1db17 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ded82ebb91cf8d4f542497ca836b4bd9a678c709 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b84b8bca9f608d4862430e795a58bd99dba2d63e | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/9296df02606bc8ecbeaffcf7fced202db9f0d477 | ORPH
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/ef89e5cbe08114ed8509da072d44b32626bd413f |     
  aarch64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/2da0f0a937d0e10873c91099d7791e0fea61d77c |     
    mips     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/6d4a4ab3d7da684fcef549ac0a1afcef6711d200 |     
    i586     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/73bd8820e2c72d9fcf1948a4a71e4a1d6639277e |     
   nios2     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/ff1b7ebb17d5630034eb8cc2581d4cd1a1fdfabc |     
  sparc64    |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/2fd46a8b1ee133b86ee8bce1bb547f111c7d1d20 |     
    arm      |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/bbd36101cdca30921cc83b36fe96c755c50dea1d |     
 powerpc64   |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/edb8c7293fdf1ad61de51f3565d2800f991a0daa |     
   nios2     |       host-ninja-1.10.0        | NOK | http://autobuild.buildroot.net/results/5a076690c89d7eb09b8ae96853a9838477dae56f |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/385896d6e8312cf3796dea6666902c9dd9e881f5 |     
  aarch64    |         host-pcre-8.44         | NOK | http://autobuild.buildroot.net/results/8ba637c678c1abba6a0cc50a8a0287d9aa398574 | ORPH
  mips64el   |         host-pcre-8.44         | NOK | http://autobuild.buildroot.net/results/37d2afbac0c52cf45d2b1bf349f74d1a2cccaca1 | ORPH
    i686     |       host-pkgconf-1.6.1       | NOK | http://autobuild.buildroot.net/results/fa1b280c6a94b4b287fb698e3d705e34ec159fc9 | ORPH
  mips64el   |       host-pkgconf-1.6.1       | NOK | http://autobuild.buildroot.net/results/b4310aa7e7da85b78a0c31f9ac537fb92e0a6226 | ORPH
    or1k     |         host-popt-1.16         | NOK | http://autobuild.buildroot.net/results/38a3e8075ee397a9145e4113a0bf1e1d085ea791 | ORPH
   xtensa    |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/31c3ae2efc48e9b8afcca27b2b11de934f7099e5 |     
  nds32le    |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/910ac8ac10026df974897ee71c45cfb766b6446d |     
 powerpc64   |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/84202fd2c7ca4a87769e7562631ec3bf728f54ed |     
    i586     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/1dd9bdcbb1d5b15ef1e32921410d67c97cbbcd4c |     
    m68k     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/32a4e3973c487b7693d26fbdfadaa292d8c01f9f |     
    m68k     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/dbbe80036f9633808e4af57864e0e8310db85135 |     
    arm      |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/36cf930495481eb680631c46b3bb9e2eb24677f8 |     
   nios2     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/03e123c2b1f4663e85a4903ad603107623385a46 |     
  mips64el   |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/0980a1e0e1d4dd8019a7199e6af0fb1ebce36c66 |     
    i686     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/d26564afbc5f2b06df1dae06985a9f82f5f47d54 |     
    sh4      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/f15c6bce3b3520833413c3f62d17e42004b6213d |     
 powerpc64   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/ae13708bbf96c3ac5b50226678aca60571c1ebcd |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/940c16242b6871af7481fe68e55c3accfbf4e818 |     
   x86_64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/3d59bb338d8d93d4df3cc7448313032996fbe353 |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/36211ffadf99a62c58540f01f1166da1f237504e |     
   sparc     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d6282ad82fa51683dcf5fa05c2c9030b5a91eaf6 |     
  riscv64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/6eadd4bc4bf0611b9db5e3eaedcc1f71621061e7 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/f00152f4ee4b08d88ee71c005d5aa138719892b0 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/483ff019996605f4800c33fd17974eadc632aa14 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/eb519abfebcb897e3035f00f2a207201babd22b5 |     
    i686     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/8fd3fbc1bf80fd0c2c2d4e2493f9056bcd785ee0 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/1f204301569d3953392fa5063cac10c295a5cdd4 |     
   x86_64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/54993f02f3053e28e31a0abb71abd7160dd8674d |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/222f77ec17a4cbac1acf479b80fad97d92f77a9f |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/95144f86ed8c010c282b55f92904d3729e15b6de |     
   nios2     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/2ea3233305589f3c3ebe00a5ba9c98bd71a6d190 |     
  riscv32    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d061331d05c634c43e1601c248d4853cbc5073f4 |     
  powerpc    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/9f1f3b492e6df927be97e0750fa275fa080b43ad |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/b5b7db27acdb50864c4501247e8f84c81112693a |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/2307f3c29bb5885577a25358b94f8c2bce6c7781 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/64bcb9d651f577d7f4bf31524580e16cc00f042d |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/7a3d9f17675fe8d3f4cc8426b444de2d3ac0137a |     
  aarch64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/402d5b6e1a5c549587af1d55dca629cb004c12ca |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/67127a1fb44ef5523963b4e4a403d39b5e4efbb8 |     
    arc      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/56f0fa20e4ca4b2ea4968548f4d983c8cb04a0f0 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/342d531d924eeb334c6158d80ad2733329670605 |     
    i686     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/003a3d361df6d8b4b6fc772ea55fe5c9a7a33483 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/1638c18358d9bd6fd7d1b87228d945bf69aa59de |     
powerpc64le  |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/8f2968aee3dae627a34caeceb6d075089e7c3fd2 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/e6a5b839bc3b53ae3ee97161b632971f37309aa1 |     
  powerpc    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/c85b93f9637d8c575dbd70996903f17ba2d744ca |     
    or1k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/df7334c481355f0446bce6ae536371fc6ccfd51a |     
   sparc     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/6c96547717338d65bff59f26f31c55b75a0865fc |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/0819d6576a4ed8b0783821a4ac9e2970f95cda65 |     
    mips     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/888dd6fe4ea3a3455fb3d7dc6c004ddc3d47fddb |     
    or1k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/e76c844b2892b9dfb686e965a979527e4e42889a |     
 powerpc64   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/63ff14ed22534a10256f89cd9a7f893e858a5f40 |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/c39510fe5e899fafcbc3ee8c241757a147b05e3d |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/4c21a3aef8f0209d0e3a6449011f2be9148cb568 |     
    arc      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/776e6730c77c83e32ad039c608742eba310103c2 |     
  aarch64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/24dc4ca4800427de71717390433ead22b0b32921 |     
    mips     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/fc9da7456d136da5e4147d9e72f348990d7d0df0 |     
  sparc64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/5cfb79d07c1d73ecea390d60d0a60ad71a06b7c8 |     
    i686     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d9e6ff5885c249682714320d64002d133ffa2bb0 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/a4713668c4a7d55e4a60666dda3a19403edb8bca |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/32dcdd9844009dc0ad2c0245ff57aad8353c9598 |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/1dc39e32c64675731518699020155970b253f95d |     
  sparc64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/ae70cb2d17d312b4320e202a2f7be2b62a6d05b3 |     
   sparc     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d1cd2906c64b95da05dc35192428bc342486cba1 |     
  aarch64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/15e0972b2c0b975b45d0b14657555506a4c29d96 |     
  riscv64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/815befe70b3ef355af346ca76e60064324e514bd |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/8da1d3a45ba309c2ddf88a30c6c3353b7c2ecc1e |     
    sh4      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/681d08256697543177a62a602dba80fb669c5355 |     
 powerpc64   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/60eee28802e16beb1dec0efcd2e5b241cfad9645 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/848a7fba2233fdfdc07a72ccff3806817acd9379 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/1531ae6e42cba865c4763cbc06f3bb384a850048 |     
  sparc64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/2ccb87fe2629a980c4e2fa4d055013ac521c50bd |     
   x86_64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/811951c244f37bbd6b8d5867e54edd36be3ef748 |     
   x86_64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/83c5955a7a9bc2a4718f50e6ba5c4f3066bbfd1c |     
   mipsel    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/ab9ddc93257f9d2349d332467337932cdc573a83 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d4fbc16ccab22669e478810322b89d9f20f4ef51 |     
    i686     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/2e17ccc9c05de5043206a25a4ca7ccf50d7fc3ef |     
   xtensa    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/b1ef4e5df3d11730f61856adef14b3b7004f5894 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/31890511525f389fa1f42f878351e03e1577ce67 |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/1a86d02dcfe1769adcb83a0b3c42bd958eda7db4 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/ca092e449c2ccf879b3511b406426b238c621863 |     
   xtensa    |        host-swig-4.0.1         | NOK | http://autobuild.buildroot.net/results/0ea44925ec91bdbfbe5439eb9f15f34526f6cb87 |     
   nios2     |        host-swig-4.0.1         | NOK | http://autobuild.buildroot.net/results/5d2a8f4e9cf79b11b8d583d68992c38bf1168bb3 |     
  aarch64    |        host-swig-4.0.1         | NOK | http://autobuild.buildroot.net/results/3c1d9c1317c0d59a85003dea502b8a7fe5d47c4e |     
    sh4      |        host-swig-4.0.1         | NOK | http://autobuild.buildroot.net/results/3fe50d8337c123f3132228b6e88947432c7dec31 |     
   x86_64    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/ddb55d0e7d9f89fc17b44457be1bdc3a4a53e405 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/78436228627b544be2753eb0dcfbf46b68f327ab | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/2f11222f8c915dc27352e1131fdb0c48d6a875dc | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/7a490ed21c1d3df766d0d59c76b6bbb0d6b5fd7f | ORPH
  aarch64    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/2f864df3d9aa4226d0a0411d8ba562ffd35a1023 | ORPH
  powerpc    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/257add9fb2c34eb01537db14eb9d682e979411ae | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/08bc33689544fc64795465a0db8e339dd82346f3 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/a3d632fc55b01c4e199860e33d288b991640c9f0 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/7a07fa0fc3b1c4b4a9ef5e700bafd0132fd96c5d | ORPH
   mipsel    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/0f43389797c540b6eb4aa4b695b1e87371de279c | ORPH
  riscv32    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/16932d5a25b203eaad4d72da9077ea72893787cf | ORPH
   xtensa    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/0f2748eec9fa3a0e6b335b1dda959f22db2f8915 | ORPH
  sparc64    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/9b5396298f0d341f3ecd82ca8393fccb27fd2c44 | ORPH
   x86_64    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/4bdfa5183471f1c5e45809ef38d13afa3f933e38 | ORPH
    sh4      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/1640a9527c28178f7bf5878f9a2149c05f8eaab6 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/f902adda3cd8980437e6a892ec58dcb01a9a52cf | ORPH
    sh4      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/9581473b453c2b54b6d7751e4b5c5707a151a410 | ORPH
  mips64el   |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/22c0d702b9739cc0be99c121c349f7336c780278 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/573be9540446a20f7e266bc1341155f25a70f4d0 | ORPH
powerpc64le  |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/13536c3364dc1d5787697bceaf9a8492196eba47 | ORPH
    arc      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/a67b1ed430db9834a13d42df3f98645e30ee52b9 | ORPH
    i686     |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/8a0c306613a825e2c2b8f0a6bd1d138b961cee4e | ORPH
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/cf70552fcf63cd2f9d5bc6d77c5030a36c1088b7 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c66bcc26fd53f73a16a7745855fba7efd64aa21b |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/aa60751a51faf0f3029846d9494aa6670ec83a1c |     
   x86_64    |        libcap-ng-0.7.9         | NOK | http://autobuild.buildroot.net/results/090d4897b1aba0bf5bebc04f014af91f95e11987 |     
  powerpc    |        libcap-ng-0.7.9         | NOK | http://autobuild.buildroot.net/results/3bf3aff17c08f53c8ee8ddfe43e001f2307f2ea7 |     
  powerpc    |         libcurl-7.69.1         | NOK | http://autobuild.buildroot.net/results/038265acdf6fc5f3ddd02d9bf5929efce50b02d9 |     
  powerpc    |        libevent-2.1.11         | NOK | http://autobuild.buildroot.net/results/2a706e252a95473787e35388abfb9da0824181f8 |     
  sparc64    |        libgcrypt-1.8.5         | NOK | http://autobuild.buildroot.net/results/f229bc2eba681bb6d35954b31dbb5df745d59ac8 | ORPH
  riscv64    |        libgcrypt-1.8.5         | NOK | http://autobuild.buildroot.net/results/39d0a277bb42804ccd22b184cf2bdf4315aa89fe | ORPH
  aarch64    |        libgcrypt-1.8.5         | NOK | http://autobuild.buildroot.net/results/4846ad322c4ae300e285d2d67d55ca6d43fec4c0 | ORPH
  powerpc    |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/4a2cfbe5b53cf24fbd76fc5be95a28d33d5653ce | ORPH
    arm      |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/4f3dd33d08a2d87c0ef107e38e3985a2a7bfc690 | ORPH
  riscv32    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/5afba71b1b91ea1b78e6ef054bbdccb0f9dd6a69 | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/e293594a0e292373338ceaff9a1d05b7413fd504 | ORPH
  sparc64    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/28ff87a3a51c1326ceed5c8622082343285191b0 | ORPH
    or1k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/9230fc0fe1ed8062d058fed6ffdffb34b9a9101d |     
  riscv32    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/d94d76259bf865497d03c265db50ae8dfef3bbf6 |     
    arm      |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/599e81d2895ca8b343b1d034e8b2539bb94120e2 |     
  riscv64    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/1c3db651cce22a9f770a9a39de22d07e81acaafd |     
    or1k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/b000c42c5cd5ec4591c0948768372a6481068a56 |     
   sparc     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/621f1bc43467a8e4683ba0337bb075578ef80fef |     
  riscv32    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/42d3cb4bc293673e68f93898174166308c49b9a4 |     
    arm      |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/28ac122836da0d77eb3794cd51a2e6c2e25fa82b |     
   mipsel    |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/c47d7549a2e63707087b41cc23b0c5c04cd1fead |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/1eb208941c7423ad4d1db325b91ac385d89b664d |     
   xtensa    |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/df05b48cfe56c8402fb5d8d302d155ae7d1bf072 |     
    arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/7c20047c1f2fb534c1501cf6fb4f1817ea1860ab |     
    arm      |         libpng-1.6.37          | NOK | http://autobuild.buildroot.net/results/f8eadeb27cacfeb1103131b3a26ba33476aefdf8 |     
    arm      |          libsepol-3.0          | NOK | http://autobuild.buildroot.net/results/dded5c536013eeacce7f95fec15ac03465d77e41 |     
   mipsel    |          libsepol-3.0          | NOK | http://autobuild.buildroot.net/results/5ad719310349b0af3cd994e86e5e0707ba8179f5 |     
    arm      |            libuecc             | TIM | http://autobuild.buildroot.net/results/46b251174c6457c294063bd579803762aa2c21e1 |     
    arc      |            libuecc             | TIM | http://autobuild.buildroot.net/results/5531046ad8937a866b199d5e8143d205995fb6a3 |     
   sparc     |      libunistring-0.9.10       | NOK | http://autobuild.buildroot.net/results/485c558ee354d55b70fcc0464b06b25da732160d |     
  riscv64    |         libusb-1.0.23          | NOK | http://autobuild.buildroot.net/results/142e1df7da055c04c1983af83e2e4cf3a09f2262 |     
  aarch64    |        libvorbis-1.3.6         | NOK | http://autobuild.buildroot.net/results/53fc43be341eee98d7eaec6f91a27256d8b30fc2 |     
  nds32le    |        libvorbis-1.3.6         | NOK | http://autobuild.buildroot.net/results/0039286c64cf4382aa586ba4161e9e3839394bc2 |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/78077b36073d32bd953ed44d1e5edc29f2dec2f3 |     
  aarch64    |        linux-pam-1.3.1         | NOK | http://autobuild.buildroot.net/results/dfbc4c1e0f372646a4f021649f6ca5c488be8ed4 | ORPH
    m68k     |        linux-pam-1.3.1         | NOK | http://autobuild.buildroot.net/results/969468639714ee67b377ee36993672bd68eaa6d6 | ORPH
    arm      |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/9aae403dea9ddae690abbcef24eda286ae915fc9 |     
  powerpc    |         mesa3d-20.0.6          | NOK | http://autobuild.buildroot.net/results/2c190934fa890c835428701b4c2ecbf05f3e2541 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/66471f1446d396caa63305731b8de343a812594c |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/114628453fe92ab9300899b1e48a449473d69083 | ORPH
  nds32le    |        mpdecimal-2.4.2         | NOK | http://autobuild.buildroot.net/results/9405c631c2745787db34bda9eba5ffec892a95dc |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/191723313bb6fb9c683f91888fd2dc328e38bde2 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6eaf76674de7b220e957f5dcd889d89f77e04720 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1f105dee3f5a55c7437884b87cf76adc2e648744 |     
    arc      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/68726def29c923abe8947e86bd0656627e0ae7d5 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e9ee24331c6542a5553bc07709d9e41eb21921c2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9c8e04938aa4f9d2c0d81c58352b03155ea49cd1 | ORPH
  powerpc    |           nmap-7.80            | NOK | http://autobuild.buildroot.net/results/f0b89a4c464b0d668c1a06b5bd5f7239f7a197ac | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/835953df7b6139974982921e7f4abd06c80ef483 |     
    arm      |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/8de7772b79b1dedd14f37227a438d94a42a4e2df |     
  mips64el   |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/e960e11bc09f4d44f6b0be234a347a2b79cbd745 |     
  riscv32    |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/faf2d9c03d694b781a1bd841a1767f1212b4ecf7 |     
    arm      |           pcre-8.44            | NOK | http://autobuild.buildroot.net/results/af7f8398560c82ffd11a1fa1e1dc199451c23b65 | ORPH
  powerpc    |           pcre-8.44            | NOK | http://autobuild.buildroot.net/results/4b84873ee86cf101361282c473a3886b1081091b | ORPH
    arm      |           pcre-8.44            | NOK | http://autobuild.buildroot.net/results/b33a8905e6a0d20f3ac8f3b9e122e5d7ce644705 | ORPH
   x86_64    |           pcre-8.44            | NOK | http://autobuild.buildroot.net/results/3cc3093ee68e8c01abe34f2ff4d71470de796f77 | ORPH
    i686     |           pcre-8.44            | NOK | http://autobuild.buildroot.net/results/e32fa77884e147403fa336a17a30d05fac96da57 | ORPH
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/435d9ce0be4f8d1c111af5db7314a08d332c83de |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/45f36734bcf9aae4f7c7dbcbd836bd57307cc8b2 |     
  aarch64    |     qt5declarative-5.14.2      | NOK | http://autobuild.buildroot.net/results/2ce76f754dadaf7ab4d27009648f8728512d5b25 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/0dcdf2dbac8a7b027945ad99a58b4a9e41f7b788 |     
    arm      |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/0ea4c14c5346c593e9b7f1038b846b8864083577 |     
    i686     |         snmppp-3.3.11a         | NOK | http://autobuild.buildroot.net/results/1a734a3ea8720b242ef358405c0d82c41f81cc57 |     
    arm      |         sqlite-3310100         | NOK | http://autobuild.buildroot.net/results/3aa7725d24efda7d60d2b65fdf2182ccc2a5883c |     
    arm      |         sqlite-3310100         | NOK | http://autobuild.buildroot.net/results/bcfbb9ea93bf8d1b6b07e51534bc19141d9f9739 |     
 powerpc64   |         sqlite-3310100         | NOK | http://autobuild.buildroot.net/results/a2f4738bc1b760c1a671d193ae7d3266b2b0defe |     
  mips64el   |         sqlite-3310100         | NOK | http://autobuild.buildroot.net/results/b2f350d18ac7293887e4e4ef6206dd256a15a05e |     
   xtensa    |         sqlite-3310100         | NOK | http://autobuild.buildroot.net/results/f84436dcd48268a1f3fb4e43b5caa7d2e0a6f84d |     
  mips64el   |           squid-4.11           | NOK | http://autobuild.buildroot.net/results/587a7c0441d40a36502d77108a18835ad3ca489b | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1af1b6cc0db6c6d3f8ea9f458c45c3204548642e |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3b1cefde17d42725b21d2cfa260cd3f35f9aa10f |     
  powerpc    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/08d60bc6b91713189522e3d79311f165dc05ef5c |     
    arm      |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/9ec002b1f2714817d53eb9a2b6ced309bf609e4a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5f04fd7b577fcbbbb61c5303df731750e5b17fe3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e985b543001ca428b0e94c0bcc66b8d9000525c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/79ffe76119ab93996c41999e868f61ec7e88bb94 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/906fb0fadc1f001e591cf9e4917aefb88b76461c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/843680daa4725d2e70eed9f33117d06fea074e50 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/718f82b86c661a4dac918d1fd0d05e1e3857219b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/70819075d67ab6b154cbe4c6cfd100b74882354c |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/be0fa929621ab0947e201910d1c8ed220d94a903 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/702d1b77baa86e170b752aca3c61821622fab299 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ce817a4e3bba1abf3b9dd58e4821f5ffee46e8cd |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5cdb0f046b13d59f972bade2792b677a4abf59c2 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2f35671dead7976da336f28fcd4295e3ee25222c |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/131eaff88ec8ca177a01ef28070371688ac6cf9d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b80e9f0626e1623c91c328377612dca113c62157 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dd5ba70f9649f990aaf65b72d5c9867ff7e69166 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/403394c51527155fcfa5a2b3e2cc738cf3504e1a |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/8164d278ee416725a34fb79b707619abe50b81d7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f2b4467d1f11312a5d26315b25201b444417cd32 |     
    arm      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/1e6ea92c4296cf90ffd026d20e4462d02914fcbe |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/edd1e33733ae3a46b236f3bd997b044dd92b8c7a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f35fe13cce35e223c839c4437dbfb6133d8f4dcd |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/498ce6a6d7b4c68c420eeaa2af61a3a0504c8e12 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-ncurses-6.1 | 18
     host-gettext-gnu-0.19.8.1 | 9 
            host-python3-3.8.2 | 8 
        host-gcc-initial-8.4.0 | 6 
host-gcc-initial-arc-2019.0... | 5 
            host-python-2.7.18 | 4 
                  boost-1.72.0 | 3 
                 host-tar-1.29 | 2 
               acpica-20191018 | 1 
                 agentpp-4.1.2 | 1 
                  assimp-4.1.0 | 1 
              buildroot-config | 1 
            host-binutils-2.32 | 1 
             host-cmake-3.15.5 | 1 
               host-efl-1.22.3 | 1 
              host-expat-2.2.9 | 1 
                host-gmp-6.1.2 | 1 
                host-go-1.13.8 | 1 
            host-libtool-2.4.6 | 1 
           host-libxml2-2.9.10 | 1 
                host-m4-1.4.18 | 1 
               host-mpfr-4.0.2 | 1 
               host-swig-4.0.1 | 1 
                      ijs-0.35 | 1 
                 libpcap-1.9.1 | 1 
                     pcre-8.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/95a6d7d75d10962c67dcb1ad61c222a5c669eab7 |     
   mipsel    |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/93a0059318bccc7759e26dfe45d1b179554872ae |     
 powerpc64   |          assimp-4.1.0          | NOK | http://autobuild.buildroot.net/results/ac6a918a4464d330d988b59218e12c04b974d218 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/970937345a56e30856a6551d490a487f57fce24e |     
    i686     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/f77970d11038208d856253560e231d94c7a73d69 |     
    arm      |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/5d6f12b53732a8ece06ee7e3208c15d0636969b3 |     
    arm      |        buildroot-config        | NOK | http://autobuild.buildroot.net/results/d15d8da16cff08532f99f608ebee4d5fea96acd5 |     
  powerpc    |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/b16022c26f0671279d2e1090217f885fd50bf245 |     
   xtensa    |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/bcebf92e7d4f7e940fbd83014c90dc8eccb3662f |     
    i686     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/f6514a9f0b5cb0bd275d28539b5dd3e9f1bf6a0d |     
   nios2     |        host-expat-2.2.9        | NOK | http://autobuild.buildroot.net/results/83da9656404af8b39d9dd7eef9dd10fb9c539a20 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/6cfe8d775567b798fcc7d24fa95bed3af84c2f30 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/ff26e408b7be8c3ff5109f9b7996575f6856e5cc |     
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/65dd583ed1ce32d2811abe1a9f88299a189a02c6 |     
    arm      |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/35e0fbeb99a2fe59a864e2ccbc4c3b809557acf6 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/3d5358b1d2ec7a3b8cdb37fe3bba454c0738dbb9 |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/d1f12ccdff79736e01d1a66cec24cb0a3ee57046 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/d2137b342e9681c2a80185d8c3cfcff418fd844e |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/9af1c3946c08abe11238ec664a175faf5f413e16 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/a609734fb9965fbe436cf4dcda11d9a4b36d5e33 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/60a93bae7b22db881678446b1d7e4ff625109611 |     
    arc      | host-gcc-initial-arc-2019.0... | NOK | http://autobuild.buildroot.net/results/48315b5ef43642db65ac257ee3f166d4d1eb23b3 |     
    arm      |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/86b1c2674d9289b2511025852fe5bc13f6c5974b | ORPH
   xtensa    |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/12ca7037f70be58585a2b0bd079b4a233cad7bc6 | ORPH
    arc      |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/e40e9de09ba2e7a7b93d69042390cf9cfc81ec61 | ORPH
powerpc64le  |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/0fe09778d59bf4b2b6b1f59adbd6474464f9381d | ORPH
  nds32le    |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/8cbade9e41eec3f1b5e47a221eaf524c0caedd62 | ORPH
microblazeel |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/fc6c81886c0d42de523c8d67c7ba990bc5828615 | ORPH
   x86_64    |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/16c32793feb6f7ed1fc974bbd152f0b10156d0e3 | ORPH
   mipsel    |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/7ed7cfc8ac9d2b0da689f49a909d5846887ac606 | ORPH
  mips64el   |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/88b3b101ec1dc3304d4095f243887e35b94dd581 | ORPH
    arc      |         host-gmp-6.1.2         | NOK | http://autobuild.buildroot.net/results/e369a8c1d2ab33b9c811fde95946e1c3ddf5e038 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/a21c455da0cfcabf574b78c272ac342571c9e158 |     
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/f1b35d5294913dc28aa6afe07c966ca461ed6518 | ORPH
   x86_64    |      host-libxml2-2.9.10       | NOK | http://autobuild.buildroot.net/results/02c6a5c68399b3ac37de0cad9af66c62af5fe21b |     
    m68k     |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/97cbd686ae95e2da3d83c28b6cb4b97637981b98 | ORPH
   xtensa    |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/96c2233e8a8eaf3d6662982a08cc49e2f33c3512 | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e2c1a5643ba69e6286bf12ea1f549dac7ba2f3e9 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3a8f3830f269eadb8d5bfd73e7b56a0ab99224ab | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/86962718d8d3b83640c716e9e6d85ceb9b7c114c | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4e61b88df31a9dcc7fa33b137b12a86d1e3ffb10 | ORPH
  sparc64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/c2cd001c9049d832b88097805578b38ef0620fc6 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/65579901fcb8431b04fad5e9916f600b1aac9e84 | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/fc1373b49980e5d70f642dbbda43322f5e962545 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4186905f8dc1851338b66b3fee7d3f1abe08331b | ORPH
powerpc64le  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/6d94566057f45c83bc78cae3ec120318d678924e | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/094171edfbf3f0772881f778a9b742e840bbde1e | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/10730300f05288790d2f4cdf74e0e8100fe61eee | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b4b61c0713f8716b037b5d3240c1aa13d9449d08 | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d2d62cab5f1a8c572fcb930c811818f7c4fb0dcc | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/22413a6b96782a1152c8cc70b35f776c9f778da6 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/733d24b1902c7a5e187c2b8636ea5515fcf991b4 | ORPH
    i686     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8237ae347cdf84be293088fd261f3f7a2d6fa699 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7f159d7c1d0fd9dff91ed0fa399bf79eb37d0ba6 | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/c27d6d61370dcbb402ee57edc37e8a075784abec | ORPH
   nios2     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/19e5e81e05e6fb956d27b4f2c1f9923ba5f98348 |     
    or1k     |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/438434d954df7879138b283aa9f42262392e41a1 |     
    arm      |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/da25b667820fb640ce00890bebca237722d4a4c5 |     
  riscv32    |       host-python-2.7.18       | NOK | http://autobuild.buildroot.net/results/cd43bde0553a4c427d59655fc2217650d28f13b1 |     
   xtensa    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/fb7e687b721cc84f6a9afcb63ad31fb747c4fcce |     
    mips     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/23b4619fc2b47c33bab66f77b9a495ea552589df |     
   mipsel    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/22ed04bd49219a01e826c16c596a3865b470e8c3 |     
   x86_64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/59fa722d2dfeb298fb2e4432c627cefcb61d6a1d |     
  powerpc    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/115a722c6c99c7bae55ea10f36c3df9178dabc53 |     
    i686     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/52c0f66fcd54ba8e477531895d08878d38b4b343 |     
   mipsel    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/9a621d14815b5a7a4d5764aa45ab72b3aaecc051 |     
  sparc64    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/0a9a1f217a28d9e3413e8bead9867575742105a3 |     
    i686     |        host-swig-4.0.1         | NOK | http://autobuild.buildroot.net/results/e4d18f724809b2a915a4e968af880344a3e225e6 |     
    m68k     |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/367b0f3e344cc19669f94aa1450df8f4eca21c95 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/cef4ff6463d2c825eac589262967bd99f22baf28 | ORPH
  nds32le    |            ijs-0.35            | NOK | http://autobuild.buildroot.net/results/24caa15869ae7e4e9fa291bf7b1952b8ee76d1f7 |     
   mipsel    |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/a2353debdc57115049fce2abe78d5951240b6158 |     
  powerpc    |           pcre-8.43            | NOK | http://autobuild.buildroot.net/results/c8a7bbcbb594375b837865e25a9b67e4907eab17 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              host-ncurses-6.1 | 17
            host-python3-3.8.2 | 11
        host-gcc-initial-8.4.0 | 5 
                 host-tar-1.29 | 5 
                       unknown | 4 
                 agentpp-4.1.2 | 3 
       host-gettext-gnu-0.20.1 | 3 
                alsa-lib-1.2.2 | 2 
                  assimp-5.0.1 | 1 
                    brltty-6.1 | 1 
              buildroot-config | 1 
                 dmalloc-5.5.2 | 1 
                    flex-2.6.4 | 1 
          host-capnproto-0.7.0 | 1 
               host-flex-2.6.4 | 1 
                host-gmp-6.1.2 | 1 
               host-libffi-3.3 | 1 
                host-m4-1.4.18 | 1 
               host-mpfr-4.0.2 | 1 
              jpeg-turbo-2.0.4 | 1 
                 libiconv-1.15 | 1 
             libtorrent-0.13.8 | 1 
                  stella-6.1.2 | 1 
     toolchain-external-custom | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/71f144fa4438190f52fd2f4803aa25b693631b5d |     
    i686     |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/982f8be02f94ca6a26fb9da25e87c0070ddefd70 |     
  mips64el   |         agentpp-4.1.2          | NOK | http://autobuild.buildroot.net/results/cf154869b9c53af94218bf7d69006c9b3c400902 |     
    or1k     |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/e0d503789e9e73766684eff6ce647324058caf27 |     
    arc      |         alsa-lib-1.2.2         | NOK | http://autobuild.buildroot.net/results/93c0220fdfd9165741fe96fad3eeae1bcba06001 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/0c84108c159165eb3231d9790098fa428f7c6085 |     
  sparc64    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/3bb408ff6022be70e8fcd0cbedba2085fffdbf0f |     
    arc      |        buildroot-config        | NOK | http://autobuild.buildroot.net/results/eceea169974be0ee926519aa7f4e07401a4b607c |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/1e7f00fa31ffe5096cce7e494ebd8eb5dfb02109 | ORPH
   x86_64    |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/f05a99638d593fbb2237ccb205734db2680e7962 | ORPH
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b18a886d6365682eae13a8c10ae27428e02edc62 |     
  mips64el   |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/bfead9308b117dc2f81e5c2c87f7a94e8de49534 | ORPH
  riscv64    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/09a30bc4ad1d448c802d6c72e8487f5252ff2aeb |     
microblazeel |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/f3ac361fd2d6de828a9a376a80de951c0a3819c8 |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/fd01bd6510fcaf0fa857e09cebb21e027d978305 |     
   xtensa    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/6ff1bdc730561e01fcbc00521a4e0978e95fc370 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/5f519e158426f2c97988ae7c01436688f8e40ccd |     
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/c5bc80688b384a0cd6c8051c10190763c5feb5f0 | ORPH
   nios2     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/adea860aaffb7f821d0578f4e18236d64196dd7c | ORPH
   sparc     |    host-gettext-gnu-0.20.1     | NOK | http://autobuild.buildroot.net/results/eb660a08624a8491ffcd2c2655f6a456185d836e | ORPH
  riscv64    |         host-gmp-6.1.2         | NOK | http://autobuild.buildroot.net/results/38873a72148d39a7fdc3fd39b3ae750f34a66a7e | ORPH
    sh4      |        host-libffi-3.3         | NOK | http://autobuild.buildroot.net/results/d8d45eb937ebdeb8bbdee897732bde73bc924f3e |     
    arc      |         host-m4-1.4.18         | NOK | http://autobuild.buildroot.net/results/0ab72be2c0f8d374b559150317d84473abb064da | ORPH
  riscv64    |        host-mpfr-4.0.2         | NOK | http://autobuild.buildroot.net/results/5cf1f7da610e273fcf122d8d60b2e72cf1bacb3a | ORPH
   sparc     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/45f1311efd387f723795bc02bd666c1f41a2d22f | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/91d46212401625db9460c091dcb15a9526158af7 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/86c1e278acf7b0ff34dd3efaa3f9e20828bedbe7 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/68043ec2ea0e0e67458d233e915a78c4688892c7 | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d79777b362a32e08169c3e5e5ae7a01dba38f09d | ORPH
    or1k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a4af0b3a0f50fad6bd742d0f2e15a9a2d160d00c | ORPH
  riscv32    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d0b11ff2bfd006d3e18a3851eeea76080457df8b | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/7fb16ac9a9dd3c3b53741f0dd701d05e439a62c4 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/75b2955516f31ed2c1d9abc8bea758eb008e63cc | ORPH
    mips     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/77dc6f05af47689588e68d60fd446b08e3481104 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b566ee8377cdc62e9a4834d10faf70a491b2b900 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/1dad375a6c40b5242867a0058854a8018ee54d43 | ORPH
    sh4      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/0536b188c8c166042307b5691e67155f97f988aa | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/8e4ebf222c25d87a3d365cdedff53c55dd6f3a72 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/920eac15a8850e597def975638526e74f160c9c2 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/356b1b72ed2b7cd331f6f3c80580abe0a4658fa0 | ORPH
    arm      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/20fdeedd397453e7b94f98dee2056b69909cd411 | ORPH
    arc      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/307be54193d5d41fb0cf74a09ff70fc4761b9ca8 |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/4779869ca9a8ea23cef7b9345ba66e6a202881ff |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d74e8c2c4efff93e42cec6956cfeb14473a3b0e4 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/c2918d020fdca93ced2a0a53cd5dfdcf69709e6c |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/aec21629576d341e69ec17b884bfcc6c80f1e7b3 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/f93afabd5584cea3eb3e53b1c038fcc23c34a062 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/b42bc336b7e07cf6e169044be3cf05432688f9d2 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/e40f7e9b94c9e72a2c54d87e67575f53c729b99b |     
  riscv32    |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/f17e9ed0fd3b5bac8f8064b3d55ef755508a0aaf |     
   sparc     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/d063e1329751415e525444996d4e2b798c54e5eb |     
  mips64el   |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/9451e38b736130dd2267a7781f2282d24a3c37f6 |     
    sh4      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/e2daf131b559dfe863326399526410de1625eca0 | ORPH
    i686     |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/ce21c5faaf15e56b23846bc511600113d0e8637b | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/3216d36269c5523b8e5e6e0d26a9956896832aa5 | ORPH
    arm      |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/217a13bbd5a6029c83122599121855b7c96f091b | ORPH
  nds32le    |         host-tar-1.29          | NOK | http://autobuild.buildroot.net/results/b90109e13f07718f379ddea61e0a6fd4e0f90144 | ORPH
  aarch64    |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/76f459d227a495e0e43b5448516a86d5185451b8 |     
    arm      |         libiconv-1.15          | NOK | http://autobuild.buildroot.net/results/240533d25d7f7ba88235ad1fa93fd86d8027e986 | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/6e6250881e2246a7a62dff1059d753e5b07df6d5 | ORPH
  mips64el   |          stella-6.1.2          | NOK | http://autobuild.buildroot.net/results/c943ee799296ee143f099da812bc33226fe6b875 |     
  sparc64    |   toolchain-external-custom    | NOK | http://autobuild.buildroot.net/results/db03ce3ba139973826307403f558c07b1bdd1541 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/518c87b07974a71e432a829a60a3072f9dff48de |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/2a10066fe892d4b08d037203ea3e0ae7a81d746e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2869f21606bdf9e1087a3d3f6b3cbdae9b0e0868 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/947e22ad58497be6fa575745f9be805af73eb1a3 |     



-- 
http://autobuild.buildroot.net
