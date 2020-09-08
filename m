From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 08 Sep 2020 07:10:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-07
Message-ID: <20200908071031.BD9C7871DF@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 28  |  7  |  0  | 35  |
  2020.05.x  | 22  |  7  |  0  | 29  |
  2020.08.x  | 23  |  4  |  0  | 27  |
    master   | 116 | 84  |  0  | 200 |

Classification of failures by reason for master
-----------------------------------------------

              host-grpc-1.31.0 | 14
              asterisk-16.10.0 | 9 
                    olsr-0.9.8 | 7 
                 gnuplot-5.4.0 | 6 
             kismet-2016-07-R1 | 5 
                easyframes-0.3 | 4 
              host-guile-3.0.4 | 4 
                   libcap-2.42 | 4 
        ltp-testsuite-20200515 | 4 
                  uhd-3.15.0.0 | 2 
                       unknown | 2 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
               capnproto-0.8.0 | 1 
               collectd-5.12.0 | 1 
                coreutils-8.32 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                 fwts-19.09.00 | 1 
 glslsandbox-player-2019.08.23 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.4 | 1 
              host-libcap-2.42 | 1 
host-meson-tools-0a02e2d344... | 1 
                     kbd-2.0.4 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
                    mraa-2.1.0 | 1 
                  ndisc6-1.0.4 | 1 
            qt5location-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
           wayland-utils-1.0.0 | 1 
                  weston-9.0.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/8848cc47caa2966f9cd310d7521d825adee9b98d |     
   nios2     |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/8b53642bfdba96aad4350e39ba0312c4d1e8219d |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/630b9ec449ebb6d1fda9130904e498fbbd060501 |     
   x86_64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e2fc031be750aaa27813337e15ca6904a6d9dc97 |     
  aarch64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/0840cf8ef04aa2c10717b0265c2ccf12fde37da7 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f4c33f8a18141afd418d33edaa85b72a38afb6e3 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/61c4d88c364fcca947f4324ec51c04aeba16c347 |     
  riscv64    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/e57a46b2744e67a89bb0ea3a4062edbbaac5cae3 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/76f3162c70f7b0c336db7372eafaa0a60619c922 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f5083dfa43609339e40f025e861c3471097bc21f |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/eedb7bf82af1db8d175faa20e2648d7ee35f2efc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/46eeffc06815b77c6766a7cc9fc0ea7791c572c4 |     
   x86_64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/386f998f320c855ee2c502467e0a7eb24b6d48fe |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/4c01f7fd69669ae91d9a0b4e29591159c1542689 | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/684b0e8b1a6f0f05a88c0ba508ef47d2f9ef6313 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/32007293e04e6c661108639d1589fe078f254ecd |     
    i586     |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/f761a8c879615ebbbda7f157f0016003849d5d61 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/1804e8b68f715de1011750cec2ed5d3d3f7964c8 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/c4b49cb796f6a71e7cb370baf9a4816999b1af41 |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/3eeb20a24595ab1b790bd770ba745676225ef8b9 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/c51b5eaae46bc618fc42cc5ec559d2f2f6156257 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/a4445f1a6c18e58fe89c7e45cc66db62366fc85b |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/3ae9cc1d78a6bcc2b0894d9b9dcd68320ce63cfe |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/5f00f73f0495ae2696c0a38cbb0b7714dc1b17e5 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/3d9da0d0b8966726f123b70f669073477ad84ca5 |     
  nds32le    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/8f343b925af466c35e31373ff52ff6cd07525c95 |     
  mips64el   |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/ef7a67c8cb1ef2891550db25a2752e907f7f070e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6ba063c974ee5b6894648b7bc00899581c65e3ce |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/4ce2a92f226c1bcd7f2aee1f7e59e8f39ebc115a | ORPH
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/99c58ac742628dbc108c27c3a2d89404884aed50 |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ca914d269402a010247ab6b92a056aa13b0798cb |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/11e136fb1466826ad6bc14fb8bf7fbf156cb3a42 |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/560585c662ae6f87be500222b2eecaa7d131099b |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/5f7fcc0ac85334ba711ad626950bcf4ea21c3f31 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b11d9eac55680db4607e53eace503df4aefd0728 |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7a113c792967b698b0f01c7f806fc1b74f2f846c |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/40fde8c7d2ff5a34f31ef604cca27c209834d8e9 |     
  riscv64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/52da5a79e3ad17ccf855982762973621b132b797 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ef3637120f72d3807964216d2738c456b1c99256 |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/ebe543f7f1d219d3a710ff0c9f42fe41f5d742c8 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/3e39efe12174246ddb42d70b0291a1ac676359df |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/627023b0e59d5dd240ecf2a6a25382e71a03981c |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/f0dc366427a555cbf2dd887a9f4299ff513b5b19 |     
 powerpc64   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/a8046b8419fb4d31bf02e1e475055d292f21b9f9 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/9e44dcb8273f6c1936092f1d3c29143bef555921 | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/c602ab64e74388d5953b8679631b1f070c60fe55 | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/8eec3065cc549d4da500afa69e6e278b5e2052b8 | ORPH
    arm      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/9b11518cc0602484f4266c29dce0030c3ff3624d |     
  powerpc    | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/c093318765c7546cbe40d18b7b4cfacd0510d1a2 |     
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/a52e92bdac5431381c99fd59b03079c389fca1c5 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/aa652333ee872cd07e4f56941c611b09e0bcbe64 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/edad0b5f9ee3e289dc81584e6b83f066038c3017 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/84fc9c720b7036e6726a20b62ec369ea885764c0 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1283352abcd61cc5f04f2a8acbe66810e0647e40 | ORPH
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/4bfd8953889146728a6890d41b5976192608504d | ORPH
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/41ef4510b8d255800c853d4861bba7564c90f3fc |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/a883eef831d4bf0dce2e45c9c5174fe78b5bce47 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/fee357ae7f1746fc2b74171ec15969f962d20c87 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/5e2d85acca1f7831757cdf0bc5814fd4fbbb4c95 |     
    sh4      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/9d50cbe7e0df38f045010e72982c6959a95b4844 | ORPH
    arm      |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/4f8d9c1c13af468a5a0a32e7bc034d8e2488020e |     
   xtensa    |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/194992898d65eb83c5517a91a677f322e37a154a |     
