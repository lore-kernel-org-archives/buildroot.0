From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 07:57:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-20
Message-ID: <20200821075808.D3E3E2038A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 22  |  6  |  0  | 28  |
  2020.05.x  | 15  |  2  |  0  | 17  |
    master   | 169 | 69  |  0  | 238 |
     next    | 41  | 23  |  0  | 64  |

Classification of failures by reason for master
-----------------------------------------------

                qt5base-5.15.0 | 10
     dovecot-pigeonhole-0.5.10 | 9 
              ibm-sw-tpm2-1563 | 7 
  gobject-introspection-1.64.1 | 4 
                  assimp-5.0.1 | 3 
               apcupsd-3.14.14 | 2 
              host-grpc-1.30.2 | 2 
            live555-2020.06.25 | 2 
                  ndisc6-1.0.4 | 2 
                 openal-1.20.1 | 2 
                 ripgrep-0.8.1 | 2 
                      tio-1.32 | 2 
               belle-sip-4.3.1 | 1 
             c-periphery-2.2.2 | 1 
                coreutils-8.32 | 1 
                   eigen-3.3.7 | 1 
   gdb-arc-2020.03-release-gdb | 1 
      gst1-plugins-base-1.16.2 | 1 
gstreamer1-editing-services... | 1 
             host-pango-1.44.6 | 1 
                   i2pd-2.32.1 | 1 
            igd2-for-linux-1.2 | 1 
             kismet-2016-07-R1 | 1 
                 mesa3d-20.1.4 | 1 
                minidlna-1.2.1 | 1 
              netopeer2-1.1.34 | 1 
             openjdk-14.0.2+12 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                    qemu-5.0.0 | 1 
                 rsh-redone-85 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6387880136ddc563eda33e28f37591448e4285fc |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2a8c662980ec69b54c5ca1fcc79777a0beeeda1e |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a4630a0d8a0fe4ae3e1760b84c2e78aaa18b295b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4fc0e3729d763433fd80506acf7da9cc82763001 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/72d52392b0fb34619fd4e04805dee8f557864779 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/9e296120a2c24337e5c8115415a38a01c9c54dd7 |     
   x86_64    |       c-periphery-2.2.2        | NOK | http://autobuild.buildroot.net/results/c3b868c12baac9438b792ada105c0b0de0106311 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/21e0b48336bba2ff7f0a843a233ff513d5a21c4e | ORPH
    mips     |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/7b43613d6a5f8a3a41deb830b726bcce1996df21 |     
    arm      |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/443396c64fe47b6e862690a7bf7fb6b8d31bf94a |     
   sparc     |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/66f7fe4c845d997dc4b687ccea56e5ef72c16dcc |     
   xtensa    |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/8d975882746c6a58430117b847e689ff90590350 |     
    arm      |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/f64c5fcc5a0df13b417bf98182559b2a09bb9045 |     
