From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 06:21:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-17
Message-ID: <20200418062203.10E92876F2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 23  |  3  |  0  | 26  |
  2019.11.x  | 18  |  3  |  0  | 21  |
  2020.02.x  | 13  |  7  |  0  | 20  |
    master   | 129 | 113 |  0  | 242 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     python-argon2-cffi-19.2.0 | 11
              gr-osmosdr-0.2.0 | 8 
                qt5base-5.14.2 | 8 
                 lua-iconv-7-1 | 7 
              luaexpat-1.3.3-1 | 5 
                       iwd-1.6 | 4 
                  zeromq-4.3.2 | 4 
                  assimp-5.0.1 | 3 
                     avahi-0.8 | 3 
          gstreamer1-mm-1.10.0 | 3 
              lsqlite3-0.9.5-1 | 3 
            lua-flu-20181218-1 | 3 
                 openal-1.19.1 | 3 
         python-markdown-3.2.1 | 3 
                    brltty-6.1 | 2 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.16.1 | 2 
               libdvdnav-6.1.0 | 2 
             lua-curl-0.3.11-1 | 2 
            luaossl-20190731-0 | 2 
                  luasec-0.9-1 | 2 
              mbuffer-20191016 | 2 
                   mimic-1.1.0 | 2 
        python-greenlet-0.4.15 | 2 
                  apitrace-9.0 | 1 
                coreutils-8.32 | 1 
                     cpio-2.13 | 1 
                    gcr-3.34.0 | 1 
              gnuradio-3.8.1.0 | 1 
                 gnutls-3.6.13 | 1 
                grantlee-5.1.0 | 1 
                 haproxy-2.1.4 | 1 
               host-qemu-4.2.0 | 1 
                 jbig2dec-0.16 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                   libiio-0.19 | 1 
               libupnpp-0.17.2 | 1 
                 libv4l-1.18.0 | 1 
             lirc-tools-0.10.1 | 1 
               log4cplus-2.0.5 | 1 
                     mc-4.8.24 | 1 
                    mpv-0.29.1 | 1 
                  rygel-0.38.3 | 1 
               skalibs-2.9.2.1 | 1 
              spandsp-20180108 | 1 
                 systemd-245.4 | 1 
                       unknown | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/87f38998d2d60b6bce3128589973187ef9596e28 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8c78a1033653e5bfb5569f870b75a44baad85fcc |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ceb6d3f2d812ecf36cbd46f254bb9e99a52bdf19 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9f7f5efc60f2e69b037da72ce26a33df2d683370 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4478af6554ecfce36bac38ffa6f0baa16b5feadd | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d7dc9ec0e2cd4f07bf1df37f145f60dbde673a3f | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3b0aba17bcb5f1cda0f0d7f07dbbf57890c5d72a | ORPH
    arc      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c6807e2c34ea049b4450cb07afeba3dd18609913 |     
  mips64el   |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/8cc667cd02cfd360f21303fc8bf1684931f86cfd |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/2d3f73b2294d1302bdef740f110d848d3680270e | ORPH
   x86_64    |           cpio-2.13            | NOK | http://autobuild.buildroot.net/results/1fae75436cb28c46bcae4a05b00005277c7069ac |     
  sparc64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/47fc2b61d8d366250cabdac22a2aa240df6ea2a8 | ORPH
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3a6166755cd227ff9864d572c81766bf1d3258b8 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/da5e093aabf801b364f0cba718f5131504e614d6 |     
    arc      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/124fc9515440e6a3399387345d501283c5526dd5 |     
  riscv64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/721eb4da402a85155c6bb4a334ed344c9fc34593 |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/91820e11fb987ad5800145d79a5e784e0ae11fb9 |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/9aa895562b6bd962ddf013d2ace30516c0f2faea |     
   mipsel    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/a00a5f078da3b15e9769edd1b0ed48453bd63473 |     
   xtensa    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/b87b184a870ed664d7d3d0186f22c91cabb10556 |     
    arm      |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/fcec6cae0c381aec07ab6e798856c4445b7e1b0b |     
    mips     |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/ea9a7dfd30395812bb48ef66e7b9c4174a425d10 |     
    i586     |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/41b493b5c4d6932d0bd973f54260dd5dd331d8aa |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/71cd9bf5954420658be6c98d32f3f1eed54419d6 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/350db3a1a02fdc4521efd35eaa3d43c0b5ca6933 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/715b4fcfdfed0b11f4c6a7ec32360288bb00a306 |     
    m68k     |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/3a91b27827e12a9b99aa8bc8eeb17de9231ff6c9 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/854586d2f328e1d386880214c976343d1d440cb8 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/95a0cdb857b45acb37c9ae5731788c3cbeda8259 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/29945a0edb54b83b95e7c5935482ddf0d47b183c |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/81153c0ddf950acf799751f4954d5d1d67642692 |     
    arm      |        host-qemu-4.2.0         | NOK | http://autobuild.buildroot.net/results/b83b10bfd53928971b76e9d2815ea2e13548b8ad | ORPH
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/1572806028d0398d15dddad1174e0caaff09a03e |     
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/6345e0f31051b694bbf46d0bc677de6e092061a8 |     
    arm      |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/721f4f5fe26a9ce63bfdde4cd3a5958317f5d39a |     
  mips64el   |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/d0141b9db7c088894d876483c476d99a9c88acb5 |     
    arm      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/593372d069debe6a0b06a2fa39f233a829d32d78 |     
   nios2     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/05810b8fb568f2778d0be235624c2fbbd7c59d0d |     
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/c9514368b98bc3a7f7ab92cb33c54bd3ffd9a232 |     
    arm      |        libdvdnav-6.1.0         | NOK | http://autobuild.buildroot.net/results/7b2fb1be3a6b897561a72e637d902a86461f5a7c |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/1a37d7acaf944a5e820563cfcdc3a60921d9f8b6 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/1d43de083f3bb738a7301d44bee18e50b98e7701 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/cff00bbcb6346a3d342adeac2ecb830415ff491a |     
    arm      |       lirc-tools-0.10.1        | NOK | http://autobuild.buildroot.net/results/391d7a8420bb78292ccbd902d8e177680973fb9f |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/84e154cc14fc427d9aed6b5fe87612f11bfa6b63 |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/edc23b4db65cdb61af545500711111c65d552d93 |     
  powerpc    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/5207c3a671691cd90b7d9a354305db028d347982 |     
   mipsel    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/2ef52b0dd6d1b46a9777e5e6b7f7c69aa102527c |     
   xtensa    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/d2346bd635085b2588d8a9c8ff674778167502d7 |     
  powerpc    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/595cf61677ff219bf05bf8c636f23d797b309aaa |     
    arc      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/63e5520f3d3b74a69ac0ad37eb2fcac131448669 |     
    m68k     |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/b61f02a389581c14037092ce8c37db146915fc63 |     
  riscv64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/f1104f47d1e1d69bb2a9306bac4935647aab392c |     
