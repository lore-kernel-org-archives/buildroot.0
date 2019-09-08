From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 08 Sep 2019 06:18:24 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-07
Message-ID: <20190908061831.02823861E3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  0  |  0  | 25  |
  2019.05.x  | 19  |  4  |  0  | 23  |
  2019.08.x  | 19  |  9  |  0  | 28  |
    master   | 170 | 135 |  0  | 305 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 24
          host-capnproto-0.7.0 | 19
             libgpg-error-1.36 | 16
                 apache-2.4.41 | 12
                log4cxx-0.10.0 | 6 
                 haproxy-2.0.4 | 4 
                libgdiplus-5.6 | 4 
             subversion-1.9.12 | 4 
                     apr-1.7.0 | 3 
                    ffmpeg-4.2 | 3 
                    flac-1.3.3 | 3 
                      icu-64-2 | 2 
                 libdrm-2.4.99 | 2 
                   mpd-0.21.14 | 2 
   openvmtools-10.3.5-10430147 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
               capnproto-0.7.0 | 1 
                classpath-0.99 | 1 
                  cmocka-1.1.5 | 1 
                  connman-1.37 | 1 
                   dav1d-0.4.0 | 1 
                   dvblast-3.4 | 1 
                   fio-fio-3.9 | 1 
                  gnutls-3.6.9 | 1 
google-breakpad-7515ab13768... | 1 
                   grpc-1.18.0 | 1 
           host-nodejs-10.15.3 | 1 
                   i2pd-2.24.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
        ltp-testsuite-20190517 | 1 
            lttng-tools-2.10.5 | 1 
                  luv-1.30.1-0 | 1 
              micropython-1.11 | 1 
                mono-6.0.0.313 | 1 
                    mpv-0.29.1 | 1 
    network-manager-legal-info | 1 
             openjdk-12.0.2+10 | 1 
          qt5multimedia-5.12.4 | 1 
                       unknown | 1 
              webkitgtk-2.24.4 | 1 
               wireshark-3.0.2 | 1 
              wpewebkit-2.24.3 | 1 
             xscreensaver-5.43 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c645182a96b91a80c728e55e875afe60a18d2357 |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/637ad4affb988bcec3c6ddb3f00e2bb57b9bc41d |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/77abdaaa5a52498e1c91ac87f50a89079dc116dd |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/a1c1a4a61b49660c6786ff45b386f021286ba142 |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/398efedd2b92b4de16346f1119c1d398ac9b8fbb |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/6028caf451e81878596b955c414511de52f0a0af |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/0d5e48d36899e81f31acfc6ec373a23861f33e0d |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/1a86517586efc72ea960c56fd44c7e9c8648a2d4 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/aa6b8f2617a9ec77a4875e4ae6ec5f976075c146 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/06a07861b8b84bae9389819ef7f2c1f1b773644b |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5e56304dc0892f5b4d240596d4f4632112f6cc68 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ff0cf5d3e89fac26e674e9268b27458e26f92010 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/b8007cc80792c2cb0de585db2b6477b7f13f15c5 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/52e64f22e1310cb11f723591540a205586d22290 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/0f40a4848036324f2d139b781ef5fa6c5453a8fb |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/dac206d7d039bf87f46a08f82b3444c83714216a |     
    arm      |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/8e1cbd2f11b6f7a62d3bb1bfc4777a59fdcbc03e | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/8e696d9dee93f0b9223b9ecbc40128473475b369 |     
   x86_64    |          connman-1.37          | NOK | http://autobuild.buildroot.net/results/9fe30da0aeabf0c9db9b750958a20f7a9b7628f7 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/65f2c2a7eae455c0d0ba1fb07c6781f2f53bdb74 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/266d6895365512f387116313532eeca858f63d20 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c187928d2ccebc7d06893c8e547fbbc4b2dbf2f9 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/fee71c9d83beedec0e5e383d5c679998b00fbad4 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3a60b9006a892191dd318f8a4416bfaea90418c6 |     
    arm      |          fio-fio-3.9           | NOK | http://autobuild.buildroot.net/results/d9c6f4b361953d9184388911dd58a1563f025f79 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/419222f6bda6da43542dad6f0284677924a2e4fe |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/cc40dc08899ee2b04d58157974e49f60d5c1a8c3 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/3676bd73e8080c286ff1b9c41b8904a0a906220f |     
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/8e8fb1db8573d57665097ef6b84b6046d7827e95 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/0d0fa4b11beb8da7118081920d3d4a228f343958 |     
    arm      |          grpc-1.18.0           | NOK | http://autobuild.buildroot.net/results/452585f683d1481eb6ce671e026d88deda22fc8d |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/f4d77eb2f22c2234d58479e49261f26e2fece4ff |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/b6294715999611f4985e60c19368be84b022807b |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/40db8a0f3f13a6f5aae92ca222e6eb9c6b4bb5e0 |     
    m68k     |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/5d57b160461ca6faa9030775744f81468e5e502a |     
 aarch64_be  |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/28f068825d905de3225f65d6c853cfe8f73cc1e7 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/b7bd4679fe1fa99f9254ac67449ba62d3629d000 |     
    mips     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/5b76eeda6159cf7577f10390f2e9f8dbccd8f3d2 |     
    or1k     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/6b9a179a2b48b54dc0d31f0330912946cd16c427 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/875a0ef4f9948b97bd15b5843a62fa7aa13c1207 |     
   xtensa    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e2d4d0447113b0ba6483007262a7a908e4b53568 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/65f9a9a3e39b3ddd7e7239a781da09c64dadf363 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e018ca5442f95bd94c3ff26f5f50223315ebea91 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/52fef045c3b890ff587ffe47c196830cc5c5d6b9 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d1024ff135b2c8f6a3eb0050d2cc60a80f7c554f |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/c37c07671c99f4ea82789badd80afd1b690f5463 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/294801e4a8004351d1f9f1af5dd172fd7cc8f493 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/6dd4ff82665b443ae9a7ed0208779f57cc3f1a57 |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/55da454049566e88dad9a550c5b3add9ed142d93 |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/d429393dbf14a8a13c2926e548cf257fe1003055 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/1f316d59462d82cdb0b4b05231a346f461f5646b |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/531b0e07bd80ec3bb2c28b2a80538f24a6b67663 |     
    i686     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e07fef1074f0812a52801d85b6d29d80d5516245 |     
    i686     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/9e07117a2afe4cd8185ff9cc2402a528aa4ed0ed |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/5f7031d9a95e317a09dff9368bab77e2defcf7bb |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/0443a12a089066705903229bd1fa1dc302dd471e |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8f3ee346cfdc48f04c6595c99552fe14947a54fa | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5a59f7800b900341525f33635a52d7b80e0d480b | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/40807fd09f11eb9b21c8a49c6c1f710fe6bd9d3d |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5475ccc9467b92bf13adcf0c949ffc1bb89fad5a |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ec3fddd7d04cd484d404660575419b6d60233314 |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/65a6fc0cb782fcb291d73e174133cd18ce454d0e |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/642dbbfd175ee6b43a4eab02937af0e72b45f58c |     
  powerpc    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9aa3c6857a840b78954b31695941f77f6fdde283 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/cc7341505f76e422b2a745e38b0df4d76f3aa5f0 |     
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/4d872f3e20b8943053a676b427a0035db2ada47b | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/7340db123090d40d738a16778f9e8011205a4a2e | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/4c87ddce1fa773357b091ffef8dc23d7fda23cf8 | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9efb7e3dc8f8a2583575c878821b9149cdf78222 | ORPH
 powerpc64   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/901308171a1835b7f6060b872d592c87cdcd4bdf | ORPH
   sparc     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0cca8f3035b7188a51d6cf0268a3c245dbdc8441 | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/3c2aa6d608cf317752814a151c1e2368e460f7cf | ORPH
  aarch64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/f08c3ea61d67052cd8cc4bcf4706a57fbceb151a | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/8999c09c70db3c0e092efe79f9644da3cc373246 | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/568d2932d091a46853e404bc09c21f806a8abaf5 | ORPH