powerpc64le  |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/8b771c1471fb1349ef410b9ecfe6bb16eb3f27df |     
  riscv64    |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/59cdc5aa3b9b328cfa5ecbf002f36d349ff96694 |     
   x86_64    |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/76d22150b359688ca8b33f5c18dd0aac90171557 |     
  powerpc    |   dovecot-pigeonhole-0.5.10    | NOK | http://autobuild.buildroot.net/results/43d9af3516213019afb0225c99fb434a81271445 |     
    m68k     |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/0b2c1446556ba497ec9d9473d93606e5e387f1b7 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/f06a782b5abe48a2dc17833c8dc95175218ac1d2 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7a2520219dc9132277af688e4caa6753214130f4 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1544c64e241a34fd55c4aa2e82ce62dee9587139 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1564c17965f1baa526b3bd7f66401f34fe321e2c |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/17576b425d8d86e2e98a68ec71b03cebd8b28041 |     
  aarch64    |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/22573268c44fc4494ccc2a44f9ac179c96108e5a |     
  sparc64    | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/36eb875fba2847b32df05f31d8f8ca9f0ecde36f |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/4924d81d0d7c597f9d44994c3c0a38760709d4b1 |     
  aarch64    |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/e2006a63be574ad814c3197141a8dc6580d51160 |     
   x86_64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/396c7487fec62da193232d65b92d2d5394556707 | ORPH
   x86_64    |          i2pd-2.32.1           | NOK | http://autobuild.buildroot.net/results/45f91e68f2aae16dca3ee7d46e40f7899d7256c3 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/a0d8354eb637611ea633eec7030379dc23cbbb24 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c25f6208502a9d0582a480844c28e0cdc818a4ad |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/ff9f236afc2efd9b9d1e9524bcf323d718b36a7c |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/1e4281a9cb19e2d262e3208266bb34e2cd462c27 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/efd48bc9147d991471e491e36b267e075ec0d5fb |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7461e303b41128b1691df9ac99caccda54f592e3 |     
   sparc     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c37525d68f7ec7b27d8e609586bb2507d48e3cf6 |     
    arm      |       igd2-for-linux-1.2       | NOK | http://autobuild.buildroot.net/results/f296984c3851fc28341210e36ef1b55b2edac209 |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5115a2c24cef9bba3e8b4c0e1cf8f7a8fe2192eb | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/a8cd9321df00729e9988379b9226018b18c021e7 | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/6afc7e5a0595da90b486a98865c41c507ac52ca3 | ORPH
   mipsel    |         mesa3d-20.1.4          | NOK | http://autobuild.buildroot.net/results/45037a8380151dbe7ef6a5bdb447ba72ba350ac2 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/fba77219736e53008ca6e72d88221d0ac93510d0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/13ba0bbbab9b41318ca3ce3ea294b7085a351666 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/79a554239676ea404ee52be74ebc3b0fed98e195 | ORPH
    arc      |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/12ebabe8ccde0493096f773242477ca115fabbb3 |     
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/3c2e2db5be1786528513e7a8d9bbb73ed77cabaa |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2f3da33a931167949111e1fdff6c312729f7ade6 |     
    arm      |       openjdk-14.0.2+12        | NOK | http://autobuild.buildroot.net/results/7c4376da0a578572f48a39c06736b2241204fc0e |     
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/caad1ae1695b7d4b42221e700a969175a28847e8 | ORPH
    arm      |           qemu-5.0.0           | NOK | http://autobuild.buildroot.net/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb | ORPH
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/901ca164386f1654e7bc03d20dd647d0304e457a |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/3f483e55774d60bb0bbe44c275b9288f175d9e43 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b4b9885b70cdaa0720cbf3d0cda73c209b0ad7e9 |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b21887e83b1384f7c30cdf96e6744b2dc3756464 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/37e82b9fa2ba6a0a30d502872e3aa9a270daf38a |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/58d989896af93b52b5f97497712af7f64188cd3d |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/4742a4698e555f2276accb71d321949b1bee583e |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/812ea892d1a44cd5d408b4d26198582901aca42b |     
    i586     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b47d665d031c14f6d58c9f6df262196702c8dd8e |     
  powerpc    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/44e5b03a12137b22564ad7ac09ad6b420f56865d |     
 powerpc64   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a508eb93666c5b4e4151c8bde391924f32b10859 |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/5c95ff09c76524f83d9147f866ee5ea0e37e15f9 |     
    arm      |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/309ae1606716b734373cc68b0ee4edc3323d4a78 | ORPH
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/25805cedb5c300e7f879f857157e86d59567166a |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a61910b092ddc16da26ae415c069bcb7df808faa |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3a0c4666c6cf8b47e0e7073703be335bc4ac22fa |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5204cb264db2fdaa97a60c88e2d0a833cebd3622 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/a1746b67e5f261c63b93368b6b47b35165170a6f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/58a7cd1b1484dd21ecd360e9a695641087285651 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1g | 1 
                  luajit-2.1.2 | 1 
                 opencv3-3.4.9 | 1 
                qt5base-5.12.8 | 1 
        qt5imageformats-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/881a4ce44e1128dadfc88bbc5f3c69a9d9c7dc9f |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/423a9238970b701f41b73b83c88c40ba6b486401 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/8ea2f5d3ef3ac5c7250d517a7a6973bb62401b4a |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/8c39d5c2decdb01ee169715a748df81e7a658c11 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/7dc819662c947b2b7542a894cfe60250d8f8df9e |     
   x86_64    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/6831dfdd1ecaaa3812de481882040c1742a72aec |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/53e426e28ef8cbc52b8ccbc69af76d8c26b4dc95 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4082633afdbec8826082f24ed91380ee8345773f |     


