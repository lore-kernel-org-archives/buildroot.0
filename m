From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Oct 2019 06:16:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-17
Message-ID: <20191018061628.EBA4887E1B@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 42  |  1  |  0  | 43  |
  2019.05.x  | 31  |  3  |  0  | 34  |
  2019.08.x  | 38  |  5  |  0  | 43  |
    master   | 39  | 453 |  0  | 492 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-libglib2-2.62.0 | 335
                libselinux-2.9 | 36
                   dav1d-0.4.0 | 10
                    brltty-6.0 | 9 
              iputils-20190709 | 8 
                 jsoncpp-1.9.1 | 8 
           host-libselinux-2.9 | 6 
                libdrm-2.4.100 | 6 
                    bird-2.0.7 | 5 
                 libdrm-2.4.99 | 5 
             libmpdclient-2.16 | 5 
                glorytun-0.2.2 | 4 
                   systemd-241 | 4 
                   aumix-2.9.1 | 1 
                  boost-1.71.0 | 1 
                  flashrom-1.1 | 1 
                   grpc-1.23.0 | 1 
                      icu-64-2 | 1 
                libcurl-7.66.0 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
              micropython-1.11 | 1 
           python-aiodns-2.0.0 | 1 
         python-dominate-2.4.0 | 1 
             subversion-1.9.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          aumix-2.9.1           | NOK | http://autobuild.buildroot.net/results/7ecfe34e888bb2e0a2baf93b965b7c23501664a8 | ORPH
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/9906166c0ce45eeb1d1611f209b99b87299016fa |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/65a0694788f3ed60681eaff8463c0b7bd08b6608 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/11d9f408a6befaf016171aebf734a5ee0977c4f6 |     
   xtensa    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f753093eca6f61eee0fab1c8abf40649698fba5e |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/5da25682cd96a521b5c4823990d6f3c2549143e4 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/755162163f458f1bf4f08e95bddd667a65109c05 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/902dd7f8725654f7f26daceb8819da4b116db3c5 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d44df0454c5aeef450e8cdd9a5ccdce032b21d40 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/013ee4ec2e2a56f85086efa672e1e6b811815163 |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/00c94f6571fa57997affa57d098b944c2ad6ea79 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6045d6c9a028af0e7d4b7ab54d0c60e6a2b89ea4 |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/82ccd6c1d05554f1656e20efebb1629d68f38fdf |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1143113067c741514aa45173f01c106c50b17fb2 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e8effb090b08b5e401d9d04162d1bad510494187 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/dff0e502788d800c6ede9ac2c07fe1a756132381 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/a41cc01643a0ca944f2636f309b50d72c94a4f73 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/1fb91d97c2ae1863040e29bba142156b51325f1e |     
   x86_64    |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/e1b04b8616b14837fff58ba155bb66f3ab2fae11 |     
    i686     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/aac586033c7787c8e8f94a8d35efbea328cb0d78 |     
microblazeel |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/cf52057045ce86f86737b04014bbe3ff32c29b09 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/eec6b2a2960e89bd9cf792a154fa3a1c5be2cc31 |     
    m68k     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/289857bcf75b48943c9be5d0713f0c4e90858fd2 |     
   nios2     |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/f81eb25791e3ff446dbd4adf675515cc996fe69c |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/2e5351b9a8fc446d0d891856b869dab2ac0faea6 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/13d0349a1151b16b8852650aebf7d01fd00aaa73 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/07f85550a5555b517f8bfc67654eb3d05abe213b |     
  aarch64    |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/2c7b37b73acec81d123ebbf89b0065bc94ca3433 |     
    arm      |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/6251bfd0848f379fa2c9814ea863bd9a04ee3aad |     