powerpc64le  |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/016d2c647988572e170e757b70da9d211538c50e | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/f58ebbefaf6e1013451267a65070751efc80a152 | ORPH
    mips     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/43aa47e22f2903fea8d4a0e9f8752b81cb1e4fe0 | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/5d479c9464039953e9a97c02360e0cb2599b5387 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/69e88781813df0c2a67ea557e6203ce870f155ab | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/e90d434f9be48f281093a689bfa4e8df47b017e8 | ORPH
    sh4      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/5c40948e3e6007a39836e1128964c1ef82a08c7d |     
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/4381daa40625998c44f7d6cb59f30d83426e6e3c |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/df111d8af2c1377142e60e417351758f078f95fa |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/da21c24e455c9f232940de4966e40da82a9db094 |     
    or1k     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/073da2790369747f02a2528c6b536df497a0064a |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/ec232b0de02a1ee0171ca6971794666c9f151cb1 |     
    arm      |     ltp-testsuite-20190517     | NOK | http://autobuild.buildroot.net/results/b7484483fe1fc75b1a7e573c0536e50208948119 |     
    arm      |       lttng-tools-2.10.5       | NOK | http://autobuild.buildroot.net/results/6161a82e222aed2aafc865987dc2bd4d8221aefb |     
  mips64el   |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/a68112f9774cdbd1085a31ca3ac1ee6d38fb8cbe |     