Classification of failures by reason for next
---------------------------------------------

              host-grpc-1.31.0 | 3 
        18xx-ti-utils-R8.7_SP3 | 2 
              keepalived-2.1.4 | 2 
                     avahi-0.8 | 1 
              bitcoin-0.19.0.1 | 1 
                  boost-1.73.0 | 1 
                   cvs-1.12.13 | 1 
              dieharder-3.31.1 | 1 
               domoticz-2020.1 | 1 
              host-guile-3.0.4 | 1 
             kismet-2016-07-R1 | 1 
               libglib2-2.64.4 | 1 
               libupnpp-0.19.2 | 1 
            live555-2020.06.25 | 1 
                  luajit-2.1.2 | 1 
               opencv-2.4.13.7 | 1 
openfpgaloader-849e5751e06d... | 1 
                qt5base-5.15.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     18xx-ti-utils-R8.7_SP3     | NOK | http://autobuild.buildroot.net/results/850bb57a3c9d1a0ecfecf0b352df65c8f74ed01e |     
    arm      |     18xx-ti-utils-R8.7_SP3     | NOK | http://autobuild.buildroot.net/results/879de8b1bddd4b4464d31b06588eea7381797312 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/fb47abc59910545541a585a644ce79e9d8445d57 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/81e035b06a6ee84ae473163264fb9a2d9aa0cd7a |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/292e1ac541183792dfbb0300e2da74f0f7cc588b |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/835dfef22a4cd3fb92cb1ed74d3afce00a6f7352 | ORPH
    arm      |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/4c2ead055c6b37e2b89e6c45b5fcb00f78d0db66 |     
    i686     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/507a5dff58729aef1bd01f53e0adf0d6bb86fea5 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/989c90e0258b677077589f72709126b3bbed6b52 |     
   mipsel    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/d18f7487afc89eaaede170d3c98d4894a9c0e83e |     
    i586     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/a5ec0b1667fb4dde9c36e19b0e9e6088df9915c7 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/ef59eb80a7f955bebe838eba9613c241ad7f140a | ORPH
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/8c85c39edd3bd658a9bdc6ec436d6cd9bc3e3d26 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b403e75e4079281f9d275bdda581e2894f73fea6 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/a64b0c2dcfd3e669c05ab0edd1f03b9b83704e5d | ORPH
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/f51f9bbb17f4a0c36d513bf413bc64eb66c5c50d |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/bdbdafcf6d0ed439ee2843e904238f76dff6a02d |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/33b83b903287b915ddb25d1caf5b5a77d28a69e2 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/3c9e49e0e6aedb3ecdf0bf8d17c9bab50af401b3 |     
    mips     |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/e967a13cbd2620186a5a31988a5ebf252162ff5c |     
    arm      | openfpgaloader-849e5751e06d... | NOK | http://autobuild.buildroot.net/results/f3f3cc216ae42bb8a8925b0df7c1a3cc79b027d7 |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/b69bc77635c9d05850d575ecb20d463b49ff5893 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3ae357670de0dc1193a45970d2b6d9cb533e003f |     



-- 
http://autobuild.buildroot.net
