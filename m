From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Apr 2020 06:26:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-15
Message-ID: <20200416062609.2B7BF86203@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  5  |  0  | 28  |
  2019.11.x  | 37  | 13  |  0  | 50  |
  2020.02.x  | 33  |  3  |  0  | 36  |
    master   | 171 | 151 |  0  | 322 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libtirpc-1.2.5 | 10
              lsqlite3-0.9.5-1 | 7 
            lua-flu-20181218-1 | 7 
                 lua-iconv-7-1 | 7 
     python-argon2-cffi-19.2.0 | 7 
                 mesa3d-20.0.4 | 6 
              gnuradio-3.8.1.0 | 5 
             lua-curl-0.3.11-1 | 5 
        luadbi-sqlite3-0.7.2-1 | 5 
              luaexpat-1.3.3-1 | 5 
                     mc-4.8.24 | 5 
         python-markdown-3.2.1 | 5 
                       unknown | 5 
                  assimp-5.0.1 | 4 
                       iwd-1.6 | 4 
          pkcs11-helper-1.25.1 | 3 
        python-greenlet-0.4.15 | 3 
                     avahi-0.8 | 2 
                    brltty-6.1 | 2 
                 gnutls-3.6.13 | 2 
              gr-osmosdr-0.2.0 | 2 
       gst1-plugins-bad-1.16.2 | 2 
           host-nodejs-12.16.1 | 2 
             kismet-2016-07-R1 | 2 
               libdvdnav-6.1.0 | 2 
            luaossl-20190731-0 | 2 
        luasql-sqlite3-2.4.0-1 | 2 
                minidlna-1.2.1 | 2 
                qt5base-5.14.2 | 2 
                  rygel-0.38.3 | 2 
                  zeromq-4.3.2 | 2 
               bctoolbox-4.3.1 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
                 bitstream-1.5 | 1 
               collectd-5.11.0 | 1 
                coreutils-8.32 | 1 
                 dmalloc-5.5.2 | 1 
                    gcr-3.34.0 | 1 
                 haproxy-2.1.4 | 1 
             host-cmake-3.15.5 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
                  imlib2-1.5.1 | 1 
                 jbig2dec-0.16 | 1 
               libuhttpd-3.1.4 | 1 
               log4cplus-2.0.5 | 1 
                  luasec-0.9-1 | 1 
               madplay-0.15.2b | 1 
              mbuffer-20191016 | 1 
                    mpv-0.29.1 | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                 openal-1.19.1 | 1 
                openblas-0.3.9 | 1 
                     php-7.4.4 | 1 
                pipewire-0.2.7 | 1 
            python-cbor2-5.0.1 | 1 
              python-pyqt5-5.7 | 1 
                 rocksdb-6.6.4 | 1 
                suricata-4.1.5 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/4e62f2fb45daea297de1a3fb430a698c7836b975 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/77ac0c885398effd16ec5d1048d534c3062b2bf2 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/fde5f81ae25165a597c97bfeca5fa98378d50606 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7e3b65853ead408e3f0758e4d3ee3c83fabb773a |     
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7705435b125f78d619c12cbd3263b8b7e5f49346 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/cb6d2898bd67f6ac8222cd45ef99d17976dee022 | ORPH
    arm      |        bctoolbox-4.3.1         | NOK | http://autobuild.buildroot.net/results/e209596a3a1db7a0e0ef319990436838166616cc | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/67fdc0d5d01ce23250471205a866cdb4db63800b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/50acac81779eb1235f7937f7eb084ff30d23fe36 |     
    arm      |         bitstream-1.5          | NOK | http://autobuild.buildroot.net/results/bd05ac606f9a54908fa3cf6cdb5c075935c5f920 |     
    m68k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/0b6963015a32b2ed9e5eb1d4774f1659e876ba77 |     
  riscv32    |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/446ffaaea4c2514d19bf2c9d99260c0d617b8038 |     
   x86_64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/cb886276a6a66a643f10e90d6dd1b5fdb357ec78 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/4a309ad1f6cce98418e41259e0e3010f3ae51fdf | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/63103638e0d0de2dca102aa653ea641985b40fa4 | ORPH
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/ea4a8094a809cd57d625d7feccaa7d63cf4edc61 | ORPH
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8e73b77f336ec736565e8bcdeb6dc7fbe039c93f |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/e3dc606d3898b6822d011b7ded221f2860370a15 |     
  sparc64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/084afff79dffa5e33096669be12f01484e0f4015 |     
    i586     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/8d3ac95275fb6f815a31d8887b41ce3f5859d602 |     
   sparc     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/f96820fdbad9f9a88e56da303bce9ac41cae54ab |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6421f95d3be714eb532656e4a3203b10e9ab2a4e |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1da1f6f85564e924960a571b4ec08a0d06059977 |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/4bf7854743457bc4a6d0855de413af496cc6f846 |     
    sh4      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/414b5380fa5c1a623b22af1dfef31d1b48a2c2d7 |     
  aarch64    |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/b4cd85be050b28895741c4539090b6444b88da0b |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/4729373cc86b23bc4d2c78ab5a5848f4321cbfd3 |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/ec1c6d939dc00e10b8ae22ce95072e444b15bd85 |     
    arc      |       host-cmake-3.15.5        | NOK | http://autobuild.buildroot.net/results/0d23b5a3e71e00bbae7976cb72e0f82f2aa7bb2e |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0bd98c3ad92f8f30e457f2f5666cd6468906816d |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/0b0b2b73d078537598178a491e8a3dbe30c44fe9 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/55a9aa09516c144e0b1c73eea60f2f083613a8da |     
   xtensa    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/18660c97a2b8c0e5dda34cf74f0e49fd02f3629d | ORPH
    i686     |          imlib2-1.5.1          | NOK | http://autobuild.buildroot.net/results/b62d0614ed113b0a27a82850602957d6fc823ef8 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/4ea48fece40d460b649bfac1cb0fc2f10c4f66cc |     
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/cbac72781f1662c532cdfc9eff211932fa628b4e |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/04c50048853150d5a17a96eebcf2fcfe9eca0065 |     
  mips64el   |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/d0eeb2162d72f3636165c063a639d374320e596b |     
   mipsel    |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/483b835b1206f0da04cff582ff4ba6a353a9e1d7 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/eb7670efcf136b07f4aa5ba1ad3ab85f2bbb1fba | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/09621158c80acc9b8900cd79cbf32f7891fd5699 | ORPH
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/f69c5f3ee89e8539ec5109e612156f559a3fb59a |     
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/4340552926ce6f9b7b6e284ed4f7fc81a23e444a |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/89b77f153137b8b049dfe9517bc442bb4bcf9a81 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/46bbf12bba3804e7b1176d50801a35692dcd5a96 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c6ceae63f4cbe3a704abfc1516033ec92d64cbd0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/eb24b828d7699c39c40b957ced61007c7d8fae72 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d1aff2c4c92a2557731f48018e527b4b18880999 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/47eb79d490d2c05ba8994d75efe6908c56ec1467 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/eb32024494b19ac856a2bb68275f5a929ba3384e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e829f04e06ef3c2abbf8c10b0f6fec00e8e4159e |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ddf2d63e3592afd09c2a064e401a08aec9586370 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/de2219b25bd614a324e6e97261d95e2e0b56f6e4 |     
    arc      |        libuhttpd-3.1.4         | NOK | http://autobuild.buildroot.net/results/8914c82f554df167b0fe1330ebc78311016aa3de |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/285a3e103aeb2551c569c8edc93b0c555d3756e3 |     
 powerpc64   |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/2d1d82586499eb4dbffc13a33a61ecc39b9293ee |     
   xtensa    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/4bb2d69e6a017beec593b5783053e4876f88a1f2 |     
    i586     |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/446d71cf91a9da701a38c1d70a981b3a3cacf4b9 |     
  powerpc    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/d7e544b45b18249db9ebf66c74e67efb1aa9f1eb |     