microblazeel |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/4f5160a7e9e60dee08fc51762470a082321b0425 |     
    m68k     |         glorytun-0.2.2         | NOK | http://autobuild.buildroot.net/results/e4056bea4d2ef97d89753dce6441e56959b3f470 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/c32f9c7406b8156cc00dd197b90e525aa32bda23 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1296f3f89609ae61cf132372d77ca54d354cb86b |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/329540db463bedf1dad59a87b540e96b5784e0a9 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/929a35beb1c09eb8e302c6ce8a77b1cdc59a7b01 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/975f953324632b331b098279f7d6d8a208853ff2 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5e229a0d526c75c15fe56a0d61aa98caaafef08f |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/60371b47d28b40dfb78197caa30e346ab22a316f |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ce8def6b7534e3d35ae731cd8b9eedbffa98200d |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/db83f9d43727baa0b5d772d0ced35d6d110e1e28 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9d2b128c83fda016f9eabdd60815b11f4e8e30c6 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19dfee22dd9e4f72f552cd4b5b07d88b2f1e1280 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/25cceb9a5463bbef790adcf92f8d15602fd24849 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bb8c6818655216c66b91cc208fa1d5790a39537e |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/99357bfd8307735542118ec294f5beb1c95f235a |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d2704b0677c8702ba84ae217e299d4b696f71d56 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c9356b19e09fc9195bb78d7617a728be1cde3a1e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/03bb9c81fe880c31d7a8a28e598d60740e26b4b2 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6e069468d6b0b09a1b840cebb5acbac3744c57c5 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/916d58ae2856e1cd6ce1fb6e92930e2d20132b2a |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1248d97be5c521775c5dcff57e418f680c653050 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b96348440304ea7eeee0b20cb236100c21e9b8c2 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/89d925c298d7e42b1a1529402ac8359ad3b8b8cf |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/34484ccebb90726bf5d9ce43ec6b2fc3d5d9b154 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/65e1e5a4db04328d80d5dfb59272f5d0be00b2ea |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1d2713e9aae404de6021703add586706bb5974e6 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6e815a49f36c9563472fd518bc6bea9ca57d86f9 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ab051ed69143b936456c863e40eddd7cacea5014 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9733279fcd50f990c34fe74699e0ee5b09ee46ce |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e2d17c1f854c37a7b17bf9671ec792c7520eef33 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/973571b2739823218ae4c7cfbb9ef2a4b062835f |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c9192f9e888355e5a9794dce0a30b1d95141af72 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d162d71f124c226d1dc6fa8eb7363fee65ee0a86 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7528306599df3a66474f66e007a2a70d5033b043 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/11cf4424abac73a56246c93dbe76f588b51ddfd8 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9529135e51e2d3162ad9936b98b1a850a55d951f |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6b4aef51bb5e052e5549806aa31f0d272e9bc3d4 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1f2f2f95af03b0732d29b837425a78b5633e58a5 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f16b7cf16ab1d33fc1bd153984a4bae7359bda33 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6980f73f42f7f95a405ae698176b3960baee6a60 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c4fbdcc5887874360f6d0d964712863a68e01c34 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5acd4ace32494c8c53cda9eb3727d1648856e10b |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3aead9445828f49ff0048a43038df61d5a132157 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2517424080494a589ad4211f64a482103ed82210 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2df60bcaaa3e676d0c2d231895822d0f9e41afd7 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a29b872a5155be8619ceaf49452f927bc82b51e2 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9f88b1ca0eeeff20db24b56e5052d637c4a350b6 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5a8ae605402c88bcf821d6968511e600b3300a44 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5c2151b53973b18225e34b79cec33211c401a0de |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2fa607c97c71d86d48f45d844dfa241af0a07492 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cd0278a4ba3476b939944bf36d8acb7ef7db179d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7466a5a0cd94a688d72e1d4cd34ae0a5dbb61f15 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/803a3e320914c126254798cd97d817449de09464 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e2bb0feb5d55c3bdda15d684dc3141013728373f |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c1650b4aa278e334bdb5ca8826223499d395a131 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/50bda6ec5fca964706103fa18a4a0b3688d4e512 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/839d6947d9b2ddc9763da518a576c4ed1a803f96 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/27c7939ab9e9b46649855e5a8bb45947c73fd56a |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/44c3eeb3c5b77cffc215ea068ce37de6977fc2ed |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/61f7fc3dde3ba1833b117fa68759b80e4ec01f59 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4b8c0cfbb831a18006cee4fdaf59057a670ee8c0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/43da80545c72f36594e44633e5b01894db473a50 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/935065ce7372e388e26c7d6e7bcf803a3347b035 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/683160bf0c6ca6cc792542332ab707e4853ceebf |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a517474242aed828aad03c40aca946fdd478eea1 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/644731a827d8f00ac5002ab4f548aa515946e7f6 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d88cca8e6b783df761988cd934ef382eaabc7079 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/af38d49bb744878d627aa41d64f9798eb1e147df |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/009aeef2ce39670384fa29debbdd23462366d28d |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eb01bbfd05cb6610397fe4afce28f1c26db48a4f |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a8797da1bbe9123c20bac9ffb6e3f424491c6fdc |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a5814e312350f02f68477a7e50d5637a95513e49 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3aa8a5075931944a76633dcb13acb6b8af831529 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2373649a0e65388ca15b3dfc87de088749e08481 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5fffdedecc67b9ba3a959d757592a8e83aeeb496 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f905c597ccb95c7da38064c860fd1a4c71899e00 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/77775db5a4bf5b77cdf285a93c4e703ad3db93d3 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/212f5d5487abdcc041143ddb60ac53915593f383 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5355404372ab92ed3d94dae63b57bb87bab384ce |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bdae32fa654301a0dce6e5408861965612ff0899 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bc4ba4b49efe90a33f9343de9c744b907461a452 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a5dfb0b85d76126651c89037bf78d604775f63a4 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3b143ff8b5bf7ab1658b326538aff9485a5fba01 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/115b28ee53babc3825cf3b4dc68c0c82534510f1 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f28c5e40156390ae1449a6767475af1b156d8bd4 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9719b72e76dddeb09b217bc16dd437948b500ec9 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8d87d8fe8396c4452d03e180278325585326c2ee |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0cf82246ab6d9c61e80e89f5c4a15c6ab5beb936 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eca07abe7bc7ce24394647fa19d2f8dc9d4872e2 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19498c4b2108f160014d54f210b014c2dba5a408 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/17f749f8ef920dbec6a6cbc6c95b349cb589e341 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9abe8dee018fc482754368d8c4a06be9d07c3e70 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/afa6566aa208402ce018604cbc010c4ebf38cb8d |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f365bbf626de341f32618f5476b5c649342da7a3 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/89c68dd6b8fbb5bd4a674c580702194b657bd259 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/22409da30b152790aa572c16ebb3fcbc549cde96 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7d5e2bf0c713ddb3334aa3325a943629f453cfa9 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d043fce2173a73b29f653ecc3aef5faf75d9b584 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c316daf10f9f4aa55c264a7747fd8f943ade2352 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d89713d12744cc13e01c5902ca1a668a801c741e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5cfc586d87268165cd137a6454f4f37c3f63a4b4 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/95321f0d9eba5aa1f1bc654042d5c79abd5ce249 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/48964aab5c9f5d1414c1edb9962b9486a189014e |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a145ecb037ab3542ccadc41c273fedddd42490da |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8c3947822829ef19cda3b8af33bf274ccf6fdd4f |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/698ac2a09e80189b3183c5ff68c95dc93a11ed6e |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a4c4bc3fb03405163f7fa8b9961f53530987f33a |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/39b1c4bdf7b28877e6060993c1af1b2055db19c1 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f66ca8a946e6502eb6df13a2511b879b8afefdfc |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cc953763f06f4c53d9cd0c928cea967b1b11bf6a |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fb5024a4ecc504b4969c65e2861afc9c02b1a162 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/34dc0a54166855f34705c6a622d41d1a9268d347 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ba5b9369c5c719ca2a9f1f1fc7ae8d002e6008b5 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/82f712735f4fa46913bc3492df5df681f8ce9466 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5aa3a994834c7f2bdce1d0ead8cbf594d4e0cdc3 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8bf12635eeeaff38a67820523657fc2f4d67581c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/36b12e51423db1b60364252d042432c360bd45c7 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1089bc1cd95216eca98cb1fae59e786dfc9f419c |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3fdaf6122a4caace8329d6328aeeadded29dda55 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a80e17dacf5ece407e273ebe1148d4b264ca5b58 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3f1972d4994642084542c58af0539424c6a9d7c3 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/081862e1d85bf9b0be7f6b1636acb8894b097dd3 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f9f449e895a76046c2d86254c92b1ab36b793d7f |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3d205ecaa80ba95288ca5d35c4c6d9b7e47b73b9 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/792ff23ea1428ac96925e794253506c1b53c256f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/92c312d84b2a2a92c538ec06828d35544caa3c56 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c5bf8f9907a6290d0df9a1a83ba9768802dcfe94 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dbb267449f7fbb4d47ffee83c2d28030ddd94087 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bde08db612abef620621d6bfd40729edd484b225 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/68bb939c34ba123979b170e0eee2f4837553f91e |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fedf9ee58f8dbf994c656ea31f3dc863b83acfef |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8116f1c9849a195c735e7598841a0147165371bd |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a297ad91ded3681e53fe860be6277a098edc2fc5 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/286e1f21720abc620cc1630c948685b38fa882b6 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/410c48b309dfd5cc3f6eee820445ecb6d9bb5f46 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9f927cc220b8c133d454fec77688d610cd43f19f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/64fd4c71810371f92b460fb3295ead4c8aad634a |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1acd0a5f6bbbe8aaecba955ca1fb988cfbf6eee0 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5e15a9079c670853d6d6e21d70988e3a3eb2db64 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8b85c437ed7662071ff72411908e251a1e7df336 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2ce7538dca6e2160d73ca39e00d6508deaf68b33 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4c7f6014e49b7f96dccb0f9bcd30c06ed78aa9f6 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dd17603352db64e7485ebdf374560a809a61e1e9 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3693d6b2e27fe905c59ea6dd82d9ec0d93313483 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fcc10d0bd4782c7b55f1039028adb06b54ee039c |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3e11b127849c77f9facac271f5fac77bda84c30f |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/233311efbc301e7fdbae7a73f3129aed1ec87398 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/74e9b05ded248c2b05a1b72ba875ffde95b93468 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6cd5033fa4d03921f3159921f14b43fa58b67409 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/caf70c86109b1abf20e9a7684172192155ef5398 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a48549711fc64282d8c8bc19c139746479c74397 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c8904eb2c19993bde353ee702c413aca035a0955 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fa5833b02c7e84b30cc645feccfd39787aca6cd6 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/eefaa87f2c3e820fd4d9ad6bea2bb19aeff7b7c8 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9888fed9a413907f4a53eef196494d9397fcc0c4 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/da8f381f43e31889d3461b3d8f3804fad55db55e |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b2853447f43064bb0726484c16ff06eefe661bd3 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3230e1150eee6f42b97dd1b5e3104f72f738c251 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/26728e06e2661eb91c800da941880822de082db3 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8bb756668da94a19127ea2fa9619be133981d032 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2b45d403ddaadd09d75116bc366fb9c9c1f6ff2e |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1ea25525ae8f7e7ba6d1d8d7879af08253b29d60 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a674008599c5b3f005c43de9000a8f2c791a40fa |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d48ede3b49ae51b9e3c82d34c3d31a860923d5bc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/733482c353aea10987b0c81970212974d405ad65 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bd6ef8816a7ffcc7db91fba3b52f1ad029aec744 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/718d0b6db17f5f8dda82c94a13c608659cb8f6f6 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8bb5ba9aa945aa96b3e3f61a14880d2f0af30b68 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8ea0d2edb6e2ee502e42055f0467627047e08164 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f9f7bfb666cf56d70a8e4e1b14623b149e09b8cd |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bae215f1f5eca8bd5e0082a89bf51937e7d7918c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1008a9b9443e437418159c34fe408884a8d27dab |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/205bd5ecff2fb3b793821d89b25dafea40b9aa0a |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0c59a953d9e8bc563566e59f73bf5c74253c7d32 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/39ba6fed2616ee704229feeb6d477d74fc799fbb |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f2d637b4121c73a47553489f3b2e21d257788d5e |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cfe5e5875996e86babaaf5221015854d6a0da515 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0567800e5dac1af47b8aa3ee48b8b724698497ca |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8fb7eee8a594751e426092f7986ba52547cad252 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d69dc317cbde8b492225cefb906cc19e09f5a209 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e6c299110647c3fdd917815cc36dd7ecab1c36e0 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/832ebd902316fef043267c32154a30267e406489 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/aa74da1b5b9bfa075ac0e128c3eca808b787d9b0 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/43f61a0a974f8cba2fa4b22463a5d2fcf58829e7 |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/33d2013c504760929446c5bb580a946cacede59f |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/52fc4ad6eb0cdd732ad00a7b29cff8ad12080f7f |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9aa01d11c3fc8743e22e469034d3bec479b55c53 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8a2c2b7fa36e7b054339713586bb9729e8684543 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f066984de2954a801d68af36a706bc6018ba4dd8 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/022c89354a96980e063ed6dd604f53aed75adba7 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e018fd7350d0d941856c56715841b77b2d3c48ee |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4623bbece0603c92e9642e0685a9195dc6d90544 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/8c9240b7ddd8ab3d7ab58fa1f6a8105eaffa3c66 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1b5ce2c72464ae6f951c5d429984f03e6a7cb2bd |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b81942d492a8f2c03baad12237fa04386f721419 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a2b72e27787416caca3fdb7aa34f55867924df98 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/73f159dce09d6cfc37cc40d740cf2fd1184176b3 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/181c9cafae57217e03e9dcff946a716c826047bb |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ab2c9a1c0863b38cca037107a9e9da26a4219653 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ab82d54051649080ed44bd15ece26f24c1266d54 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2970c359064b473ffc5a68ef4332bb6e962c6837 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0da2f149c07d7e6954f9e09fe1e97d2a2bb51b8c |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/cf9ed26bf8b32c1e3ec7b8db9640872fdc3f13f4 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/40933858dec8b0de7d3ade42384153c008276299 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2159e9da0496a89555f1994c5698e88f45316313 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0548b235b74e3694930a93d328cb69779f25fdcc |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2e4858b73e2f7c92099d094374a38fda0f001f74 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/53552393da166973c7c52f51e5543664e0be153e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f0ffec7a639122b10946f95d851ec2b0735fe2ca |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d9756988ffa8374aceb0745c675d10ef13c91303 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/04c7fcb25ed47aaa3b3be83eafb265fc0aa79513 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/757703466ad754886313c9d3a5ec6a90f3386144 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/160956ff6cc9313a44edaf067073e893a876bf2f |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/088d67ec3508fa588b38e9858b800b13ae0db22a |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/20c30df2815024718640125a94b2b784846dcb22 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ac41d2c8f4634f1dadaf1cd85eaf40f7cee5a24d |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0a85a4083c75cdd8c34b9e7166172b44898f64d8 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b66312f469774b6e36dcd1165dc3b9798db57387 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/50f208ff54f459623950bfd53f4cf2ec9bc359ee |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5e68a69b002037b0b3f15414d012c04702b61054 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ef2536979fdabbc237251005ad549c5bad0283bd |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a6b65d1d3b83a8939c406a7a9f3e156d53393dcf |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/fa048ed742093f49c2951b3184bd356655517c47 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5a440cc1e99c499299c1e9072d7c03cc7d8af796 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f4ef985d39a25216a838e2268315eb6d49c70359 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/257a08db2f2daadceaf7cd314ff3d07b0317a4cc |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/42d5c0def607961960b1449878793d1c15a1caaf |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e7dba446c82738607f17ce83437b457b11143295 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/046eafa891aa25cdc2be2223258f6bbe94503388 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f7b629b258a9eeec8da0b5bbc61841df2e48d7c5 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/663c73f23a24a3438e673c8877c7203175074797 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b2b98b9033f289ebae5d36a01414771f6d0cc8da |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/306780667c9ad23840a9d0d146a145fec1d878aa |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/56442e3c973fdbc24245d13a266708fdb531b6d5 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3fd46b7decddcec2c53b9210ccc2c36c9d44008f |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a2dfd37c56ed25c70e4b7cff6379a6f9d05a04bd |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/27c70ee048664c655dedfe5eed29cf9a2639b7e8 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b9f1d075e74f8e4d75a03d94bf4cec13a094e74f |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/490b2fd769556c1d8ae5d2d022842652f25b04a4 |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b515d042b38cd161f03912d67f2a62a01e8295c7 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2e1383277e577f6dfeece6ff21c3301e8dc0db54 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b00bd141dd3e066ed514c396a6fb53cf22243e43 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dc6a462db6164fc6079a5bc515020e7d9a963e3e |     
 aarch64_be  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/edea976d77529155689ba0d132b1cefb899c198a |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f11c57c89218e17e2ee476361cff55557130ab79 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d59ca8e450d7d2dda5402ff48fe760e793e4da95 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5f689d2a1a1359384a25f14177d96cc614fd1d07 |     
    sh4      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/badf7c55805525ff3bb68e5fec3dbc2ed49ca492 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0d5473455780b653861752946bc4c9e0c6db3c4f |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/968ca3db032b412ccad827d38f9620ba631de59c |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/05b57e95777abe3abdac246c913d6b7a5e6936c9 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3fd48b00525d57554683d46841aef4da94639d0f |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d6c09870d47d8749c9daf11b76196d68e92ac7e8 |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/187cc0fd62c0f98696869835e2021cb88d4f1334 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bf4de141fd860dd2b78f00f5b90c6243b37854d5 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/35a733cc863c227a60ef4e6d3d2ee40d81dc169d |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6b4809f40d93bc7cf06183c72c9c5ad445810044 |     
   mipsel    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e002c51a404aaab7b5ad46e2da09a12b17fe9f4a |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/106d8ef4b0fb041b52e1f764a62278d066aa807d |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3805cea189e108960c577c184fb6f161a6a08f4c |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7d3eb7281c4dc820f8e7737700b317dbaa62eeed |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/5010d7a46f3321f481ccbc75f130d0ac6a49355d |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9ca27136a8995c7961aef7f04600c49667ddf7d5 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6eba247e082640ff81cdd76e94a483a3aa2d9af2 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a233048877c09f16e155d5377ca102c30315d848 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f0cf6af95140f70fe37d323b8c76af3cd055fde4 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2c6d4f5933fca49aa265bf1b29681ecb4feb44c2 |     
   sparc     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/65c19257fc8910025a13588560aa88f9e23e57e3 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/93593e7f563b37554b8a2b4c9c7132a0f6f370d0 |     
    i686     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d0a913c6cd8f9ccbcbbe606c9b5fb98c9421b0b9 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b22d2cbee6cae4174db623f82ad0e204b74960a1 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/386f9ced35e3b0b13acfef9a90cc1618066fbc92 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9f8be77d2988fdceb3afa65d03ec0ff2ee833993 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d4836c8090856472ede1229a580050a809e65784 |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2dfefa300df13e2ac45a655cc025ba79e06a25cb |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bb9b0d6fbed6bfe74d07003f7ec882e0c574f4a7 |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ad3059ff04dc1ee49ea01edf067dd6aa1275cb1a |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/069ed45d9bac50faff8549506035b4d1307cc484 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f99e5fb6ed4f1131511ecb5f7928c512fc2690bf |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/19fadfbb0f1bff549673ed0f1440c17c810667d8 |     
