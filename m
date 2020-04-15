From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 06:29:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-14
Message-ID: <20200415062921.563DA86DB3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  5  |  0  | 19  |
  2019.11.x  | 23  |  7  |  0  | 30  |
  2020.02.x  | 32  |  9  |  0  | 41  |
    master   | 165 | 110 |  0  | 275 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libtirpc-1.2.5 | 11
            lua-flu-20181218-1 | 6 
                qt5base-5.14.2 | 6 
                coreutils-8.32 | 5 
              gnuradio-3.8.1.0 | 5 
              lsqlite3-0.9.5-1 | 5 
     python-argon2-cffi-19.2.0 | 5 
             lua-curl-0.3.11-1 | 4 
        luadbi-sqlite3-0.7.2-1 | 4 
        python-greenlet-0.4.15 | 4 
                       unknown | 4 
              gr-osmosdr-0.2.0 | 3 
                 haproxy-2.1.4 | 3 
                       iwd-1.6 | 3 
            luaossl-20190731-0 | 3 
                  luasec-0.9-1 | 3 
                  zeromq-4.3.2 | 3 
                     avahi-0.8 | 2 
                 gnutls-3.6.13 | 2 
                 libuwsc-3.3.5 | 2 
                 mesa3d-20.0.4 | 2 
          pkcs11-helper-1.25.1 | 2 
                    strace-5.6 | 2 
              bitcoin-0.19.0.1 | 1 
               collectd-5.11.0 | 1 
                grantlee-5.1.0 | 1 
      gst1-plugins-base-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
                  imlib2-1.5.1 | 1 
               libgtk2-2.24.32 | 1 
               libuhttpd-3.1.4 | 1 
               libupnpp-0.17.2 | 1 
                 lua-iconv-7-1 | 1 
              luaexpat-1.3.3-1 | 1 
        luasql-sqlite3-2.4.0-1 | 1 
               madplay-0.15.2b | 1 
              mbuffer-20191016 | 1 
                     mc-4.8.24 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
               mongodb-r4.0.12 | 1 
            python-cbor2-5.0.1 | 1 
         python-markdown-3.2.1 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f2d943377a50fbf79fc89cc192fb8ca38ab3af77 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/879c2554fd75f53c0ad06dae22a7442013f4cfda | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/441a264b648e80eddce83171156c125097264d81 |     
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/aafb8c72f147fefc7a988c45e4dc17de48b07a95 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/352ef4fba607cf4834c1c4a9bb98fc1bf8b08fbd | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ae267713a964921a47be66bb1445e7989173b207 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/aa6c3b7b9d8b11fb2bed1f54166750a342572a54 | ORPH
    i686     |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/68a94e681c313aa140dbbc0b3a503bdac587907f | ORPH
    arc      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/1872153f1c11a9097154a0dc0b5d361c8661b6c2 | ORPH
    arm      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/9baf7ee234a59c90a880bdd62430686d8e55ec63 |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/b7137961bc6118eef863d9b8a04827279e678d4b |     
    or1k     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/df0bc47b4a0cc9fa147dd36db85ee66e20cd9246 |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/b56537d12bc9939c92e049b140fe40562869f2d2 |     
   xtensa    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/dca22577ff69c20d3d636fad7b1a1eb2e46c2c91 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/3aa7c8869490774be427f978fae1d45f87c23bbe |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/238e663591962b1ea798024fb1fa40940556d84f |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/5e1fae534429701e60b35b8498ab47778934fa3d |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/aab19015936bd9cc005f245477e0bc0478099eee |     
 powerpc64   |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/efcd2615b5cc42065634f900123a7063c799e011 |     
   x86_64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/c82e5707d809ad477e53693ad6b82869f62032c8 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/585142c50922ccf7a3ede1e731435c67e99e60ce |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/3738b44f8e28d444cd30d42c2d8a833e7e7e3218 |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/2af59b77b92d343314046759de0d60677f0214ec |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/31894b88b38d3ee01d8d62f4db0845e1d2478bf7 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/be0b2338bbc61b0e710a002794fcedfd151bdad1 |     
    arm      |          imlib2-1.5.1          | NOK | http://autobuild.buildroot.net/results/dbf2fa330baa6e626b28c46c68de6410441fb61b |     
  mips64el   |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/0e5e771da43155b0592d73433beb0cde73f7cece |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/f53bbff27ec416fa6c36e569e7cce29d7e7a5481 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/9d0d2b50009c6e3985def25d74d9b02db5a7bda9 |     
    arm      |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/8a7dba7203f6c0516ca5f6f42d059ec6890d0114 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cab54bb0227f3ab2a29527324ffec2c608527557 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/7ea1539def459a5e0d0c24d4d10dfd1e099a6d5d |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/154a30c8627619e6a7ad2c80ddfbce6c6c2120b4 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/303aceaf670f8f637c8a1307d9a03bcb53f17fe5 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8277e70d7b8c04e391adca3c1ab6933ec044a50b |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2a39448e05d06df60bb5a77403b0d695374cf01e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e8a563e49186a60e1f7b8c23677a1009929e7351 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/990e38d77177d17db1a1d52fbeb33fbac046ca72 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/442d066b8366220c623a013f7d07a24c1ffd24b0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f29130b2a7bac6e9296aa2dac1708eb1d6124f2e |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d353eb178ff5b7f4dfbf355eade4cf83bb983b04 |     
   x86_64    |        libuhttpd-3.1.4         | NOK | http://autobuild.buildroot.net/results/99eb40f44435fdcaf265b647538c32b78211fbed |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f17a881eb4e40950b070931a09d0b2698504e4eb |     
    m68k     |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/033d6b289a8a94913254067005a3af1b96b779ab |     
    arm      |         libuwsc-3.3.5          | NOK | http://autobuild.buildroot.net/results/c894aa17a04b2cb3afefff56fbaed9bc58eb8b0f |     
    i586     |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/b957cfb0bb58db95d74ab51949b1ed33da096cd9 |     
   xtensa    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/f9da9a4c82b7849dd153aa6bb22639f7f9eace18 |     
   xtensa    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/523f79527f31c21c0534c8b7ca5b6df51954d369 |     
  aarch64    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/03028573b796c21672bd00f4f3e3283a9e648792 |     
  mips64el   |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/4c0ffe8a7914cc865da9a8370886e30aacdb5a3b |     
   x86_64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/eccd193d0857cdc20444db3972a6d61971b91601 |     
    m68k     |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/46a61ea3eddb2d827b6c14d59d8095e421d611a5 |     
  powerpc    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/244d8f9c3eb6f7a62bbe6002523f0d7b0da4ba0d |     
 aarch64_be  |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/3fddc15c053fd10fa581974a8acfe8daf1fd671f |     
   xtensa    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/33e9a7542b9a5a972e3c425871ba7d87d9552e54 |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/6d9bb3ed7fdde1ac29782bb759165e354ceb94e7 |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/4317cc0f6cf7cc116e93716e71be9ba5d9e47349 |     
    i586     |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/47bacd225a5bc14b92e0e621cc49da5e081b539b |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/d3168b0f25d6fbb5261b2d79d9f4202ed01f83b6 |     
  powerpc    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/c2cf964f6d38e6418da350c8d60710d51a62a4c2 |     
  sparc64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/207a155971272c5b2d8c6a43e5339c88415c2905 |     
  aarch64    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/592657d617c9b3d14c889953220a3674996a9c94 |     
   x86_64    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/cf3fa51bbc4e0d9f59519d2b265bff7698dc2375 |     
   x86_64    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/f512d13c98fe51be8facb765e72919dd81eefe40 |     
  riscv64    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/c965026b5ee5b296779da019d7f433b9f17d9514 |     
  riscv64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/bd571b3598a2c91fd009e231d5be2e6b4e5af545 |     
 powerpc64   |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/6cf1032c793ad49ce8f639f5eed7e851bcf80985 |     
  aarch64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/e2b99553781c82407e9e5a8f9f52282674f73720 |     
