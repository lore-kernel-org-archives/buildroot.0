From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2020 07:09:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-21
Message-ID: <20201022070952.D5A0386B2D@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  7  |  0  | 18  |
  2020.08.x  | 12  |  5  |  0  | 17  |
    master   | 114 | 67  |  0  | 181 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 12
              asterisk-16.13.0 | 7 
                  boost-1.74.0 | 4 
        host-sentry-cli-1.57.0 | 4 
                  ndisc6-1.0.4 | 4 
                  uhd-3.15.0.0 | 4 
                       unknown | 3 
  gobject-introspection-1.64.1 | 2 
                   libcap-2.43 | 2 
               libuhttpd-3.4.0 | 2 
        python-m2crypto-0.36.0 | 2 
            qt5location-5.15.1 | 2 
               apcupsd-3.14.14 | 1 
                apparmor-3.0.0 | 1 
  binutils-arc-2020.03-release | 1 
              bitcoin-0.19.0.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
glmark2-c493520253fbfe3676c... | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
                host-gdb-8.3.1 | 1 
               libupnpp-0.19.4 | 1 
                 libvips-8.8.3 | 1 
                  luajit-2.1.2 | 1 
              micropython-1.13 | 1 
                openblas-0.3.9 | 1 
                openntpd-6.2p3 | 1 
                    wampcc-1.6 | 1 
