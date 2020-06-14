From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jun 2020 06:26:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-13
Message-ID: <20200614062651.D9E87884DD@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 19  |  2  |  0  | 21  |
  2020.05.x  | 11  |  7  |  0  | 18  |
    master   | 114 | 98  |  0  | 212 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               linux-pam-1.4.0 | 53
                     avahi-0.8 | 5 
                qt5base-5.15.0 | 5 
                       unknown | 5 
              host-grpc-1.25.0 | 4 
                  rygel-0.38.3 | 2 
                wayland-1.18.0 | 2 
                 xvisor-0.2.11 | 2 
               apparmor-2.13.4 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 host-icu-65-1 | 1 
           host-nodejs-12.18.0 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
                   libnss-3.52 | 1 
make: *** wait: No child pr... | 1 
                 mesa3d-20.1.0 | 1 
                 minizip-2.9.2 | 1 
                    mpv-0.29.1 | 1 
                    mraa-2.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
               pulseview-0.4.1 | 1 
              python-pyqt5-5.7 | 1 
          python-web2py-2.20.4 | 1 
                 rocksdb-6.6.4 | 1 
                    rtty-7.1.3 | 1 
                  umtprd-1.3.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/c0369df1cbf51bc526861e466f3ea631856435cf |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/968b521410f8aedd336f6edf64019b380597de14 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/875d78a77355f0aad2e02dca7973c8d943ef7ecf | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1fb1256ed85338d26852f0db0e25ac9a00462b45 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1b9bb4bb3614c0b8e281e6cc70f02c86823a0266 | ORPH
  sparc64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/37226461dad7650881f59fb67c3de13a1ccb43ad | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/8ce2b69bda7ae6671814cf66f1825208aefa11a1 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aebc075a13c0a2e6781bafff83cc0fd082370c11 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/29a01a1814336a4086bc47aefe877c6b5cf5df89 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0a656983d3a8d7697608cb26b3c16250b998e737 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bbed1a3238f601e8dcf6ef54491e0822f1ea1321 |     
 aarch64_be  |         host-icu-65-1          | NOK | http://autobuild.buildroot.net/results/4edb3719395d9035487a97b23288278d2d016387 | ORPH
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/3252f0f65d6c3ca9c5f4e51ee186242f08aeadc2 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/25d639e447850f47ae1918c96accf5f5051c5891 | ORPH
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/89f350bcd8928f1981093e7352df8ec6d3d8f912 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/1ea99205a217684af96148f95ad10b40e63a68bc |     
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d73e7fd433cfc651bcfc74d199abf70925ed1ddb | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3ceae8b844f29f52885ff9b70c1f4f4dbbcf0540 | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9dca7be1930140fd76e8951ad8df9a57917a6baf | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/73fb6599ef102663aa1c53889f340cb9e028f4d8 | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/84f4a07e681e684364b05814071aa22f907d5583 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0b8a93132c4d07bb13b9846060eefeef85d7d8d8 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/551c3f01f81736221ca4b0d7e9fec2bbf2988766 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/29553041552d2771eb855097f5552b79da861f40 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4615f337e1673cc9902ad85a6a9ef75670c39221 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/63e0068663df3e2aaad47d65c7d7902cf5998061 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/344e23dafe0917cf9b80fbc675e649f0f7fd36e4 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/96b724513e5cba12c5a666ee7e3561c445eb4a93 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/26977c21f5308ae83856057cbdf51ac95e98af5e | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/623c5a6faefe2cac9b6f2e5b1c2f2c102003d9a0 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/564d0771457f22f8b23ce1a7480d28b96e98c51e | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7515097074e50b8a7e31688c5f29e77afbe9c966 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/49af7101f34011e37b21ecc2717468a780594c14 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9660a8f7690f4126eaf8e6fa0a38b67561951c85 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/83588eac2f6b372a710d0ce5db08b81dd0929908 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/8ed5570e744bb187cf6775e43bd5f446b2b10045 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a0fced9d122886b7d2a5be86dbde7d517f537037 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/fe8ff8e91e60e5bed768880384d6008957784382 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2a6b2b3425f2420aa22db042456564938f5ed656 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/8fc9c36230dcfab71314ad2674ccec395ce8a4c7 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/57a7556ea07ab4953ff4c4640de7f45a9a9e114b | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/85e084d8031f044c7d6b06523ccf5b91ed48bf14 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a2ea6b2910d971cca4c23c7e9222ddeb42299deb | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/6582e25a64bb2cdef32d94fc9a1fb7c1abd669de | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/489a5c3f9ebc0757242a9db929f72208205dbc18 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d447badc6b8efd432ed8122be382b3762f6b4db6 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4e79c8863b33ff55b3f6cba5ca8cc3f729d1d6b8 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7ff57432bd8aa87b00759d67134aae78a22f0947 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9e30865d2f601024a994705c2ef8a0446bff56a1 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ac002ec224c2617cd6a22954f30023aa516106cc | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/514ebcc9a67c068a248a78be481efd2ce9d93ee7 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/31a00010362a6bf0d4eaee3f6e81e471a583e46f | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e3a01fa5523c17e60c214a27f9982b9d9bb4249e | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/219394ae79f7c48276deff2029cdfbb55bf831b2 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/648b67e64862d2b7f88910ff134ba583f93e17dd | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/091ed9573e67c9ec3c1ee51ffd5a470b1cfdc1a7 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0f6f88640968e85f61140e9eb0056c96dc0588f8 | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/85f7ca07c1c96b6e2105400ba180c23775e4b919 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/928b65df3f5fdb1afb61db8325b6872589e1fcdd | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4911f63003c8ce6ed2216c4d586a16f84fa36b7a | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/efe121d18625b23ed87e80f303c66f103da30abe | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/71796bd550d7f82a16873494e69c172acf89753f | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/c3cfa0def1dba8166ed324b8b38db3e02b6be899 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/44e4679d1acf6c6d4a964417930b5013f84fa2a0 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3ed55d8069f550ecb6e0af8f4eeac267cff2a6eb | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f4162397c8e6972ca4d34dcbac68385c55af1bc6 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/660eb45727f777203877f9b1567ac0f6547ec6cd | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a475824c3d5baef39de3fd925523eaa1ba84f240 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/41230686eed5787d4480bb57dead33d25c3ec1b2 | ORPH
  mips64el   | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/eb7766797669882c780d3abb0b15f780382fe910 |     
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/47cd80db2730c9749538b12a40ec16ba97f18c1f |     
   sparc     |         minizip-2.9.2          | NOK | http://autobuild.buildroot.net/results/b54b625751a45d3b449fffcdfaa06fb9209b4652 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/464193f70b578647ad9304095b272d2049a9a205 |     
    i686     |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/8e99eb282668f6f83f43c5be45112d82936e3408 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d2a70c43dbee5b454f1e447c868eefe523d80948 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/4191a26d04515259086c686be43123054fae04c0 |     
  riscv32    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/993d7ec4f33e418f4139ccaa445c564fb19efa6d |     
   x86_64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/1d725da8231a877b12b100225d19f289620bf461 |     
   mipsel    |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/2c976289008a2979e8c418da27e809c8d3ca8a62 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d8b2a5f66bf34f6d9a4701acf9567f69678f40db |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7b2762529b9b0de6a7393810891fa00301e85c63 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/faf1f59ee90f6057807aa7f1d29ea4321c295a00 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f08b3bdbeb94e71b4f29cf83f899ff265610719f |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/baa2e5de1593bcd645866fd89fe3667ade9b3ed3 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/853fd7b7e47fff0c0f3cd8c724e96b8bd060066e |     
    arc      |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/6ea1d3b8f0b2f75a798fe25ba75c649bcaa99320 |     
   mipsel    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/67967be60d59adf04e1a0ffbde0b43978d8eb9f5 |     
    or1k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/8936af8bcd390d75f55ef55591af6cdcd07199bd |     