powerpc64le  |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/13065c11a814fb76cbfe7fb496cefee066c53c4e |     
powerpc64le  |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/c8f4d7149b7cb5ee9eba776412e58927b51d8012 |     
    mips     |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/8b9b13708f520b92e29213d473234ebd53680020 |     
    arm      |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/9acaec73da61557d6b13c5ee6446cdab07cfbf4a |     
  aarch64    |     luasql-sqlite3-2.4.0-1     | NOK | http://autobuild.buildroot.net/results/5045ff0ec29d68e42423c79d43cfa161b3d49137 |     
 powerpc64   |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/15a8c7f6e34b26446179c04383719ea71495403e | ORPH
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/1f6cdd46060c1ebc4911065d570b7d89828b556f |     
   x86_64    |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/417b074fcb79dda0f5482bfc9160b7df6f47daec |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/95affcbeb39978e7c0fb20c09555ffd1cc4fa0d4 |     
  mips64el   |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/61d969a1c1c7c849b8d26b4e5a0ce14c3a3fdddc |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/eb5258a29f751f15f8b0837b7d5aa8c45ad13347 |     
   xtensa    |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/88c5f0e48df70b8d28b7bf1af79380dfe22d4c2b |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/aee0ff498421ea255b07eefabfe332f2045918ab |     
    m68k     |      pkcs11-helper-1.25.1      | NOK | http://autobuild.buildroot.net/results/741eac09db5d1d2e9ade23e6692a36b254923e36 |     
   xtensa    |      pkcs11-helper-1.25.1      | NOK | http://autobuild.buildroot.net/results/3411074765312e67dab0f71876a254721911714f |     
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8a8b3c7b981456c43fa7e3a5606f56cc28a75cce |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5a94b881c4faee8f5206a611e9ef61f40572007a |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9e34f6c54bb5c25491a2449860663d60bae1105a |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/aa37b71a9b70251df1fcba1b77693d82deb20ea4 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/01c96ac9e17f00c95ba07b03eb25a75b464b47fb |     
    arm      |       python-cbor2-5.0.1       | NOK | http://autobuild.buildroot.net/results/c5a5ecc3099f842b0b6ed2667c4d0939d530b2ba |     
    or1k     |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/4161bfcd9577cdc6b9795fc3d6903f3bcc124f99 |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/4160cfd9f67bd6d72c095609e796356166a25cd8 |     
