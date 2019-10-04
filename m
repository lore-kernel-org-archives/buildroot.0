From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 04 Oct 2019 06:17:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-03
Message-ID: <20191004061739.7A2A9877A0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  1  |  1  | 23  |
  2019.05.x  | 15  |  2  |  0  | 17  |
  2019.08.x  |  8  |  1  |  0  |  9  |
    master   | 89  | 61  |  0  | 150 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 15
                    brltty-6.0 | 13
                    bird-2.0.6 | 3 
                 libdrm-2.4.99 | 3 
                  uacme-1.0.19 | 3 
                 uclibc-1.0.31 | 3 
                       unknown | 3 
                collectd-5.9.1 | 2 
                   grpc-1.23.0 | 2 
       gst1-plugins-bad-1.16.0 | 2 
                  c-icap-0.5.5 | 1 
                  cmocka-1.1.5 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-harfbuzz-2.5.3 | 1 
                 mesa3d-19.2.0 | 1 
              micropython-1.11 | 1 
       python-matplotlib-3.0.3 | 1 
              spandsp-20180108 | 1 
                  spdlog-1.4.1 | 1 
                    strace-5.3 | 1 
                   systemd-241 | 1 
               wireshark-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/eef47f1edd3da97da9f5fea435d561028ae3cf71 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/067a5f3fa59f54111348fd3f2a402058ba9e03f2 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/0bfb4c40f23717d2fa18f34add24cacb3d1e8744 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ba332f14151ee31796805bfda6c1d64cbecb7bbb |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d427ddacfd8abaa938b35ba2dae14c7128fcbee6 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e24e97381b652e0785c1ae9713c4ef1c8af714b7 |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/34de4c526f99dcd94674d746931ff2285a0de800 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2f1be808f3a46d92ac22d10bf026f2696377a63f |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8726f6405fd8c8c3aea42956c67c0bc89445ddc9 |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/09d51583c71fc30ae1bf2526323b6fc3d97b089f |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6960063f1e933fbdf62151df09921928b14a7a1e |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f0a72f5ebae17655ef203e17f5933a3e1d5863bd |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c5b29539cd657935d4f89ed5f43975d7b60ebab5 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/cb43b4571988188e99185b98d2896a865356671e |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f23d1ba4106178e2e736b279e54fde14b2131930 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0b0b2f400ea0d5f043086a139f3e24a29c7cbc7a |     
    i586     |          c-icap-0.5.5          | NOK | http://autobuild.buildroot.net/results/1477076672b1a1f42a4e0f9fb86d05026734dca2 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/546d9230dd9634bb9c6a8ec8df1f22c956633d32 |     
   xtensa    |         collectd-5.9.1         | NOK | http://autobuild.buildroot.net/results/9d3ae5e8041dc0bfde0a120fc714b5768b590cd7 |     
    arm      |         collectd-5.9.1         | NOK | http://autobuild.buildroot.net/results/f4eede9e65cee2792b163b5fe08fa624dd178a02 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/2fe2cc4fa25fddb602dcf21de9b72fbfe68f0f26 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/63c33338bb0c9870d390e4e911831cee307442f3 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/c9221bbfcca862d09338813cf1b3533faa03fac4 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/3efd97e5d2ef73cdd1295df1a39bb9eca2f7b5ee |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/de5245898d446ae36485df6d8296018ef1b6deb1 |     
  mips64el   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5b1f0f8aaf37a1370df545e1b80d645670904a42 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c79f5d900937ced527904cb0e22f4a974bf1b215 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/22c3b00ef6d5a8fc05a5dae90985a44ea6bcc2b3 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d25108eeb629d2b088a1bc5a653c1c94f231dbdf |     
  aarch64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/3811b31d35546bae46812b5f2b45486b2fd9faa2 |     
microblazeel |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/9def9a995d932f00aa266239ec1ab8edf5a9525a |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/63145d14c3dcf1fb46277b60a0ffcbaaff9a696e |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/4c23ad25ea561a13377308c66a47d208a373c656 |     
    arm      |          spdlog-1.4.1          | NOK | http://autobuild.buildroot.net/results/f839e70e96a0c7d67034f604565b32ca354da7d0 |     
    arm      |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/d0300e9536cb470480d59eb7d64a3727d45d67bc |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/acf6b37fad7adb69ff12ef57b1e54e13bea5f1fb |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ce991ea6edd6e6c7f48ef90928c2df75d7f41f9b |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3096a1801379ea436771721facec6e2219f82a65 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5d6f5d6fe2c873fd60d36ae3f24bed4115a7faa5 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/39d3fc0017a7ba9fd4d8fa5e3328ffe75579afcd |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7a046002a73716a065b6bda4eaffcb9d9167861d |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/96ed52a4e278040640fe4a6459e1cac428ecd71c |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/54e28e583d6b54c0a217ec571752d4ed93741a36 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0149cebd2b1bc657b77465c700445abec4833ef9 |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/0778c50f5824bb2f9f5a7bfad28b47ca4da78b20 |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/90275890622b7983796ee4d54c0d5add890dad17 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/af2ba4174af7eda596af763223e559991b04d018 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/02500416e62622c353949ff0cea935cb7b73d3ea |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b3e3a5e7477ea7a87f256bd55d1e599c01a9dd88 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/62cc07d594f980f3c73cc3bc5595fdb8bf39b962 |     
 aarch64_be  |          systemd-241           | NOK | http://autobuild.buildroot.net/results/512a36eda81271714533a9d70636cafaee3867f8 |     
microblazeel |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/bc715a2f53f72630ae13e3d226e6a029915c4ee4 |     
    arm      |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/a016b58d755cc0888680b345844f92de467329b2 |     
  powerpc    |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/07d5e454ffd11527d70268681fe15e9de77379e4 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/7ddf66fd7001786c821b39984b919475d84977d3 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/5f1be84d790ed9e6cc23dbe1e315c20c0797777e |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/e75e0b802cfbd0bbcedad9c772c4140958f79122 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/73de7157b7cdf8674836a9280e11f080a4018e80 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/772b6fe60a8cd5b576a9cfe24994442ac7447dff |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1fa85f6aab8699cbcbff11a83cb0f5efab280831 |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/e5ed8689406d6eeea4f0f656cd4f3f62e9509fa5 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                       lmbench | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/c26f94fdf8a60cfd4ea4f750e82130459caab602 |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/a1047573adca6e56a200ebdbbf7be9b970f97856 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                gnuchess-6.2.5 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/83e3db6445cee1f964ff99d1556127825611d6d7 | ORPH
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/4d732db3789b9fa8eeb778f661cae3c167211422 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/09eba5b88ff45c337ad3f764bca755e6008b0a40 | ORPH



-- 
http://autobuild.buildroot.net
