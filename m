From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 08:11:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-29
Message-ID: <20201030081119.387E9867D7@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 34  |  3  |  0  | 37  |
  2020.08.x  | 19  |  4  |  0  | 23  |
    master   | 169 | 78  |  0  | 247 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 13
                       unknown | 9 
 host-libabseil-cpp-20200923.2 | 6 
        host-sentry-cli-1.57.0 | 6 
      libabseil-cpp-20200923.2 | 6 
              host-guile-3.0.4 | 5 
              asterisk-16.13.0 | 3 
azure-iot-sdk-c-LTS_07_2020... | 2 
                  boost-1.74.0 | 2 
               capnproto-0.8.0 | 2 
        python-m2crypto-0.36.0 | 2 
                  uhd-3.15.0.0 | 2 
                coreutils-8.32 | 1 
                  dnsmasq-2.81 | 1 
               domoticz-2020.1 | 1 
                  ffmpeg-4.3.1 | 1 
          fuse-overlayfs-1.2.0 | 1 
                harfbuzz-2.7.2 | 1 
                hiawatha-10.11 | 1 
               host-efl-1.25.0 | 1 
                host-go-1.15.3 | 1 
                   libcap-2.44 | 1 
                 libraw-0.20.2 | 1 
                  luajit-2.1.2 | 1 
                    mpv-0.32.0 | 1 
                openblas-0.3.9 | 1 
                    quazip-1.1 | 1 
              sigrok-cli-0.7.0 | 1 
                  sispmctl-4.8 | 1 
                snort-2.9.16.1 | 1 
                   sshfs-3.7.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9777a00f2d4cb551de723359abcbf14675faf59d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/f680030565bac5129f4f7d2a04ffd7ac8492c135 |     
    arc      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/999bb7fd80869e259d6f1c22da6f5f6682512249 |     
  powerpc    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/373e1010787a9b7495b6d237df63656f3adc3103 |     
  powerpc    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/ad7ecd00d8f55c7cae5886c38c097ff0d071a962 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/5d034883c15909815f469a27491e912dab835a93 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/af119311e522e511f958499872b83eddfb709203 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/df6cec1edbdfa2250f7ce6941def9eb6eb56365e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bc44ac9fbe2c708e6f0572d61a1f22633756687e |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/3a3bfd5617667ecc848f17103aea5697215bcd94 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/4375ea4012f69a1fdd349efa2ea550ad6a8df83b |     
  aarch64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/6f2e92a5e8e194b7a6a650e9a20d8ef5dbe6cb08 |     
    arm      |          ffmpeg-4.3.1          | NOK | http://autobuild.buildroot.net/results/74cdfe9c9d3b326827935800547276e45297edc5 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/96d473d818d686f4f6d68defa4dc85070a788847 |     
    arm      |         harfbuzz-2.7.2         | NOK | http://autobuild.buildroot.net/results/589cd0d4901baa13361a0539806ae907a622a81c | ORPH
   xtensa    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/c2bafc74de9a9bca0ac444770617ab2eac71cafe |     
  aarch64    |        host-efl-1.25.0         | NOK | http://autobuild.buildroot.net/results/13000d8e35f99564d97383d501cf616c52f84fd0 |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/93e5958fabcfae9badcf1374eece71520a175bb8 |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/52e324aeb12e320a895cf7a70a3f75a0db57e46f |     
  aarch64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/11a7d05fc51c822cb7840b3373e31a07003d6e10 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/86fcb381d82a8736a4b08fb7d97e58049f6b8703 |     
 aarch64_be  |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/cd9d86b8f8e97928b1b49081dad7a0081c71ae34 |     
