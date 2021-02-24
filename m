From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Feb 2021 08:17:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-23
Message-ID: <20210224081724.E85B94308C@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  6  |  1  | 15  |
  2020.11.x  | 17  |  3  |  0  | 20  |
    master   | 128 | 62  |  1  | 191 |
     next    | 27  | 35  |  0  | 62  |

Classification of failures by reason for master
-----------------------------------------------

             libopenssl-1.1.1j | 8 
                libshout-2.4.5 | 5 
                 pixman-0.40.0 | 5 
                  dhcpcd-9.4.0 | 4 
        host-sentry-cli-1.57.0 | 4 
  gobject-introspection-1.64.1 | 3 
                 openmpi-4.0.0 | 3 
                  bustle-0.8.0 | 2 
                  monkey-1.6.9 | 2 
   openvmtools-10.3.5-10430147 | 2 
                    qemu-5.2.0 | 2 
             util-linux-2.36.1 | 2 
                  zeromq-4.3.4 | 2 
               belle-sip-4.4.8 | 1 
                  boost-1.75.0 | 1 
                  botan-2.17.3 | 1 
                    brltty-6.3 | 1 
                coreutils-8.32 | 1 
                directfb-1.7.7 | 1 
                 gerbera-1.6.4 | 1 
       gst1-plugins-bad-1.18.3 | 1 
                   httping-2.5 | 1 
             kismet-2020-12-R3 | 1 
                mono-6.12.0.90 | 1 
               qt5webkit-5.9.1 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
         s6-linux-init-1.0.3.1 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 
                   xlib_libICE | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/ba0f50b64505b393268fec77ef120aa5baa381db |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/369f06c93ba0e0267a3f199ae59e22c2b515b8a7 |     
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/185866a7b711588dc0f8aece69ab841c1e318624 | ORPH
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/2f40e78b65402f197ffb87f607d60865b23bf64c |     
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e0588769fc47f276eec173959fbee168fd3e177a | ORPH
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/e1c4d47ddf892f935c3c8a1797315a49394c60e7 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/384ab27b50563b244851be82bb536ef5522ffb04 | ORPH
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/19bedb8742b2b6d0be4582100dec12a64a812c85 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/66b108bdd0582977b3777ab47ce2eb57db54d32a |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/cc107177181357e40ec5d724770f70cb8ab5ad4f |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/c14f5861d9c93bc6765ab22a12d8a2a03ee5a0e0 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/460f22c166b7365cad48beb81a7e494cf265470b | ORPH
   sparc     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/070eccf8396e7689cb2092fc184c90af116111b2 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/814411ce7473f8c26c889a035ae30d543f90670f | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b7404e3e45dbae39e0dafea54682c90ae30ee542 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7924f3cb6dcc52edbcb51ff69d6cdb13b6d75a84 | ORPH
   sparc     |    gst1-plugins-bad-1.18.3     | NOK | http://autobuild.buildroot.net/results/7605dda6dd98667bc2857c2503e3f469ecf50834 | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8eecba508e86d3734a28718a9150c12f231d5715 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e9a9e084aaaeb2c2a94b6343778e2f3cab5e0db |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7e6ffaba6cd16f0eaadadbe6ece4da98e8d6ce20 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d84c0301f4b6e13e163ea37bf28ce3cedef9e124 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8f2185ac5eaa7e86d71f39acce43c319c09fcf0e |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/fe21bac550983566e92fbb95c7be90f57c62c78d | ORPH
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/7b83e3a6b1a3503168b38e04fa8c2bb7ef665ac4 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/1db13c1640b2786f3afbf89325fdafa2036ce2c6 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/fbb420fde5dbede0c6db2d3ca54a0c25e8eaaae0 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/2fd815420dbcf936111c476ce2cdf903d4220a56 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/367ad52101f2204926adea58242676fad61945f8 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/18a5cff895b8f123eda95e9f3e7cb96fc25c752c |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/09c52c8bcb634c49184ddd3c3cfeb3d5f8dbc5d9 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/9885ce01138cc0e142e2e316aa80cedd904a9a99 |     
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/7cb9ce0c306a80cdca18bc5e6162ae7970cee239 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/aa46eb365791abbe6e497a0be3f30fdf9c1d54a8 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/03538f2e9bb718c4cd8a87b05688d75618794e86 | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/2e845d31345e0e2590a13b6986c1dc9444557ec9 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/1f874851a65fc8d2ef6b8e6b1cc9e8608fbc06af | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1b17798e21cda0c33a4763f0432a57109b2485d4 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/e4fda48d248eadcae86566cd92ef1456bf03ad2c | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/71ffd53a2aaad8f911fa6b6292af286823d8dfeb |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/02f19af0adf72eff82426e5fd113068a28849c36 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/730e49aec4f6d9655cd2a53f4efb9fff7a6fbd05 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/fbc3b2881c41dee22fff06edf9493adba8122362 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/40ad51e6c6199b603c7ac5f97ebd076c3cd6ecc2 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a26edd2b44f789e9d2411a1947dcb4aa0ec71cb4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b5928839895757f4ac90a90f896be5c0f11de915 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b84b70bfd75f85b46940017097082cbff5332800 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5fefc4d8c7a20941f8fcce305914d3e3d48ee9b6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2825a08309579af49417afec9e1d850b730d3602 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0a535081dd4979c32aa3114c4de5c7026bc3397f |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/a7bff50b22801f02b944b628be927be222269962 |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/f5ede7c3933e37c0b6536aa118606a3cbb4f9e92 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/68780d9baa3dc9577d18d33ba2c3a3c9f8b5e6bc |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/d15c039531256912a7fe0951690cdabe3b1ab597 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0c76f097f77c0f712e9924002294465fcde6ebf7 |     
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/375cbbfa966154f3e874897e4082b50c443d0b0a |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/db7437231bb125b0a384e74f2d986f7d496ae477 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/de56ef626bfcf2f26d78ff1828990c320dcc7285 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/81826c4fbb7c91c4961c5286a212bd0575e64b7c |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/832f2dbe313c377a0306d677abbd0eaec6f6493a | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/d8d60d317450b3314f7476d75c13065a3d79db78 | ORPH
  sparc64    |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/314fe9662b4ebe3b2b1b738b9bd565ecd5d9dc4f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7bc378fb65021446a7f2192503057c984544d74b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/89d98c7196f7777bf45ed3b5e483321c0466b22c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                        bustle | 1 
             kismet-2016-07-R1 | 1 
             libopenssl-1.1.1j | 1 
               libtheora-1.1.1 | 1 
                    owfs-3.2p3 | 1 
                   sdl2-2.0.10 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |             bustle             | TIM | http://autobuild.buildroot.net/results/53b27fe12c044f52c441f0240dbe9ad2396d50c5 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3fe6df28a7c507a68f9a03658f5bd4c07c301730 | ORPH
    m68k     |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/117d8747c1782dc6e0dd7ce4b1a1df3242912a42 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f50aa82a2d7dd42f26d411c3dd4c7afaed5aef24 | ORPH
    arm      |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/db520851c681b7c4d1d34f9e28a82abb3ef9a383 |     
   nios2     |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/deefa8fd56fc9844cc15b97fc300fd6a6c804ac4 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/06036daa0095045fd937535c4ad2363c485022f9 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
                host-go-1.15.8 | 1 
       shadowsocks-libev-3.3.4 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/430c116fabba36a4a7666de7bbaa067241337403 |     
  mips64el   |         host-go-1.15.8         | NOK | http://autobuild.buildroot.net/results/8bfb0b9a3f9cab9ba46d5b937d9f875a9261577a |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/5186861c30beedb0dbbbef02696d43d7d158502f |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 4 
        host-sentry-cli-1.57.0 | 3 
                  dhcpcd-9.4.0 | 2 
          libxcrypt-legal-info | 2 
                  monkey-1.6.9 | 2 