microblazeel |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/8a365c04e4e483e9176d285e1e92d664ace64ae2 |     
  mips64el   |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/46022f63006b2509f5720f2157efd29ebe35193d |     
    i586     |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/1f32bb20ada501f1c6a7c7fd9e3e0ae8ea63082b |     
    arm      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/eff9624ff9a75c6dab50b4c7f40204440fd117bb |     
    arm      |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/9e6d41e616eb0e16944817e411161669c3f56cd9 |     
  powerpc    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/c927a3b2d4f60d36db5f386c9c9201b5a2cf0c58 |     
   sparc     |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/3b32025256c54baa698a72409a7cfd5dd0c6fe5e |     
  aarch64    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/f4d2fe2a1b9037174c7e0e0c2b20b93d2066700a |     
  mips64el   |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/cd2daa394598c9c230f65e0a14b26879313fede8 |     
   mipsel    |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/a40bf0df3c87fe2eb6a47a8f136ed282222e401a |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/4d74997c462ff95bea702d5e14d0595c2d5e6720 |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/d210a72a3b9ae7de3c519b9814367f8a1f19ca58 |     
   x86_64    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/d33a57bd4736e19e8017c0b94616c1653642fd30 |     
  riscv32    |       luaossl-20190731-0       | NOK | http://autobuild.buildroot.net/results/5bce3f752bc56d5a2826cb189a17cd67ab935540 |     
    arm      |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/ffdb4b4dd3290b51db2ae63705443c7726105f52 |     
  powerpc    |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/f851d4f99156223203980e2f954a94eff6bc1042 |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/dea953c2b69cab86eda262219cb1bc345c50fec3 |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/55a14b463a180beb0885979aced3c9f8a579dea6 |     
  mips64el   |           mc-4.8.24            | NOK | http://autobuild.buildroot.net/results/12a8d86f4bc378a25b04f2a0d0c14c6307c16c02 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/36342a3aa06d1c18391cc195960bf7cbebf7b877 |     
    arm      |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b4c7f64ab0a21dcac404a580ca3d3c85d8b9ea64 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2c20d8af48ef9dec0c80cf15f359ca35e6071cef |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a73b9df9ff63424bbf85c358bd51e8f995937bbd |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/06f21b691b911c3bde9ccf4bcb39f4746cf22594 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/7e45a2d43ff5bbdc074808736d47d13699175749 |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/a5d6bdddc804588cd3df34d51ed6d06aa3e4f6a8 |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/649fd10d9b4136b54cd227a5fef91aaea2143adb |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e2aa027edbb46824f4df55e778b403f2e7892899 |     
 aarch64_be  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/fa9e27fc1da7eaae18391bb6e5150f002158780b |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/80ded4c8076ed7f1cd0bc0fee6297b5258d7e0df |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/25bfd4cbb27668de8780c83385d3e85ab82c4051 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0ddee3fbdb1462ed258ceee9165db995dc29bc86 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e4963e4e67d004c3490f3cfe776b84b35e1da62a |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/7ac0eb7d65f3d6163ce60923a42eb20c1c57d7a4 |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/097c8c970af2a35a3af89f3a225f7225db906790 |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8c6181c76d013695bddb8ef011cc28a9665815a8 |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/16db2422c1ea979521c105ef2cbc7640212e115e |     
    arc      |     python-greenlet-0.4.15     | NOK | http://autobuild.buildroot.net/results/9e97fbc79b4b563d16bce328d4c189f0ad2a96a5 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/9fa5871abe999f966b1b67167eca54b8fb3d4150 |     
   xtensa    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/cdd0b0c47dfb7b898a96f569ce531512cb236040 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/461b275ca6920cac77df812607271a738b91183a |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1e8ac47cd63a52765695cd9973e777a71af76386 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/964d8f7e6469e864c4c3d5be8107cac1b3499316 |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/e8ced3221067a6a5637e53817e66af4b006a940d |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/1475329c16f9e8cfda9cec137055a25923801c92 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b3005680f0fb8f013b8511eb24365c59d89de0d6 |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a6cd0036a8ceee7a2520e410a066b1f73cdac42c |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/460d8f91e3c1bf12152db4309613457c1751180f |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/74f5249d1ee14c1269685af53a65055da7dc2ee6 |     
   xtensa    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/e8ec14c11bbe0530026e2bb02fa0a514e7c59abb |     
   x86_64    |        skalibs-2.9.2.1         | NOK | http://autobuild.buildroot.net/results/22ef33e3b79e2cfbcc6495aa75988bd4a9c17135 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/b17c6a7bedcedc0cfca9cdecaa2ba4fbcfd6cd21 |     
  mips64el   |         systemd-245.4          | NOK | http://autobuild.buildroot.net/results/94dfa79903ab97670571b565a8ce4334102062a5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5dbc008cf90b9515f24ea7a463a79e7c7b043454 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/d9144d085b1c05d800f03b501897c5f857ff4cfd | ORPH
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/2c6bb832867038ce00fa4e0c7e4afe16054562d3 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/154371472f3fcf6a3e4cd22ac0be346921a50642 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7f12fa61d9f726f22c86e8d482adfa68d459b043 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/6aa3904242879fc6255c7312a1fc5c9227b1cc6b |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7117b6588e718bda2e77cdfebee505b9845ddd81 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                         arm_juno |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426809  |      
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426824  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426826  |      
       atmel_sama5d4_xplained_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426835  |      
   atmel_sama5d4_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426837  |      
                     bananapi_m64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426841  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426842  |      
                   beagleboardx15 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426844  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426845  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426846  |      
                     beagleboneai |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426848  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426849  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426851  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426861  |      
               freescale_imx28evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426862  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426864  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426870  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426871  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426872  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426873  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426874  |      
             freescale_t1040d4rdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426875  |      
                 grinn_chiliboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426881  |      
                  grinn_liteboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426882  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426883  |      
                         imx23evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426884  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426885  |      
                     imx6-sabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426886  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426887  |      
                        imx6slevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426888  |      
                       imx6sx-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426889  |      
                        imx6ulevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426890  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426891  |      
                        imx7d-sdb |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426892  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426893  |      
                       imx8mmpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426894  |      
                        imx8mpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426895  |      
                          lafrite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426896  |      
                         lego_ev3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426897  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426898  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426899  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426901  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426900  |      
                          mx25pdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426902  |      
                          mx51evk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426903  |      
                         mx53loco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426904  |      
                         mx6cubox |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426905  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426906  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426907  |      
                        nanopi_m1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426908  |      
                   nanopi_m1_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426909  |      
                       nanopi_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426910  |      
                        nanopi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426911  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426912  |      
                      nitrogen6sx |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426913  |      
                       nitrogen6x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426915  |      
                        nitrogen7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426916  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426917  |      
                      nitrogen8mm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426918  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426919  |      
        olimex_a10_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426920  |      
             olimex_a13_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426921  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426923  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426922  |      
       olimex_a20_olinuxino_micro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426924  |      
             olimex_a33_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426925  |      
             olimex_a64_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426926  |      
          olimex_imx233_olinuxino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426927  |      
                    openblocks_a6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426928  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426930  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426929  |      
                     orangepi_one |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426931  |      
                orangepi_one_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426932  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426934  |      
                     orangepi_pc2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426933  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426935  |      
                    orangepi_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426936  |      
                   orangepi_prime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426937  |      
                      orangepi_r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426938  |      
                     orangepi_win |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426939  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426940  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426941  |      
                       pandaboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426942  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426943  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426944  |      
                           pine64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426945  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426946  |      
                qemu_aarch64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426948  |      
               qemu_arm_versatile |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426949  |      
         qemu_arm_versatile_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426951  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426953  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426955  |      
                qemu_csky610_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426957  |      
                qemu_csky807_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426959  |      
                qemu_csky810_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426960  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426962  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426963  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426964  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426965  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426966  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426967  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426968  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426969  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426970  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426971  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426972  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426973  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426974  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426975  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426976  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426977  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426978  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426979  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426980  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426982  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426983  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426984  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426985  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426986  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426987  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426989  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426990  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426991  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426993  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426992  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426994  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426995  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427005  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426996  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426997  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426998  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427000  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516426999  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427001  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427003  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427002  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427006  |      
                    roc_pc_rk3399 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427007  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427008  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427009  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427010  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427011  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427012  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427013  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427014  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427015  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427016  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427017  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427018  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427019  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427020  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427022  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427023  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427024  |      
                  stm32mp157a_dk1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427025  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427026  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427027  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427028  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427029  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427030  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427031  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427032  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427033  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427034  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427035  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427036  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427037  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427038  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427039  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427045  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427105  | ORPH 
         TestCheckPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427288  | ORPH 
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427106  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427107  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427108  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427109  | ORPH 
                 TestExt2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427067  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427068  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427070  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427071  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427280  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427281  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427282  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427283  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427284  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427285  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427286  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427287  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427073  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427051  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427052  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427053  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427064  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427065  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427061  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427062  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427110  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427111  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427112  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427091  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427092  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427093  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427094  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427095  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427096  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427097  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427098  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427100  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427101  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427102  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427103  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427104  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427075  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427077  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427079  | ORPH 
