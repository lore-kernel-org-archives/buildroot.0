From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 06:17:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-15
Message-ID: <20191016061748.4CF5B20482@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.05.x  | 19  |  0  |  1  | 20  |
  2019.08.x  | 17  |  3  |  0  | 20  |
    master   | 122 | 73  |  0  | 195 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 16
                    brltty-6.0 | 11
                    bird-2.0.6 | 6 
                 libdrm-2.4.99 | 4 
                  flashrom-1.1 | 3 
libsvgtiny-ea9d99fc8b231c22... | 3 
                   grpc-1.23.0 | 2 
           host-harfbuzz-2.5.3 | 2 
                libgdiplus-5.6 | 2 
             libopenssl-1.1.1d | 2 
   openvmtools-10.3.5-10430147 | 2 
                    strace-5.3 | 2 
                  exempi-2.5.1 | 1 
                      icu-64-2 | 1 
                libcurl-7.66.0 | 1 
                 libpqxx-6.4.5 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
        ltp-testsuite-20190930 | 1 
                 mesa3d-19.2.1 | 1 
                    mpv-0.29.1 | 1 
piglit-ef761094be04d14e258a... | 1 
                    proj-6.2.0 | 1 
                 python3-3.7.4 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.5 | 1 
                   systemd-241 | 1 
          xlib_libXfont2-2.0.4 | 1 
         xlib_libxkbfile-1.1.0 | 1 
                     znc-1.7.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/841af21b9eb6d5b1698fa84b5ca043cd72d3d336 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1e8e80e4e26d3c67228d4042fccf93497ae9ed28 |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/93b2716dd04ddca4d20ea297ca16666ba5bde190 |     
    mips     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/be52fe80c6bcb98cbe230cf89410113fd5cfd973 |     
    or1k     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/4ea3a0b96d525ca019bc653d44626c75b582a687 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/4c16e60d8da3c6afb31492e1612fc292311be8b6 |     
   nios2     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bd200beaf34589c0c433e4f74a3d2a523fb80a7b |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/17ad5184ae10bbda4ea1adc3267a8f5e22b0d76e |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ad4d30e14db8e56d1af035f7c2ee51cdc5aecaa3 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7d7e20549ecddfb2a56278dc1aa5a1317364bd2e |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/72e0a332911870f5a8a9316eb219ea4201cabc1d |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0eaa17f2df23de8c86ceeb816e080af8fac74037 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/55a1461c1a9c1ffd6ad0a1b50acaad42d00b3cba |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2a4e592f27496387386fed245625fa56fa19783e |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f13f93a66f123abe2f373086cdcc1dbe1f3cc398 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/07c98abeaf29794f39b4e3a5bb325fd1b6a42aea |     
 aarch64_be  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f0634775106c83ec1074cd3dc428e950ffd542d9 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/3b52635a87d7d0b4f1cb6f387e89167482c0b288 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8447da8370c2fa9cc92b63d4410e33d73055ac11 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/382a75ab9fd0e33350d1d02e3ad57f61033cba05 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/6cba05b7904d43898266b1dbaa4249150408931b |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/f897272324d935c3d1b3816e975ea608abac7473 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/909d0c54177e65269c472dd18a20841f18e7e0b4 |     