microblazeel |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/0b5b7d29a9fb400ed2c1d2a513fed2af877a5d23 |     
   xtensa    |     ltp-testsuite-20200515     | NOK | http://autobuild.buildroot.net/results/0226eb55461c57e474575da680b5c6ee333b0158 |     
    i686     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/b6908a9061dd0238d0e27e00c627552bb1079c85 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/7701c317e300f0b06d258aed2a3bda866e740f48 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fb1f370c2b1a0b5f9b84be4849c7ad81785fd47b | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/39c6b059420e5c38975b3ccc62e4c71d66c11940 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8981e2629ca1770f5443942b67fffdf2e8d6fba0 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9b2f2f4b7d7e6e060c86468e890b9bd371dddfea | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c2cda2d47b282182d80829bfe4046c2d609ca3b6 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d3509f756f7a6259d482e6b88f956b84f2b8f024 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/87d776ae1fa5a0abf36c09f9bf82bfcc9ef75f09 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/188c16d22c06923cd1161a18f03fa4663246cb29 | ORPH
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/811f8f408e8930cb714332ae06452705780eef9e |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/2256525e2fad1affea53e6686e91c553c764d8ab |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/a33da6ecc54556e488b2fb6aa17fcdfc7467ee7d |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/ab9ffd51966111fc8f837b873bc9e9352e6d9900 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/cf8c6dd81bf04a0417e93946452707970359dbe3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/556d51e57ef917d4b64980223e1344fe6e57bf51 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/009ae53932c96cae0db9712957226f466173d518 |     
    arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/ea4daeb94c25232e3b4a34c1da72bf9bbd5f3cce |     
   x86_64    |          weston-9.0.0          | NOK | http://autobuild.buildroot.net/results/931dc2bfd431dffc4693b62e0889e43709331d8e |     
    i686     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e12bf2162df1e174700f33812626a22c82d90b45 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 2 
gr-osmosdr-46698a67e7e06419... | 1 
               host-go-1.13.14 | 1 
               log4cplus-2.0.5 | 1 
           oracle-mysql-5.1.73 | 1 
        qt5connectivity-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/22b7823b18442cd8988bc4e688a1c589bedad756 |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/0371d080fbb4c91b19dea370fe5c8685678880ed |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/4357df9faedef450774247d2dc09f1ac568ad976 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/f9a9ecef0f9316008963d823f1deefa568d958e1 | ORPH
  mips64el   |     qt5connectivity-5.12.8     | NOK | http://autobuild.buildroot.net/results/7c65d58ceea5592fb79f12dbfb2ae0e20336ad9b |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d4a2cab0f11a220d4dee6bedf8c02eadaf5b3cc4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8f122c624717c6e095b876065caeae6d34cd25e4 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
              host-grpc-1.25.0 | 1 
               libupnpp-0.17.2 | 1 
              luabitop-1.0.2-1 | 1 
                qt5base-5.14.2 | 1 
              tinydtls-0.9-rc1 | 1 
         uvw-2.5.0_libuv-v1.37 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/3a2a99b1a173e35ede8fe7d243711734df5cb61b |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c8d216871263da90423f32bc833de8b7341530ed |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2b4ce531a4a746c1b8bd8eeb5a359ad5d6d1a15c |     
    i586     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/1d50cb83c935740846d2e5c9ba8a0c30d0054dda |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ebc0369ad1a166edd1eae5b7d4a14d60843e0ebd |     
  nds32le    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5f98713ad7d5abfaef3a643c7167137f87a700f8 |     
   x86_64    |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/f4ea48c9d781ec6fbc0d201e25c9b6a5cb9dd463 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                qt5base-5.15.0 | 1 
                rocksdb-6.10.1 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/41467cc528ed80c23cb9324701b35b0ced147beb | ORPH
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/632351c67a7dbfc3eedcf97d68fb289901165790 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/3580f49ace7a9e9716359f854d1e9a6e3a089173 |     
  riscv32    |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f6914fca888ce48d0edd9e687462ab7ed1374718 |     


Gitlab CI results for 2020-09-07
================================


-- 
http://autobuild.buildroot.net
