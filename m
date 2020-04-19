From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 06:26:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-18
Message-ID: <20200419062638.A1A8920346@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  3  |  0  | 16  |
  2019.11.x  | 20  | 11  |  0  | 31  |
  2020.02.x  | 18  | 12  |  0  | 30  |
    master   | 128 | 71  |  0  | 199 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            lua-flu-20181218-1 | 7 
              lsqlite3-0.9.5-1 | 6 
    python-dataproperty-0.48.1 | 5 
            luaossl-20190731-0 | 4 
                       unknown | 4 
     python-argon2-cffi-19.2.0 | 3 
                qt5base-5.14.2 | 3 
                  assimp-5.0.1 | 2 
                     avahi-0.8 | 2 
                cracklib-2.9.7 | 2 
                 gnutls-3.6.13 | 2 
              host-grpc-1.25.0 | 2 
                libselinux-3.0 | 2 
               libupnpp-0.17.2 | 2 
                 lua-iconv-7-1 | 2 
              luaexpat-1.3.3-1 | 2 
                 openal-1.19.1 | 2 
        python-greenlet-0.4.15 | 2 
                    brltty-6.1 | 1 
              ejabberd-19.09.1 | 1 
                    gcr-3.34.0 | 1 
                 haproxy-2.1.4 | 1 
                 jbig2dec-0.16 | 1 
              libsecret-0.20.1 | 1 
             lirc-tools-0.10.1 | 1 
             lua-curl-0.3.11-1 | 1 
        luadbi-sqlite3-0.7.2-1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
               nfs-utils-2.4.3 | 1 
                 openssh-8.2p1 | 1 
          python-enum34-1.1.10 | 1 
               qt5webkit-5.9.1 | 1 
                   vlc-3.0.9.2 | 1 
              wsapi-fcgi-1.7-1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/6eb19d019480eb82a3291400704990745dd7c684 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/74e45df0aa4a9811d77adb6f77fc02b8013a7120 |     
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/78196e7bf15c64d40affdc40e84e179d296a5f28 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/66d27a8cbc6a9bef804a297396a4c05819ba59b9 | ORPH
powerpc64le  |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/1a84c4178c609c7eb45b681d471b0533cb502156 |     
    arm      |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/638f2e67b20d99994f1ccc08a9ecc32a2e3c3a40 |     
    m68k     |         cracklib-2.9.7         | NOK | http://autobuild.buildroot.net/results/4700ada7cee058d6b5cbbc39af511c5e250f42b8 |     
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/e09e91e1d9258f0abe4a8f89fc4e0af00e1c647f |     
  aarch64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/bc901026d177af93a9409d1f0d52a1ff25d33190 | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1d615b9cc7b3bff2f17863572714fa632002fbb5 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/254a948bfefa7dd3cabc337b3b657285822569d4 |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/1bdbd7235eaeeafcd393c3de128c79382a789b9a |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1c3d00e9936a81058ac3062777340b067fa4d3bc |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/35c3b0ed97259d06b71643879f9c8b94ee06f756 |     
powerpc64le  |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/71765eb976a4d40e377b3bcca094b13927f00bd8 |     
  riscv32    |        libsecret-0.20.1        | NOK | http://autobuild.buildroot.net/results/29033d3cb0c3237524330f8dbf4ac33fef4455ad | ORPH
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/0c9a1351a0d3ce3a8dbe49fe3751f02bab2832aa |     
    arm      |         libselinux-3.0         | NOK | http://autobuild.buildroot.net/results/59936a6fa7a773956b3fc84a867f3264737f78e7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e42803dc80fc1af18baa4631e7c9ce46c4187c76 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d47a0f7add2eb3fcf87138462e34c8eb2008af77 |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/dffb16abfb21413fb08b081b1be94f94d445bf2a |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/18a92db4ff074d49549c8561d058bd1ceb3acadb |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/641ce671ce22e802850f1a5bbc96839e0b9f0c9e |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/da9fa4dcd67cd9c3d1d8577fc648a65e7f34f6d7 |     
    arc      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/79cb9bb71f43a82ceba406e81587fd1f6866e42b |     
 aarch64_be  |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/7b18dab5e82e05ea94dcbc8723503ce8400e9c33 |     
  mips64el   |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/69e0a70b62ef60f0dbf0eee937c728f8cf728d50 |     
   x86_64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/82d6dbcaee6f684c6d7194b26a75c16eafb6bbdd |     
  mips64el   |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/898278c13ea2e0ebbd76e63210a50540906b8600 |     
  powerpc    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/c5b262f798deb1397be3e627e04545607e97bb8e |     
  mips64el   |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/a53cbafe02fb246563c6344e9a6b99381eb21f18 |     
  riscv64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/6cf270eafacd9dbcd1a953118fc12e0b7136e66c |     
    arm      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/feb5c5a81070c9faa4e4ab141e7346c7f0eccd4e |     
 aarch64_be  |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/379c30c91b9738448c622758f4d5baff25ed7fd2 |     
    arc      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/a93642572bd9ead94b74e79c1700cc59bec624c3 |     
  riscv64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/e8f64b2de0c5b2333ebf76135d009da3234f8fd6 |     
 aarch64_be  |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/072c657697fe63cb6b42c0d269164c543748c3c7 |     
   xtensa    |     luadbi-sqlite3-0.7.2-1     | NOK | http://autobuild.buildroot.net/results/3ef401ab10788e55fc6e9c4c1921b15f8eaa550f |     
    arc      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/29322497a0ea7079a03cec7a7843fb32e1b8411b |     
   x86_64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/6e7fc397917e8935f04393ce990e84751feac926 |     
   sparc     |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/d2c9412e1eb4dd8325c0b9c7d9d941d1c5a2e921 |     
  aarch64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/300ae0162cdeb51b8a9ce7abd4412419908e4870 |     
   x86_64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/4f4c61ddbf9fed486af249bba1e74a342b32743c |     
    arm      |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/074fb216729fff372252eb8c74d4459a27cef05e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e57189778eb7442cf8531ae58bacf9b847044557 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f90b4d96a22f6989f46f707a922feac837334e38 |     
    arm      |        nfs-utils-2.4.3         | NOK | http://autobuild.buildroot.net/results/1399e38c49967b44fb797e0353028283427db236 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/3d6cb38a5ae64765fb10ecc273771d3ffce1c317 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/eb55494c31c13dc3e7dcf904c453bbb1c2e515c8 |     
  nds32le    |         openssh-8.2p1          | NOK | http://autobuild.buildroot.net/results/44bfd25fb779d4b36b5190e45e32c888fec06783 | ORPH
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3b90821ddddee0beeab345248f319ab9be7e848d |     
    mips     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/bcf26cc323dd474ecc2ca1507c77ade6e17b8804 |     
    mips     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/9bb0318eac821d167dc6d2678bec2fd646b21137 |     
   x86_64    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/a4b054af27ebb6dfd64256dbce0fe668aa384f80 |     
    arm      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/4a2581d80e6b7a68877bf559fe5e3a551e798606 |     
  powerpc    |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/ea5cd30233751055c6bd2e3cbd32354bafa0f6ec |     
  mips64el   |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/b47c5e03a2412a052eeda81d797b059e6cb16e7f |     
    sh4      |   python-dataproperty-0.48.1   | NOK | http://autobuild.buildroot.net/results/598730d347b997ca17cbc2750c55d093dd1c9e6a |     
  mips64el   |      python-enum34-1.1.10      | NOK | http://autobuild.buildroot.net/results/740d4b605027a161497cd36505589c5c61296065 |     