powerpc64le  |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ad50604442d9dfb2b0c03c38a4994bcb682f467b |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/631192d849e637c04433fa0c18142b6574fbe2e2 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bd6626bb373ad188aa631173bcafdf9befaaf78a |     
  sparc64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3aad1d77162fecbdf568c2b68c134b6ee5c290ce |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/927d22bcf636f25e52fcd072733a1b6488e8ec7d |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/726d93665107a4b92d26e2845c7d9f34e9c33e7e |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/dcd92c8562d0236b5933d45a8e61608f8c7f8a38 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7202395b129793c90984c137419cd3985d4d9171 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/d02ce8d3693cf72136e9e4746bf24aae64181d2e |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f7d5d366086ccc679f095caf3130eafb020ae714 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c170862fb88f6e06cc9fda097d87321a938831ca |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/02b0f73288d36bd9a6a761e11c6a082c6789b545 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bd7b40eeb05f607e064da3d1e33e327441d3c8ec |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9cc06d99eb041e02a699a58dd709590b3453551a |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/912a7d20c50a80c17b34576281e12efef8106aef |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a08ebe91e3838675efed93b2d043c11173610dbd |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/73c90907cb959a4b8dce3a332db26243cae6b10c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/75f475dd7f8fd2cbd9bacc0efd2c85f9cf2951e5 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/526867afb87563d6be6c1b6954b54e54f1c01d73 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/80126903e0d5e9e9c7fa993b1076b5061cd445de |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a042f1b313d0804e25d41b71b049483a8102ea84 |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/83ede4b78eda494afb89afe239c5dbea77bc8060 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/baa37018bf7b2fa678988c4376fdec74cab80862 |     
  riscv32    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/93d9f4cb32d45fec60aaacc7cde5c33775209df9 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/6d17e7643ac1f21a216933df9aabeec799adc635 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7caa4c1a20f2f5bb1731796eb794e2878095ab5d |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e22e42d48b1f6f4ce43d3d6d59c4b068465ad4dc |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/4e8b06012b487a9d68a46fa9450c00e95914808c |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f69a7c978924db362dc0e874bca98b2b82ce0e46 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ef2c44c9eb826152be174e4ce6595381aba81bf6 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b7f862040af45f850fa6db85e14c96c7f1fd96ae |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/82d4d83e284a6ce9b3ca5fa7115340b16703810a |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b981ff7905b0f0cb5f122cb252df114055279cc1 |     
    i586     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/295de759b28cc1e0f36218917d8ff6cae745f8ca |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e5dced5d621282e688289812d5e6dd460db5ab12 |     
    or1k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/0f38a3273a7fb0282dc2b370bea66515fa7e2f44 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c9775e1c955ce4ea90e6bffcaa91c17fe3181c8b |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/3315ef0c66679d061482388fe0bdccbedc935d90 |     
    arc      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ca69cd522b732b1890bd3faadc8b2e2bd46a7c2b |     
 powerpc64   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/ea2778fb9286613cd635220fc6a9766804304844 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/160679ccd1ec7470d1b1cb89dd83e0f39b33ef9f |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/bdc22e5521ed34ddbae8a7e7270efaf534289de5 |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/00ab2672c950fc2a0f2b785d1c972e51f24e0f9b |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/b7f4862ed20defbb3cc7f85b1c0a2357780f0f5d |     
  powerpc    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/da39a50b1c2dd19aa8168a7f03fe0d1640c39384 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/a0dcc90c70e42ee341e7801ab17fe6e6246a85d5 |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/357ce979bc5a2cf1d2290dbcdcc9170eaf7fe42a |     
   x86_64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/18dbf80f15d8a94613b90575a076d7cc6f09f4ed |     
  mips64el   |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e2d17f5622bc9717fd19775da4842de1a21fffaa |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e668b514175d97c87fcd162db2d57c255f1ef3f3 |     
   nios2     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/9e3771034f0a6fb0da23bfcdec86b19febb79add |     
   xtensa    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/e52fd3dcd82ec3e0e94a118a5ef56ac09d656efe |     
  riscv64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/f6a06890372a55cf32f374c28419f2d79bc6d04c |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/1a54e6c81d4af89568bd7761a30989e1e29d3fbd |     
    m68k     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/80891c90d005c6297894d41eeb246bca7a9feb85 |     
