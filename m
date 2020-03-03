From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Mar 2020 07:23:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-02
Message-ID: <20200303072356.5CD39870D7@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  2  |  0  | 21  |
  2019.11.x  | 14  |  5  |  0  | 19  |
    master   | 121 | 49  |  0  | 170 |
     next    | 18  | 34  |  0  | 52  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 8 
                 opencv3-3.4.9 | 5 
               libglib2-2.62.4 | 4 
                 rocksdb-6.6.4 | 4 
                oprofile-1.3.0 | 3 
          gstreamer1-mm-1.10.0 | 2 
             host-guile-2.0.14 | 2 
             libopenssl-1.1.1d | 2 
                    mpv-0.29.1 | 2 
                  pango-1.44.6 | 2 
               protobuf-3.11.0 | 2 
               acpica-20191018 | 1 
                      bash-5.0 | 1 
                  cairo-1.16.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
           host-nodejs-12.16.0 | 1 
host-python-setuptools-scm-... | 1 
                   libnss-3.50 | 1 
                 mesa3d-19.3.4 | 1 
       python-matplotlib-3.0.3 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/147867890f7635dcec899493aa9783674dd6161a |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/dcbad3f2418c13de129018850e6ae82d29030927 | ORPH
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/f0240b543eb66b2952f6c6b11a50b622acffb033 |     
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/318093cabef7574d64cda826abffaa8da5d8c110 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/df96e94ddeed919e4b13a4787acb313b976d29a8 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/334749a4b88f0f4db4aa8179dfa8aa19c74645c3 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/09b617d77aca53178ff1ee89ad7e1b557607670a | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a341062071070c075ad7fbbe5ea5c916d6d52c83 | ORPH
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/4a93962156345b051f628adf916a781600c759a4 | ORPH
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8ec5ab1a8234a09b66505cd9114ea1c69aa18367 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/5e2eb0b4cafd2a338db9c8ff74f346d56cc5d2c2 | ORPH
   sparc     |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/b33019b3c9ad856aced34215c69bb292b536e25e |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/4088ab167ae3696c7766764ff6286bcca394f281 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e32b2d7f56540552c20262ca1d74d736a12344c5 |     
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/96cda5898213a2497ec995baccaafa95a806dd96 | ORPH
  sparc64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/7de2d65476f4661d2e21387722d1d2facb8b7637 | ORPH
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/a1ef69b1b4105e8dda5ce9d60d83ada416f8ffa0 |     
powerpc64le  | host-python-setuptools-scm-... | NOK | http://autobuild.buildroot.net/results/0f44ad59e01828423daef588bd4d4864c8aabe27 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f44a5237307b93cce786a38edfd6f745906e6af8 |     
microblazeel |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/426e365b0c2ef97608968a1a26af0f39ff8020f9 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/12374b304db8729785be8c2be1372b1b3727078f |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/cca6049b197cb0607f17df4465affe1117c4dd6f |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/b49c2b60b570e3af1b5b4f85f121060f7dd6f8e3 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/3f7ef053959452c9b170d8a169dce6c180d32519 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/b18f95835e773a0130a3d6082731104c7135d97e |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/aeb11e4cf88c571ec475799c5204831078159e9b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c9f209a0ce5c0653942a4ca9a299c6dc0053d826 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/eca0dd9efbf04d44d20eed9dbc3438df2fc508f5 |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/a9d0fe29c6d7f695a4781e45a36cab95d5f9bbe2 |     
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/1b04fa156e7005867243fd915f6d7a316d45940a |     
powerpc64le  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/807089e6bbc1f8d2a96c16340bd5fc4b6f16b9be |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b78a22e6214b89dccd10a96fb7402c6dab44799c |     
 aarch64_be  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f04061d11045085d7c0a60c591cf58e0e7839cc6 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/094ad8de0eb1b3fd023b32ec4b15c297c3273b74 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bda9e089b83a041d3123ebc430b1b2fb51ae53d4 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/0a0d543e302e613ee3051a469c3f52729011afc1 |     
   x86_64    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/66925473bfcea9babe454238416b41d17ccea085 | ORPH
    i686     |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/69f43958ba02fa706ac55ae1b1d198b406ebb676 | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/33281a7fe0a9e444fd932db16e04ea41011acb38 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/f6f5467489b4f7bf08005d8a9de2f730249da114 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/a0a386451b92919a55c2b8f5711ec9d6df692ec5 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/97f0bd43265b7686ce339f52c9cedc817942d3cf |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/bfaa4d2eb71c30c53342a2f6c936c68025e13dd7 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/87c736b6e14b1fed665742904571a18369263a3b |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ca8c51b3c4340175934781746be0cecfca375b4c |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/618036b00efc27d4b2cf0db3db8488743aab828a |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/89c4e007aa9a178727634e84e3c0823ce84962d6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8f6ebc3f051375ca38a7d15a6034ff01a845471b |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6e0428830dad28516602564d233fd5def710a567 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 5 
