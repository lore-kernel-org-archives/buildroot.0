From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jul 2018 08:00:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-30
Message-ID: <20180701060025.720432082B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   7 |   0 |  32 |
   2018.05.x |  25 |   2 |   0 |  27 |
      master | 225 |  93 |   0 | 318 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 2 
                  cc-tool-0.26 | 1 
          host-libsemanage-2.7 | 1 
             libopenssl-1.0.2o | 1 
              procps-ng-3.3.15 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/47fd6d6d9dbc9704e7f60a2144bdd62ab8684b3c |     
         sh4 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/bd89cbccecf34a499d0f2b301fea175b85dc7f45 | ORPH
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/fc2ced341daae5042530f359df446877b5035a9c | ORPH
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/9d6864c054b55c7ea5a890da06061a7901a13b4d |     
   powerpc64 |              libopenssl-1.0.2o | NOK | http://autobuild.buildroot.net/results/34b9c88192de4f8bf38cad07ded0568a1a38e3f8 |     
         arm |               procps-ng-3.3.15 | NOK | http://autobuild.buildroot.net/results/eac700c61e277689b46fd617b6ddcbf94b5271e5 | ORPH
    mips64el |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/7138b3bb8a57ff7372b3d2d26557562cdcb943be |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 1 
              libgeotiff-1.4.2 | 1 


Detail of failures
------------------

         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/f6d54cec0715901f36c2de883e3a23bedd93e50a | ORPH
         arm |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/d665fff8bf0f0a43f2751babad4df784fb61e58c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               json-glib-1.4.2 | 14
python-libconfig-b271c3d9da... | 9 
                   dante-1.4.1 | 8 
             gnuradio-3.7.13.3 | 8 
             host-aespipe-2.4d | 8 
                   wampcc-v1.6 | 6 
                  boost-1.67.0 | 5 
          host-libsemanage-2.7 | 4 
             gstreamer-0.10.36 | 2 
                    host-rustc | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
qt-webkit-kiosk-a7720e50f2b... | 2 
          qt5charts-legal-info | 2 
                  samba4-4.8.2 | 2 
                      x265-2.8 | 2 
                beecrypt-4.2.1 | 1 
                chipmunk-7.0.2 | 1 
                   erlang-21.0 | 1 
                 expect-5.45.3 | 1 
                 gnutls-3.5.18 | 1 
                   libao-1.2.0 | 1 
          libcdaudio-0.99.12p2 | 1 
             libid3tag-0.15.1b | 1 
                libmpeg2-0.5.1 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
              mjpegtools-2.1.0 | 1 
                     php-7.2.5 | 1 
                qt5base-5.11.0 | 1 
             stress-ng-0.09.32 | 1 
triggerhappy-b8228880661293... | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/58d8e6d4b7218a55c36fda45c7343f57175cfe97 | ORPH
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ef73ed04413bc4a7d3d6d09baef3b5c8fb74f114 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a75421124fe945f600641bf8264c0306d6251bc7 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c526b034f96b4a8551112fda19feba7045d8ead6 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c83e085d51cc119cece653c9f74b75941bd8ffcd |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/726886097bc112578e7e246396eae4aa1234bd1e |     
        i586 |                 chipmunk-7.0.2 | NOK | http://autobuild.buildroot.net/results/396897ecc139b7e1e095954c9dff047f04e590b6 |     
        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/8cc22578b41b1b072381330bf29ab39d6edcbfae |     
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/c13267089390a3399f99e5a30d8f439639fef709 |     
microblazeel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/34b403b28ef76873090c405aded1a38614187027 |     
      mipsel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/153813d79cd64fd3a77599e0b6bdf63f295278bb |     
       sparc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b0cb9570e20143d679ccd757822ba4d5f662fc1e |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ac7095ed87cc0f065ceaafe38164fbe7f3ba60d0 |     
   powerpc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/c4e988a8510e7a58bce1bb425ae371ce98ad5d0d |     
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/160d6169ec3d66b82d183a78d951ce57499d39e7 |     
         arm |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/48eb320bf02c9b0ae8d204e2366b861844b74416 |     
      x86_64 |                  expect-5.45.3 | NOK | http://autobuild.buildroot.net/results/597b1f1478369509da0f475ba10a3173c2a4f9a7 | ORPH
        or1k |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ba089c96a8ae17e65c5f66535e18793d2df76c64 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/43ced9a3daf2f685a15da1ebf6130fbf20372b96 |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/67b0046f94f1607202fe1ad90a00085b665761fb |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ae7ff720c4be89facb10519644531b275cfd0474 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6fa1c4f2a12d604d255d2fbd0a1c029ef8c13209 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/72c56abee98d4ce003758f8cedc5926481a59f95 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/34afd83534360ce1660ece36ba37b3014c38a8db |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a631f90d9145706cc6e5fa32207daaed5e8df712 |     
         arm |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/c18c1c3f7dab0cdacb3cb1d8441cd40b06835059 |     
  aarch64_be |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/8a8ba5ce3bba640de6ae776541d00e9b65ca084e | ORPH
  aarch64_be |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/b061948b04b42e753e52607f395ed7c597a52c68 | ORPH
       nios2 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/a1b923d245145954654d1bc007f882bd1959d3eb | ORPH
        or1k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/5a49c998ab623b91fc3f5dbc4437599ee377a962 | ORPH
         arc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/207102ab6232a37d062caeb1fd7818c415f39c57 | ORPH
        mips |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/8059530b2e3732dbcbf501313e07103afa146004 | ORPH
         arc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/3cd6df23ca15fd28820e5be7b06f9cdcfe069fc2 | ORPH