microblazeel |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/7f04a6049b5ef05d0e415d7f454c0aaec0143e36 |     
    mips     |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/c989485101dac20120c79f0b399d2fb459d95686 |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/495a3682cfe9fdd4074606fd76aac7674a92ad1f |     
   nios2     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/3f763370162a0cdca2f8afd4e98c24fe464fd2c2 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/aba32e19ed57e036de9764754a9812c2d02b1f63 |     
    arc      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/421fa64bde87d7943267325f8a56f9546011d03c |     
   xtensa    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/90c4175900c49cefe7334cbd60151657977c3dd1 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/8d7369afdcb5318d7d2ce49f7ede3b3a9dfabebb |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/9885d534bc438cba9a7e2495f620c1c2027d6d44 | ORPH
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/732279c3b0c9eb78ee0069aa9d381a6ce97e239d |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/a832d03727d0bc91e4c0f8cec8017b21fe0db0b5 |     
   nios2     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/fcd95ab70fee4b8f631ea68f80c267fd462b6252 |     
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/530236e04f9897189e681bd4fcc87f764865febc |     
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/11029a047adac4e23dad89c88d8313f0d1c7f692 |     
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/c9c432582b5545ddb9a92c56eb73bb68c0815a1f |     
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/ca0c04039894059daf43140461a9354a2bf75745 |     
  aarch64    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/390f87c285d7abbeb7e5d4d9f9524c997857ed43 |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/40420e1e7369d94153d1ffaeae69865f96459f99 |     
   x86_64    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/2d1ff2fa7201b5d2167655ea8551ccba37fdc6a8 |     
  riscv32    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/ef5df15dee4c73a7d8446bf51f4fb69fa47e6060 |     
    mips     |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/60dc476e5cbe14152e9ececa6ef9bb0c241cbadf |     
  powerpc    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/bfe516e641a8a2954cc5e802e71925fe8b157688 |     
  aarch64    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/e668215347922006388253481e398a47bd078fed |     
  riscv64    |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/7c499fa6bc372929abdaa686a56d84e18741da99 |     
    arc      |         jsoncpp-1.9.1          | NOK | http://autobuild.buildroot.net/results/8c7cee31130260db0c6132e7902dc5e3ca52cb13 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/7b1905209de248deec711dce31fdefa759bae4d8 |     
    i686     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/fb11dedd340ba67a852b4c3d246556697fbc960f |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/c1bd4b96b46595ef5a910314c7308a39fe29c86c |     
    or1k     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/b9c72373286d890e12bea3efd8022b26937cb970 |     
    sh4      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/14d2a22d17835d7d80613f956a5cc03c88e813b3 |     
  nds32le    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/9522242ed708c873afc122b907b5b2aa56fd7074 |     
    m68k     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/5d3764cc93df0a56d210bd403910ef78c796752a |     
  powerpc    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6a21c4b31fd9fbc7a72e06481cb934f059726c71 |     
