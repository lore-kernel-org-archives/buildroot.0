From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Jul 2021 05:50:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-12
Message-ID: <20210713055054.2FAC181919@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 18  |  5  |  0  | 23  |
  2021.05.x  | 19  | 10  |  0  | 29  |
    master   | 64  | 72  |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 9 
                  exiv2-0.27.4 | 7 
              syslog-ng-3.32.1 | 6 
                   seatd-0.5.0 | 5 
                   libqb-2.0.2 | 4 
         host-gcc-final-10.3.0 | 3 
                libsoup-2.72.0 | 3 
                qt5base-5.15.2 | 3 
               host-qemu-6.0.0 | 2 
        host-sentry-cli-1.57.0 | 2 
             libsndfile-1.0.31 | 2 
   openvmtools-10.3.5-10430147 | 2 
                       unknown | 2 
                usbguard-1.0.0 | 2 
               capnproto-0.8.0 | 1 
                   eigen-3.3.7 | 1 
                    gcr-3.34.0 | 1 
                   gssdp-1.2.3 | 1 
                harfbuzz-2.8.1 | 1 
              keepalived-2.1.4 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                    libbpf-0.2 | 1 
               libtheora-1.1.1 | 1 
                    llvm-9.0.1 | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                      poke-1.2 | 1 
               pulseview-0.4.2 | 1 
       python-matplotlib-3.0.3 | 1 
                    qemu-6.0.0 | 1 
                      tar-1.34 | 1 
                xenomai-3.0.10 | 1 
                    zstd-1.5.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3e949530342c9f4458f8da58d02f5286a7b54631 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b849261f2f805519cc70e2e3ccbc2f404184654f |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/cd561f0e1958f945b6662045337b5bdfc4fad60f |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/09f0b8f5131d5debf5e1d9f47ad258973af11dca |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f89765f63a49459f24aec25e508b34aa57130c5d |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a32235e145185e25ca98a41d500283f0071199ef |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5686ed5045d1768aabe73e60a32187c2095e31c3 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/19fb434dbb1150bc7cbd97e70b161840563c377b |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4fa1193136086c54baf707b70df041848e8749f1 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a1eecbca72dc07c3c1d90ba11231d2a710636b82 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/9b051f7b64502319d26f760443d6e6678add0253 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8d0e62337f254228ef4969fa9219a7761d6dbd7b |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ea10a31e1b8c9ab54b97943096ff9d9077af933c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3a777a7adf2553c0a37ab454bc2c492af79f1141 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7a9f56d06fc9eefad71c9107811770f2bab4289f |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/33e977fc29a1e240faace272a49efad6ec466f9c |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4d949d73b355a75264ca128709b32a56bbebefca |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ebb8eb6bcab8df085ce9d035697108c3a597def3 |     
  aarch64    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/98bc3646bf7396f15a153b733a17956367bb18f1 | ORPH
   mipsel    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/3e4182781e0bd0472de958ac98bbcf80cffafd8e |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/a4a808d38cdac498446e0b3a6633650a2308b2b8 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/05677bfd9673db44b707639bf73481dfb9d0582e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/529481d4eabc7b135acdaf8408601209f5d9fae6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b6a375ac29973a06f0ccc09f4fe627e1a1948abe |     
  powerpc    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/7d4ee1db843dd86e810ab04f8c52d52353d03a6c |     
  sparc64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/676c515d6f91df177132c47ea145f1cc059b05cf |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/da1cf81e35accbbe6433e4e62d2010f855017f47 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ad5efef8fe4372cc378d5ddc2ebdc3b19b959d1f |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e796f2b80bd7c38f6984a37150a2c5e8ed8aca9b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a5ebddc19abee8025ee56402dfaa02864ccc477d |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/7f8e84220c2c4831434095f7e78c724f9578f8d1 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/f9bda8edf13338ccc65d14963d57bdbc0e9afb6f |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/0e95cafd211a5e06c40f5e61ca5e56378df61122 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/6d1c2df5b257ca2fdaf8289b5e8678d29664cac1 |     
   xtensa    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/1705e7f49392f7d7104e107d7574df8e17be6618 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/a7120718e51a3b7112483091fd78b877eb359f28 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c9a8cba46945a5e65832389c9b2775e98c74aed5 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/c26f43b5001fc98425c790e25c9a36f7de3c7ba9 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/81ff5999870d66a106f927fcc4f8ef9e64c7c7ff |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/259f992b903901ebde307b92781c769d97639ec8 |     
   xtensa    |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7091f59e18441c7fe30371589eee7848be441272 | ORPH
    arm      |           llvm-9.0.1           | NOK | http://autobuild.buildroot.net/results/a0e88b36417762844a918fd0f685b166829cf236 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ea1447ddd6e335c4782f7d0b5e56ef36157bf8ae |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f8d11e7a18c9a19e01f2c55fb077f085c69f0ee2 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e877deee3d4a6e3c20bede7ec0f38fdb5306c7fb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/367851ea985e118d67435b7f3bc60997d1262d72 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4e9441406b150ee0eb3b85d390feece63d809a65 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/13dc736cf6c31d73b758b149ccb9c0c6321d399b |     
   nios2     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/905619a0c372397d62441d80ae7e60b065478f8f |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/1936185994cb0d1aa031ba36d9b04381e24314f5 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/bcb35768c9060bf301291daefd92b8bfd43e0a5f |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/35129c32ab1abb718ad2183191ef188c7f50eff9 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/3f1a713b046128e22b98f27de30d0763c0a54a25 |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/172cf3221ce23b163920181f1231310a378aca49 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/b20bce7b6e9c96b66e1529f0a74f758b183ee577 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/a117ad0326bbf8af32daa02e8b369bc300ebef80 |     
   mipsel    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/075c534f902217090f7ad8291699b683f21abd02 |     
    sh4      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0676d0156096e982960cef2b14060580ffdc41ad |     
  aarch64    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/adcf3f13ba72d8d8a88fb51a05e17a16dbd61a8e |     
  powerpc    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/4b3bad155012d34b5428aa7e8be52595125b924b |     
    arc      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/6884b708d7be378162788a024f7e0b0b373c3880 |     
    arc      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/f35759b85d0531994fb71c41cbccead1822ad3ce |     
   xtensa    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/c3f4f239155422d773472cb111ccc8c85e26c44e |     
   x86_64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/16569fcb7fc9b7257897253b26d6f0a6a2c9e14b |     
    arm      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/5b340e7d6e4500e7d3321e45ba1411ff1f3734e1 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b1e8998be1dbb354a01956c3d0c799a4b7d32a68 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2642befe69c84079a43bec3bfb887a790ea555d5 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/552e302c6129bdbc838075ba483f5960cf4d2806 |     
    i586     |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/7db1fc3e00a4dd57a427ae8decf7cc12f34af53b |     
  riscv64    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/43248c184a83225110a15124d18e4659c359d78a |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9bad226f5b8fcdc9396d839cc203797c3ebd1a1a |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/6312d283f4288302e50281c80290ae5aff962475 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