...so9660SyslinuxExternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427081  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427083  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427086  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427087  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427119  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427129  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427115  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427117  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427122  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427139  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427141  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427127  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427131  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427148  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427133  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427151  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427155  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427125  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427144  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427157  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427161  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427272  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427136  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427120  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427130  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427116  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427118  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427124  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427140  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427143  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427128  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427132  | ORPH 
       TestLuajitLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427150  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427135  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427153  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427156  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427126  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427146  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427158  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427273  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427279  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427137  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427159  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427160  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427162  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427063  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427163  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427165  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427167  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427168  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427170  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427171  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427172  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427174  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427176  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427178  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427180  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427182  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427184  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427185  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427179  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427058  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427186  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427187  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427188  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427189  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427198  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427190  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427192  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427195  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427199  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427201  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427203  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427205  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427209  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427216  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427223  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427233  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427113  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427239  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427244  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427248  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427252  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427255  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427259  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427261  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427262  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427264  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427267  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427270  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427191  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427193  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427194  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427197  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427200  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427202  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427204  | ORPH 
       TestPythonPy3Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427206  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427211  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427214  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427217  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427220  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427227  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427230  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427235  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427114  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427241  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427245  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427250  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427253  | ORPH 
...thonPy3ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427256  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427260  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427263  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427265  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427266  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427268  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427271  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427054  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427055  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427059  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427060  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427274  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427275  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427088  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427056  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427057  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427047  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427048  | ORPH 
    TestSysLinuxX86_64EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427049  | ORPH 
