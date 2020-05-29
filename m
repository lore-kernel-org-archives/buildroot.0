From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 06:27:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-28
Message-ID: <20200529062708.02F3321563@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  4  |  1  |  0  |  5  |
    master   | 92  | 48  |  0  | 140 |
     next    |  2  |  6  |  0  |  8  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-gnupg-1.4.23 | 4 
              host-grpc-1.25.0 | 4 
                qt5base-5.14.2 | 4 
                  assimp-5.0.1 | 3 
                 gnutls-3.6.13 | 2 
           host-nodejs-12.16.1 | 2 
                 mesa3d-20.0.7 | 2 
                   mimic-1.1.0 | 2 
                    mpv-0.29.1 | 2 
                       unknown | 2 
                 xvisor-0.2.11 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                     avahi-0.8 | 1 
               belle-sip-4.3.1 | 1 
                   cvs-1.12.13 | 1 
                host-gdb-8.2.1 | 1 
           libusb-compat-0.1.7 | 1 
                   mpd-0.21.22 | 1 
                  ndisc6-1.0.4 | 1 
                     ngircd-25 | 1 
                 opencv3-3.4.9 | 1 
       python-matplotlib-3.0.3 | 1 
             qt5wayland-5.14.2 | 1 
               qt5webkit-5.9.1 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
                 samba4-4.11.8 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f6c3c88f6b11b72cd37fed6c94e85b54736dec8b |     
    i586     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/641ff8588cbfdc168902115f809e7ee07bea1aab |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8e45fa66380beb6297012a2e42be12a43592ba36 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/13235020fca60f434fb8d72b1d510b5d17ecda6d |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/27488b1fe068b481cc613f6a0bba60c324a0be06 |     
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/e42034230c06bde79eb1a03f7922e8f96882c151 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/9a9234840f400883466e7070d72866ced05ea657 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/89fcbcc76e8b0e26aa9db96070127dedd1663694 | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/2f599bb8f51fa573bb95c5fb2da0e21118423e72 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/383969e756ab4245d17034939d419456f7629dc4 |     
powerpc64le  |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/810a3e143120b420db7cd19499a22cb3da7605b8 | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/3bfcef2575bb9165e434cae9778946d83c2c6be8 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a1cf020dec9402a016a6f7a0a962a518a8287e6d | ORPH
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/b653e30a10dd480aa9dca9d90772a18dff9ea488 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/49f28647f47963a502db4ea106332f7e1256c581 | ORPH
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/51c637627177c452b473d98613dcf5df1e23a31a |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c45559b239ddbfd7d364ed2e935b24fac3d24610 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7b32cb13250c8c10ad935edabe9db9568a8fb5a9 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/74c40ec97054f1b7b6f44bad34c64693d88326bd |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/f012559e55c9ba446e4ef87cb517c48a92565435 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/46e7f2c44bb6e27b083f74f3975b5fa6e46e71e6 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/77b1548dc0d90de48f5d5d5a81be9c7950fe13e1 |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/45bd622349f848df18ae88cdd8cda6ec4f6a4c46 |     
  mips64el   |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/b9dae44fbe4bc11ce27fc86886ed1ffb44801f7d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/975211f5ea455a4d8b8dfca24c222a7d64125b43 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c5f026b958d36479f3afc2a53faa1f4faac07047 |     
   mipsel    |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/b10d0c66ec4c2f14651aa80e5310727c1f429ada |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/8f28cd72d0e6681b666b96563e77a6604c87679b |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ba254e31cb6e6dcb163a7c3e9bd38e4398557584 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/173022343e6b1312636fed1bd83cb0723cb7cd82 | ORPH
   sparc     |           ngircd-25            | NOK | http://autobuild.buildroot.net/results/078a7afc432786316a1d2ea03f96444ff741b942 | ORPH
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dda478ab0a1e2106cdf401b17471dd38afebab30 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/38111a4300ddc648c41cda886fd0827a00229f05 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/da9181c2cba4f674c75f9966a857038e2fe4e0ac |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1b09668089e11231be53afa807c446e137f52b3a |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/32aea211d31794230cfa686a08794f0e2ce8d7c9 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f9173c3a31d09d3628a0568902867c2f733182b1 |     
  aarch64    |       qt5wayland-5.14.2        | NOK | http://autobuild.buildroot.net/results/aa1bd387684b352d512c7935be91fe36a9610387 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d0b77c4abc2497c99f9c21163c9d8f7778486f01 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/85178d45d89525a89e6a99f0c2ef1adce8cf55f7 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/68cbf7ed309b16bc422b8339a4aafb9d75c7abc4 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/264e7e44df1e12ab199f9cf4e100dfb48488e0d0 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/5dfc81ed5e953751116ed83759817668f9773f13 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b4b30a75f201cc79e5185c669433352ce5ea2baf |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/89ff6116eeec5dce04753a6008309197d90ac4af |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/ff51e29b0ccb6d6242aca842dcbb36912d54ce66 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/46f233604c64af5eac3e12681d7c5434cd1afb0c |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/12d40fc30a839d72731dcf096386dfeac7f5b3de |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/e48450c0ed27a5239dc44659ce7d9af02935f3cf |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 1 
         host-exfatprogs-1.0.2 | 1 
             host-gnupg-1.4.23 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
           host-wayland-1.18.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/7964356cb585359c30c11c8c29a128c059a10935 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/e01cb1fc3c165ce556b5150cb7e4545061ae9bd9 |     
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/00bb8b9bc8eb67bbc882807cc1090543349b5ef9 | ORPH
    arm      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2d7d90598eef4f7123ad9f09e3e32cf35ed78dee |     
  aarch64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/af6d200d1d2e879662dcf4a11542f0ad8a2fe774 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/2edb84657531f3400d0a51664b6db879e86fe7fa |     



-- 
http://autobuild.buildroot.net
