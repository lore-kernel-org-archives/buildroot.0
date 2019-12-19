From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Dec 2019 07:17:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-18
Message-ID: <20191219071755.CEC7D885BB@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  3  |  0  | 20  |
  2019.11.x  | 15  |  2  |  0  | 17  |
    master   | 126 | 96  |  2  | 224 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 14
                pipewire-0.2.7 | 12
                   libnss-3.48 | 8 
                  apitrace-9.0 | 4 
                apr-util-1.6.1 | 4 
               protobuf-3.10.1 | 4 
                 xvisor-0.2.11 | 4 
              alsa-utils-1.2.1 | 3 
                tpm2-tss-2.3.2 | 3 
           uboot-tools-2019.10 | 3 
       alsamixergui-0.9.0rc2-1 | 2 
              host-grpc-1.25.0 | 2 
lua-msgpack-native-41a91b99... | 2 
                 mesa3d-19.2.7 | 2 
                    mpv-0.29.1 | 2 
   openvmtools-10.3.5-10430147 | 2 
                qt5base-5.12.5 | 2 
                snort-2.9.14.1 | 2 
                bitcoin-0.16.3 | 1 
                        bullet | 1 
                   dante-1.4.1 | 1 
       firmware-imx-legal-info | 1 
                    git-2.24.1 | 1 
google-breakpad-7515ab13768... | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
            host-mfgtools-0.02 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
              iputils-20190709 | 1 
           libwebsockets-3.2.0 | 1 
        matchbox-desktop-0.9.1 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                  monkey-1.6.9 | 1 
                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
package/freescale-imx/firmw... | 1 
            python-cffi-1.13.1 | 1 
                 samba4-4.11.2 | 1 
                     syslog-ng | 1 
                       unknown | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/d6324c0a1b85f2ccd18d24135df9804894922b4b |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/e5c949ff587a2c718aa6b3b5cc098ccffc893969 |     
    arm      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/8722ca2c23ac5ff5811eca91301af91b7b5a3e6d |     
    sh4      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/11b7fa4f7479704bcc6b40b0904994cf668d2873 | ORPH
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/5db1bbaef4f0263c9a7c2061d755b146840c294b | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a5698af9a7081997363169389c5acfbb198fcb5d |     
    arc      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/52eeb3fc3c2c437e986124a843fa7f853ec8671f |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/bacdd1cf055a66c7d11780305ab37263f660c395 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/96d57c0bab9749ffd0359771852d692f26ebeaa8 |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/71d72e71722d7399512e0c59f2fb7019cf85106d |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/6b2bb78629a474693f17e80c0fef40712b4d736d |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/9d54e5fb80b01c28e865e63cdd0b915ab04483a4 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/bac01a1319df2479142a8c60a73a782dde10648f |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/a391afa8cd4561f33211592a86f79483d0a10975 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/8fbd9afcdee842b878d5ff3085c02908c1d87958 |     
  sparc64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/ef3b6542a3ecaea7700d9ce7287048626eb14797 |     
    arm      |    firmware-imx-legal-info     | NOK | http://autobuild.buildroot.net/results/d9d82dd6727b82a643cbb75ca33b88a4636bd5fe |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/9811515c1396f40d365e9069b5cf0038da441f3b |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f8ba95f1ec7757b85029cc4f28e63f5c221cf9a5 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c0d05a2c85933104b59b19277db4eba9722a2ff9 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/21c5f84433998a826fcd2fac345cb73156567967 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3318f4f99076e086cd5f3319aad04f300a978bc6 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8e41de3683275979c74ef2902eaf64120f4a1779 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/9baa085f94c5b0af86a773ec1691c33a8b16800a |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/add1aef6837adca6d4ee3c65dee34753cde6bc20 |     
    arc      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/dee48fce8e393476245b5c2fb9412fb0ca174b49 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/b7887b0bb95f46a63563de986206435a9c5e7529 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f5f42b82f8c577aee5a40654842874fac06d61e2 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1be4d09ad6e220c161bac827b8fe730919ae572c |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/96846ff48bb6a67de024b6bf54672c1d3fba4006 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/16d3fef3ceb090acbe540c245d05429f0a790cc9 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2ddae8c5449154269418c94fb83b5ac40686e65b |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/dfbea38dd3de0871a65e8f77c8d82d97c6c005c6 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ec132834085059b791669c10dc9b9c4c5c3cb168 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0e62cdb5b9fa7abc0c0f56e9c36470506e8b0fb6 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/063ac4d7665c7dff2b6ad23f5e3011692ceb18cd |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/bdbfbbeb2026a514855a99133e9bec1831a4befc |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/19232a224bd7367b1a36141279929dbf2b2c0eec |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e2834033f148b418c2196799cbd945f375b81603 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/996f720c0750a0dfc5eed625f1c7627df8c0b6a6 |     
    sh4      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/11d5fe6a457cc4b06e3ae60bbdf5f6f9bfa0c6e7 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/00cca1d6c1f9a56cbda342f6f5d81ca2bfe27a38 |     
  aarch64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/4b4014cc911cbecc5b1f625ba762593cb9e422b6 |     
  aarch64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/ff5c94879e73d356bfe6abe21bed6da76e082a90 |     
   nios2     |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/e8d02733dbde2eabff148f969fcd9f10fbc16a0d |     
  aarch64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/3605bd16c6495b8ef353be092caf0cb0597fab05 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/c65de0618b5c2127f42c1fb73a7cbcd93237e019 |     
