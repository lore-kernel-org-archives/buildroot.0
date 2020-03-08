From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 08 Mar 2020 07:26:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-07
Message-ID: <20200308072623.4E18487C83@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  6  |  0  | 25  |
  2019.11.x  | 10  |  5  |  0  | 15  |
    master   | 211 | 69  |  0  | 280 |
     next    | 32  | 53  |  1  | 86  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-guile-2.0.14 | 5 
              bitcoin-0.19.0.1 | 4 
           host-nodejs-12.16.1 | 4 
                   libnss-3.50 | 4 
                       unknown | 4 
                      bash-5.0 | 3 
gr-osmosdr-46698a67e7e06419... | 3 
   openvmtools-10.3.5-10430147 | 3 
                oprofile-1.3.0 | 3 
                  cairo-1.16.0 | 2 
              host-grpc-1.25.0 | 2 
               libglib2-2.62.4 | 2 
                 mesa3d-19.3.4 | 2 
                 opencv3-3.4.9 | 2 
                  pango-1.44.6 | 2 
                qt5base-5.12.7 | 2 
                 ser2net-4.1.1 | 2 
                suricata-4.1.5 | 2 
                     vlc-3.0.8 | 2 
               acpica-20191018 | 1 
                 dmalloc-5.5.2 | 1 
                host-go-1.13.8 | 1 
             host-pango-1.44.6 | 1 
            host-thrift-0.12.0 | 1 
              lbreakout2-2.6.5 | 1 
               libupnpp-0.17.2 | 1 
                 midori-0.5.11 | 1 
                   mpd-0.21.19 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                proftpd-1.3.6c | 1 
                    qpdf-9.1.1 | 1 
         qt5xmlpatterns-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/0949cc12bda4ed7a97166232a1ab25f28f7a875d |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/c5ee91fae5270a5eb8655aa2930c0d123c1e1e3e | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b1e9e302d8d6380bc933b2be2b50e96453283a51 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/a066d376aedda0b491aa5d3bb56b4a2d39ffce70 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/32211d5e04a0272bc7915770b2b6c0afb6e8c9fc |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/4a3c561c84c69ff955e8a996ff6dfe3c5bcc7577 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/7415e46865ad6c70de1a696c097889ab522b1492 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/60baf9ab2a3308996a94751763c932b1871ab94e |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/dc6ec16788df7b7b7d4ccf10f70a55d222db2b97 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/66a96e4a5004ba005275d09411f553b0dc49db47 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/4eb08644dd9e0f7e546b455f341e3ba7751b64b8 | ORPH
  powerpc    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/5f9fe03a1dcac0ac5961f6ff24a49c8d734541ce |     
    i686     | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/e54de3ee273d85b402917231e7faa07a3e29c9be |     
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/bfe8b9d71df7b8c60c383cfadda31735057598d3 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/876407fc83a0b7d71386c3d14ccec3d80de1231c |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9862f51f88b15c0880e3d78cf43bf25aa93a90a1 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5c511a55154e058d7ef6ed3c22e9e1c6115d237a |     
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/44d5794ec5a06b0076ff9a2965a5ffba29abbb11 | ORPH
  aarch64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/bc6fd8f7d4064ea90f3140cd1a172e1632d1211d | ORPH
    i686     |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/4da4805dbf54d14bc79b35d4f844c591b9468886 | ORPH
   sparc     |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/f2943f55c0b600c850bd184b288e1283731e949c | ORPH
   x86_64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/e9fe04b95593ba3e9aece2145090965fff7a86d8 | ORPH
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/064fb6c916b669fd68aa08244fb833fb6523743f |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/62ea6656e19903c20af020188157cdc9c809c1f8 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/a3555d9ecdc8b82adb85890577eb776f9d3e320a |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/68405180b1ff8cb1545e170c27387f277a88588e |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/ba74a37d0f1b01aeb4e93492ff0b7354d6d13dae | ORPH
  mips64el   |       host-thrift-0.12.0       | NOK | http://autobuild.buildroot.net/results/3efc3b98f736a95533c844e902630aac9f0c592f | ORPH
    m68k     |        lbreakout2-2.6.5        | NOK | http://autobuild.buildroot.net/results/c600ed6ac1f349ba9bf632e105eb73fabcbb809c |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c4ff22bfebcf98f9f03e6f3760bba27ae28b2d53 |     
   sparc     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/d7a58660d0b4a3b597b3618c4633a1ee0b06f6fc |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/ceaf7927b42ed4d79fabe2f2f815c3951e857df1 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/dd89633033e0e3c1dc9c3ea9bfb24988a660b144 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/0e918725162dca5b0e683b911df292f35195b0d0 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/3588ac91ce9b416970964d330bf3972916c56240 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/428f299ebe0f703694b7046ed90e2e88d3808526 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/c0e2d14ef609924066aef80f5fd0a5839b590e0b |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/b3719ad041ace1e2c84855abb61f86cd1b5b2da3 |     
  aarch64    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/0ed81063039348bf92843b07560fd8ca60d5a198 | ORPH
   x86_64    |          mpd-0.21.19           | NOK | http://autobuild.buildroot.net/results/4267483ea63d6f2f22c891ebfaa0798ed54bfec8 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/52ed2e93a74f80bf0c6fd6e32d07c6c121e6873f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5792f964a9e82c9260c3a6b67d494265cbb67f1b | ORPH
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/5574133b7edd8f330a4e071d308261238cb746c0 |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3e3a652ff083086bbf8bedf39f9c9ade0a5fa89a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/bb04b8eb49e166e4b485b3f8386aebf73f261316 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/adfdeb915d6ba56ccb591f333ee82ce5999085c1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dcb385cc9b8d3d1258aba8e45ff2c5066d399c77 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/17797dc6e97d98db7a74a69858144e845c0eee71 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/52c9378b86c6057db3687f711a5a90dc3714ffe3 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f63867f8b0be42e0fdb23ff61e4aac6087965d52 |     
  mips64el   |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/46ddfc68b02ddb65227e23e9a3cbbe4e773e6eb7 | ORPH
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/651b0b229b5e935092796b547f489e172407abe9 | ORPH
    arm      |         proftpd-1.3.6c         | NOK | http://autobuild.buildroot.net/results/4d680d8204bdf1f3deec2c3eeb9a2d9e6eabe4d5 |     
    arm      |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/85f2e988f66491cdefc4714ce8f1254dfca00cd6 |     
   nios2     |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/19881951a328ff4df82b5753a23219eb634e86df |     
   nios2     |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/ee11bb45f43abc30e590c0423b9fda65f8162fb4 |     
    arm      |     qt5xmlpatterns-5.12.7      | NOK | http://autobuild.buildroot.net/results/317ed4a3e9bdaf19705cd50395b031f65a3b7621 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/44fec4ba37f534b3871cf5dc98c7459207a4a29f |     
    arm      |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/66e0d3e0a2a8dc5a62c267d16a53216f0f2ce8dd |     
    or1k     |         ser2net-4.1.1          | NOK | http://autobuild.buildroot.net/results/d31194a5435f1db13c1899998f8b6f819f418701 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e20e5c7116c556ae5cae58c003d6b7e715eb2edc |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/118196ab9315ca19be62ee63989974c27c9ff701 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bdb9650b1599c232ed06ace3c6fde96c084d8461 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/dae8e65b07a1e30ce3c5744ccda19af8c50efda4 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/39c368ec54df2a9fc6e60c0d3902037c5233713c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b6f2188477655dc106e1b8b5b3ccd0e0c376f8fb |     
  riscv32    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/6c0fa60ada11646fd41539c841b2c6f047e090c2 |     
  powerpc    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/861e1bcb8152e05985a2fa5042522e547ddafd0e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/79ec87e4d5376ced281988405c1a53184e1d0f06 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 4 
                       unknown | 4 
                classpath-0.99 | 3 
                 haproxy-2.1.2 | 3 
    host-python-markdown-3.2.1 | 3 