microblazeel |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a7999b50e3ddc48584ad608e6261f6ed7eca3022 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/f7176d09b7d51e534ca7fe19029fefd59da2a1d2 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d097301c5179a8a6ebda3cab4719223972c6b2b1 |     
microblazeel |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d6a23b9e881149d8ce6671dc2682145707244625 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f8ae966b4343a39b61a0243098837f1b57c77ae3 |     
  nds32le    |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/62784f288d6c0d74f485fd55c13de77f6ce777df |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/0b285446d50c20695a3d20e7e68d30f10094a2ab |     
    arm      |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/64863ddda1c8f07a31460b24b158d2d30ea773fc |     
microblazeel |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/57de1b58778c77b38ed0aed4497ac97d2c2058fd |     
microblazeel |       libmpdclient-2.16        | NOK | http://autobuild.buildroot.net/results/a217b0de7bb77892039ca535616d0ddc7d416e31 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e8e7d50440f9b90cf839e1871039030309ff8efe |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6f720c1be5cc705ee5fa376c6d6561af471bd24e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9c94a6b130be5dd1fb1e82e4a0776eb0a90b0ad4 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/715bf96425bfd1cb39a3eb01028e5138434f562c |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6fe45d161fa1e8c764e80b765426892e62b82aab |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aee3a3f0379f04b1d0a25ce41086826b62fee54b |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/307b1c86f4cba410bcaa5eeb6257ae6bcf3d8d49 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3151071877b0b0d4a96cd86b3d6f2ad34b708374 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/1b7dc0e10140435f42045ca856ff7436dd1da4e6 |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4a6ec292ee0db1ad7f82090a4d153bc6844d3f5e |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7789d8b6c75ee4ec8ca5bda638cc43c03e538a70 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dc5faf9f896afd295ef12acf12eceba396bc2608 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2949e3b63329485527f048f04c43f1d43880d57f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/635066724380dd4f89b16614dad10f93f9be8415 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/54d7d36ab4db21c2cb517e7e084977c8bf656da3 |     
  powerpc    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/78bceb9814a80bcb01263868571f52c0f5a6ca6f |     