microblazeel |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/6da9f4ecd5b56fe0e837a72313ce85616cd93e6a |     
  riscv64    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/966b8541443d66bc93be68d49aa71bedf4dbd0af |     
  powerpc    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/c24cef1c73137bc7b58c25e612ab6380fe20c23f |     
  mips64el   |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/5bb8bc490734d039efe6854c11522521595787e9 |     
  aarch64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/0278389d6704aaba9a3506f04028d05d7a9d74de |     
    arc      |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/3620356cdcccb2fd95219d85996a73f90bda604d |     
    arm      |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/9d8b4f37f3857fabf3bcd6ea63379c862c07b1c0 |     
  riscv32    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/676c31b3c55304c4db64d70984c9b51131cb9803 |     
   x86_64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/3fb876e985da0168825b4e13859d81338139d6be |     
   mipsel    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/175c79762e6b6afae94261f0819e320005cbe1c7 |     
    i586     |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/dc5c93d7e7e79cda28fc424b41461bf7826aec64 |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/cd42aedd64efdd8f6e6689f67004a66a40da79e1 |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/3951a5e29a0d2535367d8ab75ad7cb1589811352 |     
    m68k     |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/d44d545f7a18c49c30d497c70e1e018c9b23d82f |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/2d80a97652bd024dc07b8550127d56784b5df57e |     
