From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Mar 2020 07:25:53 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-18
Message-ID: <20200319072600.4C5B386AFB@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 29  |  7  |  0  | 36  |
  2019.11.x  | 25  |  5  |  0  | 30  |
  2020.02.x  | 24  |  6  |  0  | 30  |
    master   | 166 | 132 |  0  | 298 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   bearssl-0.6 | 12
                  connman-1.38 | 8 
           mediastreamer-4.3.1 | 8 
                  ffmpeg-4.2.2 | 7 
                libevdev-1.9.0 | 7 
               libglib2-2.64.1 | 7 
                libtirpc-1.2.5 | 6 
psplash-fd33a9b3d68c89fa22f... | 6 
         python-markdown-3.2.1 | 6 
              host-grpc-1.25.0 | 5 
    host-python-markdown-3.2.1 | 5 
          syslog-ng-legal-info | 5 
                oprofile-1.3.0 | 4 
                       unknown | 4 
                linphone-4.3.1 | 3 
                 mesa3d-20.0.0 | 3 
        perl-crypt-ssleay-0.72 | 3 
                     avahi-0.8 | 2 
                busybox-1.31.1 | 2 
                   libnss-3.51 | 2 
package/syslog-ng/syslog-ng... | 2 
               protobuf-3.11.3 | 2 
                     vlc-3.0.8 | 2 
               acpica-20191018 | 1 
               belle-sip-4.3.1 | 1 
                 binutils-2.32 | 1 
                  botan-2.13.0 | 1 
                    brltty-6.0 | 1 
               dvdauthor-0.7.2 | 1 
            flatbuffers-1.11.0 | 1 
 glslsandbox-player-2019.08.23 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
gstreamer1-editing-services... | 1 
              iputils-20190709 | 1 
              libeXosip2-5.1.1 | 1 
                   libiio-0.19 | 1 
              libostree-2019.6 | 1 
               libtheora-1.1.1 | 1 
                 opencv3-4.2.0 | 1 
                 openssh-8.1p1 | 1 
           oracle-mysql-5.1.73 | 1 
               qt5webkit-5.9.1 | 1 
                 rocksdb-6.6.4 | 1 
                    sox-14.4.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/2b197a042cd6bee9fe12166f2f461c69c1f7a5ab |     
microblazeel |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/855b1a9cd7d0700865096f0e5bc7cc3f9e6a74b6 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4b7ddad8aaeb6c9a1cc67afa9c21cba854484932 | ORPH
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/34d2488eb6ef464c03aa7f84952ae1ce0b4e5722 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/56c597e835e7098e1838073cade17b5d2c697f3f |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/f85e637d7c274cef626b054a326e862e54cb1b95 |     
    or1k     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/6b1ec21286ecb7a03eb984472d3753e9bf9dfbf1 |     
   mipsel    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/3ce53e6f8e1dac783237570729560f801b4fcf3e |     
    mips     |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/54c57ec95fedb9c54cd526e0a1fa822702d5936e |     
microblazeel |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/13ec140237fd832e00fd62ba05f4f9b026767e00 |     
  riscv32    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/d7c7c43426d472263e48ac7814a337a78cd95322 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/329c607978a263c1c7dce03ae412b2ef708c6e01 |     
  aarch64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e9f707a9f62c247f464e5fdeefd6986978abcfd6 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/e5dfd9b4af01de4bc260bc0d5c9534048071ef26 |     
   x86_64    |          bearssl-0.6           | NOK | http://autobuild.buildroot.net/results/75e4ac4cc39fa8c184e47ab4ab16df2a9b8df2c8 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/92ef2f6d551f4f77dd274053afab56ddd6497b07 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/c23c140e5ef275ec8e1acc645c50b4ccdb65ca3f |     
    arm      |          botan-2.13.0          | NOK | http://autobuild.buildroot.net/results/fc8c552f60683288ab53b62a3358310dde454b13 | ORPH
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/086beec32be370a0fa3d3d8c62b3e542008bd83a |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/7607d7c5fc9c000c7dc9cf1eba41e3c1fd98840c |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/e683032985fb1f8c89b85ab9fd68576ac01648cb |     
powerpc64le  |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/86ee7a5d46b81653d79ffe1c9c05ac7bafdd9a8f |     
microblazeel |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/b7ddfe67087eabbf11993168efcfa42d31a0ddb8 |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/6698006174c52a70bfb6ce709d863bfc3c3f10d1 |     
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/114a6b2c607ab4fbf28560cb32d1b5b39e9d8e8b |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/62232d6cc0dd72d38f6849c5240b38cbb78acbd0 |     
    or1k     |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/bc5a73796b38a73e3d63c08cc9c6c1e9bfc7084c |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/e12709f0687bb66438598b26d717e04c25e180c7 |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/5f8031f9d53879474780a27d4683feeb28e93f66 |     
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/2a0fab5787f38923e70bf774ce7d3e711669ab5d |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/e3271aee5c608361943bafd525b3b2a5d64d2076 |     
   x86_64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/f9e850b89f47dd69ff8a47ad1c04238e234372f7 |     
    i586     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/124a6393014705c9a48b4d4c599f7c0e9a527901 |     
