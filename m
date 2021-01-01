From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 Jan 2021 08:18:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-31
Message-ID: <20210101081822.D6EF2875BE@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  4  |  0  | 28  |
  2020.11.x  |  6  |  4  |  1  | 11  |
    master   | 77  | 51  |  1  | 129 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 9 
        host-sentry-cli-1.57.0 | 8 
                  bind-9.11.25 | 4 
                    htop-3.0.3 | 3 
               belle-sip-4.3.1 | 2 
                  boost-1.74.0 | 2 
            quickjs-2020-11-08 | 2 
                       unknown | 2 
                xenomai-3.0.10 | 2 
                apparmor-3.0.0 | 1 
              asterisk-16.14.1 | 1 
               capnproto-0.8.0 | 1 
              fetchmail-6.4.14 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
                hiawatha-10.11 | 1 
                host-go-1.15.6 | 1 
                 libusb-1.0.24 | 1 
 Makefile:753: target-finalize | 1 
                 mesa3d-20.3.1 | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
                       vmtouch | 1 
         xkeyboard-config-2.31 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/92be9402dbeb0b739d7e9b30f8c35b995d35503e |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/5e1d5eaa5d9f690b5be1032bb9fc29790c47578e |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/0b26471d5d0f9cc4b9d4780bf208f65960b30332 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/48320e9954ec5b31c4b956038393e8a2d2cb4ebe |     
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/6b064b8ee0ea0ee2165e9c45dffa1aa5489f3cd2 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/c15ca8f10854ffdea6021f2857cac6a9d8c95b03 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/22ea11b77f8b4f6ba745ff284a4a7b38d48028ba | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/122ce8b4b5d28ed80abe846393f9ed8d5ad72e73 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/dd3f1d3268e145cf5d05fcde21902266cf8e66a4 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/e640bc26b03da014d39c570045af51f333911b7d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2017a23849652eb7178cc7b0d59cf3f16ceaca0c |     
  riscv64    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/19fac41a57a322d51c8637373501aaa4c6a74edb |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/222588f4e0cbb73baf2e93a88abb3f2d2ca4bf0c |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a9e3fcd84c1ca8e7164fd316ead68db23e246d6e | ORPH
    arm      |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/d720e3b0f9f1bc40d60070337f2138c1d292c2ed |     
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/dd3a78fbbcc74ebde98646163bbb1bc4a1e15519 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/214176d59cef79e384efba365c29676de46b281b |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8a85d90d9b821e804e324ce453973550860a6451 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68aaca5844bee125ecc13a6a4584a91527e70913 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a659eb37f7a2073c90df0d59a2e5f383a3665c7 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1bc2f7159bbd84a396c704398834aae7b2056012 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74016f6e7c11a7c5e332f9b5c86b5c6b274fe7e8 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/823525b44083ba64157647f90b5da778cc2156f2 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3b802fd07ff2f8e6281c38438d52d8932dbe1cfa |     
microblazeel |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/c418e892e02f7f34ad794e34f22e7dbc1ac88f9a | ORPH
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/5eed351a142043a941fae9f01ec71dde6232d062 | ORPH
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/730b778676473d6ef5c3956337af5ecea87adc95 | ORPH
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/ddd0506a81435e341e3288780f3b8a08fe5e092b |     
  aarch64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/46669e18261926c59278b7c4ee33bc391b76badc |     
    arm      |         mesa3d-20.3.1          | NOK | http://autobuild.buildroot.net/results/3ce45e38fefc57f2ba6dba8deaea6f037d815e78 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5d9de57353ce0adf13365350b77cd7067bcd9115 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a625b8f1f716500d44ab8089776e3b75e8f4babe |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/de3dacff98cfd28f468840e3b05d61df88223c9b |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/11680b776d65e28e1bdefc652f68178b030ee40d |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/2a954c7286e1c504caedd7eb43560daef2c76036 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/039870e2fd235b5c6314938e91697ec868be1fc2 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/53b0ba766acc16397bdcc80b9ac59045bef93ebd |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7e20ec494cc3e97e167e5fa8c4bf8fdca0743817 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f7ae6def11fb1cc9421340627b4515e77785aff2 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d85aaee0b18d29366c0d1cb8d77e46ea5f5121fd |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/18538dc1d16c7a58325c226956ff3a22b937dbc8 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1e73823d7c524e00cd3ea77af1c200b8b0d06f71 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/a9f6d091d4dd7ff4238267d3b2703a1fcf316def |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3ca6ea0fc5ec0aa04974253a9864523004a2d144 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/424467a1933a10190e0fc31332b939b2c6dac311 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/e2de43d5861d8594e071e8101c379b28f3394dd9 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e27e6195741c0092bcd0265d0caa21203cd4cab5 |     
    arc      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/53129475575d06a0947220835cafdd9b123a50ff |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/04bfee34d93a538523973a0ac12f3babbe431ff3 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/74b212d537586d478026180b7cb1e215cb248fd1 |     
  aarch64    |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/3297e7cc8d0b97d2a1998b8b450ee2e732b8199e |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/dd1e51e00aa41feeae58aa71c2db67b588c97308 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                host-gdb-8.2.1 | 1 
               libtheora-1.1.1 | 1 
        qt5imageformats-5.12.8 | 1 
                 uclibc-1.0.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/8c60ac58362e75683bab01097b2e5c40aa544fa3 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f56aba850eaaef4aedfb5070a423405e5fe83efe | ORPH
microblazeel |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/3277e03f9eed85cc0fa03a725fe907197d165e43 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/f433b522e4cd5cb2c73c03b108ce95428078bef5 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 uclibc-1.0.36 | 1 
                       vmtouch | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/54f45542a8b80e74559d75fde4fe415d9ff718e2 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1a863b846a0134202a573ca0baba1fe7152140cf | ORPH
    arm      |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/32b688044abc8d8a38ca416c0786dc3e11e8c559 |     
microblazeel |            vmtouch             | TIM | http://autobuild.buildroot.net/results/779f90415529fa21af36048279a0894db8597d3a |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/732747db25415401bda859ab0bc4a94bde3f3b2a |     



-- 
http://autobuild.buildroot.net
