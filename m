From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 May 2021 05:44:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-21
Message-ID: <20210522054459.E2DE440243@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 18  |  3  |  0  | 21  |
    master   | 85  | 29  |  0  | 114 |
     next    |  3  | 19  |  0  | 22  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                    ffmpeg-4.4 | 3 
host-gdb-arc-2020.09-releas... | 2 
                  lvm2-2.03.12 | 2 
               pipewire-0.3.26 | 2 
                qt5base-5.15.2 | 2 
                       unknown | 2 
                    vlc-3.0.14 | 2 
                  zeromq-4.3.4 | 2 
                  boost-1.75.0 | 1 
                dovecot-2.3.14 | 1 
 glslsandbox-player-2019.08.23 | 1 
             host-lvm2-2.03.12 | 1 
                 mesa3d-21.0.3 | 1 
                    mpd-0.22.6 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b |     
   s390x     |         dovecot-2.3.14         | NOK | http://autobuild.buildroot.net/results/16456f6181e9d63da930af1c6981f53660bed6a3 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/75d7a7622f6762d49cd18d626eaeb44c37c41d8a |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/613fdf09ec35f43382e46628955c4f21ba45cc70 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/064aa8423fac1c262a21edfd9c1e9a77e1c82a7c |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/8aa16d0c120ac8ff9bfbc719e335f132e9ed6c22 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/809957d979aa4809616f480c0706ae3a6542ba0a | ORPH
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c3201d2987f84918d31875a221b47cb83aa0b7b6 | ORPH
   sparc     |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/67f450e2b3b4aa0ded7289d7bbe0f0b63e65de6e | ORPH
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/866b205125ab85903c9bd04de300861ac8ff9b46 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f481bffec94c47322123a811acc668921a5ed4c0 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/60545585ba904098525f1c3edc722d07b6fbf26f |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11c521e0106e0223eef9d317441f5bf08c9f48b2 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7dcc2065677b8a002e6fd6339f6ec50ce0c28f4b |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/40be9981ee28cfe215de66c63206dbfa0b12de3c |     
  riscv64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/a5b10950de2a9b61c6094b9623aec2b60839ce92 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/c569e93787a5e93100b0f17baac9f49e69016d4c | ORPH
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/3a308f96e1f291d86b52f8f8ec615cfd726a20ca |     
  powerpc    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/cd52de7eb3a15b2c7a0cc1f62cf27c9105c1491f |     
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/b5ec924c65101d0d9655e5392f5ed9b984714774 |     
   sparc     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/b5305e8e7dd1a5e8bfaba72b06251056ba7d1af1 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9dea74daba7af5d3d8509b6539abbb2b9220fa31 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7a1c2c60f068bbd95e61c827fea08825d56d3098 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ce7d3f65e9ad46087b618acd0614450e66fc860f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c47da1264f97c13a52c6b4e306dcd57fb8533c99 |     
  sparc64    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/78720afb4de6555327d0028c2bb65099f8a51f81 |     
    arc      |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/233058018e442b589f68e8b7264900833cf6d18b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f99f8be84e8fe962217c3020ba4740b3b8c80dbe |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bd87d0020f524dc30884e79663754dbe14450bbf |     


Classification of failures by reason for next
---------------------------------------------

                  botan-2.17.3 | 3 
               aircrack-ng-1.6 | 2 
             libtorrent-0.13.8 | 2 
                    ffmpeg-4.4 | 1 
           host-libselinux-3.2 | 1 
                   hostapd-2.9 | 1 
                 libssh2-1.9.0 | 1 
                   neon-0.30.2 | 1 
               netatalk-3.1.12 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
               pipewire-0.3.27 | 1 
                qt5base-5.15.2 | 1 
                   rhash-1.4.1 | 1 
      softether-4.30-9700-beta | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/7c5cecb750eaaf61664f5f24e712ca40b5ba3622 |     
    arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/25d4b0b0e071ccef758d959cda1fe16236e9006a |     
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/940da33435dc8ccb6af15a285d4e271e6eef5626 | ORPH
powerpc64le  |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/ec820415074890ff0d5de97c9d19c08959cde8b2 | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/43f1ff99b81dd395c4c2c662d7f32137b2683e2d | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a0c24292471ed221e0b07ad5cd11ea9a72935c52 |     
    arc      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/603eb9b76332bbb6c934c28f0ddf78024f80ed2c |     
   mipsel    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/09ce1d8009da98cd2a3f2c8488abaa9f060a9d6b |     
   xtensa    |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/6e3a02e8ccd7c9d9cdd88c0f6db2dbba17fd6732 |     
   s390x     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/701752313c457b35c8b91f9c794cd42e9fd595be | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/8def58f421ef9e45ed762eb4ce0a01876c650d73 | ORPH
    arm      |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/3d58476a5f13d77b3f95142d9900ecf62f182d6b | ORPH
    arm      |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/2d921c3d2cd3d00327f2cbe2eed759eafc6e0fab | ORPH
    sh4      |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/21eefbd3db29c06133add75535744116d2a35f99 |     
microblazeel |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/ac4f2d0b927fb0e305eaf1be80844361df418294 |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f0c7458e678bc1be599e65f3357591819dbf7439 |     
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/02fc08a89c878bfee06d1befbff579e094ab4c0e | ORPH
   mipsel    |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/0e124cfd524d795d78f7fe2a4c1c7834d9f21697 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a6941c2570f0dedc812d0abb8268acb7c954f1d3 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
        host-sentry-cli-1.57.0 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/5a82924b5b3f122d4c17ed79a22555f0dd633d47 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d10af92e79a7e1a87cd00c907a86c39350783895 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/966310e3cfd2023e966799ce87cbdd5f35d06e6c | ORPH



-- 
http://autobuild.buildroot.net
