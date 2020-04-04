From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 04 Apr 2020 06:33:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-03
Message-ID: <20200404063322.9CDE088A4E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  1  |  0  | 18  |
  2019.11.x  | 17  |  3  |  0  | 20  |
  2020.02.x  | 14  |  3  |  0  | 17  |
    master   | 138 | 56  |  0  | 194 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.64.1 | 10
                   cegui-0-8-7 | 5 
              host-grpc-1.25.0 | 3 
                   libnss-3.51 | 3 
psplash-fd33a9b3d68c89fa22f... | 3 
               belle-sip-4.3.1 | 2 
                libtirpc-1.2.5 | 2 
                  ndisc6-1.0.4 | 2 
                  pango-1.44.6 | 2 
         python-markdown-3.2.1 | 2 
                       unknown | 2 
                  boinc-7.16.5 | 1 
                 clapack-3.2.1 | 1 
                coreutils-8.32 | 1 
                 granite-0.4.1 | 1 
                 libuwsc-3.3.2 | 1 
make: *** wait: No child pr... | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
                   ogre-1.12.0 | 1 
                 openal-1.19.1 | 1 
                openblas-0.3.8 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.12.7 | 1 
         qt5declarative-5.12.7 | 1 
             qt5wayland-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.5 | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/ff4ca8e218ce4dd5a3c220ec74e6aa844871b479 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/4f6c6f4773e56c9971a3a4b6ae30905a9708122f |     
   mipsel    |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/beed9e62bb2bd10df477148201ac73541320c51c |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/d2150fc07b2d9ffcca673c923e7ef6a10d98593d |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/02a2f591126cddc07ef6ad823f4164cfd41f1d6e |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/6d6e2cd6cfee1f42daab7db2b5ccfa73e525f95e |     
microblazeel |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/56dd7e8eb6240d3c2c8186a9a5fd4b46c75c3f14 |     
 powerpc64   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/9ec3e77f4821fa4507cf09f7eec8fe1122dff833 |     
    arm      |         clapack-3.2.1          | NOK | http://autobuild.buildroot.net/results/c558c5e2a17b36d6b1e2a130612060680d9609e8 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/0e021cdb6d613ac7de76b80eaade18031698fe00 | ORPH
    arc      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/60d42a673d4feb7033d07bd2e6b5918ce6a6cc48 | ORPH
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9a00cecb18cc7428895ba97da8b2e107d0080caf |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/130891ca341b8870ffcd4de781b81b6784275d1a |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/53b9eddb03f5ac6277ef89da9151ecaf9691f32e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/04160f44c414818c8706c800986ebcc49ca615f6 |     
   sparc     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/83770f32e25033b1437a0a51e89d96d37ca45a4c |     
    sh4      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/40053fd78e761644ef226acf5de0452228190f19 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/4fadc655981b6970aa94c7a1a950efac7ac0aec1 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b353fc6e48126568356e6eeee8957453b0f66643 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/dca4bedd186bdcdd60ca8a5ff40427ac0a210fcc |     
    i586     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b6758ee22ff4129bf5d432dc81a58f91a9a1e996 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fadceeb9e67b230bd0222395079e78bfcd9a7389 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b8622639835d3c86d5986907801e612574eb4ee2 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/58f9dbdd797360a942a46748b5ee0360353fe99b |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/4e1f10945e5f6827f0cfda43a5b21a36eb88b4ac |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/5e9e1011d4a0fe1f9e5b1a26efd0b208aa2069ff |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/cf616a9b36785a7365a1c190820bb9d38007de48 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/12883b1c3d4b2f828859667154bdae4deff52d6d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/a9367e910ed4c8f3973a240962e76bddb9cc86d9 |     
    m68k     |         libuwsc-3.3.2          | NOK | http://autobuild.buildroot.net/results/0b6a8676410420b887c94b52592dbb7376dc4780 |     
    sh4      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/85c0f59bf0eeb766da5b6c43622aac5978cc1ae4 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4163e6618d050bb01d3b34aae8228b7e9351a047 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f0ddcbde8e9e7a0ac81585b9bed8be1531784a8b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4442b900618abdacf920f9e6e98ffb0a465380f5 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7b4d0d292082ff29bdc20faff3f2cb825d104978 | ORPH
    arc      |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/1c37aa407094a6e9e9a399115db63dd5edc5d676 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/3c4823a2ac87e3033285c5cff7dd540b2e2e0f02 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/3e64ab392caa9b3c6f4d70af8019c6352ce3f8b7 | ORPH
   mipsel    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/1afdd7f0816df9deb859b1d2d7ee7e08f9944ef1 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/673ad029f879cb5b293bf32cdab06d011d47945a | ORPH
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b45f0fa7ec40da145052af53eb96244d7a0406f5 |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ba1172abf918f351bca64fc125c85f37e58cfba7 |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ab6c7b4ff3fb33b9ea42220b0f2a76d1a0d68a50 |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/bdda93d8f8546f73695d209ce2f568c3da245839 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/0d3eef392728f3aa49350bf1c7b0e03f648e3a4d |     
microblazeel |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ca2a40f1e21689f1c91f21e33f655612e09452be |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/05b6340e7a3419f19a8f98ad2f2db3e18f7771eb |     
  aarch64    |     qt5declarative-5.12.7      | NOK | http://autobuild.buildroot.net/results/9a336ac0656bea81275e44d100877b483825386e |     
  aarch64    |       qt5wayland-5.12.7        | NOK | http://autobuild.buildroot.net/results/31ab6a8c025623183c633759036d92134368f58a |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a9b3b28cc126376642b03020ae689eb61d2d8ec6 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/e4856a867ff37636009411867be6a99eea757f2a |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/3db6b4452468ebaae32fa35772e803b8a8b3b8ea |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/74a4e4345e9c9cd99c12b767c8bcf73cfe9fa7ca |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b23bcf372fdafa3d872958ed1c193f7a8cc57c4 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/c5f859f663f0cf6c2727ab0a3846d17e7be68d29 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/eb5da9c827f5041ad84cece03cbafab108810617 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5b4c0560f7b05fcf0fb9a6be47464c967fbebe77 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-19.2.6 | 1 
                oprofile-1.3.0 | 1 
              python-pyqt5-5.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/3518bee4bc6fdfa1b54f56337fe3a466af3c4c1e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7fc3e889d906157f07a94f7806bde2ac99f4c89e |     
    or1k     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/6a9341484c29c555455621046f0962c8f17e181b |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                oprofile-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a09447eac477df29c80cb743654b4a1ace66051c |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/d5391aac17116b808e5417b6e0ca35334d23adf5 | ORPH
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/350f03380ea9a523d8ee4e27743e713f82447a6d | ORPH



-- 
http://autobuild.buildroot.net
