From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Apr 2020 06:32:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-02
Message-ID: <20200403063239.1084720524@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  8  |  0  | 25  |
  2019.11.x  | 34  |  9  |  0  | 43  |
  2020.02.x  | 28  |  9  |  0  | 37  |
    master   | 227 | 106 |  0  | 333 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   cegui-0-8-7 | 13
psplash-fd33a9b3d68c89fa22f... | 11
               libglib2-2.64.1 | 9 
                       unknown | 6 
                   libnss-3.51 | 4 
                libtirpc-1.2.5 | 4 
                      tio-1.32 | 4 
          gstreamer1-mm-1.10.0 | 3 
              host-grpc-1.25.0 | 3 
               libupnpp-0.17.2 | 3 
                  ndisc6-1.0.4 | 3 
         python-markdown-3.2.1 | 3 
                 rocksdb-6.6.4 | 3 
                  boinc-7.16.5 | 2 
                coreutils-8.32 | 2 
              gnuradio-3.8.0.0 | 2 
           host-nodejs-12.16.1 | 2 
                 mesa3d-20.0.2 | 2 
              python-pyqt5-5.7 | 2 
                     vlc-3.0.8 | 2 
                  zeromq-4.3.2 | 2 
                 dmalloc-5.5.2 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
                 granite-0.4.1 | 1 
                 haproxy-2.1.2 | 1 
                      icu-65-1 | 1 
               libgtk2-2.24.32 | 1 
                 libv4l-1.18.0 | 1 
               log4cplus-2.0.5 | 1 
                netdata-1.20.0 | 1 
                openblas-0.3.8 | 1 
                 openjdk-14+36 | 1 
                  pango-1.44.6 | 1 
               protobuf-3.11.4 | 1 
         python-gobject-3.36.0 | 1 
                qt5base-5.12.7 | 1 
              qt5enginio-1.6.3 | 1 
               qt5webkit-5.9.1 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.5 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/bc4e1d9646ce62ec481c6ef26e1e54e79a577d29 |     
   sparc     |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/299ddcc0c2267f7aec53050ed301645250e6ea26 |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/8555a8f33586a4f62c05adfc0e3acde6156bd749 |     
   sparc     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/de80a311381f1c38e6ac0fcd529cfe1bedaad3bd |     
  sparc64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/41a1229a510c851fb798d8fd026ea6b9d41e88f4 |     
    i686     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/8ebafeb3740a599c2aba183b545bef0c1d201a1e |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/5871791bbbd06129657657c5102768b034e4fd27 |     
  mips64el   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/1d37e1b6cd6a52a980eb281b483ae23e0947d1c3 |     
    sh4      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/782147338080d256662b8b942986bed16ff511be |     
    arc      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ce3729096e427c8bbcd5cef6436a398d0d2253cb |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/3dad0e95227307562bd80b859773b4863da8f45a |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/a2c837f6f77c04ef63d2dc5d7a4f23db2ba9bc26 |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ceed10bf945a18c1b572782f7ca865df6d573354 |     
  riscv64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/531ce158931dd61a72b13d6d8d4f9dbabdc427e2 |     
    arm      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/906bd48c5bf7b5d43a385d7ee6ec6cf1b78b7b9e |     
   xtensa    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/b452e71d5cae80a0c664b14f762412648704a761 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/b171ad5b8a028109df7c3a611810e54bcc328a4a | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/c05326357ac79b5aaa3cd3f4f4cb4ef274af5b78 | ORPH
   mipsel    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/246a2e1b68a08435106913180239ad19814eb18e |     
   mipsel    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/2b22e19fa36bf82154c6af8fa18c4f011a388c75 |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/8c94e0cd6510e6cc6b45df03039d98fd632d34d5 |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/51174c05984bb8b3e6b7630df21be9c6e9cb0cb2 | ORPH
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/616d8b29a15fb6d1d3d8389ca572423aadff399e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/65da89d407ba0503bd5194ff9470f6b89487b98c |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/afa150b5a1c086e317e0d36fd21849afe7b8fbe6 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/6566fe2ccbf273145e8d4b4a2671430f7d0a5119 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/022c7189e595bbc353ef4c502408c79898391bf8 |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/49d07817bf1ce1e3714c8aeaff03270793d2f700 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bd68f64a2be13fb067244a320cce4164819beaed |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/26e3ccaea8448d550473cfc715095889c1ed61de |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/7473d18b8d7dcd85893f2755b71409fa783c384e |     
   x86_64    |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/fee296dff7341481f58fbc0d866285950893fca5 | ORPH
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/189b042d2f5b08c11d6097a29e9e8a3e09773f38 |     
    or1k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/be7b3793a63b2bfe2c1f6cb1e89df2c483fd9fe1 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7c6b994ecc1d61217c22aa39578f2e3a96a883a1 |     
    or1k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7e83f4ac9c0c8631aa225c589690d42723c19e97 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9335dcc0bbfb60986d2fd8444c2ed0427d16720f |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a473149ddcca7043ec4bae554aade8ff9b7e0d3b |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9e85d9ec4999dc001a33a5da55f4e2cf84bb20d0 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e620d303127c89c4fe1f9778731357dd7335853e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7651c17c7e432157fa37a2890fa6cb9a054f6cf3 |     
  riscv64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/b2267a9abb4c55c45e04b5bd2b2ef863ec92242f |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/ebfa6bfabfe98fddbc1590c4d5d8038f3eb8992c |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/7626a9f4d604b3657b88a4a6da4db3a8eb810059 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/2625066922fb83db42ad4ddbc26bdf0b3ef09cb1 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c4b3a4a6d39773c2faa8595f64f1ce747971f5a0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/36eaf69b99b3c1e2145fa429edb203af18087271 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/42a7eaeb58274512ea83bdc8cc23490f40b177ae |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ac5775697fe329b4bb582b2bff1e313987e185c5 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4ac41c36c0b24241e872aac0439699b816e34bf6 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/03d39a984d08946f00bd3246fb8a9c7534db6931 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/dd8cce367d1273f3a4d664b9ca7277762a93bca4 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/991c7d68a822d07a844068acb8805a35783f83d7 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/09e58d21781d0f042cd18a3e0d07fe30c2dbbaed |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/54a5ea4a4c763e32828bef19096cdaefcb02d94a |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/1b3bf80cacffe0b48266bb07012e0e5b75285419 |     
    arm      |         mesa3d-20.0.2          | NOK | http://autobuild.buildroot.net/results/a32c6c25f16ed496a3a46889ea2d3bcbd970d71b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/eac3cefc212ddbdb588c4781b44120c149d8c00c | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a8ee0afcc13879b3a84a13ea3ef3e95933736dea | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5686e9798303946388aa8206204eba7f5e0ec4d9 | ORPH
  riscv64    |         netdata-1.20.0         | NOK | http://autobuild.buildroot.net/results/69ee6ae8a5b7cb8fca87d1369dca3e1b02b5e982 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/7e665912df73d69abe0dad4cf491c57fc967578f | ORPH
  sparc64    |         openjdk-14+36          | NOK | http://autobuild.buildroot.net/results/0a4608828365df301114b533d6b59a4733599d94 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/f6fa3c2217115b0fe7168444ec76e8c70d3c3e29 | ORPH
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/f6fd62be77b18fcb08579dce74a6a3e54a69dc3a |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/45e03c84b050d31b9322c09fcf186fcebaafbf9b |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d837f61b58b9cbe1fc38ed1693f700a56edb2995 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ef5d7487526bd608f2c976b8d444a177deff0763 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5bfbb8942264e8765adc5a0ee7f6637f874c5362 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/77642112c7941786270a1a2c91034274c6453908 |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9ec8f3871dca0c714a2a5b4b85b02318ccfc42d3 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1793e867ed5885b58e95c33d1037a2e2f65d4e01 |     
    i686     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/8146318c76dbcd921958268818408e199b75be3f |     
  sparc64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/cdf007348f9bb016064731802e403f8803541354 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/56e72694fbc778e89e40f2b55428130dc17ba1e0 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/6174ffe9aab9a3bb317a68d12ea1c7f0d59726df |     
  riscv32    |     python-gobject-3.36.0      | NOK | http://autobuild.buildroot.net/results/e89460a693d52b794f0aeb11167724020dd3ea49 |     
   nios2     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/e743539f9af5b86dea36868771027da41c257409 |     
   nios2     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/e5209ae7fcb3abf2aa0ace882ab0ca2c2a44d7e9 |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/590ecf4f62a80fba48929dbd46f2aa1eae769b6e |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/16ddb5404693ca1defcce1ba79c3d0890729250c |     
   nios2     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/64ba700bdbb6d048117c151ccf99b9a49a2911fb |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/9e5d561d7a70c8f5aee1d8aacdaab7ad0ede1280 |     
  mips64el   |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/a0817d89ea20c1d1bb5346a62a1e0a33d2ae06da |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/1412f961b6d4d169aabb46dc4a74cc1069ee73ae |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/93c6d5a2021936c6d1c5b88ac0c4bf6bbf7c88d2 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e15c8e1eff9aafe665b22d26f54517f9a6adb106 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/752c369ccb67f09a8e291ba49dbcb64746da3836 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/2437e34b05a4d6625e0a32e222910cc62cb37e00 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/ebc349d22540c82520e3e84fa7399a04f0535e89 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/61b02b6587d4a1bf69f71e30f05b3e830ca990e3 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f3202a096d9c1cf244a1cc722859b76c563a333b |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3ae7cba8d599df771281b7e9b2f453c7234382a8 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/36c2f67fadd6e47fc5bdbedfec3b739dbc352c81 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0973fe60c9a8a4a78cc9c21c811f451fe67e0423 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/21663f09f4d158ac5db182986cee3edb9c588c77 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cb9e8accd9417b4ea2bef466682cfc2f5b00ce4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e4fca38d62d8215dbc599727361228d06460a8d2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8e2283e09cf762f7d9ab4b4df038e3ecc8b7fe36 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/0f92f0466b6dc39d23f172c2083ec9095609e1f2 |     
 aarch64_be  |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/1fe74b70cc4d5b19212c222089f4bacf113d6f9e |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5aa377216e6ddcd3c35c1b2ee7da7c419cd3e987 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/b22372bbb7728ede0547178495395d1a7b246df9 | ORPH
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/f52077a46e7e430212e7e503fded5ef8b1d5177d | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/9753fa42361ed8051dbe3823e4cce46bbab5e594 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0272107cb511b8f61f583678f01480493904ac37 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 4 
             host-grpc-v1.16.1 | 2 
                classpath-0.99 | 1 
             gstreamer1-1.14.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/6e8789728194d1d395cc4861674a593c96478a51 |     
    arm      |       gstreamer1-1.14.4        | NOK | http://autobuild.buildroot.net/results/91bd08346cd4c5f0750ff7b79da6ebc267c077dc |     
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/a790eadfe73e2eac2e93db8dd17a691e23cb94c6 |     
    or1k     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/c68d350a7a7bef298fb8d2bd75f5db145f0d5e48 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/43f19663d145a3de006d2e8061f5480a69bf71e7 |     
   x86_64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/f8b2cf0fc8dc77857f9c10d36b638df05c107e8b |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/06e45f9824257d62cc54284914e92691e87efaed |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e3660746d632f87859febe0f9078115fdc8887ac |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
                haproxy-2.0.10 | 1 
                host-go-1.13.8 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.4 | 1 
                 mesa3d-19.2.6 | 1 
                nodejs-12.16.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ebae9c8ec0f48d58460d1b6cd6fec85c1416b006 |     
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8ee1173fc6929678c177d9fc8e541676f364cc63 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/4f5e9abc10007b673ce0770cd7f9519a479a445e |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/351dc57e80b5bcb2913ffdd57a283d873b7e26b7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/9d7f4c60fee257083e1451767f6df51bd16c2e15 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/bcb75a6a80269cc8634b87e0c2bbb0fdf36405aa |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/5f713e921537dfb0a4e75362d9d6a4d75427fc95 |     
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/e1ddeef0ae8d372e80655cf88830106b605cb607 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/0582e3ee297d0e4525d6445fa4d3084200a446af |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 3 
               acpica-20191018 | 1 
              gnuradio-3.8.0.0 | 1 
               libtheora-1.1.1 | 1 
                oprofile-1.3.0 | 1 
                 ripgrep-0.8.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/57a8a610fa39aae2bdeea630e15e0ff913e4ce45 |     
  aarch64    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/89c9faf4ff75aad18c526c770df0a2608d167a6d |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e35da31c369761c612d9d2c262d5de3b522cf477 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1c8f804e9a5f058ad42222e943f8d1578f869e12 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2e45a87804fa483cc7cbdc14a9d1579c44a45c50 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/71f20016e5c09c6c6408304cdb9cf4df28f91c58 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/5d4e7544f5fbcc814c9683ee485eeabbc4a73bd2 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ab38d99b336672e0f3c48844fb9239a2a734afd7 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/40b07c71b8bafbd714d3984f81c984d474f93fbc |     



-- 
http://autobuild.buildroot.net
