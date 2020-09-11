From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 07:08:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-10
Message-ID: <20200911070826.658B8868D9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 24  |  6  |  0  | 30  |
  2020.05.x  | 18  |  8  |  0  | 26  |
  2020.08.x  | 20  |  3  |  0  | 23  |
    master   | 112 | 56  |  0  | 168 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.10.0 | 3 
              host-grpc-1.31.0 | 3 
                       iwd-1.9 | 3 
                   libcap-2.42 | 3 
                  uhd-3.15.0.0 | 3 
                       unknown | 3 
                 dmalloc-5.5.2 | 2 
                      ell-0.33 | 2 
                 gnuplot-5.4.0 | 2 
host-meson-tools-0a02e2d344... | 2 
         libcpprestsdk-2.10.16 | 2 
                  boost-1.74.0 | 1 
                coreutils-8.32 | 1 
              cryptsetup-2.3.3 | 1 
                   dav1d-0.7.1 | 1 
                  fbterm-1.7.0 | 1 
                  ffmpeg-4.3.1 | 1 
                 fwts-19.09.00 | 1 
   gdb-arc-2020.03-release-gdb | 1 
 glslsandbox-player-2019.08.23 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.15.1 | 1 
              host-guile-3.0.4 | 1 
              host-libcap-2.42 | 1 
               log4cplus-2.0.5 | 1 
                  luajit-2.1.2 | 1 
            makedumpfile-1.6.7 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                  ndisc6-1.0.4 | 1 
       opentyrian-9c9f0ec3532b | 1 
                pipewire-0.2.7 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.10.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                   trinity-1.9 | 1 
             util-linux-2.35.2 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/893a6815a962976fbb4a6e8d8ba537793d73a55c |     
    mips     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/be3f3e86356fb733633494cce31a9fcd8ce7d8f5 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/9994962a95666dd06b739fd66f6d8774bf69f1c3 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/1e8e6a9eea465af267420ddc761b450156ece81a |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/d1571ddb55c7b073f1d0cfd32514067ad65030b4 | ORPH
 aarch64_be  |        cryptsetup-2.3.3        | NOK | http://autobuild.buildroot.net/results/38964ca7826e37c11db5c65d59c2bd2fe21b7568 |     
    i686     |          dav1d-0.7.1           | NOK | http://autobuild.buildroot.net/results/c80a35030e9496ecc5d86a32fa28ccce2346ea19 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/0c071c349b10ba8a464bd686cddc51f7ffc5161a | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/481f5dd8af503936cf1201e45a6377a7b1794bfa | ORPH
    arm      |            ell-0.33            | NOK | http://autobuild.buildroot.net/results/c37fc77b8dfdec92719179f8808c95a758ae33aa |     
    arm      |            ell-0.33            | NOK | http://autobuild.buildroot.net/results/26e3fa5c5d7639d2fa307800ebd54452fe0661fa |     
    arm      |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/b9284b0944245a23ca0d775c882a46886167f12d | ORPH
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/66f1128167fd6baab1a7a1de77d30a768c474977 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/9a3b3a820d43076c7c840af1cfc0e408766e1b47 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/0c26445fb913e59688c790a22c5e9206d4807b63 | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/69237e88e1d17178e4249125addabc0396895e2d |     
  mips64el   |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/265e311773efd10e44ab21cd1a59de14af2a105b |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/e6896fd50635137c0e1e7a16dea5a034859707e9 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dbfa186f38a976034e92ba780b505812c9b6c302 |     
  mips64el   |         host-go-1.15.1         | NOK | http://autobuild.buildroot.net/results/0e6e47269a89caddf7618463a9eecde92f51c178 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c2078e821e0728fe980be2c849c25d82e791a4c2 |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/3ebb2880b9b3fd5154979016391dde897e2c039c |     
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/18661c888588666e56d82792a5fc1714c133fc5a | ORPH
  riscv64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/100b16fb87a0fd19d72042405869f25944b6f3ed |     
  nds32le    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/602d474a12cf2400e4f38ffad903758d7fd9f2f5 |     
    sh4      | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/65cfe582ce60fcff18afd008c3d469471ffb0e49 |     
   xtensa    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/c7a0096a269bfc52bd8e23d453d36d5bfb61441d |     
    arm      |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/a2d378de6dc0acacb246963903a1ad57f425d16b |     
   mipsel    |            iwd-1.9             | NOK | http://autobuild.buildroot.net/results/025701bc7d32260c7364881dc8357bd594c45c41 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/a39fa0e0bac175fe74b6285022ce6058a5661fe5 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/a06c6d49c52614fd77888183e164e40fb3e49dfe |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/3be6d3604e2824d85dab9f99df3ac1353c7ef12a |     
  riscv64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/c0d3642c00c2063049df9000315adb19ede52a3a |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/5999b9d2d836abc2205a81b0d1ec153ef8e95ad6 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/da73524f17177c09432306b60b94e780995fb30a |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/c19432a610e69775f0ed06eb5ca6ee711e5a8320 |     
  powerpc    |       makedumpfile-1.6.7       | NOK | http://autobuild.buildroot.net/results/7bb95b34f396211261853283165f3e3222714570 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a8bc816c2ca939a3166cc5f701ac9ace4ffce7b8 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/f98970eebb13f07c255318cc22485c9f919a5b63 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b98e7e91ae792974d7112552f29c9c26e65edc95 | ORPH
    arm      |    opentyrian-9c9f0ec3532b     | NOK | http://autobuild.buildroot.net/results/241b594bab63b2eeceb749e01510da550ed0ffd1 |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/aed4a243c510383978f518464ba4542e9beda758 |     
    i586     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/0be38a566fe40f1d11709b8916a8fc9488a10008 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/34fa92c1e0f601d6ce2f805a3344cf25346b37a8 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/68ce3a19ec37b08110e67ba564e3695f367a7026 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/66d499be6c0d4dd1e5250f59f3703615d482c437 |     
    arm      |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/bac2cbc791e2ab1d0995c8417bd3d19cbc884e47 | ORPH
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ec873f365bb70cb7141e88063d2b4107aca46869 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/13882f30bcf383d96b13de15c61c20dd7de71c9c |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/1677bae8688551b09f67b3efa014833d6c637c01 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3f503bfc1450ff4d457598a158b3d668da8ed92c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d44cc82730d4937fd9ab5a21b1f1ce5a2cb7de34 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb3c06bffb67183ca26fe21a34b6d82f952b93a7 |     
    arc      |       util-linux-2.35.2        | NOK | http://autobuild.buildroot.net/results/095ed5f001923558bb9981bf23a599cefd32419a | ORPH
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f661d0d40c62dc30bef603fc00e439a2795b9ad9 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                   expat-2.2.9 | 1 
              host-grpc-1.25.0 | 1 
                   mimic-1.1.0 | 1 
                qt5base-5.12.8 | 1 
              qt5script-5.12.8 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/02f561ae7d6f0f133a3179c865a88c1f60f38c16 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4a52be548424178e195e92b02abacf44d5d37b8e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6bbefa8492376f2c3674f0657e89ab8f94914ffd |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/6034b6b823ebc29c2b2bea9b8218dfd4a1ce9522 |     
    arm      |        qt5script-5.12.8        | NOK | http://autobuild.buildroot.net/results/43ac161b8331ca26e92bbd84ca39e0e2b5da9e35 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7eb142ececa975befc84ec30d22474169ea3b50c |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                 dmalloc-5.5.2 | 1 
                 gerbera-1.4.0 | 1 
                  luajit-2.1.2 | 1 
                 openal-1.19.1 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 
               wireshark-3.2.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/1f1d0a0b197f4c6fec8ae3477130374378da64d4 | ORPH
    arc      |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/ab650ee6062191431cd7d2af1967e5f67cf71c61 |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/419634c56efa85afda96674d6335a8dbcbddb224 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/bb03e87573877ddf3151093a51be5dd5cb14283d |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/58a8de75845d84c30192c50f78579c09d1db377c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b40c651f1ab87b5a43605c919a53005fcef9caa2 |     
  powerpc    |        wireshark-3.2.6         | NOK | http://autobuild.buildroot.net/results/bcbf829d81310bc541e9ae0019260b254680e198 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/09c9db049d0766267d203ce0258ac59ed601871f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                     kbd-2.0.4 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/57f81659d31f7449d8249906c95ff660baecd6cf | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/174e21913a9e69df08014058020179240f60822f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/dc7b2ace1790a26847d6f09a959fa3059c7816c1 |     


Gitlab CI results for 2020-09-10
================================


-- 
http://autobuild.buildroot.net