xdriver_xf86-video-mach64-6... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3be4b86662fa5832989e7faee761b72a37ae97e9 |     
   xtensa    |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/8febc0008ab1ddfd2eef9e669d84a95d6bfb6a2a |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5de2d72fa6764fc986ef2179f72fd6d4325705de |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/b4efe437fe0be9e8ab289ef1edabf3dae677184e |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/eb6d3ff222a58df75c0994a9154820b6ac892468 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7a5149b60b6ee8fc446240439e511a1b8fe1579b |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/589f8a908d2d0e006ad1ccaad64996c34de931bb |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f37739a7a2d186c86bcb4eee85c08a7038ec6edc |     
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4545f844299827d4ba775283cd8b590dcb621607 |     
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/3e503fc92b3e3ac3cb52e56f937001cdd798a3b2 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/22221798001a98f119cc9066db63d1155ca67a96 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/a2c5122e075ea66877bd0c499c22774e804a25df |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/9f70f1e796850c6a5ea0a149189321f118f34e4a |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/2d891974950b2b7367d4f1df4a585a3207879428 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/b1ba3a4b8f3b960ebe58891ee613c9f6ec4be989 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/56d90879ccbb8bfa14857f5f47fbc38de8e8881c |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1d0961570bd78199662e4872a2834ca72f85ce3f | ORPH
   s390x     | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/7cdf81d1d6b7425804b6b48e2fba5121777e060d |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/23dad30bc12f06b4bd42cc2a8b1367f5e6a533d8 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5de1176b98d6c30a30c8a6ef2135f3d5a30e6d6c |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/abc98b75ffe74ec9a3d5f3983b40f48e2f3f7984 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/39056fd7b63982584308ac9fd0f2a43980eeb605 | ORPH
    i686     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/264ae28f13267c9d46d2c9637db86adca2f23eec |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a43319c78866b1184d665b8c4f3e3165216d6ab1 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/29b5508d61cccf429215bae19b704d6b729494b8 |     
   xtensa    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/0fbe0caa6ba1cc0194766ae4a1711050942cf04a |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f823a90f742bc71167c63a88be2692666c87b17c |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/3146e87274e1f0e588090a45ebe939d62f33ed1b |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/5c7fa44fd41922a7f57860a71edfc82823a823bd |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/f0e6be554141a392d612a444e7a7da594d19a448 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b4d1fbeee0c44756b5c256717f259c5afe2a715f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/80466488b3786c961fb038e0d336410c58dae21f |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/69859fc021a15b97d7558f6f6446908c4abb7499 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/67c3588bba8c069ca46f0776f20bb955c3f4b720 |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/012dbe3ce42d1b0f64b8bb2113ffc8394d722647 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1d8b84b597481f3ab8e26af0e325b400cf9cfb4d |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7145a80a15aae1e0b76cd4e1efaee02b1e7e2d9b |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6f4721479831c4db6e77bf9b69e9d82be3a875aa |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7cd1745209ebe241ed7a66e08c6696903d0d602 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/718d94bf5ce44bb757352aea4c66eada49b81724 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/0ad6f394da9d10c4a3d5d2cd1bcdd0dcba14301b |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/e55e96e8d43ccdf91a658cfcc969ad783dc69dc1 |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/e462f1a426b15a89f83d796c4ad4be5d2ef613b4 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/1fc48a7ac1882640fb3ad281ccd20fdc244e3ef1 |     
    arc      |         libvips-8.8.3          | NOK | http://autobuild.buildroot.net/results/094830226aaa0a11c9eec091961655a5e999734c |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/6713d57d6b2c5370bfed6d906455b59bfb8504ea |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/fc730978649d005d28478b8a78d51169e1baa3bd |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/06eec408b39acb6a589dc6c45020a4922111397d | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7af0888172dc9e92a818130572f0fd37c2094e0a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/97e21f1aecca697801206df21b9dbdc80973f99c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/648c5056f1cd2fae873971a0c85e3429631dc067 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/8a903c63801a70b5710d9c8c2582f8a19fdfe41e | ORPH
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/1c951b00b7ff13438f943a49f457f9349b55c322 | ORPH
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/6e5e34442e51e52b863f57602b66874fdc446ee0 |     
   s390x     |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/a01f2a042ba65015584d35344e9983460ac16b76 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/b9e591e410fe74c692a401a8debdd205b6e4d2a3 |     
   x86_64    |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/53ba4b0cbb9b6d1473423f362cb5f648849e08a4 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b16f6aebda6fe728909835e678e919f003618902 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/02935c62ee275dc6130a653b3ecaf5b961bb007a |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/7607271d7fe2b92fdfebd9dd96b1a0a05a6bc939 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a467d8e51a3415891d056ae43a312f479fd2044e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/af9212e0f1013790149618a9d975e53086010c88 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/65d24577d89ddd40959778bea9d218f3abb60618 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/966cd7a9340ad7a90d514aced1e378c52ed0ea69 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c1539e9b4166d5c5ca88ebb63534289e54decb41 | ORPH
   x86_64    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/16b84f0379c791fd64e867c4787d33e9bdfe119c |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a92b6e51f741117436cfc3965bb81e23d8afd309 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              bitcoin-0.19.0.1 | 2 
     dovecot-pigeonhole-0.5.11 | 1 
              host-grpc-1.25.0 | 1 
                  ndisc6-1.0.4 | 1 
              openjdk-13.0.2+8 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/5069f81a5f26eafd0a1cf2dd467ccfc3f6207791 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3546fad9b392fc343b5dd2037acc176708d10025 |     
  aarch64    |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/5cc3dbc1113d6b84fafa5224067984fcd4359bc3 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ccea1240666601c793c5e3c3adc51b6dcdf2eff0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/443b80e716edb20cfdd4645eaefd92ed8e6a3c66 | ORPH
 powerpc64   |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/1bb252996c392bd5537377eba92f1fdc836cac91 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/62c0fe5d1820982398d9d417dc6166a2b10b2d54 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                       unknown | 2 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                    xen-4.13.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a08ee97ed9af19b9623bc706a7b53e950aa4373b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/56c9d18c98c52deb8d6841e42b00342c52510551 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/40a1b26bacaf60a4409a3769a8a293d8d1a7191f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4ace6118e8b1a3f9fd7e5a85d9ee46ca5b2234ed |     
    arm      |           xen-4.13.1           | NOK | http://autobuild.buildroot.net/results/8e4e15924621ed3f323d3213479f0e5c4776b493 |     



-- 
http://autobuild.buildroot.net