powerpc64le  |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/a1ec07f4349418e254e665a1e60ea3a2d96e3aee |     
  riscv64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/0b4f8dff22f3c0b4f2ba57f4d84e003a329edb00 |     
   sparc     |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/dbf0336228628715ba5e51e42493ffd1a711dfb2 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/69e5c28cc76bb729c86a37eb27a9b2ab94606ad2 |     
    arm      |       flatbuffers-1.11.0       | NOK | http://autobuild.buildroot.net/results/35161c631f72cd5e07592d407bc4e0fa70060c6e |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/44f6dd11aaa2cd297e300edd271fc9123343baf9 |     
   mipsel    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/ce2a14e67c2aa2d3dc1714840d0f3f489bc7cd2b |     
  sparc64    | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/5820c70c3988ee0a8b9767f5eac68a3c1fc336ec |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6b93110210be637b9a259bd7de882b5c381c943 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e93efdf59c6012b7443b344c3e57ab06bf1a315b |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d77cbffd85a1495b63e451acf4bfd5d9a5f6524e |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3f97c2fb366c29307740367beb2f0386ea68815a |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/37cef9fd3a35c3ff940359d1dc4cf1e3cf46948a |     
  aarch64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/9ecf0cacbbe7965c9cb9422eed78addfb96067fa |     
   x86_64    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/159c85ee516d29bde8ee1d5c8d6671bcf165bf51 |     
   mipsel    |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/49571c9c44447cc063c9b063cfa96a62565190b8 |     
 powerpc64   |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/3b73a98db584cb95b1d66323d065def7949f2e52 |     
    or1k     |   host-python-markdown-3.2.1   | NOK | http://autobuild.buildroot.net/results/e6ce694e3b738878555f4f5dcdef6faa91ed31f1 |     
  riscv64    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/b03170fa39ad156ce36d8f070f879a2334036e98 |     
  powerpc    |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/d1b212e598c6002a36e4b2486b0f764bd80849f0 |     
    m68k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/a9b1f2a6bdfc4266b4dedc911cec54d3556106f5 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/a170b73b5fb943ea54b6e3f27fca03832c02de7b |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/0bc675e9e5552630ede1bfe586415c126a397f25 |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/ac0abf183f03632956b21bcae994ce93709997b9 |     
    m68k     |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/f4cbb7d88c3a33e0bcd156cd3f123736ee293cee |     
    arm      |         libevdev-1.9.0         | NOK | http://autobuild.buildroot.net/results/79f7dc422751be405f87a1e739cc880f8cde82ed |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/0d61ad6eecca8c5e02462ca2db8f6ed99495cc17 | ORPH
    i586     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/b5c3139b35aa585aa912f67103456ba8a8af186e |     
  riscv64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9e560d938093daa0dd6c554ac39271415e1a73a9 |     
    m68k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9f47b390a48fb3b896ed703a2ad7868f0f620d9c |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1b26e7245dc16fa85fac5651d5443a9a757fcf65 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/34bfcc3ce798e9bc081c79a57b6fa31cc92a212a |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/be455531f7d189a33b9e42b00fda0983dd9741b0 |     
    arc      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f88f9e7802b81f1c7af5ebebd03dd51e4573a145 |     
  powerpc    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/4c938607e8cb5b0b483be7d766f92bcbe526a91a |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/74b732c87c178d46032db13f3305286d80f84639 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/8bce51b53b631b478f74e3e475731f28bea398b8 |     
  sparc64    |        libostree-2019.6        | NOK | http://autobuild.buildroot.net/results/220262c5b510cca4b5d6a97603ef85e5ca37f7e8 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/33bde109f0cfd5828b394f1ac0a78f0aa27d603a | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cdea087b7f2d8f3fbb410c0d7dc95fbeed351094 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/fa7cff53b22c976172d8c394332cc8df6f878684 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2b57086c2c35882404fa1bacccadf5226a29478a |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e9438d0f6efdee518381c4deb2c8b7ae74d73865 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/1032cf3372ad025f77c6ad4973e625249436f357 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/b6f9ad486529d373bd48075dc2939542feb9ca20 |     
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/ed05470ed3af97253d1c6fd2379900c668d719a1 | ORPH
  powerpc    |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/252285781f78c014ee20b3f7a87f36c3ff04dae0 | ORPH
