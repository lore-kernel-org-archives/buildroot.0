From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 May 2020 06:26:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-23
Message-ID: <20200524062637.7FAA586FEA@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  7  |  0  | 17  |
    master   | 105 | 58  |  0  | 163 |
     next    |  8  |  4  |  0  | 12  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-gnupg-1.4.23 | 6 
                qt5base-5.14.2 | 6 
               host-efl-1.22.3 | 5 
                       unknown | 4 
              host-audit-2.8.5 | 3 
              host-grpc-1.25.0 | 3 
              bitcoin-0.19.0.1 | 2 
      dovecot-pigeonhole-0.5.9 | 2 
                      fio-3.19 | 2 
                 gnutls-3.6.13 | 2 
lrzip-8781292dd5833c04eeead... | 2 
                  zeromq-4.3.2 | 2 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                    brltty-6.1 | 1 
                 gerbera-1.4.0 | 1 
       gst1-plugins-bad-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                 haproxy-2.1.4 | 1 
              host-erlang-22.2 | 1 
           host-nodejs-12.16.1 | 1 
                   libnss-3.52 | 1 
                 mesa3d-20.0.7 | 1 
                    mpv-0.29.1 | 1 
                    rtty-7.1.3 | 1 
                 samba4-4.11.8 | 1 
              spandsp-20180108 | 1 
                    strace-5.6 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/bb1d33ae1fa9929906fd276be1b8a02bf5c247dd |     
  riscv32    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/c23e43d4011798663b5bdd1534fe673e418d1227 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c8fa8bd58de2b5c96bbe284c76907ba96af0e8d3 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a6c3a130a3398f5581eae1ca83a1e08bbd00062e |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/a2af54c39b389fa196f4772e2e7b0fa7a387f3f1 |     
    i686     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/79f84dc5fd0c7f509f8bb0bdbca916654039a8f3 |     
  riscv64    |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/b62884a2fc3f23f49f854314889f79e49121684e |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/697bce287eb03f689964bad46f20f6d44476a03b |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/6dc82572ae1369aa5c9954b6e61777766c5aa3b4 |     
microblazeel |         gerbera-1.4.0          | NOK | http://autobuild.buildroot.net/results/7a53a59dd08c043f371bea967c3b450a7bddcde8 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1557fdbd14afbe915ad02ac421b35bb83333c1f7 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1c668190a9b619d662322efcbae5b46b78b319eb |     
powerpc64le  |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/21d0375d21085ac74af5e5a4e87f1a08d7ce02f7 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b00edd8a84b4bba3e9604fce521585433ace02e7 |     
    sh4      |         haproxy-2.1.4          | NOK | http://autobuild.buildroot.net/results/3cbb34238a76f491b024c857aac06d7a6b07bad3 |     
    m68k     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/c6b9196d77249c7a6fe72436c93b25529b89607f |     
    arc      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/b4a4520f389a83ee8b53dc09bb1c872d657cb140 |     
    arc      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/58a21642812339608960af26a9639f4655971084 |     
   x86_64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/4eff9b3b69672d3b6370d932951ea421c4a45442 |     
  aarch64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/c13681ffcc03257fe133a2036086807e794beda9 |     
    i586     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/c1ba4f4d37f6474fd07c8f4f67c36362a82889bd |     
    i586     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/15f94bf02f4faaf350a225756839835b10e572e9 |     
  powerpc    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/6d08f3f0ace3696d14e6da0abcf374a3b8151af3 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/581d166697fb6f54e1ee6be74015e606be7c5086 |     
  riscv64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f8c4464f4615a1d7096b4a627053e9e0825845b6 | ORPH
  powerpc    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/c53a8497e98747e5a2c371ab3faa22809f578978 | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/c603ed93d51c4fd149c3d64b9477c6685d335b21 | ORPH
  riscv32    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/9a83e6e9e734623876310ae4ed5b325fbdd00cd6 | ORPH
    sh4      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/9df5f110cd1930320e2d7fdcbabd65259ca3bbe0 | ORPH
    m68k     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/24d644c469831962c2bbc31994a5bf6b3357043d | ORPH
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1fdb3e2a0d46d2b64fb2fc3ed6652fe094d458f |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/831f95c541f21be3688a3abe5fecef56ad787309 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/42de48d4dddc6c18b3e926e8f3dc61c30f4a0257 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/18095e147a2292c35740e0ceb82ddfe8df88e473 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/652e270a21946920317e5a228f672c75653d9a4e |     
   x86_64    | lrzip-8781292dd5833c04eeead... | NOK | http://autobuild.buildroot.net/results/fe403a496e94af23823e2fd4d6f66f28774594aa |     
   x86_64    | lrzip-8781292dd5833c04eeead... | NOK | http://autobuild.buildroot.net/results/800d8a97966ef75dbf20e85ec8a02766ba02cc76 |     
  aarch64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/067ad3d2884927676d193b5c21694e4c14aa7928 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5e1b53d5da2c59f6209b22a6e9ab1f53977ba9ce |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/72cecf9c54d5d46892f688dd7dc55ae0c952c7cc |     
   nios2     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5630a359ad5bc5150fe9b09c37913ff601d465dc |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/83d9529b687bde6307bf273e12e1487099611a84 |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b4e44b27279e10a01858d72d95ec257c284f752d |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4fa8ceb359d2a6845871d451638a8007701f59b9 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a0139bf3e73b12c0875c95d6147043ddfe6038b7 |     
    arm      |           rtty-7.1.3           | NOK | http://autobuild.buildroot.net/results/d28ac5074307239c7cd63cde9b952d47f9eba921 |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/2ad541f71fd42d06b3a2b23f0f16fb1f0e4251eb |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/ca85fbd1320f3f8615f942567727785fb86b4196 |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/f26a4f2bb5a9b25739e55be5e5ded2b83a0937ac |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/34e2e7605565c32ddf954c4be0a76b49a6a915ac |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1a2e10c56a7cba909fb8c786993eb844d121532d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d38e3c918f53a3c247618593a362213375597273 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/60085815d6a76ef00568e335b3ca63874d1e42dd |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/794048dc17aae2d2c2b3ce9b01852df38d0ddc4a |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/da996e189220499b85efbdb541a891ac18db38c6 | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/a3d1b913522730d1927463fea8bb711f71e7d720 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7af561f071896cbdf723af43e0cec9370758d489 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e15ca8f93ef39176be56ee0c824d209a42b4f2e2 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-dtc-1.5.1 | 2 
                 augeas-1.12.0 | 1 
          host-checkpolicy-2.9 | 1 
              host-grpc-1.25.0 | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/a87121651aab4667efafdaf575a2e87386958d79 |     
    arm      |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/70d9665610dc8bca9cc76b152a6fc153451d3e94 |     
  aarch64    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/70b8e00e6fd1012fb1c89a80ce9cd5656d0ac7a3 |     
  powerpc    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/1c783427ba124d5cf0a7aa9e3ef41e7492ce35e9 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1e0b7137b0143699aae67214b51fefad33749d85 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ff8e5dea90d10275220dda96635a4dc5615c4de7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/58097032f1f6fb426d204eeec8296350630f1494 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 1 
          host-checkpolicy-3.0 | 1 
                   libnss-3.52 | 1 
     python-argon2-cffi-19.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/9e2b886494df49968ae8a3037a50f795c4219e85 |     
  mips64el   |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/7f5793b113bb14043e1b25d0272579f9bd786cf5 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/ca59afb2eaa0c18e97f05fe9e06f5f525d178ddc |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/823be7892079139a1481ada716aabb83b657c235 |     



-- 
http://autobuild.buildroot.net