psplash-fd33a9b3d68c89fa22f... | 3 
toolchain-external-codesour... | 3 
                      bash-5.0 | 2 
                    brltty-6.0 | 2 
             host-guile-2.0.14 | 2 
                 opencv3-3.4.9 | 2 
              bitcoin-0.19.0.1 | 1 
                  cairo-1.16.0 | 1 
                   erlang-22.2 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
          gst1-validate-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
host-sdbusplus-4212292bcf13... | 1 
              libeXosip2-5.1.1 | 1 
                libgdiplus-5.6 | 1 
               libglib2-2.62.4 | 1 
                   libnss-3.50 | 1 
             libopenssl-1.1.1d | 1 
                libtirpc-1.2.5 | 1 
                 mesa3d-20.0.0 | 1 
                mini-snmpd-1.6 | 1 
           oracle-mysql-5.1.73 | 1 
               protobuf-3.11.3 | 1 
                   python-lxml | 1 
                  reaver-1.6.5 | 1 
                 ser2net-4.1.2 | 1 
                suricata-4.1.5 | 1 
                     vlc-3.0.8 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/8308c32e28499610d8973ddf4833fe0991e5fed1 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/4c0401ef86adaa9885d1b173031efb6a4ea4e80b | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/d945d7dc027884c2409ee0a58be6163a67cad744 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4bbea89f69ad233fc501a7fbb282c4961b16939d |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3a5539347bf8d5e8325f6d24f35da56e5ba03bc3 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/2daddb867dad89b6f1a930fc2cb70ef64ea38115 |     