powerpc64le  |         linphone-4.3.1         | NOK | http://autobuild.buildroot.net/results/48a29c98684fe635639895944e71912ca01e0d2d | ORPH
    arm      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/3c343a3f401a6d553e82d4b9c6b4a0420939c606 | ORPH
   mipsel    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/30a8175a080b04793f44053f87a80ba9f3a91aa9 | ORPH
   sparc     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/12423b64cae9b6ec408a92c9d2d6f56361e8fb83 | ORPH
    i686     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/c02fca6fc2a71bb01a08bcb76128b09c9051de36 | ORPH
    arc      |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/c9564f5e8ecee11fd7a076e315bf1365fdad8b55 | ORPH
  riscv32    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/eb4515f3ca9f86386f1cf8c8ae855c8210c6b2ea | ORPH
  mips64el   |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/07966a8ac3885c36ded91ad40904929924d99cad | ORPH
    mips     |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/d8000665dd7a0e2d578879eed29c81c27f09294d | ORPH
    arm      |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/92667be2ba6f558d5d1d5927f3acfcc28f941376 |     
   x86_64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/11b4acb519b74efaa00be33d8e35e645c74968b3 |     
   x86_64    |         mesa3d-20.0.0          | NOK | http://autobuild.buildroot.net/results/c73673d0cafd4916681c0a12b0bcdab91f5649ad |     
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/996510103e34985569f91bae14f0a5802e0c3840 |     
  nds32le    |         openssh-8.1p1          | NOK | http://autobuild.buildroot.net/results/7b5d884335551e00125210a5e5e5fbdd76d1d43a | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a7c42108d614092cf4f48862310d0c3f04908bc9 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/db8271733d069da13822884509ff22b78a926e4b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/1eef1e0d532d030ce73409698fe46077d35330b8 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ac4cc81ac8457b44935fdca19f3f48696768e854 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/7b24db248f0450b516ae62e0d7a716223a2b03bb | ORPH
    arc      | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/d12d7fea60a188774012f6549a23f4be4b5996c5 |     
   x86_64    | package/syslog-ng/syslog-ng... | NOK | http://autobuild.buildroot.net/results/bd084abf3a9e833e1d5eb6a0adabf5e0e03416d2 |     
   nios2     |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/47dda5a48409d6addabd670f4f98bc3f3401db3c |     
    arm      |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/30659feaa11e7d0daf01c41e1bc1da2b9538968c |     
   x86_64    |     perl-crypt-ssleay-0.72     | NOK | http://autobuild.buildroot.net/results/65f00305f0097084badce2cae3c7e81333e31133 |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/cb3fde4515908f352c226a640896b0b37c471e4f |     
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/164ac591fb13d8f5f08ee9121eac656d13b3aaa1 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/81ccefab3bd4f30d224d4075eb434df3a8867ebd |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e6131df30979f36eaa269cc1debe688c915c3a4f |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a41fcd15da05dd7b7290f4afaf8f01ab14ae75c6 |     
   sparc     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/5916413cead24640b11daafd1bd63731a65d2846 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a72ca55218c3f8cb9d7c059765a54815b6195de6 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1247c4567c8037dc840f6a2f5491ebb489a7fd15 |     
  sparc64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/83367c1453fe20f015aac4385a44bfac7f98ba79 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/d91f4d9fe71d5a1fc8504f7013472d6785eadee1 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/9a109732350d3ff71db79c4e3e12a3b228956065 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/4d8d46aa41cd7755a5aebe66c1781950f3904e87 |     
   mipsel    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/ff01b43f792473e51d51dbee70d3eec91223019d |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/05d03e2f9997a24084cda4d144348ff81dfba061 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/0b5da82b3c5284f427916f4a88f72c487c2e3e8d |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/95d94e8dc56ab2c58ea4d549d6767ef8f87c1f5b |     
    m68k     |           sox-14.4.2           | NOK | http://autobuild.buildroot.net/results/9d4314c90c75b3ab4a028fbce68981097ebd8c0c | ORPH
    arc      |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/4e0768a5aae0f77e1382108b1ca06d0ad78f4da4 |     
  mips64el   |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/7430550dfce0bcb1bc5c9361033e26651883685a |     
   x86_64    |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/56afedff96d17ab4800845d7777dd151cb431acf |     
    arm      |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/2cac7eeaeabf8d77724ff283d3cb9026e778635c |     
   nios2     |      syslog-ng-legal-info      | NOK | http://autobuild.buildroot.net/results/a8189eab2a14cc5d04d90d8f1fa058b86889cc21 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c8c7da89315c3150c077f2c851c7ada9558f429 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d1591edb22d05af88d782e753fb714c3e3000207 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/a9bbe688bdfc36a14d7e8cac626252cd1cb3e8be |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/468fa3307307945abaa983239108e986dc81964d |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/8672ffc7d2e7392a3f4d23ed478f16ce7fb19f42 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/2dfdc75648aa6081e102ae8ada31890963ff3beb |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 5 
             host-grpc-v1.16.1 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/24dac116418aea686198c2c765ed9bdeca496eae |     
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/8980329e9683963bded6460129c679038bb9aa01 |     
powerpc64le  |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/b46a2366f06637887b45c8313ade7a11b8084415 |     
microblazeel |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/1f37b8bb15a54fbb2bbf3a2e74613dac124340e6 |     
    arc      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/86d944cd25d781edd87963ee99bd649def208238 |     
  aarch64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/b0c7c1a787a0680a340290dd602da8d05f5c8138 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/065be0e43fcaee274a30d60adaec03b5a8d8417b |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
               wireshark-3.0.9 | 2 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/06e8b145092582a3f8c5724bf027d453bf19bb16 | ORPH