package/libxcrypt/libxcrypt... | 2 
                  perl-gd-2.73 | 2 
                proftpd-1.3.6e | 2 
                    brltty-6.3 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.1 | 1 
                     efivar-37 | 1 
                elfutils-0.181 | 1 
      gst1-plugins-base-1.18.3 | 1 
                  janet-1.15.0 | 1 
             kismet-2020-12-R3 | 1 
             libopenssl-1.1.1i | 1 
                libselinux-3.1 | 1 
                 mesa3d-20.3.4 | 1 
                 python3-3.9.1 | 1 
            qt5location-5.15.2 | 1 
         s6-linux-init-1.0.3.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/555f0a1f159d01ac26b909601e8f9d92d0477562 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5bb99ae1c1eca444f7532572ac9b076eb43e5ff8 |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1fd4545e2620ef284991417e7cdec3581a80f3f3 | ORPH
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/52a59413a9ea31bf63f23d0a75a3295143feff90 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2d3f92f9105df1f1fe0f1b1a592a1a879998914c |     
   x86_64    |       docker-cli-20.10.1       | NOK | http://autobuild.buildroot.net/results/3474f8304fe79669ece9d99806e80387a5b259ce |     
  aarch64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/a006e8a9522fccf67006fefb4a269353c49caeb1 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/b9a637ec3431f97d9b6bc1e44d2f2531cfd15be6 | ORPH
    sh4      |    gst1-plugins-base-1.18.3    | NOK | http://autobuild.buildroot.net/results/6d6c54ff01293f8339263fccf86b6b7c8b18f03a | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8adeb7b6d9f9f97aa2968102d58fb79c11dde137 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a6066a7c13385488cae3ab0f29040360414146d3 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7525ae533b2e8d35a2d01fdbc5a1da0b20d77c5 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/13a029f884291020b147c21d792c606b067735e1 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/aa50f21c5f7f98ac8c1794ffd32579b67e51e7f6 | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/dcb5d389b0c1fe224af37b9417ae8d541e5737a8 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/b279232cfdb1663ccb4968f07bd504d35a8f0b9b |     
  aarch64    |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/0c07d369dfd7512886c67bbe46882e78e042bee6 |     
    arm      |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/74376d0e616254bc9fc9c58132041c8a07a3c8dd |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ba2c413c843a636e90f12f9b81d3bead8e00dd91 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/94571f2241470a78104f5d99a1c4617a61e62770 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/42422b75782a76999c6592c658521a03ab48b0d0 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/83d59cdfd45f011da69dd3ba6f6feba2f72c0161 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/206f241a3338abf4d8300ef63f9d8f6606f0b4df |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e8af0cd95b99eb60bb82dd00caba736c2e1dbfc6 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e354d89f8877b32a9877994e71c5a9dffab24d89 |     
    m68k     | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/7d5c005f41a80eb8e7ff80eb7f53680244310136 |     
   x86_64    | package/libxcrypt/libxcrypt... | NOK | http://autobuild.buildroot.net/results/e04bb7cada7aaf35daee9709005eba8a1e2419ad |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/850038cf2921f59682ed0b8d8c49a085668af109 |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/9fcaea811c008c4a0531ae40dac559ce0a0ffa64 |     
  riscv64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/f6686c471fb217732c95a81fec1b93f1f92acdce |     
   x86_64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/dbe3136cfc99dc21f55b267c1ab8c0d27d429592 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/0cf34d7a6cc1b1ba4e5b7e7711a9f42c69cfcc7b |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/1e95e3d5f026cfb21f70d5fa7e5d97c0a2f86c54 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/6e6236f27088f450f9700676b96b3a3e674df59f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ab4f12914e5b1aed03f50c5fc2f9f479d5153afd |     



-- 
http://autobuild.buildroot.net
