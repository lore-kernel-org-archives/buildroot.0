From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 May 2020 06:27:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-25
Message-ID: <20200526062750.50838203C7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  5  |  3  |  0  |  8  |
    master   | 72  | 72  |  1  | 145 |
     next    |  7  |  4  |  0  | 11  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-gnupg-1.4.23 | 10
                qt5base-5.14.2 | 7 
              host-audit-2.8.5 | 6 
              host-grpc-1.25.0 | 5 
               belle-sip-4.3.1 | 3 
           host-nodejs-12.16.1 | 3 
               libupnpp-0.17.2 | 3 
                   mimic-1.1.0 | 3 
                  zeromq-4.3.2 | 3 
                    brltty-6.1 | 2 
                   cvs-1.12.13 | 2 
              host-erlang-22.2 | 2 
           libusb-compat-0.1.7 | 2 
                 mesa3d-20.0.7 | 2 
                 samba4-4.11.8 | 2 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
               asterisk-16.6.2 | 1 
                     avahi-0.8 | 1 
               collectd-5.11.0 | 1 
                 granite-0.4.1 | 1 
               host-efl-1.22.3 | 1 
              ibm-sw-tpm2-1563 | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
                  ramsmp-3.5.0 | 1 
                ramspeed-2.6.0 | 1 
                 rocksdb-6.6.4 | 1 
                  rygel-0.38.3 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/10dd7c89f4db0dba0022246ba996b423a9911f51 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ec8e0d1c449097a1bd062c42026a2cabf4a5c700 |     
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/04fe3bac76f39cf97e1730f5854e7ef1d8950630 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/6a974b33cfcc7ea16d1477d03b0f552c65db4fd7 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/412f0fafc401bd800c6d3c37aa75ed3e35c28eab |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d1e7bca2b409f0f81d672977d996dd61d0e91fd0 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/c92c4857d48f132a4a8a8411e436422203575b1f |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/cb7b11cd65f03e0dcc330d6f85ad48688127737e |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/05ba0b51d6fa10ad4b30790bc688359a17507b8f |     
  riscv64    |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/e3ddd469d737104bb5e2dc81721bbcb8e915688b |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c73eb78df87a55253596b950b4eceb0a825e8027 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/65bf2f67f5e7e3a54b5f9c8a31b3adba03fabcd1 | ORPH
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/3e2cc89b9bd42824731d0c7b39dd5b5c98e527ee | ORPH
   mipsel    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/38d9f6f7ee32990d199903d0450d9d8281544693 |     
  riscv32    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/612641e455430ce9b329d95412e47dda4b0d4bfd |     