powerpc64le  |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/d22c646f52d5510af83b1dafe2c086103defdb81 | ORPH
  riscv32    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5f0420c59d13ae510f40f6b1ba4a6a4a9b7c0ccb |     
  powerpc    |        wireshark-3.0.9         | NOK | http://autobuild.buildroot.net/results/a8e91ef8d8fd09fe1aa56c64a58a1f91747ebf91 | ORPH
  powerpc    |        wireshark-3.0.9         | NOK | http://autobuild.buildroot.net/results/2de00cd4d6da7b7b2662cceaba368ab00d1256e7 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

 glslsandbox-player-2019.08.23 | 1 
           host-nodejs-12.16.1 | 1 
               libglib2-2.62.4 | 1 
               libupnpp-0.17.2 | 1 
                  pango-1.44.6 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/2d1d0811e7452460bfefce9490cf1c72a71acfb1 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/46cce40eb3efe380a7c471f7a444685994f4d0e8 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/d490c84fa24ac4176684199864c8a1cba08b0d7e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5a836a0dba645fade4cde9606b91a91869d139ee |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/f1df19ff2e6496bc793e491ef0c6360f3f68f1a9 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/435cbbefe56910598b17476d76a48d24b30bc34c | ORPH



-- 
http://autobuild.buildroot.net
