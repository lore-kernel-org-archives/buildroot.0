From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 09 Jun 2021 05:46:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-08
Message-ID: <20210609054632.1A5AF83B26@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  |  9  |  0  | 45  |
  2021.05.x  | 50  | 11  |  0  | 61  |
    master   | 48  | 205 |  0  | 253 |

Classification of failures by reason for master
-----------------------------------------------

                bitcoin-0.21.1 | 19
                  daemon-0.7.1 | 18
                  botan-2.17.3 | 13
                  gnutls-3.7.1 | 11
                   rhash-1.4.1 | 11
           heirloom-mailx-12.5 | 10
filemq-8940f34e0f1c8f25c1c6... | 8 
               host-qemu-6.0.0 | 8 
casync-4ad9bcb94bc83ff36cfc... | 7 
                 freerdp-2.3.1 | 7 
                       unknown | 7 
           host-libselinux-3.2 | 6 
             libtorrent-0.13.8 | 6 
                libselinux-3.2 | 5 
             libsndfile-1.0.31 | 5 
                libsoup-2.72.0 | 5 
                qt5base-5.15.2 | 5 
                   seatd-0.5.0 | 4 
                    ffmpeg-4.4 | 3 
               memcached-1.6.9 | 3 
                     mtd-2.1.2 | 3 
               netatalk-3.1.12 | 3 
                      pdbg-3.2 | 3 
                 pixman-0.40.0 | 3 
                 rpcbind-1.3.2 | 3 
             safeclib-08112019 | 3 
             transmission-3.00 | 3 
             libfreefare-0.4.0 | 2 
              libostree-2021.1 | 2 
                   neon-0.30.2 | 2 
          perl-net-ssleay-1.85 | 2 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                  mender-2.6.0 | 1 
                mono-6.12.0.90 | 1 
                   netsnmp-5.9 | 1 
                 openal-1.20.1 | 1 
                openswan-3.0.0 | 1 
                 openvpn-2.5.2 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
                    php-7.4.19 | 1 
                    pppd-2.4.8 | 1 
      softether-4.30-9700-beta | 1 
                   tor-0.4.5.8 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                    vtun-3.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/6eb1823f3b2928c4a0bebe54ffd63ca954d815cd |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/00737715b0687948128e10ae2d7f3abe3a4dcf6f |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/56d44530602fd47cd432c7f029a29e171927fc89 |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/71e45a5be92259713fcb691e87c5556aa11df8f6 |     
powerpc64le  |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/fa441aecc541751df17d2dc679ef06582ab9dcf8 |     
   xtensa    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/e563cb1ea3b5bfca18ed20781203a1036876fbd0 |     
   mipsel    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/6ef2c60802634a3aedf6edc10098d93545973a19 |     
   s390x     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/1b4b9a14b086f67f8c2c764ff1ac08814f7ba2c7 |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/42acfed1cc1b4fb483167073d7634bc633ab3d36 |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/07f3235eaef818074eab123d79feec97bfd735ef |     
    sh4      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/ecc03210c91809d4f1f85b58a620d35d9bf9a194 |     
 powerpc64   |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/14971fee704ef581703beb34e8721f0e214466c6 |     
    arm      |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/cae6f62fd2a791ec17eae708f263e0e75fd98446 |     
  powerpc    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/d31d6181470a69e2fc725307113e2c65dd5513bc |     
    or1k     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/efee3611f08c9a8c08b731901df26d7741c9b45f |     
    i686     |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/bbaf08b30a15c6d6c258ab188baf30290d43852b |     
 aarch64_be  |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/311c1c977f09db1bdeae21a9bd3e68ca1d4c76f7 |     
  aarch64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/9f1174cc388a840f084306f76cae2dda80d9ef50 |     
   x86_64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/1c51c2f377242425a342255cdae7cf597707ca80 |     
   x86_64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/94a8124e36365636521fe5aaeca2a142156c8bfa | ORPH
    i586     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/2d28d46f0400336946115d3145ca4830faf74d2e | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/ceb92a98b9e62e3e35195fa96d4173d1dba421bf | ORPH
   mipsel    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/393d0132cd5508bf48d89dc3d19d90e1d6b3ea66 | ORPH
  mips64el   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/e816dd79fea852635580b257310a19191f526ca0 | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/11f5e117f9a8024e78317b9185613a6ffef073f8 | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/aa2a3e32c0f796fbf83874ebca347f2007ea59e8 | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/25f2b81e3a8905e6831dfd1c66a257764dda7cb8 | ORPH
  powerpc    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/65d0817601dbb2fc57d5dc4d1dd355dc6a689fcc | ORPH
    arm      |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/6c5ce1901581d22d054d6f3bd6568f0c327b28fb | ORPH
    i586     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/3be25f4446fd4854f0858f770f697a98b923d78f | ORPH
 powerpc64   |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/d543c0c77093b6d21505bc16a1cc37618371d670 | ORPH
  riscv64    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/cf4535dc10e19e5f19c0a89697764d666719b52f | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b563da476bb75a97b63ef023e75abddd9d731962 |     
  aarch64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2fcf127618fbbd327f9d5524f1b2f76c21baeec6 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/e14d78a1b8262e9977b17f4fe6f10f53c81487df |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/d660e190f8d84162bd6fb16400af8c870fc321d8 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/88d0f0cbee047da961bec30a1a9010d142ee80bf |     
    arc      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/13a2760b5db5ae4f7e82d4c04ae01649c7114288 |     
    mips     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ca8a3561d7e6fffaa3292bd9e5603236a2aef1cf |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/5ab81cebccd7135b39581f0eb4e0430b3639a06d |     
