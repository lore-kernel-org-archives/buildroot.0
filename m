From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 08:16:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-13
Message-ID: <20210314081622.7CEF74A147@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  3  |  0  | 18  |
  2020.11.x  | 15  |  3  |  0  | 18  |
    master   | 93  | 41  |  0  | 134 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                  janet-1.15.0 | 6 
                     mc-4.8.26 | 5 
                  boost-1.75.0 | 2 
                  botan-2.17.3 | 2 
             libopenh264-2.1.1 | 2 
                   sdl2-2.0.14 | 2 
                 avrdude-r1450 | 1 
               bctoolbox-4.4.8 | 1 
                directfb-1.7.7 | 1 
                       gdb-9.2 | 1 
 glslsandbox-player-2019.08.23 | 1 
             kismet-2020-12-R3 | 1 
                 mesa3d-20.3.4 | 1 
              micropython-1.14 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.53 | 1 
                 openal-1.20.1 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/962a7fcff1e54a0550eafa0cbca780ba8bc8409e |     
    arm      |        bctoolbox-4.4.8         | NOK | http://autobuild.buildroot.net/results/1f2bf1eeaa87aa48262582ba0c5bb3402dd2b89f | ORPH
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/0834ae8e3b137aa7ebf6994b4d34a65d914200b0 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/ec0aa63ecbbf7ae1848f0839de844ab270a48a6b |     
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/832834ddaedcd3d3faed1c9d5711fa97b80b4b25 | ORPH
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/0651d126363817ffa35792f538180adfb0b57770 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/698eba638caebf58277933db3d62232b2eb63d41 | ORPH
    m68k     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/e5e7e72ae99ca0c8889128c2c093e5ff7410e697 | ORPH
   x86_64    | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/2df106356cace797c126238b2171743dabd226ce |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a31da59238e195a2cd4a933a9b43d4157d3901ec |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/42057bf01289d504b5d4be53db7138a1a7e95c9c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/41346d5d8be37cfa899e21e5a5c60c31e9331de7 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/855a49cd50e77854b7e08bd4963318df8067bcd7 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/481768b37222e42d8f7f0826714bde6d979edb8a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc2afa9452b34ba105fc33ac8e656eb89a7a897e |     
 aarch64_be  |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/56b355271092df3b6be0149a9d074a1bbb537ed5 |     
    i586     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/800e03dd6084adb78b6699094e0153b6c075fc63 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/7e10d6a39600ce8b4c7b39fec0956c498e37efdb |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/d8d84f84cf5136f9f5269385368db44c42cf7b92 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/2254c3485a29a342e79400667b0d2d7d796b2798 |     
   nios2     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/5f16949b8de5d3f62e70d32e6db022e2b747cb5f |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/cd5560c6f24ad883de7ce0c5b931906a2c244a16 | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/ac6b973afcd0b2f844a605e0f64dc64346b367f6 |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/9192c6335d9d7a530bbb2384575eb06654c30312 |     
  riscv32    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/e572dba8325e0a043663220239431ec8b716f80e |     
    arc      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/a9e81edf8b76a78574fd9af62c44c84d5ae2e9ef |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/e26380530ee96ecba291a93303dd827e10adddc9 |     
   xtensa    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/cb45146f3659ed7ed1edef99cae85fc1194b1bfa |     
  sparc64    |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/b8ca1db71f38cc49a30092b9001e853b64eb4215 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/8f1a59408fe4ec63717f28db5811c3e76e61cf86 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/5d7f7fdd48339f206f5f1b30533c8fd32a7dea4c |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f5aeb857e903343fa90c561e3660a2040aaf55b7 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f13d3a6a9f73e86d84f6c44afc3661d99b447aa8 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/99b362fc9daf1e218a4b35aad42fc15a62eee17d |     
    i686     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c5747991cda5859bc3cec7c14165458f7884d0f4 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5cc17a2dc33604de3f6f2c03943e309e81fe29e3 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9a4df1d77f5a9868fb3743f985bad25f64fe5e9e | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3bbcd547dc5269737fa2c60f75b815f957d9cfc0 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f840500bf96a916df10dfe6e741fb38ac1907b36 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/413815eb8c053fa4b52589de1e0d14c6db597899 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/000f31ed208372920e1b18e073689e2ace41fd84 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
               belle-sip-4.3.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/929975ddfb76cefd3b8b0f5dcec9b0c87e6c0869 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/ea17e3a939335729ace4fb81280ee1d7ba309b34 |     
    m68k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/1320a56a398195f8353a221377253587918f5bfe |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

 glslsandbox-player-2019.08.23 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/2852f532b71b2ac5341eb09683148248ddf1bd12 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cabb6635bef7933741df129e13fa57679bb4decc |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/5ee6e006bdb8d93440aac6bd95c13fb2a3c44817 |     



-- 
http://autobuild.buildroot.net