microblazeel |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/89d41f7e1a4e6b8b83e80fdfab96df77a7d899d0 |     
  aarch64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/99ea08f61302b841d87942d00bbcbf4bccfec4c9 |     
    arc      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/042e811dd2690a7f9c414f68e86ab55a52012942 |     
  riscv64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/6ecbc0f87accbb0283b1ac70ce68dd0fbae6f76f |     
    arm      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/77f26146ccde743648e02180d71a30b1aee07dad |     
  aarch64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/9bfc7d6b9b05985dda6b3585a7cbf9a05b8ddf71 |     
    i686     |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/401c9a15cb4da566f8e1cdae0fac65045b30ea92 |     
    arm      |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/1abdbada764ff72c26c8d33d832ab92c442f44b4 |     
   xtensa    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/8ad11ce9b1f7bb4759fb88588a9a4183fed5b152 |     
    arm      |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/f5fc1e5c1fe0837a301d0fbe57180db3b7c42d7c |     
  sparc64    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/2f082b9ef81c9fdb1e15cd1feef2e8317f7153ae |     
    arc      |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/9c92e34ef4032ce5034fa4134780f48c82dd59ae |     
   x86_64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/d83d283f58be933f18f63b52dba7da350575600a |     
    arc      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/9a77b36edb5b684cd815007575d02b3a9dbb8090 |     
   xtensa    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/32273a5d4085fdae7bed667e19754fd925558dad |     
  mips64el   |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/ca02770e77ebb853f554f0c66fc566e651e0160f |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/f8ac9f05ab7d698185f971c41e533ce10c9847fb |     
    arm      |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/3051a464b790dff2e7b61099f51a0ab1e1a29349 |     
   xtensa    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/1f0208f727ff311cec2d8745200c80f7ab02f536 |     
  powerpc    |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/3192d5c92a53e0770c4db283d406869832cf518f |     
  aarch64    |     luasql-sqlite3-2.4.0-1     | NOK | http://autobuild.buildroot.net/results/7939f11bce0bffd9becca7a7f5c0f5bc43fe5abe |     
    arm      |     luasql-sqlite3-2.4.0-1     | NOK | http://autobuild.buildroot.net/results/4bd155a8a5704e0f07db2b3bce62e6df423442dc |     
 aarch64_be  |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/719c9f4c908714449c66162a13e072debd4f951b | ORPH
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/7001408078b5b3628e1c9c47f240d2fff59756e9 |     
powerpc64le  |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/aa7c01691227445a81685184546ed3ceba29c11b |     
    arc      |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/3b9eafe0c4937839ade1b1a9d680eafcd1fc5879 |     
   mipsel    |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/14645d872d997b0d6b8f4b3a2cf063329c4ada28 |     
    arc      |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/b96486e2af3a7922555a77f73c55fc53681a1606 |     
    arm      |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/0f1b93064314709e7eeb1653c9ce268cd1fd63ca |     
   x86_64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/74ad7c54cebe9e8c8af8fbb457cee243dcc86dc9 |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/f9c34d186f584f7b49ea1a674e301dc035a51ce0 |     
    i686     |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/2d629e0e128f3d80d7819f93222b0739a011bde8 |     
  powerpc    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/a80b05206845023f24778849468987b79ca1649e |     
  powerpc    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/51be107308f10ad56c5ac0062b017b43609ea394 |     
powerpc64le  |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/bc00efbe881522063238750cad3cad6bd0a88710 |     
 powerpc64   |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/8addc0a19a097bd381ba0c68b0b5ddfbea5d2a5f |     
   x86_64    |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/410ae08ca22282f04ccb2d89475e3fd38797a2e0 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/04c4207af114a0a7689800467d199df933d109c7 |     
    arm      | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/60c496f7efc393e6d592795edc510ab52ba2dc5a |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a91dd23e2cd8262d3c85499c79b28cff429701ad |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/828b51b42422dc7af46050ac000302c84b75c363 | ORPH
   mipsel    |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/903823386b8729312c179156cc33038ce603a481 |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/d5c45fb0d07cf3953c363f8832d88d74d4650139 |     
   xtensa    |      pkcs11-helper-1.25.1      | NOK | http://autobuild.buildroot.net/results/88f8d8d6c25b7dc0b3665c120f94fb779b53e9f1 |     
    arm      |      pkcs11-helper-1.25.1      | NOK | http://autobuild.buildroot.net/results/bf33d52a50633666537cad319695ead9611227b0 |     
    m68k     |      pkcs11-helper-1.25.1      | NOK | http://autobuild.buildroot.net/results/2be342a45a13a157c46bbf99dd9b92bf7fa17820 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a1b8d8c05412ae80b05a80549d6c83fcedcfbdbf |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/dd6fed9066c099549b6c91b74b7eda0d1c432d68 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/1f05ff9a1f4d8e9ccedfec4986e7e4a02974a92d |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3c41acfd9c1bcc47b6bc60807bd2429632445a31 |     
   nios2     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/cd9c163ce381f9302d90cab024e39ff9bffd47ae |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/69bfe931531ffa9ca35b13861798a260b25ecc31 |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/b8c94f3c7cb1c9d3d727548ab33c3e3197935e34 |     
    m68k     |       python-cbor2-5.0.1       | NOK | http://autobuild.buildroot.net/results/3dd92cdcc8db8621074d974f076177e4e4a69167 |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/b6112cdf6089c83ffef97925de367c40d5075b5c |     