microblazeel |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/be709462bbab54e4f405302d54d157218f867939 |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/b0ca52e3948cbbc5bb8c6ce08932e355653b08d7 |     
    arc      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/800a6800ee3d4c40ce3cf8a81c977935274d26f4 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f85bae982da4fb49b34070ed4e989d8a1d963d1f |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/cd86412ef32ed12e932da9f99e73bfb62fb1cbe8 |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/e01a8f76f33bb25ca9e23b8c9140ba535a127ae7 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/93a87eac9404213417f7498d4b90185406d3e411 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c7d15c1de6b69a44de351fa81fbdcf6ff0a7c05b |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/64b82411b7067b9e0bd47cc225be3681bd9d3a43 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/9f87632121dfdd0b1ba0cfe01d4dbfd7a692a4e2 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/f93a2912f3bb6643eb19a4f7d3ef249e5dc736c7 |     
    m68k     |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/ffc81d3798379a9c34c7a708ebbdea27409f755d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/29ef2ce8dda36161ae60632521b625c2023ee4b3 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/21f1159b2fed2ad33d9c124b00391d4a324408a8 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/6d571f6f3a7e581276d4eaec55b7a0faefe0232e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/876613f379bfad979196d8e1b0913e4469fb0f27 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a5c0c2f6845c166500fef178a6fa95c66028d2e6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/f2be9bd5ae65e85220f9a9f3d0b824a30ac78278 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/55e62cf6b9a2d2b512cbafd81aa0e3788621adc7 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 2 
host-google-breakpad-7515ab... | 1 
             host-grpc-v1.16.1 | 1 
           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/9b20986a7ed28e3bc3913382d8339fbb37f76aea |     
   mipsel    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/6148fa49c0bd52b9eb3fb21741b8a995e9249c0d |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/18d5ccb535f4e6d89c8157c2f84d2a7ec96358aa |     
   x86_64    |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/bd875061d52c936815e4200d9b28eda983a14f46 |     
  riscv64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/8226918d46a2d665bd938b803909724cc26bb3f5 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

           libwebsockets-3.2.0 | 1 
                    mpv-0.29.1 | 1 
                oprofile-1.3.0 | 1 
                qt5base-5.12.5 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
               wireshark-3.0.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/c63156fe734ba2579c18115902a3b05703886fb4 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4cd7cb0ee8d32687960302e471dd4615de3aa7d2 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7cb7c2041da7953eb600ecd81c52b646bc450e6e |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/7b28e9b62112136aeea0ab7077dae8b0e4eee360 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5030389560c102073b2ebe19e8af07433afbfdc2 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/214bf4935ae01611d67f11c6852c5f8ff9e7f080 |     
  powerpc    |        wireshark-3.0.9         | NOK | http://autobuild.buildroot.net/results/4e93b16b6850e20758e2eac8ca8d866e66ba5db6 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 5 
               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/ac21fcfe214a80ca2fbabbbcce94ab9847518619 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/68c909eef7103e5c780417fabe39e17c9de533ec |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/51de9689fcdc0b0a79d002878f22bfe09ade6b75 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/db2baefd1fc42696fbe74a1b1093dd2f3f086973 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/8165b641c38ab6ccee1a8d7b028a8d906e2e8fb8 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ae95ad55a7fc436fb7eae45167fa410cd272277a |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ddc8297652f2f06e23739f7754d29c83a1dac6b8 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/10e5f90645b7a9eb3b1132248e8ab2f415b4e151 |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1d52359792bd4729e11278edace30eab00e3e4b1 |     



-- 
http://autobuild.buildroot.net