powerpc64le  |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d26542f0de56a61bbe73c0d1128fc9c4b9d7176d | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/aab4486a390b0f28a726e17ff6d45be81285ca62 | ORPH
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/eb9294937c0e521d26a6471302117a473f1f127c | ORPH
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8faba9b0f8d37af5b2d9260820080fa4b23a780e |     
  aarch64    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/2d5e0f2a59a2c8e849e0b91c5faa4b463c65bb1b |     
  riscv32    |      gst1-validate-1.16.2      | NOK | http://autobuild.buildroot.net/results/4471cb06b13ddca8e87e46f9de7a55b627eddd93 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/bc8aa95b195424dac826b0508d24e8c7b18b710c |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/1e246e90311b1f8afa3e0310f0933298cb6ee9bc |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/6d792bce79cd675c879ce7883a1bc941f5db0c94 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a014c59b468e7b605a35030440b2f10a7427ee72 |     
powerpc64le  |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/b2d7389b281ff8c082159e939b18cd4e3063e6db | ORPH
    arm      |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/0590ed8feb47dbce51ec5d96f95c9ea4eda6b82b | ORPH
    sh4      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/7415f475c5f61c6ee6beb260b144a615a603d41e |     
 powerpc64   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/97eef8ab1616dc5f9f98e9867db2f904766ddf55 |     
    arm      |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/6a65986b9f2b9cfff4e6420d1d303a783850f31c |     
  nds32le    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/de3bb1e0c7d7c973e8745b081e6ec4b207179194 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/7b04468da98ecfe67f84cc434e85021693cba40e | ORPH
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/de11e6caf09090b87ad4da0bcf63b1a81850c070 |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/25cc30374422de2a7508fb87ecb734d9c14bc551 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/d1d9d1b99ca0f928a15918b3826c84d9ed316d1d |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/382ee0bb3307ad9ed91b404df39e4d7a5c9113fb |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/9ad90841ca3a38710648dc81639b02a5493eac1d |     
   nios2     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/32f0b650cf49062b7eb1ca517aab7829b0329aed | ORPH
    m68k     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/f41370497b0e79919fc0ebf533e79e717f66df90 | ORPH
    sh4      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/54ad9619e199dee401776fc048885fc81abc3b8b | ORPH
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/bc125256a65f68c063c625ad37dc8e0928facc2c | ORPH
  riscv64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/f2d4cd4a0a26808413bb69badafd467c31aca512 |     
  riscv64    |         mini-snmpd-1.6         | NOK | http://autobuild.buildroot.net/results/29510bf410e00dd8f83b24586621894615b8e3e0 |     
  powerpc    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/987966d933c96de48a8e5fc964a480da3f8d1625 |     
   mipsel    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/02a5d443d97275234c51a5b9c47325527e472173 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/7f78aa03c062fed0c71271d9e8bbf261bb8e612f | ORPH
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/ba43ae1ca7012450a91116f73d017cdfc644be17 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c35ba4bc8036ff88b77bbe0596acf4aa136d0633 |     
    or1k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/8efbc7a57408b999446d20473009b38ae3a36cfd |     
  riscv64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/797cb967da84c4211faa1ea224250dcf03355b7d |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/7e27bb71a3ef12433f296d1b12e5d15479a80db0 |     
    m68k     |          reaver-1.6.5          | NOK | http://autobuild.buildroot.net/results/6d811d69af3dad9f0d0156057f46f36193b5662c |     
    arm      |         ser2net-4.1.2          | NOK | http://autobuild.buildroot.net/results/cf7e0cac0b0bd7ac2d63077c2d6583e92bfde2cc |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/5a26d9ce6638cca11989a065a738917bad5032f9 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7dbf0c691aa92d0fcb7185006eb058a3796d4d17 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/2b1ecd917fb77ae899ca36b1410600c1915c74e8 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/3bc5bc2ac70bd08520aa8ea2cb7d4a7656f6ddda | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/40ea17957775adf66c5aa41b8fd350752ebe3a03 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/12d0effd126035be14966fb48a0e531845c1b88d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/cc15d16bc583ac4bcbba6c995cc260ee78242e84 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/31adbce00c53a4bc4dfef424de08d91d9a2f676c |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/e97c91fc403a17c59f79349dae282cd95763681d |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/a33799834850011fe4b65fda3f5447b42fdcb956 | ORPH




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 4 
             host-guile-2.0.14 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/9b120bc634411196528c032f20c91fcf7703e382 | ORPH
  powerpc    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/ae14123a247bd8925120b78022defdb405b0b9c2 | ORPH
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/abb07c73a5e272f5e36ac3d550174f3a8d5a0442 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/83a39576276256cd420858345c06ceed87691b99 |     
    sh4      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/feb4f80a70dfbae649cedefa1b67e15860ad3785 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a29a0cfbaff089aa319cd610eb2f8278ad810b04 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

               asterisk-16.6.2 | 1 
                classpath-0.99 | 1 
                     gzip-1.10 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/917b4645bcd97a9ff06aee73a6e8115ac6869cae |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/57f0f8d9d2e95b02ae6e592403649c4ee8aa87fe | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/f6e3abdeecf1ec67f1c7c3e35c3f4674f77384e9 | ORPH
    sh4      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/14d047fdf800b2291fd82cf4e600aa772bb5d5d0 | ORPH
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e6d8da6c049c17f9dc10ee65f62d52a3cf35baff |     



-- 
http://autobuild.buildroot.net
