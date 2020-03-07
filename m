From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 07 Mar 2020 07:25:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-06
Message-ID: <20200307072525.145C386ECB@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  9  |  0  | 27  |
  2019.11.x  | 18  |  6  |  1  | 25  |
    master   | 159 | 84  |  0  | 243 |
     next    | 30  | 40  |  0  | 70  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-nodejs-12.16.1 | 6 
               libglib2-2.62.4 | 6 
                 rocksdb-6.6.4 | 4 
gr-osmosdr-46698a67e7e06419... | 3 
              host-grpc-1.25.0 | 3 
             host-guile-2.0.14 | 3 
                oprofile-1.3.0 | 3 
domoticz-0f411f781ae4fb4a82... | 2 
          gstreamer1-mm-1.10.0 | 2 
                 haproxy-2.1.2 | 2 
            host-python3-3.8.2 | 2 
   host-xapp_mkfontscale-1.2.1 | 2 
                   libnss-3.50 | 2 
                    mpv-0.29.1 | 2 
                 opencv3-3.4.9 | 2 
              python-pyqt5-5.7 | 2 
                qt5base-5.12.7 | 2 
                sqlite-3300100 | 2 
                       unknown | 2 
                     vlc-3.0.8 | 2 
               acpica-20191018 | 1 
                   audit-2.8.5 | 1 
                 augeas-1.12.0 | 1 
                      bash-5.0 | 1 
                 binutils-2.32 | 1 
                  boost-1.72.0 | 1 
          erlang-jiffy-0.14.11 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnuplot-5.0.6 | 1 
      gst1-plugins-base-1.16.2 | 1 
            host-binutils-2.32 | 1 
             host-cmake-3.15.5 | 1 
     host-gettext-gnu-0.19.8.1 | 1 
            host-thrift-0.12.0 | 1 
               libcap-ng-0.7.9 | 1 
                libdrm-2.4.100 | 1 
             libopenssl-1.1.1d | 1 
               linux-pam-1.3.1 | 1 
                 mesa3d-19.3.4 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
        network-manager-1.20.4 | 1 
           oracle-mysql-5.1.73 | 1 
               protobuf-3.11.0 | 1 
                 python3-3.8.2 | 1 
                  reaver-1.6.5 | 1 
                 ripgrep-0.8.1 | 1 
                 ser2net-4.1.1 | 1 
                suricata-4.1.5 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/ad0800a5082c8c38f528c94a647f92c885a9eee4 |     
  powerpc    |          audit-2.8.5           | NOK | http://autobuild.buildroot.net/results/fa0e3f056e4e36ffa0e8ce7c5a990ba45beb68ec |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/9dbddabf9c645cd2fbf2192c36f1b8ed768ab0f9 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/fb38c760d79447703d733c6e2f19fd1fe8632c0a | ORPH
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/d6f73c377a11500a8b54403960d38f0af8c01304 |     
  powerpc    |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/e5ecea94d79aa49533334265ae86af4668233cd1 |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/22678af28217ed8f08abb4ed4221debac7d3b24a |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/02b4966a6fce210b49b2e211bb043934e9546376 |     
    arm      |      erlang-jiffy-0.14.11      | NOK | http://autobuild.buildroot.net/results/79310855f9a2abe569365ffd27e776f1a56dba2e |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/da092a3b7bc469b8b095b4dffa5dae7c69e802e4 |     
    m68k     |         gnuplot-5.0.6          | NOK | http://autobuild.buildroot.net/results/b99bf4f3c91e14f11177db932c366115053b5032 |     
    i686     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/eefc00b6c5fb3366700d1d5e9b4149424c3aa919 |     
    arc      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/d1967b72381cfdef96a6979a41629fc55b761027 |     
  riscv64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/9e2600037c53a41ed052498e96d97fbd911bbedc |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/55f195d2fb06aa04b86b6197fb84a7dc923ee362 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5dd2f8618b572cd335ae05b821fe5b525871bc42 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/231781630a72b430282c65483927dc2b2a583681 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/b55c641d2df90a9a3a52ab5d6ac980ee7e202d47 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/01e64eb003f84a0f096a06596c2dee52173182dd |     
    arm      |       host-binutils-2.32       | NOK | http://autobuild.buildroot.net/results/6a8dfed983aca986ce1e24f00143896312cea567 |     
   x86_64    |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/6f95711b2031a0407183894add658e58b6be7fc1 |     
 powerpc64   |   host-gettext-gnu-0.19.8.1    | NOK | http://autobuild.buildroot.net/results/5f9c0c011e1c10f6fee115d53d2413adad2ad49b | ORPH
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/61a911995d6ddd972eddf65cbb837a1cddd7bae3 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fd47c90fce4fdf67e5cf54aee5dc87a2c7d329e5 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bae7bd001d18e40f0f252010ea20ab9176936741 |     
powerpc64le  |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/9605aac6f760bfff190d0ab95fa50f65486ffe90 | ORPH
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/059718b4996f24a7dd739b04fc9ccba2245df440 | ORPH
powerpc64le  |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/75a7eeb46129ebeb3874f3265270e139079eec37 | ORPH
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/c37014ba979e2f4e8c78a402d90b8ad7c826ed0f |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/6dbf2ee4b9bccf64118077b81499010d0b3c7a92 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b20fb22727c501b1cab46d51768d127577251b58 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/807a92c0b53ed16454e493450cf5a1b50724ceb1 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/827aa63b3df511e14737064b9588064f5d367567 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/16cfb38c54efff0230a263e151f4b181bc8ffea5 |     
    arm      |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/90b1c59a363d8af87e18575c195bc0c59a2909d7 |     
    m68k     |       host-python3-3.8.2       | NOK | http://autobuild.buildroot.net/results/0a1c0de84b66b4617276ce0fe1a0017e5493eb5f |     
  aarch64    |       host-thrift-0.12.0       | NOK | http://autobuild.buildroot.net/results/57cad5313896c868e99b0b9534678f1c83a386f2 | ORPH
    arm      |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/eb7901b618b73437e8483d3be8ff795c9ffbcf33 |     
  aarch64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/78bfe04309628cfc2f9eb4f4149207dcfe2e6e92 |     
  mips64el   |        libcap-ng-0.7.9         | NOK | http://autobuild.buildroot.net/results/6c87bee94412215c7c0045da947953250e846504 |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/e29dae423f3f80d2c34dde9a125bd216a75ad1c0 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/664221086965db34e6d941b92c5ba91ea8a151a4 |     
  mips64el   |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/528ddf71ca6a2d951a9ba1e0665fa7407c7b0654 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/51b286879f2eb8f29aaf8444541215d3f8c093c1 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/7824b0395674d7c80402b1da56d05a5205acf972 |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/a65b7ba368d249982b94d70cfd189f16263a0c96 |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/76959382443f2a03a0da0c23347bf931e615d9b5 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/2b01110535207039660be28d8c9c217f1aa8ee5d |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/d5fa702bfb4105ad49e96cc9fbd5b2b7534fe201 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/cb7f3c3d727ac7b811d08f63f3ea10c56b859ca6 |     
  aarch64    |        linux-pam-1.3.1         | NOK | http://autobuild.buildroot.net/results/439eb6841fed1cae729983a7339d0e13f0cd48b4 | ORPH
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/ff7d6a08211aaea4eb0d61e548f3e385b199967e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8ace7c94ec88989c909557ef88539eb4e221a063 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/91421b472450b88a7b99bb3abd6205ee49dcfd29 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1707cc99edc510f69d53f839a3536a89b6629a39 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7081a1eb692372aa09c7757839eca08b7bdda460 | ORPH
   nios2     |     network-manager-1.20.4     | NOK | http://autobuild.buildroot.net/results/f0e1bd8cb5fc571c3f3b96d77c924f9bac5bb920 | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/58f9898082569d369898fdcae236cbf545f587ff |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/61df0f3845a0812aa8fa98bb703924f3b02463f8 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7a3905255886964684eb66db83d1ed2242e013f5 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bc8f162e2a3df62f56c06bdbebcfee6e937dc9de |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ff3eb3ab1be0f589acdd760b801602f8ff479679 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/9ba93ed382586a46d73eb08bc16e32a0912572f1 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/e8e41cada0e66545fae1504a32c5370aa6536152 |     
   sparc     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/4eb6786569ada59cc9abe7b3d9bea7e5211d1d84 |     
  riscv32    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/701e25810549fa3cc04b6fe6a5a6a80a7e058bad |     
 aarch64_be  |         python3-3.8.2          | NOK | http://autobuild.buildroot.net/results/fd5b279fa342b6611d1d54f90fd7c3c90a367c77 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/d1852f7e9e48b0fa6e932fb794872fe9bc962415 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/bc232e2cffcc3d79d018d9a6a683e639143ef629 |     
    m68k     |          reaver-1.6.5          | NOK | http://autobuild.buildroot.net/results/67d191b9c98d49810afa7a5be226501891efd152 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/d736b96be61aaeb833f795bf5281e64edd24ff0c |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/707a7fe43ef13ce976f1ed8302782111be6b037e |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/75793199bc6479420a0dfcea442646f38ca9b768 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e6712a93f4c6ed5a473e8b8656cc06e3b2530705 |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f07a7ab395d9327bda45d26068786e282fdb7c5b |     
    arm      |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/6d5fece3742de20bc31c971846ecaba9e7f0a43a |     
    arm      |         sqlite-3300100         | NOK | http://autobuild.buildroot.net/results/7c00951596529aef9be92c4760f274143def4049 |     
    arm      |         sqlite-3300100         | NOK | http://autobuild.buildroot.net/results/e5f0d5e74d5f7b5f9590e2a7da21129b0d1a2828 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/6da2a9f9d2e0ff7ea2a84396307457b0e4895ee9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7668c11661cc9ebe08280ed4f4f6f7cbdc6fffc1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e6bd8761cca9d2d5854376d2c22f89974e376dcb |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ce21267cfcceaeb5d8fe1031ce7af76d37cab60d |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/1b27502bc8f716f41a3ed53568135c6122cea778 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/640fd2eb2f8dcdaaabcd36ed06404c983dd96fa6 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 6 
                   erlang-22.2 | 4 
                      bash-5.0 | 2 
                    brltty-6.0 | 2 
                classpath-0.99 | 2 
            host-python3-3.8.1 | 2 
