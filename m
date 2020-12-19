From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Dec 2020 08:14:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-18
Message-ID: <20201219081445.8202D8791F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  0  |  0  | 15  |
  2020.08.x  | 16  |  1  |  0  | 17  |
  2020.11.x  | 16  |  1  |  0  | 17  |
    master   | 71  | 44  |  0  | 115 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 22
                   rhash-1.4.0 | 5 
                    qemu-5.2.0 | 3 
                  boost-1.74.0 | 2 
             timescaledb-1.7.4 | 2 
                       unknown | 2 
        host-sentry-cli-1.57.0 | 1 
                    htop-3.0.3 | 1 
             kismet-2020-09-R4 | 1 
                       kmod-27 | 1 
                 mesa3d-20.3.0 | 1 
                 ripgrep-0.8.1 | 1 
                    vlc-3.0.11 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6f67022688a1ede227a21a92d9eb0edc9be67184 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9de3817f6ee58340f57c8252a0ae5cc6ac92c8e4 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fa2c04fb9eeb15791a5277cda1ac1109a4d6a8bc | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5aeca350cb995f4f3420543c9ee9be245252d44f | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/13563bcd68316634236f12baf4733678436f9272 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/98dce06bf7f675df9d3bebbd1f5c9c9bba95d911 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e0691d073dda801e2c41814f75cfa6a787b654f7 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e017061674d1313be84b3dc82275d71d61f1d0ac | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/02619b637ee5a669ef30f659ba886f305a357d29 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9f02cfa6eb75443681af0a7183ec0155af55df58 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9cb400b6c721816c0285a1de03f3f62adde37e30 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b622e8221efdd2467f0a0cda563ab9b7a9c8e3aa | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b07588e2186c8aa3d284d454a371c13d532c647f | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c90a30e91493c6b2f10f3fd4292aef9998163af9 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/68137fa156dfca7926d3796736f66c1495ca8a32 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5e3bb3bab1c43dee30c62a80ecf0a53b58704395 | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/66cfc62956f8f57b723fdff3cd1274b06a7fbc7d | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7a0b1510356025ade98ddb12be25f762e83c9660 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1beede3e51fd3c2921baf15416891d2348534d7f | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9dfd220d5ff0e97b346884f248b27b75cafe3b31 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7d5abaf3411c4697621a0f66bfccb604038d2420 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/72135fbe797009d670afdd0f86bd62d67e815fc3 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/72166abf7b26f5ffbb158ea4920bfeda84ff1c6f |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/4df22c67c63f5c724106eea2d7f2aeba37dce263 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d941a26492404de1c88afea9db6809c3b9ecfa1e |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/cda7ee8d15ace3e2eea3e2aa26ac16ba3d7059e3 | ORPH
    arc      |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/02797820cfe54fe8186def1b424ecbde5b474d29 | ORPH
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/a306f1879ec06b811499f9545e310462e9bbfc57 |     
  aarch64    |         mesa3d-20.3.0          | NOK | http://autobuild.buildroot.net/results/af6ed35ba1c44fb4540668d9849d4527c25fc17c |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/122d54c7c53414f709fd22d578020b89a4d00ee8 | ORPH
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/bec5634b7e0c59be7b2d5ee50526512a96b17d88 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/7157066821fd91f04529b57df2f7a0430b54f6cf | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/6fdba6a1405cb5ca320ebfef01126a0a90714a3f | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/56e8cbd118626c8b1c46225b0607d57903752268 | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/32b69acb352d4cedbffa6c592b798d70f0683434 | ORPH
    mips     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/03b39c57e6e82b6dd20c058994a47e60ad14d5eb | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/1ce21dcb360bda3bf9d732a551854ddc1326861e | ORPH
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/cccb7bf765b171509a2f2af77b5573dd7cacdd2b |     
  powerpc    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/b939db63f4c11b49b3bfaad73778e2ae09b59930 |     
   xtensa    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/d4c63c433a81c9391d8cf199d779649344024674 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/375eea7fb2d90d4e2e13763308e7a801af341c4f |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/45ccafa6998ca0c4e8262ddd91cdf40ed4650340 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/ee7ba9353c1daf0f4f3bd3c7783c843e4724bcc7 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/3320734430510efa04d9184285ac1448fb7ac46b |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              asterisk-16.14.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/d4e06d9b8f4649a4ea921f7b0988a023815f2348 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2437d4f8053c2702005002485f5de38f9f8ef85e |     


Gitlab CI results for 2020-12-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   chromebook_elm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/917539050  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/917539230  |      



-- 
http://autobuild.buildroot.net