microblazeel |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/365cbd66bb8b3cfadce5aea1650edfb2798ab267 |     
microblazeel |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/d9668c7a68fd2622d8122d6221b69580fdc40b4c |     
powerpc64le  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/a4a56be35b456d5f80e5ce1d88e073377782c541 |     
powerpc64le  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/b6124cc568262e7f121d87cceb4cd7df46314d2e |     
  riscv32    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/ee24f173adede1d68af05a67f3f2cef007ed3313 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/fecc5d4bbf10e5ee4722a7bf8a110c39ac4ca5a6 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/ee6e9f46c4efd24532c290de10b84dc3872cdd58 |     
  sparc64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f8d7a8140a9f53fef931a9930773e594ad0c6f47 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/112a5bb751d3801bd1b53cda0f56ac03ac0aad94 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4d381eeb3f2ab97232eb773368ac48d8ad4d45d3 |     
  sparc64    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/3810c58210a4a463d06476e9d18f55920d5de70d |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/f061e66abdb335498166174f39c5bf6214bc2716 |     
   mipsel    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/2f97f18ff350b47ce8e00ecf4956be67d1c81279 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/4e9fb5da7b32245447e73490a25b1a37d910ffe0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/df03bf5d90a03050a1efc3ff9a28d9df44633861 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a3858c83019e73ad0e9720a7f03a13fc49801a6 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/de393629854d0a43f3f97e70dbad764ec8a2e27b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/fd0f3e7b0b9f57bfc282b9745408bb1190faf8d2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/736a99dcaa72fba3f06775d08c4395f506fce944 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/93882337e46248e4de3baeb75a03012e8f6457bb | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fd8a2d89b590dc85cc9ed30b464ed230eea0a42c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/6f8b1beca28dda9c2add978a7aee3028ebee0370 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                classpath-0.99 | 1 
             gstreamer1-1.14.4 | 1 
             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/6677f22832c3b889e87f949d4da3905b4bc67d78 |     
   nios2     |       gstreamer1-1.14.4        | NOK | http://autobuild.buildroot.net/results/449cd843cad0c2357b5085cabff070ed61e79cdb |     
    arc      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/e9dfa53bf825ffbb33ea11a2b76edfc22e93bbb3 |     
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/ae7fcc3d2ec28b2538334262bfe0b88665f2def7 |     
    mips     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/e4e73b5e2edf290127219a3aecc6688857fdf43c |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 4 
host-google-breakpad-7515ab... | 2 
                  gmpc-11.8.16 | 1 
              host-grpc-1.23.0 | 1 
                 host-icu-64-2 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.12.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/796e823f05c03053d4535552936362a89f72905f |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/99c8ed1788a9f0fd32eb99c3473eb93fe7a39ad1 |     
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/cf778d888c448f3f1dade3e02c6b9e9e20cd5dac |     
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/727b6b7c12343338c648479d6b87b796b5b3b7c1 |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/217396d7afe321b07b73a67a7b322f613cd092ee | ORPH
   mipsel    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/36c1e237085b0f13b8e352293cc9ec51a1096ddd |     
    i686     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/693315f17475c2f40ef490ab8c2487b68ed1704b |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/ffd58e0ece109f2b029710fe1c5d4426969ae956 |     
  mips64el   |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/f2ea489ddb7a11486551dc644f8144d375b93a67 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/34785bf18d20ca0f422e30f47882ae236bba2e18 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/74dffd06ed588570f87e416bcd87852ec5cbae39 | ORPH
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/5f675b32fe9d6236b32149411134913dae102b1e |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3f71d42cb06f8b01f866da9ff4e70481fcdad880 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boinc-7.16.3 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.12.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/8263ccc1b62086234b5aba503fe9f27b959e73c2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e88740a1e426dd40ca399c29cbededb680c64cf6 | ORPH
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/7af962df215099020a3c7c8cdc4a044dbd604d4d |     



-- 
http://autobuild.buildroot.net
