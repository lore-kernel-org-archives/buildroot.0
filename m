From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Mar 2021 10:29:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-18
Message-ID: <20210319102936.E97E86071B@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  0  |  0  |  8  |
  2020.11.x  |  5  |  0  |  0  |  5  |
  2021.02.x  | 10  |  4  |  0  | 14  |
    master   | 40  | 28  |  0  | 68  |

Classification of failures by reason for master
-----------------------------------------------

x264-35417dcd65a57321fbadf9... | 10
                elfutils-0.183 | 8 
              netopeer2-1.1.53 | 2 
                       unknown | 2 
                  botan-2.17.3 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             kismet-2020-12-R3 | 1 
                mono-6.12.0.90 | 1 
                opencv3-3.4.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/ba97164c75fb5463c41df58eafb9d0e9a49af4c7 | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/9f548ba75f68106c27e653652b00bfde2b204dd9 | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/9bc9ade0dc8639651fb7835189da30390ffa80f9 | ORPH
    m68k     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/ed24bc9472f21f190fd42ae691ed701a8298ab97 | ORPH
   xtensa    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/e8965d8b4be98eb64090e5d7609984094f3ba530 | ORPH
   x86_64    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/9c5297a6f20ad550022007c3aba06f17ceba22c3 | ORPH
   xtensa    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/1d8f16627e78a050a4e2a3fe073a27fc59152de2 | ORPH
  powerpc    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/f477ef5afcb1a41c9ca7cb0906088220b0d6d036 | ORPH
  riscv64    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/2c250c653df8d927b892abf50ce376c51ca0c981 | ORPH
  mips64el   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/47c839b1bcd9169139831ec59e10a45f61f6a187 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d55ff2f314b7423dd95c5d753e09f0686de44991 |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/9fc7891b61b1c487b95f07c59b802dd98ef71e3a | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/bb4eb89ea0d3d1686df80fa030f93aea8cbb6efc |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c661a63cf5d55c0e525ac82f9cff42be2c4d2ad9 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/01fc7eef1abd130de44cd69cf71688821a27132a |     
    i586     |         opencv3-3.4.13         | NOK | http://autobuild.buildroot.net/results/5e2b82b6d6b1960ab68d14a7380e77a4bc65de86 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c9d45db2e7fb7e58b7eeb5927f2e59580e3be675 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/3a07e1143d3598f3b9403f9e35e5338b9639b221 |     
    arm      | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/ed0f9e4f1b7991d1d574c8bf156745ab0f4c24c7 |     
    arm      | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/c89a63201bff62d0d1455c788a1d1d0ad370e46c |     
   nios2     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/2e0fca43e7fd9ebe384066d4cfce77fb6524fbe4 |     
  aarch64    | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/c76a63657ac988b20073ce25936b6fafd3d7753c |     
 powerpc64   | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/b103df4dd78e081ea2736c0e322c7cf14949894c |     
    m68k     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/dd19a3e463d543cc0b0ea1ba7ac9faa7151d134c |     
    mips     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/b6a2ac6b2eb58df5080b8a51fd3e9f51065b72b1 |     
    arc      | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/5c267adb5f85d1764faa806f17c25f30ddc9a21e |     
    arc      | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/b4233b52c77286af7125d5fffd035b92de5ebd9e |     
    m68k     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/752f3d3754dee5ac225166df3efd06601f020928 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                libkcapi-1.1.5 | 1 
                  monkey-1.6.9 | 1 
                      tio-1.32 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff4da5aa033b33b90c121f714b04437276d4067c |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/ddb5d04c9bd62df0d988f3cb1aa3c20ba52dc7a1 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/9a3179a9029ee258bcb19dd108f0b3a6f41571f7 | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/9746be14d62efba80d95c34527ef1f1414fea6a9 |     



-- 
http://autobuild.buildroot.net