host-sdbusplus-4212292bcf13... | 3 
                 binutils-2.32 | 2 
                   erlang-22.2 | 2 
               libglib2-2.62.4 | 2 
                libtirpc-1.2.5 | 2 
       linux-firmware-20200122 | 2 
psplash-fd33a9b3d68c89fa22f... | 2 
                       unknown | 2 
      gst1-plugins-base-1.16.2 | 1 
                   gupnp-1.0.4 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
    host-python-markdown-3.2.1 | 1 
                   libnss-3.50 | 1 
               linknx-0.0.1.37 | 1 
                linphone-3.6.1 | 1 
                  ndisc6-1.0.4 | 1 
          python-jinja2-2.11.1 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/387994095cb99a9f3f2520ae3d68b093cba72655 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/0ed8068e02e4e5389de6c1d8cbd34535b325db02 |     
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/c6f9eed95d3fa21869cd7452c9efa33c471b5a45 | ORPH
powerpc64le  |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/b3478b02af0a765300eb9794e9cf65274dc14b5e | ORPH
    sh4      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a5037f47ba9d695f333dbbc2482f090b35eaaf6b | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/2b87c44deff0a3bfc10fc1516639af18908c1dd3 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/ecc774ede861b4a7c6edb7ad48eea22e5be42210 | ORPH
    i586     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8742b935742c037e2958e9818a157a7a21baa525 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/078ca51053b7aa94fdc6b4ccfffb085a6288cb66 |     
  powerpc    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/165104112e4f4368b61701921f2b53fbb88c9ecb |     
 powerpc64   |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/f3e0caa2cc3a7f3c62110a146567dc2c7603ec4e |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/54739eff7ab4ed86d239b8912fa8a786a3f92dc7 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/94b7959dd39ce7282735acb53ab3df8869be5b0e |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/b714d3248d41ea5f0428591acd93a05d0ef1eb7c |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/150ff9029c1c2125b7811ac8e4e586e91f899552 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/fd36f6741ffd90e6a050ec9d2ee41956aa26b02c |     
   mipsel    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/eb06be71665fd95823e65e996c1a01d4439e1546 |     
   mipsel    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/38982af95767f9f71f7df1e5c25ef9895b2f52b1 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e4e90813dca4db5700c97982cbb9dd8c54b834bf |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/5bbd3f92a4a38a5c5c5f2d49870626e5a49ace7e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f08c01c9df309fd1056263cf7df0244526adc26f |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/bdb74e1df2efe545ae34ccabacb885a454ed9f3b |     
    m68k     |        linknx-0.0.1.37         | NOK | http://autobuild.buildroot.net/results/5598519b9454c25296945cd7f879e908fcaf14ef | ORPH
    arm      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/8356a8645855d77c547d8256bae5d55032ef2a46 | ORPH
   xtensa    |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/68dfc7cd73520bcb6992ba876bfb6a34f01da230 |     
    arm      |    linux-firmware-20200122     | NOK | http://autobuild.buildroot.net/results/50ccb6690044c04c8793f01acb24dfb8c0c4efeb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/262821726e0e6aae133b6c27036d1210365d4673 | ORPH
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e06b2b093137a803b3447c3fad55d0483844d740 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/41e0061b9e04c1e1f2e0ca507cd2cb8e18758d27 |     
    arm      |      python-jinja2-2.11.1      | NOK | http://autobuild.buildroot.net/results/14c39a7cc12bde68d41619645adfbedf86fa9766 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2f1a441b0e878598442dd049684db26ed5a6cff2 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/bb959be9663a7af025129be03e79cc733c18634c |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/f9a4a26cdde631d7430d794dda94be08673dc18c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a0b29d7ad39ef2b52aa7823c85747799b01628a2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 1 
             host-guile-2.0.14 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/b57633aef5ab2a65a5608b8633d7ec756b039afd | ORPH
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/3847204b27bc0b5fdab62fce0c6e97f77b15c985 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 4 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/62cb45d95c938292e8a87d7f1b07277f89260775 | ORPH
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/fab0acbc08cbb4429096d4a35736dbad2f5908ff | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/15e1b1736e2ea0e1fce62cedddf5445a47e81583 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/054f9a1c8589380245c85dbabe753a4d381d8231 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/f84e3938306e5ab476175c16009058a6b23009e9 | ORPH



-- 
http://autobuild.buildroot.net