microblazeel |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/187d611a72fd59a1e69728eee851186c1335d4c5 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/35cf6766daf253c16d8d3dee5b3c5b2cc317caf0 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/886b69037bfc92840a07683d80b4650b4c77aa6f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/48f341e29af6e12058a2d231782fd8ce593d885d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1ca4cb477a59c544aa7b4cadfffba529b4257513 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/09687de6df8e76c9015ef18fa3714778000b2707 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/c61a9755ccdd7fc36019cfe5c330a72bb62e2dad |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/d6ea470cb2ed2427347ac415e1ccd91c1252385a |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/03a5fd84bfef1a7d0e36aaff3a812a953b3ff366 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/bf34fa40a9f77fa1de4d16477d583673e9e6fe6e |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 at91sam9x5ek_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313374  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313501  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313572  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313592  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313647  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313653  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/593313984  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ebb6551cceb28b2d5fd884048e905cbc7a1ae0d |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e286e6f23f38c968447155aa60609d218c8e45b |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               belle-sip-4.3.1 | 1 
                    brltty-6.1 | 1 
                 haproxy-2.1.4 | 1 
              host-grpc-1.25.0 | 1 
              ibm-sw-tpm2-1563 | 1 
                   libnss-3.52 | 1 
                thermald-1.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/25287923f5b4ee499dec7a35a4e08cb6364c1a51 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/22b547db733cf2daf55dde0d014c00a668958a2d |     
    sh4      |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/126c048bec9f936529711cbd13729a46390c0fc5 |     
    i586     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4976ca66670135bf4a919318e30482b1a2d24d01 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b63585068715afa0ab14b4b67de99c9300d52b9f |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/b67e8d976b1a70002fee2a235f3a17c6cb7dd2b0 |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/4fb791765f9ad8616cf05cd1a3729ef0746504a4 |     



-- 
http://autobuild.buildroot.net