microblazeel |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/d1d3a51a400b6669262d01b6be4b304c462ca52e |     
microblazeel |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/99878044c778e88c29e60307e88139c97f1a6a9c |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/437e13ca867c4fcace1c15c47a89f8fb596bd860 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0316f5f7bb7415c0ae155171fd85176be651194d |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1bdb73e834eb2aeb5e54f25fc1d280f4b4aa5f91 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/0beffdb0311354f9877e5d08378a2d10e4277439 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/7673440daa05b5c1f38d9a11398655848209f9f4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/63cd7719eccdb1d2d0faaf1849347a504e983604 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/53b102136b0ba241a3321c39114854684b208ac1 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/87d0386cb7b7732046cf7bba9175cf7cb5f44daf |     
   nios2     |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/9238461ddea0ad713090d12d9055c5f10b99926f |     
   mipsel    |        wsapi-fcgi-1.7-1        | NOK | http://autobuild.buildroot.net/results/12046164aa55b38a576ee3a65957eec99380345c |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                gerbera-v1.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         gerbera-v1.3.0         | NOK | http://autobuild.buildroot.net/results/29018f5a68c57b447aa2fc1f3b2b32e9e740e024 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/a7519fb4634174b0e5b4ef3b64e90a35d4b05288 |     
  mips64el   |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/9f0f7941185292c7473761e6fc5875b674e8462f |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                classpath-0.99 | 3 
                nodejs-12.16.1 | 3 
                  boost-1.71.0 | 1 
host-google-breakpad-7515ab... | 1 
                  monkey-1.6.9 | 1 
                snort-2.9.14.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/bb9d97d8ed305e8063cdb6e4b5a80c36a44d0643 |     
powerpc64le  |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/561da4e65621858e05f053e0eebf7325ba858bbb |     
    i686     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/3f0f6200472788e4e7715083fa0028c8ff314b79 |     
    i586     |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/58ece4e265b7ab2d930377c3bfa52ddb35c8bd6c |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/cae63a5f76b178fb49d0185d66cc8ebcb1e1a6fb |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/075917ec320d4898b71f0fa9e8c6f08ddff89520 | ORPH
    i686     |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/acc150c704a29872cc117c62d7c02e5929a0bc28 |     
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/8706931f4d130d780f7114c7ef8ba70326f7429f |     
   x86_64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/29f6e7e583aca781a2c6112555d7562d59078012 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/d2ece788cd8f4a18b0bbc1c832130a0010a30921 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/ceadc9a7410c69fc3539618569222c994679b50b |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.7 | 3 
                  ndisc6-1.0.4 | 2 
                 gnutls-3.6.13 | 1 
      gst1-plugins-base-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
            ibrdtn-tools-1.0.1 | 1 
                 opencv3-3.4.9 | 1 
               protobuf-3.11.0 | 1 
                 ripgrep-0.8.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/49eed458d393269f6cba1304098305078d5fdc29 |     
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/e890b607f16b4dc15406fe328e6e728e1b695861 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/85053f620113f4d8317e678f22a08dd5faec5215 |     
    m68k     |       ibrdtn-tools-1.0.1       | NOK | http://autobuild.buildroot.net/results/d3821d511ef0d325a4e02eb20d137636085fa282 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8d911f08c89f91b37b3fc29999670c6bf947ca4d | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/eab1a1a007e3410fa7eaf77bad658fe774105bfa | ORPH
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b499a9329eb6a91e8e68a15c65499b5691a487ce |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/187c88061465238637164d1948abc2d230bc1c51 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/515586d482cfbf3ab13a0b9777005a86645e1b93 |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/42aeb8ccf9cd0fb991cf32c69beda1e0731b6f91 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/7b85e834a4e049c1aa54f1d450d805dc44e5afbb |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/28b12c21b03bbdd53dc8d7b80d0e1738f507b7eb |     



-- 
http://autobuild.buildroot.net