...sLinuxX86_64LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427050  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427276  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427278  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427089  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/516427090  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                classpath-0.99 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/e5887d81c0c809e7809024a34bd4a11cec6643ba |     
    or1k     |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/c627489026780c0ff945f5a6f3bbc0af1120e173 |     
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/0a849a59189802237e94f10f1344c22c523ec144 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                 dmalloc-5.5.2 | 1 
host-google-breakpad-7515ab... | 1 
              host-grpc-1.23.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/ed6038489480aceff250a482858ec86241820bca | ORPH
   x86_64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f87433704a7f228dbb1fab329a65dbe9551d0a95 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/be8b3f428ccb9c799b0f3f6912c82124bb52c722 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 augeas-1.12.0 | 1 
                  bind-9.11.13 | 1 
                host-go-1.13.8 | 1 
               libglib2-2.62.4 | 1 
                libxml2-2.9.10 | 1 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/f50a57904e0b4cda95133a83ea8371223e3714dd |     
    arm      |          bind-9.11.13          | NOK | http://autobuild.buildroot.net/results/0ce491bef1894ee0afeb0f1417a643cac8922772 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/fad4c42719b6380c054cda13fd5abe220fecfec2 |     
  riscv64    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/0941a8101d33e15f5650534481f37e62afe007fb |     
    arm      |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/0432fb1b5a492d31065cd268163f214c0642fd7e |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/68d5f029616d6d2642e0178b71840794c7e91fa9 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/576a93416edf7f2b87614cab621ce2c69b6c316d |     



-- 
http://autobuild.buildroot.net
