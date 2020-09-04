From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 04 Sep 2020 07:09:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-03
Message-ID: <20200904070929.6709486D72@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 35  |  6  |  0  | 41  |
  2020.05.x  | 28  | 13  |  0  | 41  |
  2020.08.x  |  5  |  3  |  0  |  8  |
    master   | 115 | 121 |  0  | 236 |

Classification of failures by reason for master
-----------------------------------------------

              host-grpc-1.31.0 | 16
              netopeer2-1.1.39 | 14
             stress-ng-0.11.17 | 10
                       unknown | 9 
      spandsp-3.0.0-6ec23e5a7e | 8 
                easyframes-0.3 | 6 
                 gnuplot-5.4.0 | 6 
                   libcap-2.42 | 6 
              host-libcap-2.42 | 4 
   gdb-arc-2020.03-release-gdb | 3 
                   guile-3.0.4 | 3 
  host-python3-requests-2.23.0 | 3 
              asterisk-16.10.0 | 2 
             kismet-2016-07-R1 | 2 
                  luajit-2.1.2 | 2 
                   mimic-1.1.0 | 2 
           wayland-utils-1.0.0 | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
                   eigen-3.3.7 | 1 
              host-guile-3.0.4 | 1 
host-meson-tools-0a02e2d344... | 1 
                     kbd-2.0.4 | 1 
                 lcdproc-0.5.9 | 1 
               libupnpp-0.19.3 | 1 
                  linuxptp-3.0 | 1 
            live555-2020.06.25 | 1 
              micropython-1.12 | 1 
                 midori-0.5.11 | 1 
                    mpv-0.29.1 | 1 
                   nanocom-1.0 | 1 
                  ndisc6-1.0.4 | 1 
                    olsr-0.9.8 | 1 
                 opencv3-3.4.9 | 1 
             openswan-2.6.51.5 | 1 
            qt5location-5.15.0 | 1 
   sofia-sip-1.13.1-d10a3d268c | 1 
                    strace-5.7 | 1 
                  uhd-3.15.0.0 | 1 
    xserver_xorg-server-1.20.9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/b3a45d82f71e252be5fd16ba848e6b1a59a603f9 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f22597332df9481748d53f336091451692928cdf |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c2c75e9bd2bb0c3eba163d9da6b07d7c28d47be3 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6d859067bc73a302c53adc375f1dfd02271723e4 | ORPH
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/4092458092e0e9662097c13f52b59265ebead582 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/4b844cf98a7a4ad08d2898fb2a4bdc20ebb182ec |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/31b002296a8e9e6a4cc4f22e19450f3b16c54f8e |     
   x86_64    |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/0e43ae29c3371c5f9cc60605dd2ce438eb4abb74 |     
   x86_64    |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/f083868f03b256e0b0cc385fdd66ed44a396e758 |     
    arm      |         easyframes-0.3         | NOK | http://autobuild.buildroot.net/results/bd5479f1e22eb1925883ead20f570a5fb5006906 |     
   x86_64    |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/d2f008dc2ba6dbd54032210297f6db3ef9a086fa |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/c0f906c1892d5d75c9abeb9f78cbc9b7cfbd7c49 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/09395f79d9b52b081c64b97ad98418738fbed86e | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/0d22a088172354f505b6c533c1c213b0d531b315 | ORPH
  powerpc    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/f8953d424c0a212cc914be769d9628a89516c2bb |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/2db58fad69b4679ea0f7eea463e22924ebf90d05 |     
  aarch64    |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/be7e7b3a0dbd3254900fa12e63d1d34dec79cf01 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/b5cce34ce4dd8ef3f123465e5a1cd0fd6d0c15a3 |     
    i586     |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/649bcf5b783cea0edb59f15fd2aa3255494b67f6 |     
    arm      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/83b1e2c3167e21092d501c06304b4e3395852e66 |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/a2f5e51bf6ac40f1b14997e916a521afa5c4e9dc | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/54d7113136aee832d66534583468d8bd61d7502c | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/e59e0e1c3629efcf9395912eb1aa1629c50025bb | ORPH
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/cbe13c72abb194987548a4a3cb824ea45aa699a2 |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/f576b5863f3be8c19198e4809f83342b2688877f |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/44cd4dd19d29f564061a9c54877cdfd124feef4e |     
    i686     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/17d8ac199c4c96420b279f3508bbbaabed766b5d |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/43c8dfdc3e30ee71bb7ccc756176f26fa2ddd4ae |     
 powerpc64   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/2bf3e5d66ba0eaacff975590a5663fb5271ab8c2 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/d046e3f3d30d615f0ba7ddf7892c152396bbf2ae |     
    i586     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b1850af391cfb49d98b0d4bc44bc4d268f0421cc |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/88150131c504c6462916fb71108ddde9d22c26f0 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/6489b0c952f1588fd26118a43b55347a7ce087de |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/7d4802d0654f5b025026aacfe6dcc50c8858156f |     
   x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/6b4f729d00c84eaab858e08c80000d07c23bcae2 |     
    mips     |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b884eb4c00303e295c1c0d5d3add42b84d346fce |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/87230a54f6f94e69bb9c92e09f0be798a4618b95 |     
  mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/4121b47e2a274f49fdbb15c0b88cadb36eba4ace |     
  aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/dbb793dfa045b6f82266e41a084f8444fa07552d |     
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/54f195da521ec2064569b79d088b6f8324b30d91 | ORPH
  riscv64    |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/5dc41c485933cd5a3f7362791ad20983ddd7e79d |     
  mips64el   |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/f923778f25bdbf1d3955b2659ff84b6521061e8e |     
    arc      |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/189431853d3c5ca8c11d5478c11cc432f180feee |     
  mips64el   |        host-libcap-2.42        | NOK | http://autobuild.buildroot.net/results/9ba173a60bb1f6b553247dca9d9e817e2aae5d65 |     
   nios2     | host-meson-tools-0a02e2d344... | NOK | http://autobuild.buildroot.net/results/d46177a0a0a77301107e660362474d0757cb1edc |     
    arm      |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/c6861024db9b18561ec82b9eb9d64401aa7c7a0e |     
  aarch64    |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/474819069a2531ce5db695e1be3929e99dbcd611 |     
    arm      |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/f13c75a66145d946095b885385a61fa2d6a77039 |     
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/2c7e6f67ef3098def6085856272d547c3cc1f8f8 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/552ee2eb4ccefbfbfd3630e3c8fa3d7e5099e86b | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ad74adf0d7b1ca7797701810071dd4be7758e4fe | ORPH
    arm      |         lcdproc-0.5.9          | NOK | http://autobuild.buildroot.net/results/8f56eb991db4bec266b9d18d8519a3ed18747aca |     
    sh4      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/6e74540f47ec12716a1f1d4bd157d28c1ad822ce |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/49a87b6fe633c0d0322a347906f9ecd11d012379 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/09a9a96ce8a391257f586b17a3bf17a92c331237 |     
   mipsel    |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/0c8fedf7de6955422f1930cc168aaf1d8bd590eb |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/2433fa227979738b1e41e817af767c778b0c7d27 |     
    arm      |          libcap-2.42           | NOK | http://autobuild.buildroot.net/results/3c1961eddd356766ed24b562afc50d14783ea1d9 |     
    arc      |        libupnpp-0.19.3         | NOK | http://autobuild.buildroot.net/results/b24cdcfa2fdc37f2cc67e125b875f3e461c1a0c4 |     
    arm      |          linuxptp-3.0          | NOK | http://autobuild.buildroot.net/results/1fd6d1c2cd9b5e11677bd3d156510d9dd70ebc83 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/e9f5970ccc0f89c0fe249f5c6beb2cdcf98c5634 | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/5be7b15226f43d9154332c6305151fa4f7e43bd4 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/ee1e40be6aee4f714d5a6f9c5fa31f4bffe01cc6 |     
   xtensa    |        micropython-1.12        | NOK | http://autobuild.buildroot.net/results/62f66f879071508cd7d9147e46a0ddd3afd40daf |     
  mips64el   |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/4b6f8c3533d19f30e3a3a510328598e662bb53cc | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6f3bd62e179e0a8035256945f594040c3345fbc6 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/693f9f5eea1f3ab15bfc04949e5b391f7734de08 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fd2301eb0b03bf8ca26fb535afc29fcb69788b0f |     
    arm      |          nanocom-1.0           | NOK | http://autobuild.buildroot.net/results/4af4710cb9bbb1bc770b9824339dd7dbf8a80b05 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/420496032185166bf559d58098b0c4cac8808b17 | ORPH
 aarch64_be  |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/ba141c902371ae27faffd21c98642b30c1c85986 |     
    mips     |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/55a594242593663cc85049d5e12b4cfe7a9d3277 |     
  mips64el   |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/e909adc264c7bcaa025857c28ff3532274fe6b57 |     
   mipsel    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/37293cd40f3aace0176eea1cf58a58438b879ac5 |     
   x86_64    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/c95618d147f93bc3b80560d8d2871baddd0cde0e |     
 aarch64_be  |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/3fe9a4b20aa9076d55bdca993b07c3ad7417864a |     
 powerpc64   |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/cdbae7d350fc6f51c17e28a119b2861b08136260 |     
    arc      |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/fa1b824937fdf8d1ceb243d38288c770d78faa83 |     
   x86_64    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/09423b9db358d215dde7fa36ada564913ae4c46e |     
   mipsel    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/61bfd7769c0ec9a94bea7be45e1c5c7a458bdcfa |     
    sh4      |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/ce5e79f68cfd7efdf7cd25f0b327b055548c7cfb |     
  powerpc    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/6228e7e01fdb7674b31f2c7daeff54bfa04008c0 |     
  powerpc    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/f951fe801c79786ee2ea1de1207b919bf90ccd2e |     
  powerpc    |        netopeer2-1.1.39        | NOK | http://autobuild.buildroot.net/results/12e00767a4b4ef8b0f2039e82ae385c4c91c6ae2 |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6fc100c7c4120bdc8ae084f9e71eb9c7d68d75a9 | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/43c8d97839d2f38ad38e6499fb6ea8fc1381cf2e |     
    arm      |       openswan-2.6.51.5        | NOK | http://autobuild.buildroot.net/results/1d801e70ed62030477d5567fa760d5a567d431de | ORPH
    arm      |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/d95b454d520fc7d37ecad4babd0dc08391746ae5 |     
    arm      |  sofia-sip-1.13.1-d10a3d268c   | NOK | http://autobuild.buildroot.net/results/bc7c8aa6dfecf95e2dea55c7510248f65b451cd6 |     
  aarch64    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/5418b52917a603c6ea81e33036dc012b280bee23 |     
  aarch64    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/04f64a665090362de94db5ddc402c0f5064aaad3 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/dacb2a8b49007c126a01ae84f42e14654ccaaf9d |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/382c9abb96587c811f674c98da5b4cd6b923bcd9 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/6b9300302d69c9a348db0ac2ee0ece48300c4091 |     
  riscv64    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/f5efa4aeef661670403111074b9397da47167d07 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/255a45b4ba249edda8b99657b54e079771b5d0b7 |     
   x86_64    |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/a5ff72da1c8e423556e07f2a429880b089215866 |     
 aarch64_be  |           strace-5.7           | NOK | http://autobuild.buildroot.net/results/6dd41d7a3cee2dce15c92834e3698c82ffc6de23 |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/b223a33c39bd63d7dd6e8f6f270174ba8986f221 |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/c21fa333f5d5402b5ece0351f7d5cb8647f716bb |     
  aarch64    |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/bdfa65e41301569e1b2ae4fe01662d0684fb24c6 |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/e02fd0ec3f4532a07b0df3908a3654cca2eeb7a3 |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/c69355250b6facf0049cb58489e5e6b23ebce68e |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/5ed5f79082db6d8fe206c9565e7198ffdfd73de3 |     
   x86_64    |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/6aaf634f7ae50a8896aebc150ee937099f390b1b |     
  aarch64    |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/a52b2964bc076ddd200a6643bec050682ec1536b |     
  powerpc    |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/a1979685e77036799b231b3f382a75723b5e64a1 |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/17dfa90a3f8a5620f5f068aed1add4d17bf78b7a |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b91185b47cae1ef3ddaefc95a46a212ca38db1db |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c3d24beeaaf1d756f33f813a9d7a62ffcdbe889c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3418716f189354dc0d6084aa5b9e4b8867b5a885 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7d28aefdc6a20b438b47b62052e0c9ac47612d9e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/aafcb9c4620762f3bf681fc0dcf29b0407bcb60a |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ceaea0a323c924b5bc7a6276f139df49f0eaafc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/019651b7b23b29e1f972bb8b047b6b4e47cdc4f0 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/774c3c7483e77b831ac1644b794ebd5873405cb4 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6cf59158c5f72f15111d3faf935ae20ca0211615 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/934fa44fb0bbed28d6c1ed16a46c728e59e99394 |     
    arm      |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/d9d0ae0bc2e6dc0f1f9ed9737a767e83f79befb8 |     
  powerpc    |      wayland-utils-1.0.0       | NOK | http://autobuild.buildroot.net/results/681490655e89be6c4996639bbb9acd3f0c7935de |     
   mipsel    |   xserver_xorg-server-1.20.9   | NOK | http://autobuild.buildroot.net/results/f72cc9b30e55e2c665de7a00482a1c3ba702118c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   mimic-1.1.0 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.8 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/31041ec7ce00885e3fe12020cb5a1cfbc67f3203 |     
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/300b74f7e8e6272ce48c13f05898bce1272fd746 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/81bd1a51090eea4fcd9bf7a1d55c158fe92ffd1c |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/5053229e8b2bfa51e8190f8b4812ca73e62bd775 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/5a26aae01bf722fb08b0e61a90e8bbf4c275290c |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c5c7b8435fa3f5f9c3d8e78654798dca87e85634 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                       unknown | 3 
              luabitop-1.0.2-1 | 2 
        qt5imageformats-5.14.2 | 2 
               libtheora-1.1.1 | 1 
                   mpd-0.21.22 | 1 
                  ndisc6-1.0.4 | 1 
