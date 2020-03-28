From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 07:26:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-27
Message-ID: <20200328072703.5AC5687DE2@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.11.x  | 11  |  5  |  0  | 16  |
  2020.02.x  | 10  |  3  |  0  | 13  |
    master   | 109 | 57  |  0  | 166 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

psplash-fd33a9b3d68c89fa22f... | 7 
                  ffmpeg-4.2.2 | 5 
              host-grpc-1.25.0 | 4 
               libglib2-2.64.1 | 4 
                   libnss-3.51 | 4 
                  zeromq-4.3.2 | 3 
                coreutils-8.32 | 2 
                libtirpc-1.2.5 | 2 
               libupnpp-0.17.2 | 2 
                 opencv3-4.2.0 | 2 
                oprofile-1.3.0 | 2 
         python-markdown-3.2.1 | 2 
                       unknown | 2 
               domoticz-2020.1 | 1 
               erofs-utils-1.0 | 1 
                 granite-0.4.1 | 1 
                   gupnp-1.0.4 | 1 
           host-nodejs-12.16.1 | 1 
              host-systemd-245 | 1 
              libeXosip2-5.1.1 | 1 
                   libiio-0.19 | 1 
               log4cplus-2.0.5 | 1 
                  matchbox-1.2 | 1 
                openblas-0.3.8 | 1 
                qt5base-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 
               wireshark-3.2.2 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/303c1f44eeee91120887007e61b85de9ffd0f377 | ORPH
   sparc     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e9e872ff04153ca60cf1588f3f01b534c1fcdbe8 | ORPH
  riscv32    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/8fbf7ab37c7c9fb2a3d167da471b09423b03c3d8 |     
   x86_64    |        erofs-utils-1.0         | NOK | http://autobuild.buildroot.net/results/b4ad98806b6c990a9cb2a4676359abc0557ac254 |     
 powerpc64   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/123326bf1812555ebde45b6b39c0268436c465f1 |     
    arc      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/9ffefa493dfd317594abb9b70c706e98c2277f04 |     
  aarch64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/b868f661bf0927087d902981b8709a462cdc25eb |     
microblazeel |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/6c02517d91c4ea54c6197b24f3dd2460d89d4f05 |     
   mipsel    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/1f7c5f0d9cb08190e8f1a274b88aa87e4ccbcc0f |     
    or1k     |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/775f05f2b9ab495a318c5ebf2c260ffc768c57c5 | ORPH
  aarch64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/06f879902a567c26bade630091b21b56f637bd60 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7fc6895475c0c0493d6734adc248d2f15360c4ce |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/99c08f122a6993ede4e61964aaf95d9f3afc5b25 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7dd2292f9cd2179969afe190fd890089a752c3ea |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/89bb42f95bced3a579e3822132c6a21afab11858 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/fa421140de51b742621c73debd761d241036dd55 |     
 powerpc64   |        host-systemd-245        | NOK | http://autobuild.buildroot.net/results/5101cf501910a9c0278fc0cfed118e5d7cf8e435 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/9e38dbf4542be198b94e9d4be96e984a91320eb4 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/972723bdc24ccbde93b768d25273bfa8164f30ae |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/9ccc03afce23c1b95f87993fd9a7cf71c7ba3243 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7c90229f9dd4bab4e010fbbf92bf17683410b152 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f1176cf60e51ff8df96be90c5aa46f6db0c2cf2e |     
  powerpc    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/3092e31694e8ced23e1231cdfa8442f44fb56a83 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/c29f3053d26f4f03042e5fb5eee6aa36f8126dbc |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/9712ef8ae27241fc54e86fcfd27b0d5639512d38 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/09de2376edd97e6fbe8463b873168dc498fe4b77 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/7bbd14c4aaaed358b8b75adbe4bd1f26574d952a |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4e8593d8c73b206fd613e4ac4d7055f318384fe4 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/669dc2fd55f111eb932cd47c212c220c5c316166 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/c490b2d21368d599837b5219cf52306cf8596841 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f02ab48024cec96ce6273d4b4dadf74b6ecf3967 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/3d1cb0d0e8d4c9a4c30380aebdd1ed72fcd19243 |     
   sparc     |          matchbox-1.2          | NOK | http://autobuild.buildroot.net/results/a86f91f4b7359f2c506bf97293a061a7fc3fd412 |     
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/9d2c6ded8611c31ed63e960d1894524db233cc17 | ORPH
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/4352e301a1150455b712ca88f838929d7ac1f81d |     
    arm      |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/b039ab45f998896e5f388e7f71d6a8d336153a01 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/709d06406f3548a1fba953ed61549e123f1630bd |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/2204f98588fd80151eaaec129d30117c55ca384e |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/46d0dc9745b28c42eaf95804d4849fd1a2ee13fd |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/99b7b94dc0cfbd443ae79d58e5883f97de2e7e46 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1d5eb17f49984bcc9ec77d659801298c6fac329a |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/59213f5fcb96a146a3686c4c3dc07775dd93925b |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a4cc2edeafd1af6f082f30be93d1776036dec6a2 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/adf3a9cc6d0db3a62bcdeafb8b86cf7822844747 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d751e9e5ce14db06e1eed1c8a2acaef118432850 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/d784a9212b31f7d4647f56b9e29440c5048cad64 |     
   sparc     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/9dd76ac70e7582b73fa0dd05186c3465124b0b05 |     
    arm      |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/70866a33ffaf0a1915c161871759b3d25c0c9479 |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/8202bd6840d5135eae440c4073f4330f67098ba9 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/f1a7479dbd146a7fcfca8414f7379aab1b1d4b6f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cfe16bd1f75f63b9291aff0f443034baf8958b4a |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cf93dc8bcc843fae455575c8d6aa3c2db351a5d |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/5330207332b5cb4ef31f40061290b4ef20ba480d | ORPH
   xtensa    |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/6af7f088e22cbdafa2e8802c1d08f80dbd2a5fbc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b333f8d5a1c7b5bee3efcb6094117d3342d9077f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/56403371a21296877fa2e730002b52e0e2777386 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/702e7461ca6f0f21bea1280736b2a05d32e5dd56 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/b64b4fa4457110141da813e3dcca974b91139ef9 |     
   x86_64    |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/0309c0867462d2798e0c0fa9330fa4bb869b24cb |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

google-breakpad-7515ab13768... | 1 
              host-grpc-1.23.0 | 1 
                 host-icu-64-2 | 1 
       python-matplotlib-3.0.3 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/30bdf1505cb9c5c1311c6a4a326287b4fa4b6dd0 |     
  powerpc    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6329e378e9f79949f82217bce69e776a0a373ab1 |     
  mips64el   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/73359dec1d4d37797311281217cdb40885843525 | ORPH
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/edb99e2e5647b3fda7faf0e6cd27c790899afc44 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/8d909697e26d257926301b0f9d68adabf94e991f | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cairo-1.16.0 | 1 
            ibrdtn-tools-1.0.1 | 1 
               libglib2-2.62.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/6658b50cf6d50fd36a836d1f3cc640c2405bc60c |     
    m68k     |       ibrdtn-tools-1.0.1       | NOK | http://autobuild.buildroot.net/results/a708390a34b5d02c394f23b8c0ab175882b79352 | ORPH
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c3eef595e10d6ec8588acf2029686cb3e6611dd3 |     



-- 
http://autobuild.buildroot.net