powerpc64le  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/5f2a719a50f03f988aa2d0d7a0c50c17afeb7182 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/093a5fbc95214ebbbed20b5ee9b84d4442e31889 |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2bd2ccd9e4c9374620161d88d3402d2665a44fc8 |     
    i586     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/41ffd33770945f2fbe51043fbe7a71a098ab920f |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d9b48373dca3b3445371631c63bb33c771f0e23a |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e908368aac5d714d1546f9c4ab53904d088754fd |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/99898ecd34d42c977a42e52dee3bda04ffa146c8 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c5c89125a9ca0fa2d8f7cd47fd10faaf74c5cc0e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3c7d22e42e7169b11f78301028781d4cf07b6ae7 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/be41638301390f3f27ebb2c0f9f4f21d4352d859 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2a45e4598b6224ee45881f0cca0d873324f67204 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dcfe4722f539b585717a998e6b0b69b4f9c7cf12 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/bf8d13ce5a96dc19116ef231adaeec837a0730ca |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/806ca170e1a3cd3ca121250953e46c898bd664be |     
  riscv32    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dc627d945871173e02a663d765acbcb569c5e30b |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b448ba2d8acdd7d814f9b8c0ca737e0cff3048f9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/64719b2163f9622fdd328fd9b1911d6a9f420a93 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e3660d79c2e8603110e004c06a1e446439fdf4e8 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f850eb999a5f651a3a74da21a5a2165f50bd2b74 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ff2a7b8658f4b064c5a04cbb8fbb7fdefce2df03 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/53900f9973a2d00a196f99e818e2bedf61ec0d7f |     