microblazeel |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/91ff368ddc865497cf786d31988376e2fd7b1b0f |     
microblazeel |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/4274313984e370004f22c4c7eedbd4d384381e5d |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/3977432c3ae3b7acfe8ec01f3fadb24ab0b53f0a |     
  sparc64    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/bafb161aab9a1fb0d0e2ac8e28d357889642c055 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/a9cb3256d172be6ab5ed934fb9bad3561c67d05f |     
   mipsel    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/a0e6865482023a948e16c82e32a49bac1e6999a0 |     
    arc      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/8960d0ea98878c7eea0a918ab901a1ac2a97d3cd |     
 aarch64_be  |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/f571e1c97c6d810306a757966c15e5775e1635d7 |     
    m68k     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/4d0ffce76ca61e2df30b7be423e3414391bb0d94 |     
    arc      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/94c4d4363baaeebc53c25ee78dff7f8e98e461e7 |     
   mipsel    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/adc6d6ab48d34b2704775595c674bf2f468f8b93 |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/4071feb84c1905f5088b3413d91731ea45b708a8 |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/a2d8b8565f60f5f4fad1668acc03dc9f8e5eef22 |     
    arc      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/8a697d035b038aace5ac6c628a763ecc6400e2ee |     
  powerpc    |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/0a1bd8b55bf9bbe7c9671c7e5f5f336cef9db37c |     
    arm      |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/c8c937d92e7bbee85f88fc31485e01f30c3241eb |     
  mips64el   |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/eb6a5154b76890b899c3d26aec8783f13aee1e67 |     
   s390x     |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/855f47de199680b9da0664a6a4ec369291de2321 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bd503c234c0d5dd931233fb26cef1390df08f08a | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a7acb79dfa1b2e3287ec7874ba32aff052084d4c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/781ab8734ac5a58550e46e077bbf343bf7e8aa04 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/da03909291e97c525eb1f53dfc743a1897f59d6e |     