powerpc64le  |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5a24b349ac5ebee36699d5e39ab7df7da5069043 | ORPH
   nios2     |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/2e000464194a73dd391bdd0f47d1f2e12db75ca0 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/cef8b419b08794afe82b371e68852711c0b85f5c | ORPH
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/7f98980a06f13940c3fe64a8eb292628733a3877 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e3aac6817a16150b744b75ae22519816a1f168c0 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/6af2e2a385d841da446927a5edee2b19d3fd55d1 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a0de6d1661df393e5fc6e0875d31e90872c28307 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/29e7ba994ea15a00519e194818eb8eca9c5198b6 |     
    or1k     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/aafbe6ad738130dca966ecc27863ee30b95fc865 |     
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/73e42ef78cdf1e575a437d66e51e2b2df2d6e258 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/a69a21b1407436437277835586fe060b6f82e77a |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/e4f04bb13ec1b82b73db645bea4933e52bca4185 |     
    arm      |         libpqxx-6.4.5          | NOK | http://autobuild.buildroot.net/results/3416a2eaa6b69014f733d38a17c161b024301534 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/21143495bfa6405aaac3bb602be41950d4e5592b |     
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/20cc6a87a43e54078ef1989f60ad87037b513319 | ORPH
  aarch64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/ca8b1d02b1f09ec26922dd4fe1cebe7177f55b09 | ORPH
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/18a62d43559dcc862a1ced3532fb8f04a0b12542 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/e47bc761d1b24acf193a3b63385c054d13459fad |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/77e48438f2bd90c224c27e411fedb62b064c1b9d |     
  riscv32    |         mesa3d-19.2.1          | NOK | http://autobuild.buildroot.net/results/c9b15e903d0d1f9bf041b053de3d49bf39537b49 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6f50b50108c85894ce40be9a66fd52cb361d2b12 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/004c0cb1ac42565a39604f2e2a7096be4c1cde56 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c434ba88de1d89758c5dd6425e12ab36f7eae9ef |     
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/ad4b25c0ea34904bd146cf1716172904c96b86cf |     
  powerpc    |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/85af60e0d349fcfbcc2bbad5c3ca67c3498b00d7 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/2857272da43fb66f551c8462d85eeaf5e526a17f |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d6f39809988099e95465801c1ed165f61f18089c |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/d52a985b0517f96d0c44ca1ba66eab0f5c0f04b0 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/b33b10316c0973b813dfe0df27263c1ab6c97ca7 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/35afad11965f9386a9470d8531907540bdddf6dd |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9fb8aa94f90e893019cc2902194070b0956ff1d5 |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/bf95a02c6dd0742a24039de27f60376d5b518b8a |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7f50def266e7d805cd82c122522ef7eaa9252c28 |     
 aarch64_be  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5e782eaa82911842a40a58f23a0022fdf377aab2 |     
  riscv32    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8cdf2c7bf67fa119adc5367b2d9b18c845895612 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2e686e4dfd12f59c643f6dde93da532b00def0c5 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4d20718670044a3b6c8372630fe8d11a2b0c63d5 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9ab8a56fbb7c9c2220d8ab012ac71ccfc8b00d8e |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/88999acf149510ab4afe9dfaf6f76cd52a4576ea |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4813c837f9b9e5397fc4e4eecc6d32949372e1b3 |     
  aarch64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f436e6253125a13ff1a9013562cbdb541032c227 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/75d2ccb39b36777eb756987ed66664e0d7d6df25 |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4a8dd0af09f36ae36426533c19c493c88fff71ae |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/aa54ca7dd1d4764d570d5bd2e9382e4b3cf50ceb |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/156c63f56927761aa93ccbf0374383f831444f01 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/1ff618f8e3b34d5b5db9c7d15052600e1a929e92 |     
    arm      |          systemd-241           | NOK | http://autobuild.buildroot.net/results/43556501bfa7e51b5e6aa2f278b1eea801b63da6 |     
  aarch64    |      xlib_libXfont2-2.0.4      | NOK | http://autobuild.buildroot.net/results/46239626b6fdb11027eaf9342f8191d84f4fc076 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/366f3cf232601bcca79ca09cedcd13984fd8e3f9 |     
    arm      |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/76c7fa95945add3a8e1d6ef95976ba72414b6331 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/67d9a208a197f088c415191e635b35e419c795d0 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/952b1d27c6eb21bcf66a0157ea330db1ca7630ea |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                         snort | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |             snort              | TIM | http://autobuild.buildroot.net/results/3c00b41434cf842fbf1a0f04778a188ea1c1543b |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           host-harfbuzz-2.5.3 | 1 
                      icu-64-2 | 1 
                 libdrm-2.4.99 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/ed6c289bac922066a67cadbc6703d5327f01fd64 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/37e0ba94984b9625e57a6f67146aa0acdc91c92b | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bf5d3c0321e8a611db136294c3dac9e690fb949d |     



-- 
http://autobuild.buildroot.net
