From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Dec 2020 08:13:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-15
Message-ID: <20201216081348.F232D8651A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  1  |  0  | 11  |
  2020.08.x  | 14  |  0  |  0  | 14  |
  2020.11.x  | 12  |  1  |  0  | 13  |
    master   | 71  | 50  |  1  | 122 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 20
                    htop-3.0.3 | 4 
            quickjs-2020-11-08 | 4 
                  boost-1.74.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                 libusb-1.0.24 | 2 
                    quazip-1.1 | 2 
                   rhash-1.4.0 | 2 
                       unknown | 2 
                        bustle | 1 
 glslsandbox-player-2019.08.23 | 1 
      gst1-plugins-base-1.18.2 | 1 
                host-gdb-8.3.1 | 1 
                      iwd-1.10 | 1 
                 mesa3d-20.3.0 | 1 
               mosquitto-2.0.0 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-5.2.0 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0e522db48100d52f237654a885fe82177d14d55f | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3ea72f4f2172284a944780eab4e338d0255f1d3f | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0ddd834cd9e4867531a9b32e9bb483dfd165b704 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/efc4dd7c9487f866d028995d8b3fe10d0fa13a17 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6a5ac90bc089a3722b4d55c2d3b6163d018c9316 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2a12adf0804ceb97998ed00b582ee6edc49cac7c | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/49ae99631acaa55aeb4829a5010a7741a6d1ac28 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/17a95461ca3ec039443bda2f8dc202084923b894 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4ba57616db73ad4af7a750ff98556befad7e0b10 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/01792eaab30599102b71343100f6b8842483e417 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2ac7c16f3bfe8657c4ab5b5ec8264b216576ae9c | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/18a1647b12d8c393147fac75eb394bf1fdfaa2e2 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/880ade2e3cee8733a1c6b88a64f38f352bcd2cd7 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2b10f41bab1eb5fc4f1ddb79bfdac917b9769f69 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/dc12e643992c0b58258450f0b3a798bcfbba6351 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4528d97aab01f42f49e0eb20c425733c3f35ca62 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/be7afe3078353f87ab6eb3882b5a82c6465aaf2c | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6c00073eafbc220ebeea386f1bd5f0adb95a4271 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/aba1084654112557f47fdcb61b2630ceb40e508c | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/461e0faabf1510370c6c21eae6fe518bf2bf88ce | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/50e8c6d8b625bc79236e3fc0596d8c3304ecd4fa |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/76851968d6ea65deb90d58a2f731e6abadb3cc77 |     
   mipsel    |             bustle             | TIM | http://autobuild.buildroot.net/results/6409bdef625db34b3445be99a0a1c880f0e0387d |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/4702539c0e70011f508402384503a3cbda13bf6a |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/f62fe0b62460dd9f386e6a30aad0221b0f1d4b28 | ORPH
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/03e44309c7fdb807d475a43450f82d678bb68e8c | ORPH
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/deac6ecdbb78e9d223a2c1618d7b3c75c662e95c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e4cba3d47af20efa5cda768ce1e409dc4835df8c |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/5ad330244546e6f087425be816aea158a1f833cb | ORPH
  powerpc    |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/121bb5f1cbdf485194c3ed48eb4d62599ade4a2b | ORPH
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/22144cafe5d6481b95b02012694843e39a51a67b | ORPH
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/9483a8f62c06f2d90061be531b759b42f17a8e0d | ORPH
   x86_64    |            iwd-1.10            | NOK | http://autobuild.buildroot.net/results/8fb1341f2f5094c346456b43b4fc04996c2e1485 |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/39ed813bcc8f26be9eb7db915d1a7b48dc8c38fb |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/6586f4aecf9a47612bfedfc503c9c2948a17e9d6 |     
   mipsel    |         mesa3d-20.3.0          | NOK | http://autobuild.buildroot.net/results/bcc0bd75d5e676930eb3e7e1cadce05a9a450ba7 |     
    arc      |        mosquitto-2.0.0         | NOK | http://autobuild.buildroot.net/results/3592f39216381e1764ae23122d2e92a05fbf3e63 |     
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/3ec3f46ad999371b54b9017939132a545ae5420b |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/e37550da942c16ed1b3d6bcb839b2a1291e96163 | ORPH
   nios2     |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/1dfaeccd87b3f5e31fc5b54780cd6fabc2a6d9ed |     
   mipsel    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/fa0664efffd78bdf9b4933d4dddb475adc7c8be9 |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8168b162ffe6f8aca2e2a98615e334da1cbb7719 |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/8a8e556b97f5fb1281efb9a69af5f2d556710b0b |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/867aa56cb4d8ba36976e6faf20ad95e530777456 |     
    arm      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/ed1a9825da1eafd6e203c0fa98857d271561d85b |     
   s390x     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/bdf67d1397871c539740db936be2d36f7b3846ff | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/3b5bf6404321a6a96b439425d5bc1211c55e8e8b | ORPH
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/8056163a7d77a164a0b074c98ea475979eb27cbe |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/bdab63305026695639beb0486ef7b3dc1a2c5b83 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2a9511d3f7d18f101c1c11a74d2119c354ccdbbf |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/4cd3a57b48c0874cc2209a88cc68def89b29d1bb |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                pipewire-0.2.7 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/2879d8d7f6d9b2a162b7edc8b405d7ebd1354f56 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                       kmod-27 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/0ae72ac4f1012e942ef208e2ad8351a6a7553425 |     



-- 
http://autobuild.buildroot.net