powerpc64le  | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/88f35509c574815c30e719f9be4d7b75ea6d8a95 |     
   nios2     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/af97b1160324ba134c16bae59cccc159b66845b7 |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3e126809f866568a3b09e1dc01fc80e1f815fb0f |     
  aarch64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/3212b55f444ef3fd855be4b0da3ae6d731144953 |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/745d9cc1aabd5f400b85adb70a67711f7f1d2f05 |     
  aarch64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/12a597eb2bfab61e7b06d75ea3ca89244a7efb5e |     
    arc      | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/542bfa12d2d6b32a1174ed2e430a5803f7f2d2fc |     
   s390x     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/f4d9edf4bb74f8988447e2a232e5ae762003b4fc |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/d312c5d85e922eacd525466169762efe098bcfe0 |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/6e9d30b243dd3de54179bb07d7cca0a7b3e9cafe |     
   nios2     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/15ef912bc09bc7c2d3079f9fcadca9cc2102eefd |     
   x86_64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/66a992e3b1121e6695d3af2d79e4788b0e343a31 |     
   xtensa    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/8269ea73207a40ba86de20eb0178411bf2214b90 |     
    m68k     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/53a58a573fc9b6c60ef37025ca8ef616cfa58fcf |     
   x86_64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/ed20add91c217accac8388ef76776b5aec796d49 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/e9bcf2c659ec3e753722859634fd73b6fcc26b6a |     
   s390x     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/59f68c4f76a8f3b765a5d3ff206d360c1f4531e9 |     
    or1k     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/9eb6403076fec88fc1edf076c160b2b1c435eea7 |     
  aarch64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/bb83dad8266cbf4055c71fffe4f7c117044f601a |     
  aarch64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/5b7a541d9bde3399034bb2eed94ce53e7d24ac17 |     
   x86_64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/b87a9248604461501ee858d410e31cafa029ddc8 |     
   mipsel    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/1c2adcfcc7f5f7b6bfbf3ca0f0348e5585f136d0 |     
    mips     |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/e95a77c101212fae7f6f4d1a316189ca84937d75 |     
    arm      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/f5a3ec898a311ee9e98f6b313aa4701e43f511ad |     
    arc      |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/c6f24090c8e3d552dc9f3912608de7c4821237b3 |     
  aarch64    |          gnutls-3.7.1          | NOK | http://autobuild.buildroot.net/results/c89316053f13696e35fd83d6480a5e391522f6c7 |     
  nds32le    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/e3ef9f33418ecf37437e42bdcf3e48032cdff4e8 |     
 powerpc64   |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a3d4a0d4fe97926b0ce7db2e1735f5702c3e3611 |     
    arc      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/1281703e94fac624371fb147472395fba29ba9c6 |     
  aarch64    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a03fcad759a1e435f9fcd514c1cc67de3fee9439 |     
microblazeel |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/1d0279c18bfef35638b16142948ea690c4f8bfa6 |     
    i686     |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/95a3ed3659d46be5ace91265ebe1800850cecf92 |     
    arc      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/e86f4e03a973b86c97e511ee849f9de39c0fde51 |     
microblazeel |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/e30a85ad88900716fdd21f50e0252914d6486216 |     
   x86_64    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/f0c2d43d6055a66dc3aa1a21c1783ec0b37b8b35 |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/8ac788b10d209fd13d00e5d2baf70b78406ec694 |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/79859b62d7b42d7d9120113ab94d660e5a3f810c |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/643e643b9ecd5a8c14fcc59815cf3e13730a8ad7 |     
microblazeel |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c9b2d76d16cf4c06f74a6231ad54842311eb2196 |     
    sh4      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/18fcb875611ee14473ec9a584e600ef418c7e2b7 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/fe97f6a64961d0d225f3ca54b366c5b53c907f81 |     
