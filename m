From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 06:26:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-29
Message-ID: <20200330062640.851BC8804A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  1  |  0  | 17  |
  2019.11.x  | 12  |  2  |  0  | 14  |
  2020.02.x  | 10  |  7  |  0  | 17  |
    master   | 118 | 70  |  0  | 188 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

psplash-fd33a9b3d68c89fa22f... | 10
               collectd-5.10.0 | 7 
                libtirpc-1.2.5 | 6 
              host-grpc-1.25.0 | 5 
                rng-tools-6.10 | 4 
               libglib2-2.64.1 | 3 
           host-nodejs-12.16.1 | 2 
                   mimic-1.1.0 | 2 
                  ndisc6-1.0.4 | 2 
                qt5base-5.12.7 | 2 
                 rocksdb-6.6.4 | 2 
                suricata-4.1.5 | 2 
                  zeromq-4.3.2 | 2 
                coreutils-8.32 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.1.2 | 1 
             host-pango-1.44.6 | 1 
              host-systemd-245 | 1 
          libmicrohttpd-0.9.70 | 1 
                   libnss-3.51 | 1 
              libostree-2020.3 | 1 
               libupnpp-0.17.2 | 1 
                    mpv-0.29.1 | 1 
                   ogre-1.12.0 | 1 
openfpgaloader-849e5751e06d... | 1 
                  pango-1.44.6 | 1 
                proftpd-1.3.6c | 1 
         python-markdown-3.2.1 | 1 
              python-pyqt5-5.7 | 1 
              syslog-ng-3.26.1 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                     vlc-3.0.8 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/11e9bed245547850ca6ef6fe63da9efd6975b9bd |     
   x86_64    |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/f58e4aee05cf3e176cf0a41003c4554b303a393e |     
    m68k     |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/0cbe8fd68bc70b498669708e16cc179529f776cd |     
  powerpc    |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/f5afe60defd63461a5fc06b26bd4759fb5f56a8f |     
   xtensa    |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/0a693b5be8b887cb6e7e18f1af7465ad42181541 |     
  mips64el   |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/abbd088c7a7e0915ff96e42220028c54931fee62 |     
microblazeel |        collectd-5.10.0         | NOK | http://autobuild.buildroot.net/results/b2f909b1f8db2c6519933bc05cfd6b8a4c537fc9 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/64b691d26feb45d9668d16f03a324f627265610c | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9f65e28e2c76ed2ae59e9157722e777f3f2a0624 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/80492fcb706f0be1f13493fea2e6a17a01afab5b |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5ecca085c2064233a24ce8bb1adb1e366c6324be |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6a37f81affce0e15eafc9efd2d9737d38d38a951 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/71855231d2cd2a55ead958786a3f6a638c337e14 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f0d68d928c06deeac01484c33d442081b82481ed |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/57d99f6050264bbfca3d0faa7f75a3e8527d5ead |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/8863e78789fb0cae98d8b22eb6e02a800f720323 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/130954568c9b462e5f12905212075bd1a69d5b15 |     
    sh4      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/6b755fd04b979b2e7faaa9cc2370f8a0ba08fb1a | ORPH
 powerpc64   |        host-systemd-245        | NOK | http://autobuild.buildroot.net/results/d3f2f164bc028c3c4dda5e09bb4c1ef1d9261970 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/52a60a21d771cd5fcedb5272875d9c9022a55c47 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/d10cdd8852d793e4c16a4f3eeba19c92b3d10251 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/88a7e04a4cb0de030f4b4a5f0c80b12c02afc680 |     
    or1k     |      libmicrohttpd-0.9.70      | NOK | http://autobuild.buildroot.net/results/86ca7b08f75895f1a9a57b5d360d093c31920a37 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/91aeb9193b9a2a476fc10c38c0cc9a67bddcb0d8 |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/d7f784f2ad30f6b7e5b3c208ca2918b5f2d12673 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/04190cb39576eabb85a36bcf621cf096d65e148d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2b4dab00ac8ff70fddf98db3d2a22274851fbcb7 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4e3a60ae6f4722dba5c9ff61c398b5b9e5c4e442 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/93c69658b995db205ac1a1f15389523e1d321547 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/127e8c5a98bb1e15c71ed44cec5084b95e971c60 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4f462035239962382d003ac1c18e96acdbcabd7a |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/33c1f7d794cce20ec462ec37a7a5fd9a41bb8995 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/da7c0dec4768728bcde15b58f6c30e79dd3e4f15 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6c4d33941bb134fbf9df6ea88035375be2a9c806 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/327fcd50dbeaeeee3cf00ac81eccfa359f45dd76 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b937e098254359d1eb42ca5cb24ae71670b10640 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8a9c1a4688dd43679706d31211b39edea20e7667 | ORPH
   xtensa    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/bd812fe9e1fa6d4ba6782a3eb028a2574d0dcc48 |     
    arm      | openfpgaloader-849e5751e06d... | NOK | http://autobuild.buildroot.net/results/bb832f88eef5e7abb4df9b074f6a26a927fee258 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/c18b1d396f555ed1a076d5daa288119e3765195f | ORPH
  aarch64    |         proftpd-1.3.6c         | NOK | http://autobuild.buildroot.net/results/45e980c85d170827d3a41e7443cf1088b2d59ead |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/46515443cbfb01f563bd38c7a0ef05d29eb22444 |     
  riscv32    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/41c87f312d7ce7e6f0fa5eebb58e2e2cb8e72ebb |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/975b46598b7df08bbcd0a441c0f8b3d10f89a16d |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/39b3d56d655a977b32af53790c401cff5d22c452 |     
    i686     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f66a65cb028e6ee638575aa3ae3510c211247f33 |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f3979478ae33ca79cbae3659dafe885b6cd1bacc |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f6af6b0dca13f3821d4c8d84c897c3c600bb34ed |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e1cc8e7f5f68c988f4b69d0fa86e61182fabbfca |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f460a19efa9269145193e147e575ce9e7a20e1da |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3615dabef9ba0bca327adf64191546e48ca5307b |     