pistache-73f248acd6db4c53e6... | 1 
                qt5base-5.14.2 | 1 
                 rsh-redone-85 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3a49f0d8a3593b4ff2be287172d7d31ed153b93d | ORPH
   mipsel    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/23f66439bb1d77cf6926eefba8defe847e27022f |     
    mips     |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/390bcd6940a06d8a3c55e0ce6aad53882a511e6e |     
    arc      |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/a091520ad77696aa48530ab04406f8d5331386da |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7da667eb5909bdcd96e60c55f44e5aff7c97d604 | ORPH
    i586     | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/4c32f4e99ce5b427f83b0f29c0e915376d552d37 | ORPH
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c468050eb60654b9540e23101832610ea9671cf5 |     
powerpc64le  |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/f9ee2578caba3bb8f790416e18a96d8a0a951a7b |     
  mips64el   |     qt5imageformats-5.14.2     | NOK | http://autobuild.buildroot.net/results/7ce7b3c2f62e2c31b042779feccce7064e1beeed |     
  riscv64    |         rsh-redone-85          | NOK | http://autobuild.buildroot.net/results/fc7f3fe623887bd00ca9fb2f4ffc662970eb7463 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/48fc04c1b237d2c6b67a84bb4b1591575709ae40 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3dbbfb186324e415a901198c7d53d482b0e7cbbc |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/75efdcd8681bfa6ee1c3c9d0595a6785afdc0a7f |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

              dovecot-2.3.11.3 | 1 
libcamera-96fab38e02792a109... | 1 
               libupnpp-0.19.2 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        dovecot-2.3.11.3        | NOK | http://autobuild.buildroot.net/results/6a74684fffee45df76c04731a0cf824a5b460e3a |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/9dce26e94299a2c61bba60cbc7803926e2f85e29 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/ca5e4b33ea94098c57a4d47acf4075ebe003717f |     


Gitlab CI results for 2020-09-03
================================


-- 
http://autobuild.buildroot.net
