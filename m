From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 09 Sep 2019 06:16:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-08
Message-ID: <20190909061647.6AA4D871DE@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 33  |  2  |  0  | 35  |
  2019.05.x  | 17  |  2  |  0  | 19  |
  2019.08.x  | 29  |  8  |  0  | 37  |
    master   | 159 | 148 |  0  | 307 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-libcap-2.25 | 39
                 apache-2.4.41 | 22
          host-capnproto-0.7.0 | 15
            wpa_supplicant-2.9 | 12
             subversion-1.9.12 | 7 
                snort-2.9.14.1 | 6 
                log4cxx-0.10.0 | 5 
                    ffmpeg-4.2 | 3 
                    flac-1.3.3 | 3 
                      icu-64-2 | 3 
                  luv-1.30.1-0 | 3 
               capnproto-0.7.0 | 2 
                  flashrom-1.1 | 2 
                  gnutls-3.6.9 | 2 
                 haproxy-2.0.4 | 2 
                 libdrm-2.4.99 | 2 
              micropython-1.11 | 2 
   openvmtools-10.3.5-10430147 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                   dvblast-3.4 | 1 
           host-harfbuzz-2.5.3 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
                   hostapd-2.9 | 1 
                   i2pd-2.24.0 | 1 
              iputils-20190709 | 1 
                libnice-0.1.14 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                   mimic-1.1.0 | 1 
                   systemd-241 | 1 
                       unknown | 1 
               wireshark-3.0.2 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/943fdcf79bf513dff24b5cd5aa45397dae809057 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/25551382b52692812304dead00b42bd610565eec |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/86ddfbe9987d1c5b50443dd2ff13523104e871fd |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/25101672852e461935be48a7f39ed821d2204427 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e4c98d651a5d7d9789de66988d2760d319d1518b |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e99ec1512fa481dab5bd5857878e33c2796e2dbd |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/d58d58fc377f0700a230d89b1ab1cec544114f19 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/fe7c48e9b594687a3261589da39496f15ef1dcbe |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/d956c31c4e06c1291c9e293ad84c78a6cbe4befe |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5225060e8b52f13426df5239e120fe37f3c7bbc9 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a53b3ffce15fe45935e59411e7582a344709efd7 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/96d92dfe0dc6f1a066242a8f58f91ae73d1c6030 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/67eef7ace2c03d7ffba942fd58592daf5678cd1a |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/98de50367420c489fc05c73ffcf5552fde476cd5 |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/244b4cbfaaaa4563c7bf1fa5df0f638014f2703f |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/8cc4e206b4fbcd96dd755404a8d8cdebe3b1ffa4 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/f721415a0354be718b351916b8447a4f82b2fabb |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/96655beb0e179be1ce88bca7a048e812dc046fd1 |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/05d42863ba6bb488b8ccc73703bad9df32535787 |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/6f2c80aabde1801dbcbb06e92ea216fcc6f25ffd |     
   xtensa    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ee103fa453f7284b6a358fd6622a3a00326c906e |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/00e18a6fa1af7432429ba156f8535fae2788a191 |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/bde6ff40087c62694a79c7918d2d60ef040e2544 |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/5c09e745cab822d830f73e33647f3b0e765c9181 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/d564af08c640dd4f5a2683cb4f652e1d75eb9210 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/db751b4ba6493bc0f3f8c61d7688f9f3165f77d8 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0493f30a91735739520037368748d24e77b9b73b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b6dda1526297026993f80bae4bb5c06074ac314b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c2ed5a7195e76b37ac345240fad53dde58cf2fda |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/e2aa97fb6ca5b390210e10e22225eef08d90bc40 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/6b444c3f531c42690687f36786f0d85d62c3ce0d |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/81d0e23a312791b61191b366fe80e2ee0211dc78 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/2b0592a6d1ee473305e134c1b69683b0c584d5f8 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/a01264a71936cdb8d31be3252c2a09b944514407 |     
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/444bd54dd4930276ef49c45234576740b3b8395d |     
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/472c18d9bc0930496a71eba41ebf1c3063e827cb |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/3969ace54d13f65861798f7bce72b6e299a06672 |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/4dc69a8bdde794e884e6b1374f0c9ba0ee60dc77 |     
microblazeel |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/743c750e9932658c20965a25de89c3f21a1d43e9 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0f41455b49246012a703fb0d87a6a26ac3b7a530 |     
   mipsel    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/2c38219ca512a7884cd6b6d8530bf9f1fcb43eee |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0a9a17374d5553e9f68a3219d4a1f4dd4caec4ad |     
    or1k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/110b04365c3072707330c9c01c2b2a909d110d48 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/75fe7a1dc336ad1574be0a1c191f9adfb9ec0c42 |     
  sparc64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fd15c4ed479fca636f0c4d59573e5aa248386504 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/1328b74e7c71396e2a182e5df4fcadfadf05ad75 |     
   xtensa    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/fc5cb6a54bf2595f21a8dd0892c4a4317dfab9eb |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ebd9c9d85aef5b652fae8c76886aaf6d73c9c94c |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f124cee7b81f89c403cada310129e232256453de |     
   sparc     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/81975b8659898caca37b806f3280c98c4012dd34 |     
    i686     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/092a9d310f571a4ce2ba9fabb4b980c72b67155d |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/471e416197bea7f1e42e6081cc82ad0055bfef7d |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/43f48467ca961cf523264524af19aba29cc0c87d |     
  sparc64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/3fa445df2b74f04b7e38e44d88f7cbd9ec11c579 | ORPH
    sh4      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/d5bec1906aaf76c342a87d50bb1406cc5d3f6b38 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/a534fe859c5a8a1b2d9acc276d152b05960e82de |     