host-sdbusplus-4212292bcf13... | 2 
                     avahi-0.8 | 1 
               ding-libs-0.6.1 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gst1-validate-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
              host-grpc-1.25.0 | 1 
             host-guile-2.0.14 | 1 
        host-libopenssl-1.1.1d | 1 
            host-libtool-2.4.6 | 1 
    host-python-markdown-3.2.1 | 1 
              jpeg-turbo-2.0.4 | 1 
                libdrm-2.4.100 | 1 
               libglib2-2.62.4 | 1 
                libtirpc-1.2.5 | 1 
                 mesa3d-20.0.0 | 1 
                   mimic-1.1.0 | 1 
                 opencv3-3.4.9 | 1 
                qt5base-5.12.7 | 1 
                       unknown | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b991186f8e15c774048714cbfeb786b630173f20 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d514faa226e0ebe9320f1be752420e8e3ec53a43 | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/cd36ebd52b0aaccaa33f30e016b44f1d4e6098d8 | ORPH
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/787041f6aaee2235305e839f6194c7488038ae55 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f97f01f64d27ca94615de2f6a08dd541259d7dbd |     
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/27e166b43c2a845ef84e80fc6531211a9772829b | ORPH
   sparc     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/637fff1d6c4224a06a6a03a2115cbeba1d8f7c32 | ORPH
  mips64el   |        ding-libs-0.6.1         | NOK | http://autobuild.buildroot.net/results/7806af2fd529778ddfd4b2ae5c2c7c775e3c912a |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4f946f722df252ac3846aa731b004df85dd075df |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4569874d2606159e22472df45e5245a604e17d5b |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/fa4819d8970b29cd9a76efc3136de2d0709e2689 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/d202a6132a96e922175cb17324bf3fc443a70a83 |     
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/6f8ab5ff378226c13e5b5adfbe842847026e962a |     
  aarch64    |      gst1-validate-1.16.2      | NOK | http://autobuild.buildroot.net/results/e6e43fb85c71af9bb599ea8bbe2e805b392cf1ad |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/26e98c460c2244dd9318f039a2c052192036a3c9 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1ef0cbb034032e52ea4e0e12c156de14d53dc945 |     
  mips64el   |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/281a42ad7eca86ad15d91b51b7e43e3e02f5e485 | ORPH
  aarch64    |     host-libopenssl-1.1.1d     | NOK | http://autobuild.buildroot.net/results/ba3f3f6d66a85d07033ad6dd6c9389f5001a031e |     
    arc      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/2814a85f6ccdab4977c6b2856092b918e4a09fea | ORPH
  mips64el   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/852b38e3a6fdb477c528a20617fa606219b3c909 |     
    sh4      |       host-python3-3.8.1       | NOK | http://autobuild.buildroot.net/results/459b67c81bff1d3c88bf98dfab70361aa4fd8ba9 |     
    arc      |       host-python3-3.8.1       | NOK | http://autobuild.buildroot.net/results/b0906aa14f539ce9c586cfe6dcb02c7c0b3cfdbc |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/1e2ec539f2532c268e43a03dfe52fd816f83c652 |     
  aarch64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/6bb39a8b53e1211f77faf7dcfcbd9cd94ab7c651 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/2ab86231ecc958f4ff375c0d031cceccecfb870f |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/d7f2382a7b214acc4130687f10153b7db84fe6ef |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2861131861e33454ba558bb7b47c012dd946b04c |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8ebf345b7dd2d977ccafb8c6286bf3b541612f27 |     
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/6eac99d886fd07f71c3e2518d732d3a1bfbe8307 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/0700a98f576d05b33bf12eb0e46997adb312a529 | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8022cca239463a799c9ac935b9342ea0acd6eb64 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/1ed9b8d89dcb76389a90e0d8614ee063cf87216c | ORPH
    sh4      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/076464d10914e7e8f2d30b949d140d344396016a | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/168d81a5ab7706fdd347183141c0b8050556cdcb | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/53c9f31e65505173f99ee99984dcf04a3d0053b0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9420f4c5f7c03ad6f41f94b09e97c1fb298968b1 |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c5ef48a2b922a2995af795b65b5bb338afab92c5 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/ac46ff1c0ca684628bbdf17545cfdf3fd30fc9ea |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/9c9972821da0682d0f39f12982bbac65bd957e23 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ad85e2afb7909dced04832376ad1070f7527284f |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
              host-erlang-21.0 | 1 