powerpc64le  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/0f2519e4317ff2f7b03f7bb4042788d67f67e880 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/14d5ec3391872242eb05302f7879e1d8df25908f |     
   x86_64    | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/5fe9f7d1d5e32b46ceaf4b5a1c2fa6919b526527 |     
   x86_64    | lua-msgpack-native-41a91b99... | NOK | http://autobuild.buildroot.net/results/1294ca14a9b2afe80db7b7642a3420bef3e7348d |     
    arm      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/69b9369a2eda89d10fb388d6c85c0d5aefa3ed01 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/4781e8a5bea1423ffa5d73795059c7e8023ccb72 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/996b49654793f9c66566eeaf029c18a5a55f8f55 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/e5a425cf69aaf4c5c3f493b89d20df4ed5c3e285 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/0bda61f0c26ac3992fb251a5fffefb314d68d474 | ORPH
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3dad7979f41f509c1e9598c13cf859474ff335dc |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/cdb3596f6b8b742b466eba954df3af3185ef4de8 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/89d7743ca57f8775b00689cedbb99f6003f86a29 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/989132ea9e6ee7bb11b2ef950238d93f14fae73e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/95c1d9e0d3a0f701c6c34b068efd68def26afc6e |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/1d197aa67f710326e1df3f0af432dc2ad91937d5 | ORPH
    arm      | package/freescale-imx/firmw... | NOK | http://autobuild.buildroot.net/results/720b0ac5168003e5b157443194601fb6a41dc637 |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/b14e63c566c701a72891c4e9fd983cecee86859d |     
    arc      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/eba0f3f1563c269ce117f7e9cd08b6ff46c854d4 |     
  riscv64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/6a26a7036ddaca23f996d16f1778cc66bed3350e |     
    i686     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/0399c313543050d90d389b1298f975beef528547 |     
  sparc64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/f1dbc0195e1d810820d2863b1ca1690c50d773c0 |     
   x86_64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/501549ce342efe7c7cd51ea957b447c5bb93ea70 |     
   x86_64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/3d8c048613d39ef38fd3e1a9d71c702b9417cbc8 |     
microblazeel |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/02a9fb40c47a0b9ffad94ba9ae14beba67b1c774 |     
  riscv64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/4ff24c6e57a9bc33a378afe5c1a223d6307ef582 |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/af44bb5a5690ff7e7f0ee041207724b04d4f0d56 |     
   xtensa    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/02a99b5b62325fb7c2d800bd88ab901c799841ef |     
   nios2     |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/8ca45457c1c883a9b9c51b0d40002e34397236a0 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/61f166da6f6ff12dda896ad990fd8938d4d32708 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/066269e2676d1cba2e5ef0c4f75aa055ebdbebdf |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/1ef72cd283fea25f010d26639c52ea2d33cee21e |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/ef88ffb714abfc5be8c1344f5cc3c5ea2db6bf22 |     
 aarch64_be  |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/df84e61038f24106f24f821b72023a3cebb39e1c |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/d31f8be8ce09ecc776637c87811337393c20cd4b |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/9d9f3c4e63fbc9795250fe2f26714a2b6bc2498b |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/e3aebda1438603d864acecad33a7a69de0af8cce |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/dd55376eb3482c96cb3f9b72dc358f588d6f7967 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/9512ce8c1e90ed879cd281c69830b5c38b77ae5c |     
    sh4      |           syslog-ng            | TIM | http://autobuild.buildroot.net/results/6f6fa8c13861fccdff5c03d9e06b05d70d917ea1 |     
  nds32le    |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/675967adaf1e03114b773275c9c8a6865a0f9f25 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/935c7cb31ccbb42af019a560435abb64ee5d8e80 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/19381b8ce06619df29731a9951fad153bc2d859c |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/b4f303e70d2a2aa34f27942fb9d56411099b662d |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/093905b688d756a92461701e3b49f2517fffc4c3 |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/90c4ffb5105be574da51ba5299f25e5a2750e582 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/01eccc790a7578bf61a76d08cadbfdc30ae4e4b2 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/a7c2cd661a6dde74a77c21acba217629a0883b17 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/555c77ae6fd942ce5eabbc07dbe3c7da47205e6a |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/e82db742d33acc33af93b0afe2d73f87bb26a8f8 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/2fe25a4e544723ea48f052b2bbddbd7a3f9eb8fc |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/11ce77fece93ce4014b2dd13f194217de352f5d1 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 1 
                   i2pd-2.22.0 | 1 
              wireshark-2.6.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/2b44f272bacbbf171431c5a709d02a0647ca07fe |     
   sparc     |          i2pd-2.22.0           | NOK | http://autobuild.buildroot.net/results/915d2addeeddf76b699c124c166f80080793d511 |     
   sparc     |        wireshark-2.6.11        | NOK | http://autobuild.buildroot.net/results/c5323bed15f65db7bdce278301244fe52ed24978 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

       python-matplotlib-3.0.3 | 1 
                 systemd-243.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/1c331b94331cbf6f1b9951a73dbf4cb00b55490b |     
 aarch64_be  |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/5feae82aec1467dc8c42361baebd8d734ee72e55 |     



-- 
http://autobuild.buildroot.net