powerpc64le  |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/0fae4f2156178d5c8be6ca45010111974504fae6 |     
  mips64el   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/545bbafdc9b5d7717fc187b06e40cf82effd8222 |     
    i586     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/a5dd9eca7510b795bf5e1d54211bec0154cd35cb |     
   nios2     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/6651110c9a6becc9e12cc47a6dcec3e167f3d2a4 |     
  powerpc    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/2ba61420cc97cfe46a7d0c7d86f93d5b148b05ab |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/74b7c3f57a247b8d443ec9153c40e69077090bdd |     
  mips64el   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/1a83b7a049dca5247a88b07a193c143f2e00985d |     
    mips     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/a612f6db784ccc0bbbe4357a57ea4583bb1ed4bb |     
 powerpc64   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/3efd6e07a1a41322b3cd9755d83331dc1566a69b |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/42fbbfd97b59fa46c735c831c9b294ce1b235c24 |     
  riscv64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/37989dffeb6f7ade2675ae30bd7bf3a86bbe7862 |     
microblazeel |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/1f20f5a0ba04acd5aa02274255652bd8ce003ad9 |     
    sh4      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/81da0cf196842549fa9048b882518f4782528cc2 |     
  powerpc    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/9b126a6f99aa36b48010072d2cc5556b3d84df50 |     
    sh4      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/1ffbce8097e08a7237581ae4330803ff850740d1 |     
  riscv64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/8dc0bab508a7610cc198fb493ba35deefdf7d206 |     
    arc      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/2817664806f1be187641b4313d0a52bcb88bfc8c |     
  mips64el   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/9e618ed94965298b85c2c9cca57a96861a714a71 |     
  mips64el   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/9a595f01a34400a80b3525fb49f4f6eac8f9d115 |     
  aarch64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/32eb73459bb92c9e298a01177e423cd3b2262562 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/58668bcce09201288e80a9e57a44accccbdc59bc |     
   x86_64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/4c02fc86586bb2630034431bbcc009bdebd3007f |     
   nios2     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/e3c22e2faa3e62f8ff43c66ba44f52f61527e196 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/b35212a99f59d552af2e069a1390ff8f4768254f |     
    arc      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/89ff3dee4c4f08a73e5c54c2f5253f8b00a7bbf6 |     
 powerpc64   |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/6125b50ea0e268566463703f19c4f0b75e274b02 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/c6fdc2999307cc418882ad2fde2429b41d950a62 |     
   mipsel    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/b377e463a9e5dfae8ad30de5cb5839b7cb17f30d |     
  sparc64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/bb19947806a1ff1ef1218ae541a4b3788d2fb3ec |     
    arc      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/1eb3265e1f856348fdcc03ec477870eafa505829 |     
    arc      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/a9dba86ad7ee88e792e385ce2fbec5ed5ba258f0 |     
    i586     |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/25a46bd89eee5dde6c91e7cf8e203ecceea458f5 |     
  aarch64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/300ad4228ce6e32829b809ec61e0e4d42cdd5f93 |     
  riscv32    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/42d1ed283643cde94fc12d39e3ec3541c20ecb6f |     
  riscv64    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/91d1804841dbcd16ba970a6734b78ab0bb52f29a |     
   xtensa    |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/63a58d5d2b93d5135c9fa1e31ed3d44224e1cb16 |     
    arm      |        host-libcap-2.25        | NOK | http://autobuild.buildroot.net/results/6f021cb7f96a4606f76b03f5aa7be3cf6a39470f |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/83fbd0f01d430bc30b6ac7bc455d874e3955595c |     
   mipsel    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/7a3750d4a96fe0ffb9999150de0d43d39e9a51c4 |     
  riscv32    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/4402ebe2302a8d32e478dd7e729cc5010d06ea21 |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/723bd5d5bbff087393aa31fa540be1c48b5522de |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/88ec288834628e8c95f06f0e0b97121ed19fab6e | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/339fe84021db8933bcd0c98f6c2fd9933d5d7ebc | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/15a76c0b48adb6782ca24bf0a88c52574d56946f | ORPH
    sh4      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/e6798e5dc29dcf8824023296aff42175fe22cd63 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/66400438ff03829ba67561be6a076b43667ac9ef |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1f75edeb440f14c95ad399ae1cfb32abdb32460a |     
   x86_64    |         libnice-0.1.14         | NOK | http://autobuild.buildroot.net/results/a0770cad556a2e5860470cda6ad1efd2c8e8d523 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/72e5b5a0b4547cc881e1c1451e8c89d7492a3a28 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c5eb130ab996420ebbfb51b99df872731ad2191e |     
microblazeel |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/fda041872aa8b2fed1493c6c27afe040e90c87d9 |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/cee7308d477acfc25243d9a6cd4478a7a8f6927f |     
  riscv32    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/cefc81a6a65b92d28ea6d9cc40596b6cdb2158cd |     