host-google-breakpad-7515ab... | 1 
             host-grpc-v1.16.1 | 1 
             host-ninja-v1.8.2 | 1 
   openvmtools-10.3.5-10430147 | 1 
            qt5location-5.11.3 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        host-erlang-21.0        | NOK | http://autobuild.buildroot.net/results/180f3ce772b3a2c5c4a1b9ec098cee6072a9d673 |     
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/e0f952f294dd965e2a8a4cc6441dcba37b5f664b |     
   xtensa    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/1dec58dc0121c2b9af024e1fc3e478be2fa6f022 |     
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/3eae9e3c07371b91d475a0afd732c0609e13395d |     
    i686     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/edac0b4b902d30108da4e11869b0c2f55e5a6817 |     
  mips64el   |       host-ninja-v1.8.2        | NOK | http://autobuild.buildroot.net/results/f9d64d8ce26be3a8457227eedbb75eeb6d0e6531 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9d3bff863e050cb7d1d2ca561c024cea176b38ba |     
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/71ac99677344860055693327a678d16177b3cf42 |     
   xtensa    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/d74b43469998309e9b86275a28b90141d482f239 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
               host-llvm-9.0.0 | 1 
            host-python3-3.8.1 | 1 
               libcap-ng-0.7.9 | 1 
                 mesa3d-19.2.6 | 1 
                oprofile-1.3.0 | 1 
                        samba4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/063474f8ecad7bbddd2eda3833f640d7e309b041 |     
 powerpc64   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/4ec078089f59217f588f99cee0912993f30d98b9 |     
  riscv32    |       host-python3-3.8.1       | NOK | http://autobuild.buildroot.net/results/d394b37abfcb2af3a43fb837af9c1154f16f35d8 |     
    i586     |        libcap-ng-0.7.9         | NOK | http://autobuild.buildroot.net/results/c6ed0cf53ece2a1aaf9d24436fe4919c02a0a94d |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/a2528eda63aeaa036f52d91261f1b92a6b373f21 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/392874a2c9b070837747eba0f323825fb13fdd78 |     
  mips64el   |             samba4             | TIM | http://autobuild.buildroot.net/results/78f098018c7d808f5124d671972403c1c5bdc3f4 |     



-- 
http://autobuild.buildroot.net