powerpc64le  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/2c0e9ec7ee55cca2f49388c4325f79e2cf8a6320 |     
   x86_64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/fde540608fcaf239177da687ae54d2e52815354c |     
    arm      |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/d6cd76250e0f2fc1cf5902767fbb70a5caaeb782 |     
    arm      |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/6b07cd13155b1fb43b5ff0ea84687b1320bda68c |     
   x86_64    |         rng-tools-6.10         | NOK | http://autobuild.buildroot.net/results/4daab36d6bca651848f211f77ea5459c5250d2c5 |     
   x86_64    |         rng-tools-6.10         | NOK | http://autobuild.buildroot.net/results/3a1d0b734af0d0156b4277a1bb8325ecea8c5617 |     
   x86_64    |         rng-tools-6.10         | NOK | http://autobuild.buildroot.net/results/bb7dbd5a76c1ecd2a1d205f4a1c391095e653886 |     
  powerpc    |         rng-tools-6.10         | NOK | http://autobuild.buildroot.net/results/0ca6bf16e3acbc94065b88c4442d6595424b77cb |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/95c557d3b059c6697bc5fb6675a47d7a8ab04b71 |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/6cc2f839a5813d07806c02e3e266a50ff4a2c0d8 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/2ba31abf44854f448eba343d64f84d146430c3d5 |     
   nios2     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/c041123f54df2f0b9665d2faa14c6149bf93b37e |     
microblazeel |        syslog-ng-3.26.1        | NOK | http://autobuild.buildroot.net/results/55650b17cbdd038dc752d6ce1ba5a3be58c0fdbb |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c466e2ecc415e8ec5c1c32d2ed09eac4942c1747 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a9376d26c7d8a597f65e5e405b9d215b8dc5b02d |     
   sparc     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/c4e840f37fb760ea4bda8a34f098ce9b4674cf2a |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/efe9865ead239540098fd37e2650816f0f64a9dc | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/4183a53ac186fd66700562bfea665405f2204aa2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8a269b077392a03be10a54679ca8ea7d76ad9337 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d83d9778ea7e73cb27d6e748644cf81c1e6d8cde |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

           libwebsockets-3.2.0 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/5181756a51c698ffafd6ac4ad4f89a8af8bf3a23 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/73f519e67854f2baabdd14454d15dd7473b37804 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 3 
                    mpv-0.29.1 | 2 
               mongodb-r4.0.12 | 1 
                oprofile-1.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/082df28221ef77df5378c145d28b1191b407ebd2 |     
   mipsel    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ab597101b39cb0389bc00c8bbb970b38fbb2724e |     
   sparc     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/0de99db4b864248aa9736965c51d30c07d87a07b |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/2704fb2b0e83bf4b078258ceb7d3ccd2106ca89e |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/eca0aaa0c0ca1f34c65e49dae68d60d46d379f18 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/de7e85052d313bad57f9cfe669519d54d43cd78e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/6d675f49b61cdab500981d22e49efb224adefa20 |     



-- 
http://autobuild.buildroot.net