monkey-f54856ce250c4e257354... | 1 
                 pixman-0.40.0 | 1 
                    ruby-2.7.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c2f46e226c2373853943a10658f2fb6bafadbb24 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/39a3b245263765c61f1e83e8c84b22f002c98b3c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/17992571afcf5d68babc632ff44fcd631baaeaa4 |     
  mips64el   |           ruby-2.7.3           | NOK | http://autobuild.buildroot.net/results/773a6a68fa6b502ee1406343d3f2e6bb6dfa6b44 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6c5216cda38b26600d8111f3cb549462c73c8eb2 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.16.5 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 
                    ruby-3.0.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b008af5f99c70c4f23ff72dcdc454b65b420b95 |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/78eda3db9b885c700be5d95ebc92dd949d27f3c3 | ORPH
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/7eebbf7a146c7bf5b6597ceb5ce0748c6b7327c2 |     
  sparc64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a8ae3788312bcc30939e49e20ed3017fbabc85fd | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c9cfd3caf13f589ab6504bf6fbd42e149e2e6467 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1f0e6e8ab85db3d2e299326acc2670a971f8c5bd |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/47207b87ee8726dcb6e974c053f3260546ebb7ff |     
    sh4      |           ruby-3.0.1           | NOK | http://autobuild.buildroot.net/results/d0e13c42c2179e275d79f2d47f1c5dbbb4322be4 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/47602f03113a73d2d18d77ebf8a797c48ff383c2 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f61bcf2d06f29f6124f8d6c2067a899a95b1b3e2 |     


Gitlab CI results for 2021-07-12
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948204  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948072  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948156  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948159  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948337  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948544  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948559  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948567  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1415948569  | ORPH 



-- 
http://autobuild.buildroot.net