microblazeel |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/eb1a4ad403f55ec5ee29dbafe7e2c29574b2f69d |     
  aarch64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/384393926df504b84bcc9ea68d2fda741fde9296 |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/bac6ea7ef30bbf207d84e9e3dc6a2a6f8c8c5f90 |     
   nios2     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/a6a4339b6fc2ea36883f3b70413b56738343a23e |     
  powerpc    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/5ce34d45c222245d8e809537c2294b382c4c8937 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2e5da34e781a00011385c73c365c1a89eade2582 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d662a073c26e19809601b6f56ad74c7830a533eb |     
 powerpc64   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/29af30f553951ed9b4196f28a4d3fe6c093ca02c | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/5c5c03b231d79430b0950d01fdd35d62c9a0a7b6 | ORPH
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/87b2371e88ab05b819ce554947062c5f9b7a1b18 | ORPH
    arc      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/24baa6ad191cbf482bba1f0423858a52cb196898 | ORPH
  mips64el   |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/0c7696d0cbb149b91ac191de94405f59052992bd | ORPH
  riscv32    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/baa4e18f4264d2589c6622cf829f9a3dfed1b2e6 | ORPH
   xtensa    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/e854a2ab90ea8a47f854af538ce4c070f9009cbd | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/90cc5b6fc3678a919000e0c56f274e08a04f5760 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/4b24eeb22dd22880ae0e76f9183f7142865e847b | ORPH
  riscv64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/878ad613cf90282ac5c1ac385d080ef101491494 | ORPH
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d3ab4a402bdbf237ec6e42eb181cbea103d74d0e |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fd0407a9978cfe837a835f60c2301e3819db1a58 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aaa562dbfad87615dd4ed160dfe8e0247ba3e217 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8a1847f082a55ee8ce7b6470e3ca923d9bfaef6b |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b6ce55edebd5429770ce1972fb77e3912d0f9812 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/1994c73692266fb964157f5c5fe363d3e29ad56b |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/67c603dbd911c398199ee72e3e7b8d8768f3bf42 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/6e8fa042247f79483cce50c16f2d9536663ba343 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7f6ba14990fc11dd0ffbb695721fca7665bb758e |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/76d6da14090039149ebf1c3197ad753b30371ea4 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/b4e5fe7a13fef3dc33530c7bd7baae3682331335 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5a0755d97cd8343655c34dd700cc7aef23e4e914 |     
microblazeel |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/a41087a575f7779e042e4bcbeb107c5369580fc4 |     
   xtensa    |      libusb-compat-0.1.7       | NOK | http://autobuild.buildroot.net/results/58df121dd2b53a1acb4e8f862946204f77f01e60 |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/2e1c5483c24fe4876f61ba1f899bda866ca6b259 |     
    i686     |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/70d337c7a9e45acb2ca7db74f0b5c1f58d16db94 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/65652fdc4f9b496a113c9db3102f85e1cbf1b86b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b474f2c182a365411267b375f71d1d48a142d5bb |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e8f3179e4ba62209f20846d2b4f3081a4c8a7325 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/3c5fbc11559e5c623cc1a903eee799dd66b175eb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/9ddf38a1366b2b8c82d8de65f004c3b6f0ce972d | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/16fa2ee068f0d5f708a129bf109fc0eaf1587924 |     
   xtensa    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9cc4d48601b53dbb774ac493f880eb78c72407ec |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0f70d902e36a5096dcacfd1585f20c0e48169bea |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/cc865ebd2917192996c6d1341d08637b73fce6c0 |     
   sparc     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/dc5e2bd68d511478d2a2eeb1df9fdae872ef9a76 |     
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/9a53600cb3079ba27c7719612e92faf78e75d668 |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4a613f9f4c69369468f6fc601e59712bc93de2e6 |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a75e697b95f9ffa8f32552321c8d95583a43db6b |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/76b8da5c96de829a558b5360c7e74760f16e59df |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/ec6de27cd35e569ff59365d3080e249c4d7cca14 | ORPH
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/a2dd86f53afa1af86e0551185d6ece7a8d711d9b |     
    sh4      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/30c17f59b617aa4ec0a61fbf3c834c0be7ded98c |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/fe18c583b85ba06907a83cede7e601b72ab7ffa2 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/d0e47359153e4d5e916aa91245bf2885ba6deffb |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/244fe7aff5960039145da5b2d0d875f204f8e08b |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/ec9dd2a3d93b552f71730afd3e6eaff98217c656 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/7a357e96b75642c54db164c5d24ac946ea7104bc |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b0a534320d64f3e1d15bc9fa069b00b0876807f2 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b012b7c8fc9b8e9d3976e827b30716c2cc8f0ae6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e1567936d951973d3067628246e30c369096cb11 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 2 
              host-grpc-1.25.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/de51303a9d5427b3ca8127e0b7b59914945d633e |     
   mipsel    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/3d273509143f8a8b2b7be8190e7a1894ae53749b |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/db9823fbfd8ccb7e2ba2910bf1ab2dfdd3d792bb |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 2 
                   gssdp-1.2.2 | 1 
                  umtprd-1.3.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/0a786102940036bfb149322571044e732eba1764 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/cea615ab98404f98a86f8390c2310d1259a7ba14 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0887cb7a9dfff656be9dd028282125d97a146ab1 |     
   x86_64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/a1cbe30246c13e9db183090922dd5ff36ec89ddd |     



-- 
http://autobuild.buildroot.net