microblazeel |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/7548f7bba126fb9baa88d74cf9689a4d635c9833 |     
    arm      |      python-aiodns-2.0.0       | NOK | http://autobuild.buildroot.net/results/b8047a718da3f8ca9281f94944adadda39ccc949 |     
  riscv64    |     python-dominate-2.4.0      | NOK | http://autobuild.buildroot.net/results/ed978bca93f1e73af1d36fe94343ee27766eb1bd |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/37321678e492ef3ea0fe1ef11d61e2109c6b22e3 |     
    arm      |          systemd-241           | NOK | http://autobuild.buildroot.net/results/7a0659e50f66e80c53e103fa857002bf2eef58e1 |     
  riscv32    |          systemd-241           | NOK | http://autobuild.buildroot.net/results/7548218f53438830930c7f45d732e7b4f2c13f47 |     
  sparc64    |          systemd-241           | NOK | http://autobuild.buildroot.net/results/fbb5b8ceec447f50e479c1112459c12faefab9ef |     
    arc      |          systemd-241           | NOK | http://autobuild.buildroot.net/results/b198d0fedb602598e297673354d8f1f8c67185cc |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/c70778491ea479a0c13fa7e6ae13fd8132c65bf0 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.18.0 | 2 
      lua-cqueues-rel-20161215 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       host-grpc-v1.18.0        | NOK | http://autobuild.buildroot.net/results/800c5e584a965b31432d1554aee1ab5e3b5c4dda |     
microblazeel |       host-grpc-v1.18.0        | NOK | http://autobuild.buildroot.net/results/d808d55f3c87d0bd88f642f363c4726c9b312baa |     
microblazeel |    lua-cqueues-rel-20161215    | NOK | http://autobuild.buildroot.net/results/5c21e678056b4c6391fa19365b90e4f6a9cafe30 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.23.0 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.12.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cups-filters-1.23.0       | NOK | http://autobuild.buildroot.net/results/5c88115b92abc1360a979cd46e00332f61c41cb4 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/002beabc27eedf82d96b552c1e5a44bb9f51af2c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/9c2acfe6d09a103d800d722315a8d687e4044685 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c046483b96797bc890bd83df62941625cc1614e5 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/be6d695b4c68ffbb7ecfeb211fe864050e729da4 |     



-- 
http://autobuild.buildroot.net
