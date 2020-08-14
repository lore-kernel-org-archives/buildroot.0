From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 07:58:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-13
Message-ID: <20200814075839.7CD3C8833C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  3  |  0  | 19  |
  2020.05.x  |  8  |  3  |  0  | 11  |
    master   | 99  | 52  |  0  | 151 |
     next    | 29  | 29  |  0  | 58  |

Classification of failures by reason for master
-----------------------------------------------

              keepalived-2.1.4 | 11
dvb-apps-3d43b280298c39a67d... | 3 
               libglib2-2.64.4 | 3 
                 openal-1.19.1 | 3 
                  zeromq-4.3.2 | 3 
               apcupsd-3.14.14 | 2 
  gobject-introspection-1.64.1 | 2 
    host-mender-artifact-3.4.0 | 2 
libcamera-96fab38e02792a109... | 2 
                 opencv3-3.4.9 | 2 
               pulseview-0.4.1 | 2 
                       unknown | 2 
        18xx-ti-utils-R8.7_SP3 | 1 
                     avahi-0.8 | 1 
                  boost-1.73.0 | 1 
                     cpio-2.13 | 1 
               domoticz-2020.1 | 1 
              gnuradio-3.8.1.0 | 1 
              host-grpc-1.30.2 | 1 
                   libnss-3.55 | 1 
               libupnpp-0.19.2 | 1 
            live555-2020.06.25 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-20.1.4 | 1 
              netopeer2-1.1.34 | 1 
             python-spidev-3.5 | 1 
                qt5base-5.15.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     18xx-ti-utils-R8.7_SP3     | NOK | http://autobuild.buildroot.net/results/df2d04de4b2e5003f3fc56c9e84db5054bd4d499 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2146aa02f361d1e4a9d75dc8f53b5992dbcb254d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fd0f0ded037a8573504efaf2e335e286e2b15d38 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b715a1a87898b0d7c0e597ada731e2ca58da1d6a | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/80dc6530484951b2dc0b7e9c02dba27daf964e4a |     
    arm      |           cpio-2.13            | NOK | http://autobuild.buildroot.net/results/22fefd9774cbd6648d67f29826f47f1978e9c069 |     
microblazeel |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/99c5f6ee7c39cf3c218fd1aa36b0166f93c7adf2 |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/0caceb4ce3773143ad5bb7911f171ea8f310404b |     
  aarch64    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/4c868a6230989f2e25821fd20e2dd2302b5e49e4 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2b7171499353a03380b25538f126e9bc140eb9c6 |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/af6f977a1a5383f13b10d99778cf46a28bb999a9 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0dc91d101ce5f978fe4ab5b838503994e55b611a |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6933ea563d3db9a956b7de77534d165a14bc7956 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/49e2893ade0616d7f1f183035768bb496cfba339 |     
   nios2     |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/80edd9dbf7f571c81e4bfc2da721aabf7ee1bf5f |     
    arm      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/d5bcaca73ae74fe8b0ebd39b6331564cd639fb66 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6d6268b618af571b75862e84b4bf9ef205c69329 |     
  aarch64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b58ca97d4181ee7071574bc9745c25ba8cc97a10 |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/7dbda5ca45b2ff4e5e1ce2832d15d42f93a5888a |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/bbd17b6a46a75eea2cd38aac319a267609d1cc72 |     
    i586     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/2ebd7f9d39e53adc06f2847cc262e5292cce26ad |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/a788577e170ac07c3253e7afcac10b0e4b6ed637 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/27ae1176408b4404a18f9e93a9e7470d511b307b |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f825e2bef276e412362f37936b2b8b830338c6d2 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ddd06e6efe5fea482912702bec45f7dbff1b1966 |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d97a75e6857161990def57d40747760ff578b004 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/43af9c8771e09224151e19af5dbeae038245018d |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/ad72784470d76d2d0e4ca1dbe297f461e8057034 |     
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/df18c8f03dc22fc94c9f30f1cae2d09ae261aa58 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/7fc0051067d0b47753f581382bf71808d30ea1ac |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/4c32eaf85f218de95240d9d6d25149e738a8c1fc |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/76be4bf603bd51136da9e049f8af3580001bb404 |     
   sparc     |          libnss-3.55           | NOK | http://autobuild.buildroot.net/results/564cd34b9264d5d0faba3df360924f4b4d8a1b21 |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/f33da353b6d8509c1461751b545caf6418cf787f |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/3526d9ca39c40e27bc7ad10758d4a7a98c880f62 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/c9909cd13aca8ecb7eb9a9eec0ba5bceb0984d7a |     
    sh4      |         mesa3d-20.1.4          | NOK | http://autobuild.buildroot.net/results/1f5e8290aace5bbe1df3e78ba25e648da435e055 |     
    i686     |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/31cda2973652380d9ed9dcd5424edf8bf6c4452f |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/2915383f496495c36daf46baa059e6ea0686dcc1 |     
    arm      |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/4546ce4f176164462b0e73c387bc45c9771f98f7 |     
    arm      |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/7362c3ae4ee20f2d1cf6fd22661c1a36fffb9332 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e5ddf6b4a54acb350ac178654731b8f9034bcb69 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/0b31684bcbe6cff9e592ad4e5ee57c424d536e5a |     
   mipsel    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/c9e27a91905dfda0ba1ddb12c7910316d3ee82ef |     
   nios2     |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/433ae5b406c4de05072167549643711271de0137 |     
  aarch64    |       python-spidev-3.5        | NOK | http://autobuild.buildroot.net/results/619b9e9844e33fa8e111d6db09eee8450fedb660 |     
    i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/8d58be3f6ece410e7ed877300a92fe5e14b4ced7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5da18135e459264c1c07453c016d13d943a4ad58 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bffdd46795bf05cf93707e78d39f28a0867ca563 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a899401c858d36dd7f6e4913d03b05fe19c1d838 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b024e013ac1dedca0d91f26386a7638087cc5495 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/467a15ee48aea7862ac1a00a92f8434e57951647 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  luajit-2.1.2 | 2 