powerpc64le  |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c8418b21f9285cacab6c93736e3a4b85eeb51aad |     
   mipsel    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/deb5414e837a264a31117e2694c68f51cc9a08f2 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/aa61fbbf081af7ba47b1962d4191cdbaf28f546f |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/875d6756a535bc0213239d703eeff9d95944b2b5 |     
   s390x     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/bce2374259659ca48c74a04c463a0bdc94cfe0bb |     
   s390x     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/9b5b0b0a77a0eee90874d829693d6d2fb4d92cb3 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b321c41a87ac9357d67edab756ddabe643d48380 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/8ceef2b0889ac0f8725aa117d176ad3bbc7f1e24 |     
    or1k     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/50b6fd69dc668429b92ec7566181c516b3069c53 |     
    arm      |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/222774b9b998262184a5bbc85d7a923ce4a9ea8b |     
    arm      |       libfreefare-0.4.0        | NOK | http://autobuild.buildroot.net/results/ac55d276a0411cca8f744fc4414c153869c4800f |     
   s390x     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/bfcd9c11a540b5de41682c6565c730c96719c869 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/bda5d241ae2852c9593a7eed5979d1110dd96967 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/61546aa7379dffca03db3cd7101c2b2fe26f1321 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/6b6340af556c99ec20c1df45d4ff9bd27eeb1cb2 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/1ee326adb7e68786538a5aff140df96991452ead |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/f13196eb04f332a0692115a44b49fb7a371f772f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/2b6762b8a6b51420f25864a1254d178e0e1e74b6 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/2c13f0138b95abdac600eb20453ff40968f2c56d |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/ae29dfe05221b893249e71b44af6dd6a04e52fa8 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/3ddc65b395965899fa0673fa9be6a06da6d80c9b |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c7616809529e44ee0d0254fcac5e8c2edd520f75 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/1366b265fe5c60619efb9cd6d3738c41b2564db1 |     
  powerpc    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/2ee6166880178df656d28ffcd5bb81f792de6d3e |     
    m68k     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/5d332a1fd991d096095b7fee38cb8ec830372ccc |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/1964c2521ae07c4ece06c948ebfc889342ef2c90 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/3696ba09d24c1700c687a0c43fc195d13f17af8f |     
    m68k     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/5d82e3b4853183b752e2abe25b06b05f28f7bd69 |     
   xtensa    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/f64d05aba45bc9c97916c1562ca3925ac3112e96 | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/e76d46fe7badb2b548230c26b4dbc40f707d544a | ORPH
    i586     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/861ea2a04a502152375d45364f4301e19f868dd1 | ORPH
    arc      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/8e75730e7e326c94452140e0bdf73bd549862514 | ORPH
  mips64el   |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/a160d49b252a140acae0d1e5014d25241655c1d8 | ORPH
    arm      |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/309465e74ff139167fa54e7809146636482608c6 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/9f2acf0554dab47be1cda123de41261f14d9e50c | ORPH
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/06c6572226c7cf7d1d4a66bdad83884046a30ece | ORPH
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/b8cc6c3f4c127b4124db04308b06d67cd3c5b53a | ORPH
   x86_64    |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/ae183102a5a247b5058341fc5840a40cddf024cb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/19c173471eada98da3d4b18a8fad11c3ee5c1b82 |     
 powerpc64   |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/8cd169bb708094190ef48b266f6470273e5fd72a |     
   nios2     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/2dbf7efbcdd48a1b8ca8f5efbabe1eddc727a05d |     
   x86_64    |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/e1ee252fa65e5e17d9eacfb4d57d37ba17640dcd |     
  riscv64    |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/aee05ca6cb839e7d66985a746525863d0682ba83 | ORPH
    arm      |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/fe17511f5b822042c5fb3622f0b1fa13a92488a0 | ORPH
  aarch64    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/bb52d9f89e0298759b29be98eae41be401649dca | ORPH
   sparc     |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/adac2040081442c67ff566c0c2ea1aa342e19ddd | ORPH
  riscv64    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/74038f88ed943766dd44e3143b6f0b87f644b852 | ORPH
    i586     |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/b0adb69d43fb9f1f7884ec41dee851f0ee6166cb | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2a8ee138971c5d2fd2242c00e587ada148475a95 |     
 powerpc64   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/4661e5ad68701562fc75f84dd9f5d258335aaa50 | ORPH
  riscv32    |         openvpn-2.5.2          | NOK | http://autobuild.buildroot.net/results/7f8875b4a270270ac90855529549f16e663e4e11 | ORPH
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/498b9b61405fbb10ecc92aaff28f761eb6d0cdbc |     
    m68k     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/f988419f86262412f361cfb04e71904f5f23bb80 |     
   nios2     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/ae25b4c88459a239e643dd9d7bcb9edc414d6acf |     
microblazeel |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/35b0f944d4a5ffa849c220bd734de275aa23a4db |     
    arm      |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/d90d53d9580fcd65e3810e1dc7447818e791555d |     
 powerpc64   |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/f86831ee287103fb1cf560cd2fe39885a0234e2b |     
    arm      |           php-7.4.19           | NOK | http://autobuild.buildroot.net/results/07281b2982cc4f2af224e01319601f8a3804572b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d99f81fecd1e91eec69a0cdd67cb609408d7d0e2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/105259b75539fd4837c3775fdbcbab49b0b5ac59 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a7275b91de30663f80f23c7f40e527a0b5441403 |     
 aarch64_be  |           pppd-2.4.8           | NOK | http://autobuild.buildroot.net/results/6fc7c6e0bb2a0bb4973a020bf9f911b40af5ad6c | ORPH
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d9c24755ec6715b81e2620534ca54ffff55a5ed6 |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0af778c0025adc725c43b4938964f21a4e439a63 |     
  mips64el   |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/fbcc70054905a471432dfad93550c6f6e0eda779 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/69357a21310ffcbfd4e8d13d9676344a9e92f745 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/384e933a9fab30da8c4f8262d666be76fa0b329e |     