microblazeel |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/2c122115058a16980d4f5f08e24ff05847aacb70 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/407b53f102f81dec10cab16a17bdc5d074fa8897 |     
   x86_64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/5419d3fc6faf15216032cb5a4acabff6df0f962a |     
 powerpc64   |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/2e6626d71ba6a362b511449cf7d70a499b86174b |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/692e2e569120be2e4493e1163a783720a68e33a8 |     
microblazeel |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/5b66adac804a0399c2cb532d15268f82bc5926c8 |     
  riscv64    |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/8d9e0208cb4e24352b67c52a164b73c08de4fe11 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/bd28c508b9862e070a635c76af0be3ebec5288b5 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/943e0b6a1b12872062788b5de7c8ec68d2784682 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6ee962ac20d5ed216fe3221a3ff846f91c21dc0b |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/63a5a1cab5c4f7c0582864fcf2336ba1ef270404 |     
powerpc64le  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2b8cc152c4e03453a35be9a02579eb3122663b49 |     
   sparc     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ac69470f3650af0468500f701d468e37ae20b22d |     
  riscv64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1a7f5c2339b2f807bcf8c4808c8eb8088f8f6000 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/d392454ecbc88fa7dfe12e3782d7f907b995bb7f |     
powerpc64le  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/53f2b197d1b16019c9b15be87bb1ab5ba1885b69 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3157ab576bbfd672108806fcedb486075f1ee0ef |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e79bbcdb2bf534b27ff8431aac869e6e364a2d9b |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/986f29dead9d21e75056e418569d0970624041ef |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3d9448b595b3177d62e7ae84e71c5f10db980706 |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5c5363cf98d725a86bb99cfd24cb7c2086e02d3c |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/a7c7ffbf7d11ebb2321443813d605e7b99d0fe0f |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/cee05a6e8fcabbf5d71ec2e0717014df0d485e10 |     
  mips64el   |          systemd-241           | NOK | http://autobuild.buildroot.net/results/eb4ed7e569e1a5c256e6319e0a26ba7dd54ecbae |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3da2e4b4cbf1ead46278050fe0a64f1108536b64 |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/6c31b84e8d0261a720871bfa476b2764f0cf5412 | ORPH
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e9e389849f3a6435f15124836b896e1a9037d952 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d37672374db935ac29953263ec68a2786ee65cc2 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/a592b3d9b37a5bfd367b5323d4652f2af9125e1d |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3bdb86fa14df1499aa3e77490328a7980ca6fa3d |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/cfb557100e9424fa816792b4ec4b769442d64965 |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/5da49cd54562052e7faf8f8de95540e527a5f2d6 |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/14815d31544e3dbf12e0254a43f2f1b3cd88ff0e |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c23248ce185eb7aa6535fe9914a073a2ac92f069 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/09d08a8cba282aeff9bb122aa0e4b64afd1bbaa6 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/93efa20cefa7b886f41678458e22670353689a7d |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ef6ea230a7ea0c71347b0b365b373694a71826b9 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/2e78fa94b354f3550fac17b6e181a2071590d2ad |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/82d22235aff262b215339f7981b2452b74ba8db3 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/121560b3025e14ace3c0f7f1650de82f5c784d0a | ORPH
    arm      |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/006411b4974ae5e814295f288b72e50c4ff69772 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 1 
                  libssh-0.8.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/64ed929ef08727cde064262fb4a98a2ab967e4cb | ORPH
   xtensa    |          libssh-0.8.7          | NOK | http://autobuild.buildroot.net/results/90f9fbeab5e68f6d18eaddb0684987480b44241c |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
                  flashrom-1.1 | 1 
                     gzip-1.10 | 1 
                      icu-64-2 | 1 
               log4cplus-2.0.4 | 1 
                    wampcc-1.6 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c7e1dcc73bb117e654b76e14c02853aee1f6271e |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/0c12af7c90f76559da0c5625b2acc074eff5100b | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/be32d2241fcef521897192dc0407960602789c9d | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3e08830dd6c26478d390bba3b0b231f7beac5557 | ORPH
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/86f4920e27c7f0a4effada5e9c3f808351a71487 | ORPH
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/1a4dba26d42ed2f41579992b44748c5be6cb52d5 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/402eafd58610aa0c5737b2634519dca79a6faf15 |     
    arc      |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/c72b2c637a6b55f81c44a2f46bf6e9484b8e1d94 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.62.5       | 3625         |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                         acpid |  DISTRO  | https://release-monitoring.org/project/00019 | 2.0.30       | 2.0.32       | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.33.92      |     
                       aespipe |  GUESS   | https://release-monitoring.org/project/21320 | 2.4d         | 2.4e         | ORPH
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r2    |     
                      argparse |  GUESS   | https://release-monitoring.org/project/02100 | 0.7.0-1      | 1.0.10       |     
                         argus |  GUESS   | https://release-monitoring.org/project/00107 | 3.0.8        | 3.0.8.2      | ORPH
                     armadillo |  GUESS   | https://release-monitoring.org/project/07006 | 7.900.1      | 9.700.2      |     
                   at-spi2-atk |  GUESS   | https://release-monitoring.org/project/07840 | 2.26.2       | 2.33.92      |     
                  at-spi2-core |  GUESS   | https://release-monitoring.org/project/07841 | 2.28.0       | 2.33.92      |     
                         atkmm |  GUESS   | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-07-01   |     
                  b43-fwcutter |  GUESS   | https://release-monitoring.org/project/00152 | 015          | 019          |     
                        babeld |  GUESS   | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  GUESS   | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                            bc |  GUESS   | https://release-monitoring.org/project/00170 | 1.06.95      | 1.07.1       |     
                       bcm2835 |  GUESS   | https://release-monitoring.org/project/21323 | 1.48         | 1.60         |     
                     bctoolbox |  GUESS   | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                         bdwgc |  GUESS   | https://release-monitoring.org/project/17108 | 8.0.0        | 8.0.4        | ORPH
                          bind |  GUESS   | https://release-monitoring.org/project/14923 | 9.11.6-P1    | 9.15.3       | ORPH
                      binutils |  GUESS   | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                          bird |  GUESS   | https://release-monitoring.org/project/00192 | 2.0.4        | 2.0.5        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.18.1       |     
                     bitstream |  GUESS   | https://release-monitoring.org/project/16268 | 1.4          | 2.5.4        |     
                        bonnie |  GUESS   | https://release-monitoring.org/project/15231 | 1.03e        | 1.98         | ORPH
                         boost |  GUESS   | https://release-monitoring.org/project/06845 | 1.70.0       | 1.71.0       |     
                        brltty |  GUESS   | https://release-monitoring.org/project/00220 | 5.6          | 6.0          |     
                   btrfs-progs |  GUESS   | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  GUESS   | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                        c-icap |  GUESS   | https://release-monitoring.org/project/21325 | 0.4.2        | 0.5.5        |     
                c-icap-modules |  GUESS   | https://release-monitoring.org/project/21326 | 0.4.5        | 0.5.3        |     
                         cairo |  GUESS   | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  GUESS   | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  GUESS   | https://release-monitoring.org/project/17512 | 0.26.0       | 0.38.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.38.0       |     
                    cbootimage |  GUESS   | https://release-monitoring.org/project/21338 | 1.7          | 1.8          |     
                        ccache |  GUESS   | https://release-monitoring.org/project/00257 | 3.6          | 3.7.3        | ORPH
                        ccrypt |  GUESS   | https://release-monitoring.org/project/14496 | 1.10         | 1.11         |     
                   checkpolicy |  GUESS   | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                        chrony |  GUESS   | https://release-monitoring.org/project/08810 | 3.4          | 3.5          | ORPH
                    cifs-utils |  GUESS   | https://release-monitoring.org/project/00287 | 6.8          | 6.9          |     
                        clinfo |  GUESS   | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  GUESS   | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.3       |     
                     coreutils |  GUESS   | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  GUESS   | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  GUESS   | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.0          |     
                    cryptsetup |  GUESS   | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                          cups |  GUESS   | https://release-monitoring.org/project/00380 | 2.2.12       | 2.3.0        |     
                  cups-filters |  GUESS   | https://release-monitoring.org/project/05541 | 1.25.4       | 1.25.5       |     
                      cutelyst |  GUESS   | https://release-monitoring.org/project/21335 | 2.7.0        | 2.8.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                         dante |  GUESS   | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  GUESS   | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.10       | ORPH
                         dc3dd |  GUESS   | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  GUESS   | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  GUESS   | https://release-monitoring.org/project/11429 | 7.2.2        | 8.0.4        |     
                        dialog |  GUESS   | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                        docker |  GUESS   | https://release-monitoring.org/project/11719 | 1.5          | 19.03.2      | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.7      | 19.03.2      |     
                docker-compose |  GUESS   | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0-rc.0   |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.7      | 19.03.2      |     
                    drbd-utils |  GUESS   | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  GUESS   | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                           dtc |  GUESS   | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                      easy-rsa |  GUESS   | https://release-monitoring.org/project/17770 | 3.0.1        | 3.0.6        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 16           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.2       | 1.22.4       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.08        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.22         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.6        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.22.4       | 0.23.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.0.7       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.20       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      eventlog |  GUESS   | https://release-monitoring.org/project/14684 | 0.2.12       | 3.19.1       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.0.0      | 2.5.1.0      |     
                         exiv2 |  GUESS   | https://release-monitoring.org/project/00769 | 0.27.1       | 0.27.2       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | v1.11.0      | 1.12.0       |     
                      fakeroot |  GUESS   | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                     fetchmail |  GUESS   | https://release-monitoring.org/project/00801 | 6.4.0.rc1    | 6.4.0.rc4    |     
                        ffmpeg |  GUESS   | https://release-monitoring.org/project/05405 | 4.2          | 4.2.1        |     
                     findutils |  GUESS   | https://release-monitoring.org/project/00812 | 4.6.0        | 4.7.0        | ORPH
                           fio |  GUESS   | https://release-monitoring.org/project/00806 | fio-3.9      | 3.15         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  GUESS   | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  GUESS   | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                        flatcc |  GUESS   | https://release-monitoring.org/project/21350 | 0.5.2        | 0.6.0        |     
                         flite |  GUESS   | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  GUESS   | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.9        | ORPH
                          fltk |  GUESS   | https://release-monitoring.org/project/00823 | 1.3.4        | 1.3.5        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.10.2       | ORPH
                    fontconfig |  GUESS   | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                         fping |  GUESS   | https://release-monitoring.org/project/00834 | 4.0          | 4.2          | ORPH
                          fwts |  GUESS   | https://release-monitoring.org/project/17383 | V18.09.00    | 19.08.00     |     
                          fwup |  GUESS   | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.1        |     
                          gawk |  GUESS   | https://release-monitoring.org/project/00868 | 4.2.1        | 5.0.1        | ORPH
                           gcr |  GUESS   | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  GUESS   | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                     gengetopt |  GUESS   | https://release-monitoring.org/project/00892 | 2.22.6       | 2.23         |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  GUESS   | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
               glib-networking |  GUESS   | https://release-monitoring.org/project/21353 | 2.61.1       | 2.62.0       |     
                        glibmm |  GUESS   | https://release-monitoring.org/project/07960 | 2.60.0       | 2.61.1       |     
                           glm |  GUESS   | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  GUESS   | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.1.0        | 0.1.3        |     
                       gnuplot |  GUESS   | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  GUESS   | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                            go |  GUESS   | https://release-monitoring.org/project/01227 | 1.12.9       | 1.13         |     
                         gperf |  GUESS   | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  GUESS   | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  GUESS   | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  GUESS   | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  GUESS   | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  GUESS   | https://release-monitoring.org/project/19117 | 1.18.0       | 1.23.0       |     
                         grub2 |  GUESS   | https://release-monitoring.org/project/01257 | 2.02         | 2.04         |     
     gsettings-desktop-schemas |  GUESS   | https://release-monitoring.org/project/13139 | 3.33.1       | 3.33.92      | ORPH
                           gsl |  GUESS   | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  GUESS   | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.0       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.0       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.8.1        |     
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  GUESS   | https://release-monitoring.org/project/07724 | 3.24.7       | 4.3.92       |     
                         guile |  GUESS   | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  GUESS   | https://release-monitoring.org/project/05496 | 1.31.4       | 1.41.91      | ORPH
                      harfbuzz |  GUESS   | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.1        | ORPH
                       haveged |  GUESS   | https://release-monitoring.org/project/11695 | 1.9.4        | 1.9.6        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  GUESS   | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  GUESS   | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  GUESS   | https://release-monitoring.org/project/05387 | 0.326        | 0.327        | ORPH
                         hwloc |  GUESS   | https://release-monitoring.org/project/13501 | 1.11.7       | 2.0.4        |     
                          i2pd |  GUESS   | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-64     | ORPH
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.6          | 3.7          |     
                      ipmiutil |  GUESS   | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                         ipset |  GUESS   | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  GUESS   | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  GUESS   | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  GUESS   | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  GUESS   | https://release-monitoring.org/project/18380 | 0.18         | 0.20         |     
                         jack2 |  GUESS   | https://release-monitoring.org/project/21358 | 1.9.12       | 1.90         |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  GUESS   | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  GUESS   | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                            jo |  GUESS   | https://release-monitoring.org/project/18855 | 1.1          | 1.2          |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
                       jsoncpp |  GUESS   | https://release-monitoring.org/project/07483 | 1.8.4        | 1.9.1        |     
                           kbd |  GUESS   | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  GUESS   | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  GUESS   | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 1.1.0        | 2.0.1        |     
                       kvazaar |  GUESS   | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  GUESS   | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  GUESS   | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  GUESS   | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                       libbson |  GUESS   | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  GUESS   | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.2        | 4.0.4        |     
                        libcgi |  GUESS   | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libcoap |  GUESS   | https://release-monitoring.org/project/21471 | 4.1.2        | 4.2.0        |     
                      libcroco |  GUESS   | https://release-monitoring.org/project/11787 | 0.6.12       | 0.6.13       | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  GUESS   | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.1       | 2.00.5       | ORPH
                      libevdev |  GUESS   | https://release-monitoring.org/project/20540 | 1.7.0        | 1.8.0        |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.6.2        | ORPH
                     libgcrypt |  GUESS   | https://release-monitoring.org/project/01623 | 1.8.4        | 1.8.5        | ORPH
                    libgdiplus |  GUESS   | https://release-monitoring.org/project/06440 | 5.6          | 6.0.2        |     
                    libgeotiff |  GUESS   | https://release-monitoring.org/project/21361 | 1.4.3        | 1.5.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.60.7       | 2.62.0       |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.17       | 1.0.18       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  GUESS   | https://release-monitoring.org/project/07735 | 232          | 233          |     
                 libhttpparser |  DISTRO  | https://release-monitoring.org/project/10989 | 2.9.0        | 2.9.2        |     
                       libical |  GUESS   | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.5        |     
                      libiconv |  GUESS   | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  GUESS   | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  GUESS   | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.1       |     
                        libite |  GUESS   | https://release-monitoring.org/project/17367 | 2.0.2        | 2.1.0        |     
                      libkcapi |  GUESS   | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.16.2       | 1.17         |     
                       libldns |  DISTRO  | https://release-monitoring.org/project/14817 | 1.7.0        | 1.7.1        |     
                   liblockfile |  GUESS   | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libloki |  DISTRO  | https://release-monitoring.org/project/21486 | 0.1.7        | 03.07.2005   |     
                       libmbim |  GUESS   | https://release-monitoring.org/project/07308 | 1.18.2       | 1.20.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  GUESS   | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  GUESS   | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 1.8.0        | 2.0.0        |     
                      libosip2 |  GUESS   | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2018.9.1     | 2019.3       |     
                        libp11 |  GUESS   | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                   libpagekite |  GUESS   | https://release-monitoring.org/project/21366 | v0.91.171102 | 140214       |     
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/21491 | 4.9.0        | 4.10.1       |     
                      libpjsip |  GUESS   | https://release-monitoring.org/project/15701 | 2.7.2        | 2.9          |     
                        libpng |  GUESS   | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  GUESS   | https://release-monitoring.org/project/21367 | 6.2.5        | 6.4.5        |     
                        libpri |  GUESS   | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  GUESS   | https://release-monitoring.org/project/07307 | 1.22.4       | 1.22.6       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.2       | 0.19.5       |     
                       librsvg |  GUESS   | https://release-monitoring.org/project/05420 | 2.40.20      | 2.45.92      |     
                       librtas |  GUESS   | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     librtlsdr |  GUESS   | https://release-monitoring.org/project/15172 | 0.6.0        | 0.7.0        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.0        | 2.4.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  GUESS   | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  GUESS   | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  GUESS   | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  GUESS   | https://release-monitoring.org/project/11483 | 2.62.3       | 2.67.93      |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.8.5        | 1.9.0        |     
                      libtasn1 |  GUESS   | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  GUESS   | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                     libunwind |  GUESS   | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.10.2       | 0.11.1       |     
                 libusb-compat |  GUESS   | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.16.7       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.1        | 8.8.2        |     
                 libwebsockets |  GUESS   | https://release-monitoring.org/project/11181 | 2.4.2        | 3.2.0        |     
                        libwpe |  GUESS   | https://release-monitoring.org/project/17789 | 1.2.1        | 1.3.1        |     
                  libxkbcommon |  GUESS   | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.03      |     
                       libyaml |  GUESS   | https://release-monitoring.org/project/13522 | 0.2.1        | 0.2.2        | ORPH
                         links |  GUESS   | https://release-monitoring.org/project/01822 | 2.19         | 2.20.1       | ORPH
                      linphone |  GUESS   | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                    liquid-dsp |  GUESS   | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  GUESS   | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.08.28   | ORPH
                         lldpd |  GUESS   | https://release-monitoring.org/project/14019 | 1.0.3        | 1.0.4        |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.17       | 0.1.18       | ORPH
                          lpty |  GUESS   | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  GUESS   | https://release-monitoring.org/project/01844 | 4.91         | 4.93.2       | ORPH
                        lsscsi |  GUESS   | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.10.1       | 2.10.5       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.10.6       | 2.10.11      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.5       | 2.10.7       |     
                           lua |  GUESS   | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                   lua-cqueues |  DISTRO  | https://release-monitoring.org/project/11726 | 20190731     | 20190813     |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                      luarocks |  GUESS   | https://release-monitoring.org/project/01856 | 3.1.3        | 3.2.0        |     
                      luksmeta |  GUESS   | https://release-monitoring.org/project/11763 | 8            | 9            |     
                           lxc |  GUESS   | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  GUESS   | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  GUESS   | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  GUESS   | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  GUESS   | https://release-monitoring.org/project/01887 | 10.3.16      | 10.4.7       |     
                            mc |  GUESS   | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  GUESS   | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  GUESS   | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.17       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 19.0.8       | 19.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 19.0.8       | 19.2.0       |     
                         meson |  GUESS   | https://release-monitoring.org/project/06472 | 0.51.1       | 0.51.2       |     
                      metacity |  GUESS   | https://release-monitoring.org/project/15392 | 2.25.1       | 3.33.92      | ORPH
                      mfgtools |  GUESS   | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  GUESS   | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.8.9        |     
                          mksh |  GUESS   | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  GUESS   | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  GUESS   | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                       mongodb |  GUESS   | https://release-monitoring.org/project/02008 | r4.0.6       | 4.0.3        |     
                          mono |  GUESS   | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.0.0.327    |     
                     mpdecimal |  GUESS   | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  GUESS   | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                         msmtp |  GUESS   | https://release-monitoring.org/project/02024 | 1.8.3        | 1.8.5        |     
                         mtdev |  GUESS   | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          mxml |  GUESS   | https://release-monitoring.org/project/13545 | 3.0          | 3.1          | ORPH
                          ncdu |  GUESS   | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20190907 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  GUESS   | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.2       | 1.21.1-dev   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  GUESS   | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        | ORPH
                       nghttp2 |  GUESS   | https://release-monitoring.org/project/08651 | 1.37.0       | 1.39.2       |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.1       | 1.17.3       |     
                         ngrep |  GUESS   | https://release-monitoring.org/project/02084 | 1_47         | 1.45         |     
                   nilfs-utils |  GUESS   | https://release-monitoring.org/project/02091 | 2.2.7        | 2.2.8        |     
                          nmon |  GUESS   | https://release-monitoring.org/project/02097 | 16g          | 16k          | ORPH
                        nodejs |  GUESS   | https://release-monitoring.org/project/08251 | 10.15.3      | 12.10.0      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                       numactl |  GUESS   | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  GUESS   | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.7          | 1.9          |     
                     ocf-linux |  GUESS   | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 305          |     
                      openblas |  GUESS   | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  GUESS   | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2rc1     | ORPH
                       openpgm |  GUESS   | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 10.3.10      |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.6.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.6.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.17       | ORPH
                   paho-mqtt-c |  GUESS   | https://release-monitoring.org/project/21375 | 1.3.0        | 1.3.1        |     
                 paho-mqtt-cpp |  GUESS   | https://release-monitoring.org/project/21376 | 1.0.0        | 1.0.1        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.40.14      | 1.44.6       | ORPH
                       pangomm |  GUESS   | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  GUESS   | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  GUESS   | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.3       |     
   perl-class-method-modifiers |  DISTRO  | https://release-monitoring.org/project/06735 | 2.12         | 2.13         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.77         | 6.78         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
         perl-devel-stacktrace |  DISTRO  | https://release-monitoring.org/project/11840 | 2.03         | 2.04         |     
               perl-file-slurp |  DISTRO  | https://release-monitoring.org/project/11852 | 9999.26      | 9999.27      |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.56         |     
                perl-mailtools |  DISTRO  | https://release-monitoring.org/project/10540 | 2.20         | 2.21         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.23         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.20         | 1.21         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000006     | 2.000008     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                        physfs |  GUESS   | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                      pinentry |  GUESS   | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  GUESS   | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  GUESS   | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.3        |     
               policycoreutils |  GUESS   | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  GUESS   | https://release-monitoring.org/project/03686 | 0.77.0       | 0.80.0       |     
                     portaudio |  GUESS   | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  GUESS   | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  GUESS   | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 5.0.1        | 6.2.0        |     
                      protobuf |  GUESS   | https://release-monitoring.org/project/03715 | 3.6.0        | 3.10.0-rc1   |     
                    protobuf-c |  GUESS   | https://release-monitoring.org/project/03716 | 1.3.0        | 1.3.2        |     
                proxychains-ng |  GUESS   | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  GUESS   | https://release-monitoring.org/project/03729 | 12.2         | 12.99.3      |     
                            pv |  GUESS   | https://release-monitoring.org/project/03736 | 1.6.0        | 1.6.6        | ORPH
                        python |  GUESS   | https://release-monitoring.org/project/13254 | 2.7.16       | 3.8.0        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4a1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a0      |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.10.0       | 0.15.0       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 18.2.0       | 19.1.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.8.1       | 19.9.2       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.6.0        | 2.7.0        |     
                    python-can |  GUESS   | https://release-monitoring.org/project/17873 | 3.3.1        | 3.3.2        |     
                python-cheroot |  GUESS   | https://release-monitoring.org/project/20163 | 5.10.0       | 6.5.8        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.4        | 2.2.5        |     
                    python-pam |  GUESS   | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                python-portend |  GUESS   | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
                python-tempora |  GUESS   | https://release-monitoring.org/project/21225 | 1.7          | 1.14.1       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40.dev1    |     
                          qpdf |  GUESS   | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.0        |     
                   qpid-proton |  GUESS   | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                           qwt |  GUESS   | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.0-rc.1   |     
                        ranger |  GUESS   | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                     refpolicy |  GUESS   | https://release-monitoring.org/project/15707 | 2.20190201   | 20081014     |     
                   restorecond |  GUESS   | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  GUESS   | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                     rng-tools |  GUESS   | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                           rpm |  GUESS   | https://release-monitoring.org/project/15204 | 4.14.2.1     | 4.15.0-rc1   |     
                       rrdtool |  GUESS   | https://release-monitoring.org/project/04214 | 1.7.0        | 1.7.2        | ORPH
                       rsyslog |  GUESS   | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1908.0     |     
                          ruby |  GUESS   | https://release-monitoring.org/project/04223 | 2.4.6        | 2.6.4        | ORPH
                          rust |  GUESS   | https://release-monitoring.org/project/07635 | 1.33.0       | 1.37.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.37.0       |     
                         rygel |  GUESS   | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                            s6 |  GUESS   | https://release-monitoring.org/project/05485 | 2.7.1.1      | 2.9.0.0      |     
                        s6-dns |  GUESS   | https://release-monitoring.org/project/16547 | 2.3.0.0      | 2.3.0.2      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 0.4.0.0      | 1.0.2.1      |     
                s6-linux-utils |  GUESS   | https://release-monitoring.org/project/16551 | 2.5.0.0      | 2.5.0.1      |     
                 s6-networking |  GUESS   | https://release-monitoring.org/project/16550 | 2.3.0.2      | 2.3.0.4      |     
             s6-portable-utils |  GUESS   | https://release-monitoring.org/project/16549 | 2.2.1.1      | 2.2.1.3      |     
                         s6-rc |  GUESS   | https://release-monitoring.org/project/16548 | 0.4.0.1      | 0.5.0.0      |     
                      safeclib |  GUESS   | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.8       | 4.11.0rc3    |     
                 sane-backends |  GUESS   | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  GUESS   | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  GUESS   | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        scrypt |  GUESS   | https://release-monitoring.org/project/21238 | 1.2.0        | 1.2.1        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                      sdl2_gfx |  DISTRO  | https://release-monitoring.org/project/04780 | 1.0.1        | 1.0.4        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/04781 | 2.0.3        | 2.0.5        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/04784 | 2.0.14       | 2.0.15       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  GUESS   | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.2.2        | 3.3.2        |     
                       skalibs |  GUESS   | https://release-monitoring.org/project/05486 | 2.6.4.0      | 2.8.1.0      |     
                         slang |  GUESS   | https://release-monitoring.org/project/04829 | 2.3.1a       | 2.3.2        | ORPH
                         smack |  GUESS   | https://release-monitoring.org/project/06120 | 1.3.1        | 4.3.4        |     
                 smartmontools |  GUESS   | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                      smcroute |  GUESS   | https://release-monitoring.org/project/17369 | 2.4.2        | 2.4.4        |     
                     smstools3 |  GUESS   | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  GUESS   | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  GUESS   | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  GUESS   | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  GUESS   | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  GUESS   | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.04      |     
                    strongswan |  GUESS   | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  GUESS   | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  GUESS   | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      suricata |  GUESS   | https://release-monitoring.org/project/10925 | 4.1.3        | 5.0.0-beta1  |     
                          swig |  GUESS   | https://release-monitoring.org/project/04919 | 3.0.12       | 4.0.1        | ORPH
                        sysdig |  GUESS   | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                     syslog-ng |  GUESS   | https://release-monitoring.org/project/04930 | 3.22.1       | 3.23.1       |     
                       sysstat |  GUESS   | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.6       | ORPH
                       systemd |  GUESS   | https://release-monitoring.org/project/05440 | 241          | 243          |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  GUESS   | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                         tclap |  GUESS   | https://release-monitoring.org/project/04942 | 1.2.1        | 1.2.2        |     
                        tcllib |  GUESS   | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                   terminology |  GUESS   | https://release-monitoring.org/project/04951 | 1.4.1        | 1.5.0        |     
                          tinc |  GUESS   | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  GUESS   | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  GUESS   | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  GUESS   | https://release-monitoring.org/project/04980 | 2.8          | 3.0          |     
                           tor |  GUESS   | https://release-monitoring.org/project/04991 | 0.4.0.5      | 0.4.1.5      |     
                    tpm2-abrmd |  GUESS   | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  GUESS   | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0-rc2      |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  GUESS   | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                      udftools |  GUESS   | https://release-monitoring.org/project/15774 | 2.0          | 2.1          |     
                       uhubctl |  GUESS   | https://release-monitoring.org/project/17364 | 2.0.0        | 2.1.0        |     
                         unrar |  GUESS   | https://release-monitoring.org/project/13306 | 5.6.4        | 5.8.1        | ORPH
                         unscd |  GUESS   | https://release-monitoring.org/project/07070 | 0.52         | 0.53         |     
                        upower |  GUESS   | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  GUESS   | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                      usbredir |  GUESS   | https://release-monitoring.org/project/16012 | 0.7.1        | 0.8.0        |     
                          vala |  GUESS   | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.2016     | ORPH
                        vnstat |  GUESS   | https://release-monitoring.org/project/07283 | 1.17         | 2.4          |     
                           vte |  GUESS   | https://release-monitoring.org/project/04674 | 0.48.3       | 3.3.7        | ORPH
                           waf |  GUESS   | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  GUESS   | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  GUESS   | https://release-monitoring.org/project/05355 | 2.24.4       | 2.25.92      |     
       webrtc-audio-processing |  GUESS   | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  GUESS   | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.1        |     
                     wireguard |  DISTRO  | https://release-monitoring.org/project/13481 | 0.0.20190702 | 0.0.20190905 | ORPH
                     wireshark |  GUESS   | https://release-monitoring.org/project/05137 | 3.0.2        | 3.1.0        | ORPH
                wpebackend-fdo |  GUESS   | https://release-monitoring.org/project/17547 | 1.2.2        | 1.3.1        |     
                     wpewebkit |  GUESS   | https://release-monitoring.org/project/17557 | 2.24.3       | 2.25.2       |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20150503.1 | 3.20160805.1 |     
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/05217 | 2.10.5       | 2.10.6       |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 0.28.2       | 0.29.0       |     
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/05239 | 1.9.0        | 1.9.1        |     
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/05229 | 1.0.15       | 1.0.16       |     
 xdriver_xf86-video-openchrome |  DISTRO  | https://release-monitoring.org/project/05230 | 0.5.0        | 0.6.0        |     
                      xfsprogs |  GUESS   | https://release-monitoring.org/project/05188 | 4.18.0       | 5.2.1        | ORPH
                        xinetd |  GUESS   | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.04         | ORPH
                xtables-addons |  GUESS   | https://release-monitoring.org/project/07736 | 2.12         | 3.4          | ORPH
                         xterm |  GUESS   | https://release-monitoring.org/project/05272 | 327          | 348          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  GUESS   | https://release-monitoring.org/project/17583 | 0.6.5        | 0.7.1        | ORPH
                            xz |  GUESS   | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  GUESS   | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           znc |  GUESS   | https://release-monitoring.org/project/05305 | 1.7.4        | 1.7.5-rc1    |     
                           zsh |  GUESS   | https://release-monitoring.org/project/05307 | 5.6.2        | 5.7.1        |     
                          zstd |  GUESS   | https://release-monitoring.org/project/12083 | 1.4.2        | 1.4.3        |     

-- 
http://autobuild.buildroot.net
