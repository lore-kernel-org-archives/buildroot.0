From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 May 2020 06:26:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-22
Message-ID: <20200523062656.A111E8693D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  9  |  8  |  0  | 17  |
    master   | 81  | 43  |  0  | 124 |
     next    |  5  |  6  |  0  | 11  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-gnupg-1.4.23 | 7 
              host-audit-2.8.5 | 4 
              ibm-sw-tpm2-1563 | 3 
                qt5base-5.14.2 | 3 
                 gnutls-3.6.13 | 2 
             host-elixir-1.9.4 | 2 
              host-erlang-22.2 | 2 
               libtheora-1.1.1 | 2 
           libusb-compat-0.1.7 | 2 
                    mpv-0.29.1 | 2 
                  assimp-5.0.1 | 1 
                    brltty-6.1 | 1 
                coreutils-8.32 | 1 
          host-acpica-20191018 | 1 
               host-efl-1.22.3 | 1 
              host-grpc-1.25.0 | 1 
                   libnss-3.52 | 1 
lrzip-8781292dd5833c04eeead... | 1 
                 mesa3d-20.0.7 | 1 
         python-gobject-3.36.0 | 1 
         qt5declarative-5.14.2 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b6a1a55e7c6f4115cea1a9c5f80054ee3bde5c2e |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0ce1b1e26cee39e58fb33f67b1c3cafca9236a0b |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/af9f4b95188c1f58551d800e8a8f988d8af8b543 | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/b0482b0404168278bb0de7d6cb31fb7cea108b12 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1241999cfffb7969d8ec11a11596efb3c9d03207 |     
  aarch64    |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/70c09f1bdf39a970f093327f7f8ce275b17e4272 |     
  mips64el   |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/ff050a2314e813223f3854fea0105c8c46a9759f |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/56ce18c7f185a01b3918b23c07c052fa9d0168a4 |     
  riscv32    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/0ea57e4e4f7216288c3f8f23136bbc4c8517cc4d |     
microblazeel |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/e539dbdd2405e4c853d311d37d8b9d39b7889fcd |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/ac487937c6bc51acc2ed9251d6a8d2f4e57e98f2 |     
  aarch64    |       host-elixir-1.9.4        | NOK | http://autobuild.buildroot.net/results/26a2e408b2ab5d612f7007e3c62d8582bfce0a09 |     
  aarch64    |       host-elixir-1.9.4        | NOK | http://autobuild.buildroot.net/results/07a29f2e9dcb37e3c0a4b0f1599a2fe17cc94479 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/1e50d5413a27d65c8605601b93921ecf9103a43c |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/84dfb78084ebe9f86603ab30cfd4dc83006c72c2 |     
   xtensa    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f9fb86b659b198717bbd7b4c8dfff96805bec2d1 | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/523808fd79930fc71d32ec60a9bf65e8c45b2ee4 | ORPH
    mips     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/9bdb6824c0c553f01db7b1203aa3ddcb1891003b | ORPH
   sparc     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/0156098dd7c729939398f836df205a5dbd0520c3 | ORPH
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/e91b74a02ee566db93a60ad609580bb4d8fd0978 | ORPH
   xtensa    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f598632ac50b4947b4407b677d2da298fc311f00 | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/8f7680eee5fb0f63506209959c58547264339d2a | ORPH
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1d3b73585ccf07b75b59d5375a5b2eae750416c |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ee99f3c421bf92f0de47577a6b4aeca064001605 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/54573188bd1e0e39bf04c6d7b5978ee812345c20 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1b2f6eeae9d4a6472e8e1d316ac59351e169207f |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/799aed8d1a5f3a855e3710a679f861cf31492421 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/cec47db7e5cb81897184ab71f7f52f3b90a4217d | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/33b9e03da73a18ece9e6426a72f5c76056623f38 | ORPH
    arm      |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/1865c3fd8d64212462584204417128db6d8a2727 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/2aed1211081c7de6db50af90d5df961c2f2ae972 |     
   x86_64    | lrzip-8781292dd5833c04eeead... | NOK | http://autobuild.buildroot.net/results/1ca6db24ef26c57d4c129de7e98383e7e58b366b |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/fe703a188c021b7ca71af55344a1ff4324bc466a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3d520c27fd6b9e34349dc9d22f4f0ac157007cc4 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d660ef44f1e80dddff6ad6963b166771c4fd8a9d |     
   mipsel    |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/65c049ecec56532f1d8f6369e1a8f51b651ab68d |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/caf9b77ec74e8c43ecd513b417f3654c4ad4ee4d |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/fd9e0dc973ad61903e9880eaee03333281c5e899 |     
 powerpc64   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1fee8d70d00613b0add63b831690deffc53a9a9c |     
    arm      |     qt5declarative-5.14.2      | NOK | http://autobuild.buildroot.net/results/ec5854aa892eefb70d6e7a7f9caae1e12fad08a7 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/e247a9b4e24a916c77c7c2d6e830333cf9a9db7d |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/0933361e6c9ab2dfa41446a146c3557860ba0bfd |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/dc764302090e86a4d4b519247673bf33ca5ea35b |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 3 
              host-erlang-22.2 | 2 
          host-checkpolicy-2.9 | 1 
           host-openocd-0.10.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/afd43cdc25d0ae653a5d9d7060e3937ed657d15f |     
    arc      |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/9c4f8af9fe70454f787712b166f87cce12ee8799 |     
   sparc     |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/de09ea522c7bc973d268138c6064cf262a0a8c9c |     
    arm      |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/f1873380e86d2dc8b8c0d60d7bdcb9fa880aa00c |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/776089ec963f1ab8b3a57b49a1eceb52b2f354aa |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/90b28c1f695cfb5ad2e5f044a578b40ba88e6204 |     
  powerpc    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/a11dcb66e5712c13db0234496c930ed6419079dc | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/df69fbae801dc80aa1480685886bf0284d6af96c |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                host-gdb-8.2.1 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
             host-squashfs-4.4 | 1 
           host-wayland-1.18.0 | 1 
     python-argon2-cffi-19.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/22b4428ef41decb9424041c860dc3cb4f5bfb9d8 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/c24dc08b37cef5cb11235ad901a1ec2ac976e194 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9652add41c158830aa2530fb5893179f3ad551c3 |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/54c9f3b9080ee01cf1436ff823357af57d772fff |     
    arc      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/c3361c176111a0904f9044a70bd625c05b754c56 |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/f9f57dd342509d504a07d4f1c042db648afe30cd |     



-- 
http://autobuild.buildroot.net
