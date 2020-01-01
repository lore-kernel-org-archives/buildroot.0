From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 Jan 2020 07:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-31
Message-ID: <20200101071729.4C8ED2DF3A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-31
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  1  |  0  |  9  |
  2019.11.x  | 12  |  2  |  0  | 14  |
    master   | 98  | 46  |  0  | 144 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 5 
                  snort-2.9.15 | 4 
                  avro-c-1.9.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
                host-go-1.13.5 | 2 
                   libnl-3.5.0 | 2 
                   libnss-3.48 | 2 
               libsigsegv-2.12 | 2 
           libwebsockets-3.2.0 | 2 
           uboot-tools-2019.10 | 2 
              alsa-lib-1.2.1.1 | 1 
       alsamixergui-0.9.0rc2-1 | 1 
                apr-util-1.6.1 | 1 
                bitcoin-0.16.3 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                  gmpc-11.8.16 | 1 
               host-llvm-9.0.0 | 1 
                 jack1-0.125.0 | 1 
                librsync-2.2.1 | 1 
                 mesa3d-19.2.7 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
                    proj-6.2.0 | 1 
               protobuf-3.11.0 | 1 
                 samba4-4.11.2 | 1 
                  stella-6.0.2 | 1 
                       unknown | 1 
               wireshark-3.2.0 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        alsa-lib-1.2.1.1        | NOK | http://autobuild.buildroot.net/results/e4b4aca49924934b9fc146cba5ebc8661f36161d |     
  riscv64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/beed34fb834dd93a51e6afc5c605d58841882170 | ORPH
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4bdc3ac2dc7570ddd626b5e3d963d4d86f6fb758 |     
microblazeel |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/952f2e3b87e0cf662952053e766e4dcae38e3a7b |     
microblazeel |          avro-c-1.9.1          | NOK | http://autobuild.buildroot.net/results/755b1fa56d7b4b948757057d1a916ee4e5e9d6dd |     
   sparc     |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/c43cededbcc2d4314bef5e240757911ba4c823fb |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/fffa8b120ea67422668ea9e3aaa58b0ccaf3f8df |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/5d89dde9a290c16453535d7aeafcb1e3e8cb5ad1 |     
  mips64el   |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/596e8604750f20d3dd9c8839632afa992370a9c9 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/2221b4f810e6be85bc90bb1cea4517c38762c2c8 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/28b730d50c3ee55085947602d36be6bf00ad9c71 |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/1221375964c006c0c4a32854c1399fb1ad7a3af3 |     
powerpc64le  |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/c27d16df37a04035bb72cb6974ab764c386c7fc1 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d956225b5d3af1c8d27af4e76b4c0d19d44238b6 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/cfaef6cb832e59c829a5461f2ad83fa979e7475e |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d3912b72b04891732da30db7737271da96f55702 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/23bd2fef9c09d581820212bce1f010974c5d5ac6 |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fa35c73b242226fb266acbaa89cf1fa6747ebbea |     
powerpc64le  |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/66ed84dc5f5bebc9ffc4d6fdfce158eae1410071 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/dcfbbc9f764d1feeb0db30f64cd718649c06c3d4 |     
  riscv32    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/ef5322a2c20586fe5638ac712f8544961557bc44 | ORPH
  riscv32    |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/86dbeab5f05e5305adf1ba066f2276815bf6ba51 | ORPH
powerpc64le  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/57928e6cf69d584b430a1d9a99156c57f29b692f |     
powerpc64le  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/45e358cfa15ac4b53f22cff77de1601162ab9b59 |     
  powerpc    |         librsync-2.2.1         | NOK | http://autobuild.buildroot.net/results/896e8e3efbedad90d66ae8c4e1e50f16206cab49 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/5d2575d2056d3037f2d4f7b3a738f5c7dec50bec |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/c4a794fe14414702995f227bcb6e48842bf0378a |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/986dfcfd6caf40b0115163ab6f049510a94c7199 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/6186b4718db285edadf7203d00ed72f8d76a31e4 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/7eb07a38ca38b6b3fc5c67fc91e5212749d24eba |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7532c1ad6d3b230484efcd50f6500fb1fd9d14dc |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/fb00b8cebc72bc622a73e6401123e0162a414991 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/60f0439d027b6f03df85e22d142fe44128fc51a0 |     
microblazeel |           proj-6.2.0           | NOK | http://autobuild.buildroot.net/results/dc9bc52ff3d5a83dcfe4a86a391590bef57e1cf0 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/22e4001740126a2f1d2351dcb2042e7c1e02ec84 |     
    mips     |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/ca35e6a81c21619763d4d8ed9ad69d10794d6fa8 |     
   nios2     |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/bc70c7d9ce064458af341a97cb48e917908c9eee |     
    arm      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/36c84a0a1220706ff1724b6af9b0e2c33f4ca324 |     
  sparc64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/f8f4620f8211a8e5fcbea174b0def5166b73881d |     
    arc      |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/2bc41d78e7a4601d0deb690d38d8aaf4e47d8507 |     
    arm      |          stella-6.0.2          | NOK | http://autobuild.buildroot.net/results/b231de3d233481f11e6cd6a4df9bb6a9da685b9f |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/0acd78602d49ddab67573ea172d72ad54f86bacd |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/b6d979924ff1688f524df967a5914ce771ec4176 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b88c8d2bc23cd12b0fba8d2194485e5f35a221f2 |     
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/b1d9e1ba98e7aba3a950d93f4a6da9b520bba73b | ORPH
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/2e6254da5f1a429469c203f2a8203f7b36480280 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/846763f009edc5c9bde3823ee3c937d54f1348a3 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/09a3acd49e1d92c57c65da8b465db254037e9561 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/cb4804dd7e6ddc3e3ed013dfcc1ad5d47292fa6c |     



-- 
http://autobuild.buildroot.net