microblazeel |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9ee0a76f12b3a2584aaacde079d03310c46a5050 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/d56d91c2ddd10ef65f6f0e56f0f3d3a86a254ea4 |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2dd0a59315ca89f573e786c989b8a911ad34b552 |     
    sh4      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/ae66e19d1e742792670c75d4b340b80f124ed161 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/e5d78e9d8e0f0cd75b0ca6d38b0a66e07e5003ce |     
    sh4      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/8ce7a4050c19b1a4f3555716e11e66671790f96e |     
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/0950ba7608afcec9efcc1c412cda701c3f3194c3 |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/98a01f95a110a2dc27386ae09fa9fc8c036ce51b |     
  mips64el   |         host-go-1.15.3         | NOK | http://autobuild.buildroot.net/results/cc7e38515bdfd6ac9ab97d2b8053bcd01a8031b1 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/7d888c87fb0f22b612b84d081ed5b469082814dd | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/0377f348aacb277de03ebc35a2c25984ef78d95a | ORPH
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/fb2a1da9af08cbcd7e1a6c938fbc64fb6a778555 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/13d6ba7138a1391bbfe98cfe2d3cf5a071e15ae2 | ORPH
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/e7fa518162b8bf46357f974234d86d4a89ed0112 | ORPH
   mipsel    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/47734272a23e4bb28fae1978c277483ff6b15e21 |     
   x86_64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/3c4c6459488ce95c2137ccb4f03feadce511eec0 |     
  riscv64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/948d45dc682ddb6a00a3d0cf89ee9c5f68fd75c9 |     
  mips64el   | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/e94a54f0a6f217429b0beff70d273a00e44eedcc |     
  aarch64    | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/fcbc6cb9f5f31f72f48a7650838361d1c09cfad5 |     
    i686     | host-libabseil-cpp-20200923.2  | NOK | http://autobuild.buildroot.net/results/99438c754f2f1fb020f3d98de39cbe89c4e9d675 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e35b618bd7d08c4c0bf17cdd976e0137bc61968c |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/912f5badc644a71b71c36fe3163b430483a07661 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b9aca8532a6157b4e58368d1e2552740cb54f80b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0dcf5cfe569825a5555fe9337d497348d4591bb6 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6b3ac3340dc9bdee4d7efbb383ba18223342e77d |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a283a0f913b6358bce44d80502d1d53a9bcd73d |     
    mips     |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/c06eb6d91f9ebca4990acab582fc9984d1d64d45 |     
  mips64el   |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/7ac5ec951cb4499f189132a211e8f5c607a512f0 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/3a1098438fd86572538569079cf0971c2d3912fb |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/43bdef424031469248ed62583d39b244474d1446 |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/955c3bdfae077a5840733ffc56ee49a73154903e |     
    arm      |    libabseil-cpp-20200923.2    | NOK | http://autobuild.buildroot.net/results/8d04d156ccdb7285ed702266992b31eddafc94c0 |     
    arm      |          libcap-2.44           | NOK | http://autobuild.buildroot.net/results/640c23c84c4b6906f2feddc227db1d0fad217fb1 |     
  powerpc    |         libraw-0.20.2          | NOK | http://autobuild.buildroot.net/results/c9474b9fd6eb55ea6de96d6286e35733cea65b25 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/cd0a4a68b945b7eb02375ec2039abe61d9a80a45 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/c19e53017dc99b2cb35e33b6051a6e93e38ef6b2 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/2f9e05875ecec6a1ced9327ac6bb43f4c49a71ae | ORPH
 powerpc64   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/b1df1fb963851b7814c964f6244a820e813f9aa9 |     
  mips64el   |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/a8d4dbd78d6753ef106e58fce5edc57c874c1d18 |     
  mips64el   |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/ceb2c1e8d4d5a970bf1fb01a3a97bbb9a7ee970d |     
  aarch64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/9e6c831c15a0ffde03b102d4e892f40a6e0661e2 |     
    arm      |          sispmctl-4.8          | NOK | http://autobuild.buildroot.net/results/079f1454121d38a83c49529c0f6cc8ed61fd5abb |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/2eba8cf221ecd5dc8b763ab79598e3bc680fbc94 |     
    arm      |          sshfs-3.7.0           | NOK | http://autobuild.buildroot.net/results/f055c2aba0c72b379352488c21684858d911ec01 | ORPH
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/cabc7a87ee869d6bac7d092c1a4fcfcdac22a96e |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/b501a8bf90f2eb10c3f98f26a52539392d320088 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/3d18b9a0afa42fe616c90df835e5e27291f7811e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ced6edbe441f96f04c36d61b0596d0b4133b40e4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/10887337feed01a7ad61d13be3abb8ceaa9a4de2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/97e99cc45561dba7011b1c571a985abd8169505e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/1d7fdd592689e6d87c5a2f91ed6cdef3e6fd8453 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/dab9ef91d478de749efa35f9b36bcacf231f851e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/64dfbbd6d2164d7cf38b660a8609e5624c9df49f |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a551a7012410052faa7d18c5edc3edf62919dfd |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/80ebf057c1287eb9aa4f72d6c0ef8bb5ec6cb7d3 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/49d14cf2a1bf0ee59de7049e7db469ca7a4cfebe |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libnetconf2-1.1.3 | 1 
                  luajit-2.1.2 | 1 
piglit-ef761094be04d14e258a... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/b7557fed6204ce51dde52eb01e52897824f2649e |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/b88231ebd320d3e8bb9300dd22197bdb735984a5 |     
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/2cb799919d47e57eb401b7ece00b65707f9bd3ec |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

   gdb-arc-2020.03-release-gdb | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
               wireshark-3.2.7 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/54a371d0d7ebd7b0f5506feb85e38eed6cc0e8b3 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/719e18e697052f607514d8ebb95ee186f71ab7e6 | ORPH
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/66a7a01a0a69c740cc16877188b99c1accd8bab0 |     
  powerpc    |        wireshark-3.2.7         | NOK | http://autobuild.buildroot.net/results/457a6f6eb21ebc2d2ff2520a123830fe17d33134 | ORPH


Gitlab CI results for 2020-10-29
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818356835  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818356905  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818356956  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818356957  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818356994  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357039  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357042  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357091  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357093  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357123  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/818357126  |      



-- 
http://autobuild.buildroot.net
