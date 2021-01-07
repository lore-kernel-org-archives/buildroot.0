From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 Jan 2021 08:17:10 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-06
Message-ID: <20210107081717.38840865C1@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  5  |  0  | 21  |
  2020.11.x  | 17  |  4  |  0  | 21  |
    master   | 163 | 51  |  0  | 214 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 9 
        host-sentry-cli-1.57.0 | 8 
    trace-cmd-trace-cmd-v2.9.1 | 4 
                coreutils-8.32 | 3 
              fetchmail-6.4.14 | 2 
                mono-6.12.0.90 | 2 
                    olsr-0.9.8 | 2 
                   rhash-1.4.0 | 2 
                 rt-tests-1.10 | 2 
             timescaledb-1.7.4 | 2 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
                    htop-3.0.4 | 1 
              libostree-2020.8 | 1 
                   mimic-1.1.0 | 1 
         multipath-tools-0.8.5 | 1 
                poppler-0.84.0 | 1 
            qt5location-5.15.2 | 1 
             qt5wayland-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                    ruby-2.7.2 | 1 
               target-finalize | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/226b6b834089e242c3012a1f84cdcbf71930e6b9 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/42383670aa2b2c15a83bff38097157ac94ea5e0a |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/49341e2c5613be1531d7d1f904a08fdb059d1265 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/c59abe1131ec65efae152b8d37e5fa92aa92243d | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/c0d22e63ec03d41d52933e92a6ce0f25ece331f5 | ORPH
  powerpc    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/b7db3b7bbb8390d5c8735550af953cb8d541e40b |     
  powerpc    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/11fb5ba25d4734b2d784d464425a94e8774ad4dd |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1c53ca618493d87165e00992d04286d67692e3aa | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ae676106b2b86ddd7a375a0ae64789156327cc1 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e5dbb89cd9d9fb27e480cd2cf4892eb23a840fd0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a6c6862088f0c738a99f6d6f06e79f9cedb46acc |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3ca05edd44a8774769e79f3aaf935e99518b49fa |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5bfb9d4b89112c00a9c7c1aab8a225bef8317e2f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be234898fc0d69613e7d4b5dab2ac4eacd1ddc84 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f00a4c94409d59b10396c9ac42d0782a921871be |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e4cd81919299d588eeccb447a2df6116c131616f |     
    arm      |           htop-3.0.4           | NOK | http://autobuild.buildroot.net/results/2976729b0b95bf822c3095efbcf3f86d6c71874f | ORPH
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/61b4c9fe7004339500e8a64834b6cceeafdf0e27 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8914dc43f8ab60717c3298253209b4b5d2a266a3 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ced0affc8ab70f44184c770a41f015c0b190476a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f717e04632cd62f9e5981f32df58ae6aaf0b33bb |     
   mipsel    |     multipath-tools-0.8.5      | NOK | http://autobuild.buildroot.net/results/71f7661e7d26ca8608e902eee9f2a92376b00601 |     
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f375874cdcd79f784dd14b02b05f9bfee4aa8b74 | ORPH
    sh4      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/36c79cad9ca6bb9b64682bfe5394be6a4164ece7 | ORPH
    arm      |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/e4e43519a1c70686844b08257971cc350a746636 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/77afdbed8cb121b60feee334d003be217e324117 |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/89b2d1b1bf3dc8ced37b1e4aac1ad0a062cb4f9e |     
    arm      |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d7c7e0c97440872f2aee5e6e438f41da618e27f0 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/38af61678a6903cb65cbca5040a90a28c522a5e6 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/283245dbe506802c20a7b08bee371d1fcc8652c8 | ORPH
  powerpc    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/7f75711d59bc28485b10298f049451915eae0050 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/587f52c8fc9d12aef1ef323f513edf78ef7a1aa6 |     
  mips64el   |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/1c74dd58dd85351aa7195994d4c08e26e42dcd73 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b3e4230affe2a5b357e1f6bd12a5069675adcc35 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/2b4f563dff930ed9bf467917670e4888535edfae |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/fd90289afc40f19b732f90c89889aaa29b4ab0fe |     
    arm      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/026c44a962494ac95844b9131322d7392b42fed8 |     
    i686     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/0cdcbf172d6d2943898c4543ec2cbc010dd91b22 |     
    i586     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/a6db700f818b09f05ce3af946f7a03a796355561 |     
    i586     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f5df26500cc92e2ae9f5697dd1b3500857b5607c |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/fde23a65382983382d474adb0fa44c3b7d0d648a |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f79f36bb69bc0f9ff5802222150ba9b345539658 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/4cd7902dbb90d428157881a2d1d054489a6092b4 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7870e09fdeb510d232d79abf619348bc9ae2f84b |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/56a2f462c1c9b84a52f530259613318a05d50e1d |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8d66983b61bfde541f5efc31a757aae494bbb341 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c673aefce5097157425b642a3902322e6913da6f |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/12126cab772613608b859626df86d0dd1cac9494 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/e5d5bea139eafd027fe6a214bcb4d6d1a9195f84 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/91530538d630a7f09d85327e514f01b45253c1a6 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/647213781d7ca3fefed5696b941dc9f365ccdad8 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                host-gdb-8.2.1 | 1 
      host-oracle-mysql-5.1.73 | 1 
             libopenssl-1.1.1i | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/2a8eaf73f195e44d20243de648692686f7300306 | ORPH
   sparc     |    host-oracle-mysql-5.1.73    | NOK | http://autobuild.buildroot.net/results/6eb35a2968e00a2e8a2e80052e64483440b3a91f | ORPH
    m68k     |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/5ec1404e8ed71cd6e8f787fa598149fb3aa1c8c9 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/1be720bc5067638e7947c210c96ece4e7f6ba208 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/67306550d07d1a275b95854c0a704180c61e64c8 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               belle-sip-4.3.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                 uclibc-1.0.36 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/de4f4582921be569e24c1412c6244ce7b0a9a3f8 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e72de7c293c04b98cd22da1f5212bd15f3a22c9e |     
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/70d9b436b7669ef92e29d9a44a2d2ab5aa9c3373 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/0cae03a5bb16eed2c2cacfe7b2ac7a5f691d51e8 |     



-- 
http://autobuild.buildroot.net
