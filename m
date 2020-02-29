From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Feb 2020 07:26:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-28
Message-ID: <20200229072650.3FCDD85FC3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 22  |  1  |  0  | 23  |
  2019.11.x  | 14  |  3  |  0  | 17  |
    master   | 140 | 49  |  0  | 189 |
     next    | 32  | 28  |  0  | 60  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 5 
                 rocksdb-6.6.4 | 5 
                 opencv3-3.4.9 | 4 
                       unknown | 4 
host-python-setuptools-scm-... | 3 
                classpath-0.99 | 2 
                 haproxy-2.1.2 | 2 
                   libnss-3.50 | 2 
               libupnpp-0.17.2 | 2 
               acpica-20191018 | 1 
              host-grpc-1.25.0 | 1 
             host-guile-2.0.14 | 1 
           host-nodejs-12.16.0 | 1 
            host-systemd-244.3 | 1 
                libgdiplus-5.6 | 1 
             libopenssl-1.1.1d | 1 
                     lxc-3.2.1 | 1 
                   mimic-1.1.0 | 1 
                   ogre-1.12.0 | 1 
                oprofile-1.3.0 | 1 
                    owfs-3.2p3 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.7 | 1 
              qt5script-5.12.7 | 1 
                  ramsmp-3.5.0 | 1 
                    ruby-2.4.9 | 1 
                sqlite-3300100 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/77c891b625d3fab245cda13bd52123e584776aed |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a9aa9ecf0d06e2e69fab54f0efd3b9b012fcefe9 | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/69b63a4e90a33bc6cff99aa358017ca6256270db | ORPH
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/6fc6e31efb5fea2dc9d18d8361d5075daf627930 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/72505aa8adba140cbcdebdece511210fcbfddb32 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c67698f83ef6ea060492a32f148f9f71c95c070 |     
  powerpc    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/91fd5e1946b1f609112cf4593897fec692e44d9e | ORPH
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/d2bf76e65ae716ca747d0ebd4c27e5aa71c06f84 |     
   xtensa    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/4f35895bb2c6b6a174770f8ebba16a6b12f0b46d |     
microblazeel | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/2c7d94bc57373e9f6dfadc82cec169fbbc72a1d2 |     
  riscv64    | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/09703afcee50ce274f1c4cf6676b99fa6d6e3ecf |     
  mips64el   |       host-systemd-244.3       | NOK | http://autobuild.buildroot.net/results/e03ae6a3209eea00459b94cee9c10fd4f2184fec |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/6f4d499938e7ef0c5ca51755e2211ac961a34fe7 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/bfdb9050fff95593f6bcb8592514a7bed01276da |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/d742950040fed979ee9d841057ea5f179fea6a85 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2bfa12df41afa87f62f482d8a1a0774111e30955 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/fdcc85a13d35a28feb1be92c3ef1da3c2e676608 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/68711eb5d3dbd30170d91b6f21f641ca4b10757f |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/bf06d1ed74882d4285347f4aba2ed52b1a93ee9f |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/fc01a0544ec258ece3a5ae7c8e38b37e4697b956 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/991c9d1ce03130f7ccb9585552753926cdec6ce8 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/cd13238320a913f808f731627f2a9b7def461ff4 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/558ba83c659fcbe2fedde3da1f86c179050f5e67 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/17c2319850f02f24da6fbef9656c07f86fdc5a3a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c11ba36719e4439c598900e3639750e7971f4461 |     
    mips     |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/f53d0e5ae7a57a619352487f6ce01f55aaf60445 |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5fbe45ecd6e3c6a9b6c5ecda2bf022d65878face |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c610b61ece4452fe04351d8af3ebd0bc40e68f0f |     
  riscv32    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/aaf1d2fbb3c7e2d2b0b9cb5a50a2caaeabc00658 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/9144e1f89e5fa0a153b2625ffc5a7ec411bc4b21 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/939ad99c62e6fdee1d3ef7e7c608ff7b7a6da7c5 |     
    m68k     |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/f0872a4fe2d6789d5e12ae2c17aae80f7f827122 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/5eb06d9a14c3a0445b4ea862b8d30a8d2a64019c |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/6f0d8bda5cc334e3aca8ae52a294d2b44f323878 |     
    arm      |        qt5script-5.12.7        | NOK | http://autobuild.buildroot.net/results/b5ff4dd44b93b6ed29f209bcfb2a64b7e544af45 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/427b194d38bee87cdf63cc76697bb78a9a8cde19 |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f77b7395a34aa2e457165f29391cd85e91289413 |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/d7aa9d2a292717289d01b15b8ca40cfd087ab8a6 |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/361c5f669ad5c2db792637f6eace91951c5325ea |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/340c863985d02519844946dc0193247bf0abbbb5 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9b1d2b8be0fc4f80c02ddba887032e14cbc7947b |     
  mips64el   |           ruby-2.4.9           | NOK | http://autobuild.buildroot.net/results/d0ab5334f195a400a6d6dd6c49e3c1a2001b2b70 | ORPH
    arm      |         sqlite-3300100         | NOK | http://autobuild.buildroot.net/results/b452676efadc7518ede1a1c342de234562b51523 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/5c35510e4c0dc6073dc5ed31675874d326854a24 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2d18100fb555bf0a04ffc0b58c527aa440f9d2a7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2f713e6eaa571c3278e277deb19f5e90cbf7f50d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/10e06ae30f6f8d962d871ef0c16253e07db961f9 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/aa4857841c958c9851fe76a184f66ff6c73dd2bb |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/7f87d3784a3346c3f1584b33f5292e17cd76f7a7 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   gupnp-1.0.4 | 3 