microblazeel |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/831a8451d825dde2edf8ba295148b7ba0e105ede | ORPH
    mips64el |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/0793a7f64e87b47663e6c6bf5a4cae72a8f92514 | ORPH
     aarch64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/8276d0f269f6ac6cf9a51b6de67a1a0356488fac | ORPH
        i686 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/4886e6d202eb2ea4d476f158f62f3e800198bc3f |     
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/d90b8e2be3cf9586fa831a319933306e3b31f219 |     
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/a3a47fd1ad3a77433f7cdb135aec5aa67a15e9df |     
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/5092fb8a0f497af5ab9bf75a9dcacd4c599ca0df |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/be043954795b732fe46612793e7b9a8968d5aec3 |     
        mips |                     host-rustc | NOK | http://autobuild.buildroot.net/results/10993327b6dfff77bdf77888cb7774286611dff5 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/57046edd250f7dc13e61ba2dee141eb60b115187 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/40d5fdd758cc90be0da38ae7528244d9aa5eb4da |     
         arc |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/951a0824b69f96ac2fcbe7b0f4508409ffee41b6 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/cb43e34d6a1a72b1c490b95a0bff5d468e0cafe6 |     
         sh4 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/e8f94b9495a3f8cf86996704332e861ff5c9e7ac |     
    mips64el |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/0efa8e168bbc32b190c14a42869b06ef163d43fe |     
     sparc64 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/6ffccbac79dba571a441eeabc36b771f06bbdc9a |     
      x86_64 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/d17ae7d5c9240714daf42370db81bd986485c525 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/3a7918fe4c3f4e17371033d60dac9db419962ff1 |     
     powerpc |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/4b8def2c64fbde72491f5b0f926005cefda1f056 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/ff08509e01f36e5209012a15f4b901da1ebbb9f8 |     
     powerpc |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/6d44922775864fe1dcbf374a939485b311e5d5d7 |     
       nios2 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/2785f8f8a620a2928b32d3a164571b58a89d24be |     
      x86_64 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/d33e1ab7e4ac4f1dcc54a619bf886ea65408df81 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/fa83840a2468859bd0145e3ef3991dc11c156512 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/916fcdc8bdf5aa3dfb950742663686b2e363d8d3 |     
microblazeel |                    libao-1.2.0 | NOK | http://autobuild.buildroot.net/results/f1cb9209de912060e584eca39b2b590feeadf86d | ORPH
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/c6cb416bce8de877d7cb54f36c484e4a3c13053e | ORPH
microblazeel |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/b6abead423614cd4927a0f94068afda28f361df9 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/30c537f1808543792bf41650003002c746893bda | ORPH
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/8e146ecfc8bb62891bc7b1be7cf8b5451ba0e7de |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/4222ef7aa8d905ba72ff713e2e239d12ccb69439 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/83480df9ccfcead3e10c58cfb78f0591718a20d2 |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/7f116217fc4e1856b3e6ba5a02d0cfa022dff981 | ORPH
       sparc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b5b0c0090623452630ac5eb813a2136b1d4f9570 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8910d73b10c8438f9bbf4218489db661ecec8a52 |     
        or1k | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/92e88f7826da290bda3bc9f2e40fff0be56ad99f |     
         arc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b50ce69f4b41d99f5128c38a8090a6a678da0df9 |     
     aarch64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2f9a767acb7888b139b7c209928f0ea10ce3c1e9 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/57fe1680f35426e663860acecb600599e3dc28c8 |     
     powerpc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/04e9fca3661aa55bce0455ae9232ec909312b6d8 |     
      xtensa | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d76896605625a579ebf2523a62063a7f3e50c477 |     
     aarch64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/638afd6b901dce4bfa4362ec62b8221b30458adc |     
        i686 | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/8a999bf4425b59470a53a53556424a7ff1ee82c4 |     
         arm | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/1af069da9c6d01578958e4fd35c52ad5ea4fc56c |     
  aarch64_be |                 qt5base-5.11.0 | NOK | http://autobuild.buildroot.net/results/8cab78907aec67fe5526df0585125066fb3573d1 |     
    mips64el |           qt5charts-legal-info | NOK | http://autobuild.buildroot.net/results/1bde69c515d9140ef0f9a5571475c2850c7b8dee |     
      xtensa |           qt5charts-legal-info | NOK | http://autobuild.buildroot.net/results/b9c14ce7c2fdaa412eb6416ae12a0376aaf05770 |     
         arm |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/bff0050242a7beba4b9e154aeef4ae4c8c52312c |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/6d067f8eaa2393145015e7ab9c25a8f6cce4441d |     
        i686 |              stress-ng-0.09.32 | NOK | http://autobuild.buildroot.net/results/741f5881d3cb745d1003ede3f762c20eb72de0b5 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/15cc6523a42bf66508b2b37fd1fcb74625561ec2 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/c1c77065eddef19e283b51b4a263d5c20bc72397 |     
         arm |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/64eb556f273c406e0ad18351dd50628eb84bf059 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4ad5f809038945bf9480bd6ac54f3f973a6689bb |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/5ec1e0c55346f4dd8ae4771d6fa363f4366fd5d4 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/dfbe3315406b43452b17240f8e4a9a81eb52e945 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f49faa95e98a8b66008a22ff6f9c43908a699f62 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/fe27c0ee9b5c0f3b4ea985d4a8b73c18540ba264 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/46ade43d90a476187b8691e425bafa3c38e09ce4 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/d3ab6e24a73cc71dbccf106d548ece65927c9177 |     


-- 
http://autobuild.buildroot.net