microblazeel |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/90d04f37cbe243940c30ec1d0da05d64848396b3 | ORPH
   x86_64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/1ae49c28e4c8693c6fdbc78a9e4d81caef9e45e4 | ORPH
   xtensa    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/0b1426d0c80f458c395cb129eb2f89563f7a91a3 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/062aa469c0059b4b2a2600d088da882d58c150ef | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/24aba452f0cfaa146119f9a19bd6d048afaa25a9 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/367a5f46406515b91c75761eb41d2daed8649d00 | ORPH
  mips64el   |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/15f7baa9d28599035b9012223359f34db614bed7 | ORPH
  aarch64    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e8cffbc9409349e38531e5a78ae2b4deb0a9f1a6 | ORPH
   mipsel    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/92c6a45e84e6c7b985c5c7f73c698f29317477d3 | ORPH
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e8483bdcc953c1485ebf63d376f340bf589ef2d3 | ORPH
   xtensa    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e957038d3789f36cae57e0ed6fbc858411ad2a13 | ORPH
    arm      |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/2b0535fce024acf6eb0f002bbb52fe3add1611a3 |     
   x86_64    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/ceed85a8b41715737361efbfa2ceda44d9b2dc02 |     
  riscv64    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/f268720fd0522b24383c3c90d2edd51981682b20 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/68ac83e752312a9332faf2a52a2e00da688c83d0 |     
   mipsel    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/893d38cd484bee27d9c1a2b0b197e134a2a5c9c1 |     
  aarch64    |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/820aa20310d7e256afa5636f043f8e5b75a35db5 |     
    i686     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/536b6c87e0cf778261dec0d0c5af709b584b86fc |     
    m68k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/992af955cd3b465ab949c6af602fa8cf63c7a8a0 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/53a429aa6ab3f79dc28b598df2d15ca9de24f8ee |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/ac35628144062fd6952ef00c15ce356f15cff12e |     
   s390x     |    softether-4.30-9700-beta    | NOK | http://autobuild.buildroot.net/results/df44d4ef4afd382df9e95648d8524d29fd1a57e8 |     
  aarch64    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/089cabdb3806d9af05a0f90f7da2e52334f698cb |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/877631b33e35dd6ed994f7cbea120df33f2db9e6 |     
 aarch64_be  |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/e2165dae72af644f2cd01727a33b0919d3bec6ed |     
   xtensa    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/6a03f7512439ed1d0626454caa3c41fad28e1493 |     
powerpc64le  | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/28747550b4a56af75f1471af1e1e090d52a04e31 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/948c032c728ea32d081186acba62247b765437fa |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3cf8db407a3eba691797c273cec06e04928dec5e |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8787d8e25e20e707429c9de874ba4ff10e24e22f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9fa9fb54970589e0067a3a80ae2835828afe2a60 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/93641821181b4ca748b269fcb7cddd5ae660ab53 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5db08526c8b22878f26f9a2eb909f35b57ad72c3 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fd2389e85605e9ca8d2eeef5a8a5137fe20f9915 |     
   s390x     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/91c4317e4a78204dec702a4f52b07d6a080ef85b | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  apitrace-9.0 | 1 
               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
           host-libcutl-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
                 openmpi-4.0.0 | 1 
                suricata-6.0.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ef49097ec995b21704528ec0d05d606b551f57f0 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/9b521d736652cba38179577ed47b8a9bbbbfb9e8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/35d45a2f9c85aaf4e201323d11ce4c610079b15e |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0cfb5400ed42d431662e1be81fb7e0d78fed1f28 | ORPH
    arm      |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/cd3adbc8ed3a08ac9a124d7cdc5c6346de3dcb7d | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c36321128f326010733a4617fe1e49ce7b507a55 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/10d7331d390e70a55f064fc3cbef4432561d510f | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/180bf451ba86f03e5414028837d6dfe71bc2bd52 | ORPH
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/6edc57b7bcd89df912ec2d10698e1bffb0017cbb |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 2 
android-tools-4.2.2+git2013... | 1 
              containerd-1.4.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1dd63113d6b57b7d23a4e806eb6c16282c358321 |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/0806b43f03ab4d0faed2b28d769b6e35348ed734 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/eb99b3802123ff5935c95696eb5e1d3d2e1169ab | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1657c4dac999a4080f24d1ddb69659c13707b37e | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2db69b8a4058daff2ccfcdbeec2c61697451fef5 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/617264e3c4eaaca01876ac53d6030397625c1a45 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7fd8497ff280cb20aeddae5e648edcad22506613 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7d8e50ba28f9f640e3af42e3e63392ad4aa32ea4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e46ad705bc0e02133e5463319c292137517d5ff6 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6d04ba9d55cfcfde944fba37eb1cc20c77c93d4b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/61eddc78887291f0d090b042d4684607e2b5dd94 |     



-- 
http://autobuild.buildroot.net