host-sdbusplus-4212292bcf13... | 3 
                linphone-3.6.1 | 3 
psplash-fd33a9b3d68c89fa22f... | 3 
          python-jinja2-2.11.1 | 2 
                       unknown | 2 
                 augeas-1.12.0 | 1 
                      bash-5.0 | 1 
                    brltty-6.0 | 1 
                   erlang-22.2 | 1 
             host-guile-2.0.14 | 1 
               libglib2-2.62.4 | 1 
             libopenssl-1.1.1d | 1 
       linux-firmware-20200122 | 1 
                 mesa3d-20.0.0 | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/deb37d4358658b303ce27a7e78406748620261f0 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/67e3246b92e71dd8b36aeee62ec444d4d5f1eb5a | ORPH
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/984cbc1b2a296e61b72b48814be50193dc6c11f2 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5fb0c36270ccabac03d26e24fe6cfa971dd6bdea |     
   mipsel    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/28091ee2ee696a713bdb45340a0aab3f240604a6 |     
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/8cc6d6d1142bb1e8ff22a2df92b683583429910d |     
   mipsel    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/6ecf63ed06f497e67dad1ac5d57e5892a9e2849b |     
  aarch64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/c9ccdaebc2c7d1dfbb3397054171ff11ca76b749 | ORPH
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/57c51c22900c88d548f3e3524b3f56d13872cdab |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/208179bf51e8314fab57902e7f2c837720beee02 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/16d05698583199b555626b649e2e7b68c80fb46f |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/a6291e037030dbd197e3610ffc7d1ad1485b18ac |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/9b5c8c48b7623f71105705e220f7de4b856c8c72 |     
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/98ab0c7c971fb1fd067e713fd00d4f22ca80c229 | ORPH
   mipsel    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6b89008af9b7c65d446ab8d31bebac06cca7b80f | ORPH
 powerpc64   |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a99a0f6caee2b30db06fa9d0b3156cd2318e8937 | ORPH
    arc      |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/d6d4fcfe3cbbebea17bf24a1422f8a0c11cc522a |     
   x86_64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/f262b7ae77c45f1e9a90c641668ee30675d37c45 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/60fcc34bbb4a669804d8f28d415bfbb5712c2791 | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/068f2987f6e21b41f0d37c250353e23c945774a8 | ORPH
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ab70719d1bd083ab0f3d858a085a04d904115407 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1f512caf073050a51a8801fd7081c58a70a1733d |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c94baebab8d0f55b172bd928686677119acb2c19 |     
   sparc     |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/a2af3eecb7ed4ddd893f7a4da6de1853d6b7bdae |     
  riscv32    |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/bd3887fc34f14f5dccb3de523912beda4de46e9c |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a5f2ee5b44fc397f020b5c181d743aff55a9b7ce |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/151471f76e2a7b3cb9076a098b04fc330d4cc049 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/386e73670f8630fd1b2c02537cf75084ae4f8a97 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/808cccb984247b559dca658009e40d3533ac6f4f |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
              jpeg-turbo-2.0.3 | 1 
                    mpv-0.29.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/5596c4e5e7e82794410a5adb8bdbe82bd06cac42 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/5c60461743897def92931859da35772276ea20b0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/acf8bca73df67bcaae51d4b39ed7c4bfe0d75ae2 |     



-- 
http://autobuild.buildroot.net
