From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 02 Apr 2021 09:30:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-01
Message-ID: <20210402093047.44ABC60673@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  4  |  0  | 22  |
  2020.11.x  | 12  |  1  |  0  | 13  |
  2021.02.x  | 30  |  8  |  0  | 38  |
    master   | 94  | 34  |  0  | 128 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                 samba4-4.14.2 | 3 
                 mesa3d-20.3.4 | 2 
                  monkey-1.6.9 | 2 
                    mpd-0.22.3 | 2 
            quickjs-2020-11-08 | 2 
                  boost-1.75.0 | 1 
                  botan-2.17.3 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                   eigen-3.3.7 | 1 
          gstreamer1-mm-1.10.0 | 1 
             libopenh264-2.1.1 | 1 
            lttng-tools-2.12.3 | 1 
                mono-6.12.0.90 | 1 
                  nginx-1.18.0 | 1 
                 openal-1.20.1 | 1 
package/mender/mender.mk:10... | 1 
                 pcmanfm-1.3.2 | 1 
                 rt-tests-1.10 | 1 
          sane-backends-1.0.32 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/33544ed88493d6ef6d1fdb095fdbb767384a8c11 |     
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/78f077741339c383b57ee9adc6933dd8a053fafc | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6ee29f1326eb1bad72a5385fdc9a75c16821bc1e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d8f2de1a83ba379fb1a07f48a83b3546bf0e5f46 | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/28e1b47a4cdac9fd21ba3d99af91bae1dc9661b4 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/53e27e3dcce1894f4fa4f20dfe47a6c0e564fd76 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/636ff8f0a499f82e73044e34c5f7d50e09010dc5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5dedd7c74f10e80165b99456ed1a01f884d5996e |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/37b5c237d83c433745c9ed3f07d184e6b40f7c02 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/733da3a703a2404f6cc879ed37c4a53c20884c3f |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/f520655cf9b6609d699fa97e5e8e408587b60e60 |     
  riscv32    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/dd39188a7191efa512a51f18f4c34d9ee711a6a7 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/2149ca57f1f7a850e001b7ad14a45b464521ff9a |     
    m68k     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/74636f2676487d8d31799f4806006e42702012ec |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/19d3d045003c506fcea607a996369ce14eebd96c | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/f7afd97345276986cf6ab42d0bdcc9e412b97457 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/c5741bbc30801c04eafba2034b109640097eb77c |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/cdf51d02a39a39bc78524fe7ee0748b5d1f11ba3 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/619b3faaa7d7a1b2beae55a1c9894446cbd95a2c |     
   xtensa    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/79a51b0d348e756517b5c9ce815a67f5c657e7e6 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6be7325cf9d6af4d9c3cc1eb2e3e4141f1dd390f |     
  aarch64    | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/2112cca4c0078ecb5e1a2a57ad7c2de469a201d4 |     
  aarch64    |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/e23d283782a2ad56fdfea5e6d40843c44ef8cdff |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/abc4fb0dd36ac9d5a7be5c62c7283f310260880e |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/2028e46951966af43c106df70b30269f3b9afa7e |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/040ce8a848f0465c7e62d600c13063289e969a1c |     
    arm      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/c91cc23a47cf1194cd4b2667454de24d9ea642d8 |     
  sparc64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/7362631bde6d39faef3f8d926b1c9d265d467ae3 |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/cf378e3f1f35e10673ea8717e5cc0c7f763c94bc |     
microblazeel |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3a44f7884d6ba18e75246a1519148b853841360a |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/9f1ccbf3d148f26cdc7b0f909b4f03e325c55a1c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e265cf3d135753736995f18ab9b9adb2c17fc3d |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2e6e03891b3acd6c0955ffa6f0615e5ff33998a7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbe874bc2c0ab4043ad64ccdc05f7ca9ba59c790 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
              ejabberd-19.09.1 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/a5917e21d2fcec3a65c7295378c69187ecf32a76 |     
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/0526017aee899f8256ec26d6f984a230cdaa4c79 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/150db05f6f8721100d021ff76bb740f4e36e72c2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7fe11fae95948bcc9bec60b1585fbe64392060b8 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/3ef0d85bc1c4311ba6bd13e823f8251961df215f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
             host-cairo-1.16.0 | 1 
                    mpd-0.22.3 | 1 
            quickjs-2020-11-08 | 1 
                   tor-0.4.5.7 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/fb14b546f83ca6f6c8108058d4d0f90b94874622 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/30d1a031df3aab76bb64dedd2d5c57fab5c2c85d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/62e64a8aa06c4684170a4142b857b2a89b4f255a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fa1f5304277f7bf37cbca4e76fcb8c9a837dece |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2fde75f32e69dae0125abec3ebfa3757ecf7a845 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/30eacd7ae463da5f766fdd111d94d6a13f0a4ff0 |     
 aarch64_be  |          tor-0.4.5.7           | NOK | http://autobuild.buildroot.net/results/de4f1a99b1c524b81579ee804156e26d3f8babe7 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fc0d2fddbb05ea8d782296d6854ddc15119a4a3a |     



-- 
http://autobuild.buildroot.net