microblazeel |        micropython-1.11        | NOK | http://autobuild.buildroot.net/results/613a48da8192fc2ef07fa14b31f7072d0bb48d70 |     
    arm      |         mono-6.0.0.313         | NOK | http://autobuild.buildroot.net/results/6ca7c8c1ca2ec4fb563847ba8227eb3f2e145444 |     
    arm      |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/77751dd1aec18169debd55fe79a39c486890f1ed |     
    i686     |          mpd-0.21.14           | NOK | http://autobuild.buildroot.net/results/63dfdb7d6fe2d41a9673775e0a280abdb1ec8ecc |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/80e933065be90febd319efd954e0cc417fc07dee |     
 powerpc64   |   network-manager-legal-info   | NOK | http://autobuild.buildroot.net/results/44ce11d110a508821f76aae7ce996c1814c6a453 | ORPH
 powerpc64   |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/d47c844ea7164138ea70425fa2e7b1c96802c526 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/490744577d35fcd53da090043533ce8d692218f5 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9d216af47e2b0def32d2115e4fc20c6b48bf9d6b |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/baa729db7f4b13d40ce980dda8dfdd808b156c03 |     
    or1k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/df19e9271041cc6eda89f8ffaa162a4dc6457138 |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/2dd03327a96e51e69b1a175e525666ab79d2a8c7 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4dbdf822361e039adcfebe37fcae775d6cc0339b |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8f20cad6ff302a75973ddb1b2a7ce5e387fde21a |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2a883965fd627f7627bcca3a5acb25729ca96f61 |     
powerpc64le  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/b0554e3618ffaac56178dbbe8d6f2890f9d23506 |     
powerpc64le  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/b978b810f1e154b413ac19c4e615b7089723a32c |     
  mips64el   |        webkitgtk-2.24.4        | NOK | http://autobuild.buildroot.net/results/609808b5e44ecbed8d907125eed90bdac0f7e53a |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/b8a6f45220bb0fd79e580a4c952739d2ebf0b12a | ORPH
    m68k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/ecedcb60ddd3e8c560dbcf319ae58ea43955e2f1 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0b4c29ffc61547d8c4231d68997733b918f35d52 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/70cde4b4e2fa010cf6a78bea3eb7c35d1908aa11 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/971e27319cec896e7456a33371a922f67a5aa829 |     
    i586     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d99618af08c42e8c98c5530baf0bbe6933462aa7 |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8d8f7624ced8cec876f9958a73508abeccf6c34c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1a6e1ab87063783c16aa39e0bbf2bdd7c553538f |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6701ec3717045d14439cfdaeeefc5fdb1270795f |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/90a54c6920fea4c271a21f597aa78774cc19f4b5 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/38ea4b7a41c3057eaa6ca77d2dea342ee55802f4 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6d5a75f0781483e248368c9cbde93a869947095e |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/674a39d1c90ff8534fb892cf3cf26da949c3ec21 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/461b6d77ba88fb8baf06c8f655ab42ae3aef99c8 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c1873db2a16cfb9e5eee7cdc88341fdd75b1730f |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/68a62aeba0c563bc66f6439ad1e21b6deb984fe2 |     
    mips     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/c9c018314bc3ec3578400226ed208d53e0f5b271 |     
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8a21a674b514ceee046d8391f3b725abba75650a |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/de311fe337bc9ba5532d0b094333cf93b4601305 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/438dfe931736ac6ae6865c7935edfa78b1728c61 |     
   mipsel    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/64f0e5c6cdff6505207dd3eceba3921da1d2be17 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/42adbf6bfc9a559bd1fe11221a332346131f36c2 |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/5efe50b4802b2a6cbb8055260fbffa0b9623661a |     
    or1k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e59c8c918a47bbb03ccfb753bb7d2262a806d802 |     
    i686     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/4d123728032ef71356d4a017d11a1e916f545237 |     
   mipsel    |        wpewebkit-2.24.3        | NOK | http://autobuild.buildroot.net/results/8280506642820daa4272f2b0d0eea73ea7ac637e |     
 aarch64_be  |       xscreensaver-5.43        | NOK | http://autobuild.buildroot.net/results/8e64cf762d16991d75054fdce5ce68ffae6848f2 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 3 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/58c429fdcbeaac981204c3f62d39b02d05f04380 | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/e7e69e7489a3c343499201500b56cdb90e715dc8 | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/74c5d00f7b75b0a8d1c9ebc52c1074730fd0063d | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/2f2e203022d5f87b6603b10b045c6dd1013a61b3 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 4 
                    ffmpeg-4.2 | 1 
                      icu-64-2 | 1 
                qt5base-5.12.4 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/715ac830a94880e330cf36afac0e504a41c1b051 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0fb51c7bf7dc491968e737bca5932df38515ca94 | ORPH
powerpc64le  |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/d6d1f7114a43e2e767a3c94800a968372e1e911e | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/879abf3d40eda676a8d265865946af2ed183fd3a | ORPH
  powerpc    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/07bc0aeaacbd1400ac152a6b3eb1b5bbd5810782 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/c48e8cf129f21c55a3ebdaeb6e460c33b954dcb5 | ORPH
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/16675c90cad4d63c2f726fc6420d5aa204a3767a |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/b6c6f62e106f6fb8b57ecbd20c9c1347931d7008 |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/6e4b39e2ac7b5e8240e9e8710be50f2f3d447258 |     



-- 
http://autobuild.buildroot.net