dvb-apps-3d43b280298c39a67d... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/ba2a931c8081bb4026f903e92625e9eb8b733d4f |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/39b665b29ba74a7e1920d7fb788980569bb29322 |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/4f7b58979dd90fb32e83075a37bf81ae7bc580db |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

dvb-apps-3d43b280298c39a67d... | 1 
               host-go-1.13.14 | 1 
                   mimic-1.1.0 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/4c632dfe738f75294bda177e3eedcab164f72b8d |     
  mips64el   |        host-go-1.13.14         | NOK | http://autobuild.buildroot.net/results/28a00cc2387199ea7626d6127af10b26b5e13128 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d0d75df67e297a40bea1fc8baf93b9e44cb0e96a |     


Classification of failures by reason for next
---------------------------------------------

dvb-apps-3d43b280298c39a67d... | 5 
                  zeromq-4.3.2 | 4 
               libglib2-2.64.4 | 3 
                     avahi-0.8 | 2 
            live555-2020.06.25 | 2 
               log4cplus-2.0.5 | 2 
                qt5base-5.15.0 | 2 
               apcupsd-3.14.14 | 1 
                bellagio-0.9.3 | 1 
                  boost-1.73.0 | 1 
   gdb-arc-2020.03-release-gdb | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 gnuplot-5.4.0 | 1 
              ibm-sw-tpm2-1563 | 1 
              keepalived-2.1.4 | 1 
                 openal-1.19.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/eb23315d93954fb18041befbba9266cd32bb5e38 |     
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3e73dbbab33fa317ccee81f554c9ef29dc88536c | ORPH
    arm      |         bellagio-0.9.3         | NOK | http://autobuild.buildroot.net/results/68dd68ecc01893caacf82f8538836af77e40226a | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/83907db8eb866049d246c7260701dc8d5141725b |     
 powerpc64   | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7b6640e76ae95a26098d9d1fd6ecba9a7d4c5892 |     
 aarch64_be  | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/25e5b3535a39b4b47a9578d0c82ad7768dc17c02 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/a5731813eb915cd9c851547857c0b79feccbcd11 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/18ed354a3c06da01f62dd3a388b066f7fc909d97 |     
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/304cf4327acedd73583feed351960b25814c4dcb |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/472b9490eebd4e9df19958b420870c6834ffa2cc | ORPH
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/2dce12cbefbed3aaf22f12fec0ae4e1959856c31 |     
    arc      |         gnuplot-5.4.0          | NOK | http://autobuild.buildroot.net/results/e56070e4235aee64660d9c07993ec39c242a3ef1 |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d818127c4e73b95d89a3c31e76c6570ac120cfac |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/b4b9e9531384e114087b0b4bd0b2085c10504615 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/f7cfe2d8bc225a567dbdc96926a3898344fce4dd |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/bff62c84af5971ba54c6fceda8e65743c5d44f6c |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/899c9d0d73dd2b2fa815bbbc9375347d1b247463 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/c87e5313cd9170e78c17b90480de61adc4ef1820 | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/f758146d67d1fdb3ca8762dce27c87f5a8f9136f | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/d737aedded213553ed45fa2841fc3c1adaff0a1b |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/f84285b3ae671542c25eaabda97dc746a3efe9e5 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/464f50e851522a027e583acd641572aaa169362b |     
   mipsel    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/dd0ebb6b8f3b73a2623c05e7afbc318a735376cc |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f17d4ecd0bb49068eb9253d60a3e63b68db717a8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/fd5f5bfc531fa5493e6e069c3ae1a092cb51489d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/81cf65a090af60e689257168d12768d9526f9de6 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/076f5efc294e2afb48841750108c482432470257 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/64991671e4eb0f04a6bea53e612ebdccbfcc8d63 |     


Gitlab CI results for 2020-08-13
================================


-- 
http://autobuild.buildroot.net
