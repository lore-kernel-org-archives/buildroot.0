From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 05 Mar 2020 07:27:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-04
Message-ID: <20200305072805.6915786DD3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  6  |  1  |  0  |  7  |
  2019.11.x  | 13  |  1  |  0  | 14  |
    master   | 87  | 24  |  0  | 111 |
     next    | 15  | 27  |  0  | 42  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 3 
                 opencv3-3.4.9 | 3 
                       unknown | 3 
              host-grpc-1.25.0 | 2 
               acpica-20191018 | 1 
                      bash-5.0 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
             host-guile-2.0.14 | 1 
           host-nodejs-12.16.0 | 1 
                 jack1-0.125.0 | 1 
                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.11.0 | 1 
                qt5base-5.12.7 | 1 
                ramspeed-2.6.0 | 1 
                suricata-4.1.5 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/b23b6c5f00749eaba3d34fa803c8248a80aa0e01 |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/dc2be45422f4f3e90ab011a67d0fc1d9a0860ebf | ORPH
powerpc64le  | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/4e13ebf8e4945dd1b851d211fe46fb19195b5e7a |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ec3bac8164d0269a3be1d489a92f6537f3ced20c |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9c768f54fbf417561209004bc94367b35d4fd97b |     
  powerpc    |       host-guile-2.0.14        | NOK | http://autobuild.buildroot.net/results/0edb10d6a076fc93ef4ef14055cd1c9a4cad8874 | ORPH
    arm      |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/95f81bc8ee5751c835183db059ca60ed2e536ac1 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/e66e5456f707f5125ab569d330112fcbbc2e515b |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/8a06c689d1e915007f1e691dae65e9e4a98dd9ac |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/647b677b75b683d8aa14cf21babc9570016c3ff3 |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/f0ae222134fffde084d61f64520ad1dd725b7b4e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f397cb16ac04e7a4fa09b9eea4ed3605c88ca624 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3ae40120aa412d339a155a698faffbc23f61883c |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/50999487dd34ce650143e615b0133241456c8cb2 |     
  sparc64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/f4925f6c8722ec0ad3f07818fdd7e62d99168384 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/fd1975393aaba988178f017c50736a64cd6750d2 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/14cf2c6b706995b3ee85c6dcd3c8317814bbaea9 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/f2381e3fb45ba1098ae34c985eddcd65ee3aa886 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/23d1a3ea729ed9b531e8a4f98d4611a6d113b613 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/03540b6b582e0a566556f9fa00a0969620543f33 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c1bdf20a72c2be1d0fc922106d4711de6aad4b1e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1b82a7912af9e4c4656189ace97d79e618b947a9 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/96040c7f253884f5b89b3ce854558554ee7f8723 |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/9dcf644427d5a3a17ea600994ca45ffcb1d2c68e |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 2 
                   erlang-22.2 | 2 
               libglib2-2.62.4 | 2 
                libtirpc-1.2.5 | 2 
                linphone-3.6.1 | 2 
toolchain-external-codesour... | 2 
                     avahi-0.8 | 1 
                busybox-1.31.1 | 1 
                classpath-0.99 | 1 
                 dmalloc-5.5.2 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
              fluidsynth-2.1.0 | 1 
                 haproxy-2.1.2 | 1 
           host-nodejs-12.16.0 | 1 
host-sdbusplus-4212292bcf13... | 1 
                   libnss-3.50 | 1 
               libupnpp-0.17.2 | 1 
                  luv-1.34.1-1 | 1 
                  ndisc6-1.0.4 | 1 
               protobuf-3.11.3 | 1 
psplash-fd33a9b3d68c89fa22f... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/1a8a39240e3b1c319547277b233da88c2bde8b04 | ORPH
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d50a2cd7a7b1737d9dfc98782731feb0d1ad6c9d |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ca44628a6dd9a42df0f816095305f4dad3b16f24 |     
    arm      |         busybox-1.31.1         | NOK | http://autobuild.buildroot.net/results/f45f91aea6deee6699eabdfa618ac44873b8da51 |     
  powerpc    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/407ffe3b06f0d13d39d3d16591a269d6aa707b4a | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/835e15412e5f4c3d81fc31f7ae936983d584f6fd | ORPH
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/a34ce4015f10d3756d9d852bdb05858d13c94514 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0ccb16f1d7a4645211503faf5f02cdbd49a83f84 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/7e5f28aaa67c7b27ea21e006767f87f2de67e2b8 |     
    arm      |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/308380b5b8fd3e82724ef48acc61793f3e6a93f6 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/96f7c33407397d73ad8e1d5aa480f1fe84ca2d27 |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/8522946ce37ff7dd8b1c3101acbfb9bd7772cad3 |     
 aarch64_be  | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/857190a748df1eec5e87c5fccfbbf945dc76d1b3 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2afc901bcc669647239bd3fe86846ee1a161de84 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/45d6a8666cfe42cdfc8be6aa69f43a4bcaa703da |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/cc2b261b266363815d1f7b4158cf35d3ee6f359a |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/96710be523db889f167e13365502b0e156026d84 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5b63104da2c4edf0d80b356db7011a4ad896fc40 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f6109df109ed27448fbfb68e62a53f53b785a21c |     
    arc      |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a27d72bf8059c596b61253e44dbc605aa34bf6d1 | ORPH
  aarch64    |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/3af9e006e13d459806298f636bf229f0b2b28f82 | ORPH
    arm      |          luv-1.34.1-1          | NOK | http://autobuild.buildroot.net/results/79710e7af59d6c9e95a0ebdef42dd39a71b67b63 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/95256a73ae34849b99fa901fa3309150e0a64028 | ORPH
    or1k     |        protobuf-3.11.3         | NOK | http://autobuild.buildroot.net/results/e3bc23ccb2d34425aee258e7e5d3e5274adc9ddc |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/42af010c3af5b19727861c08694f9e161ab44583 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/a189d8df84ef968b2598e7736568adf9404e87ed | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/60d0dc8d3c33f4054a952a516b325fcad07fc974 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                      gzip-1.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            gzip-1.9            | NOK | http://autobuild.buildroot.net/results/12662fd08a21fa7410a94a539f96cd08db3b3777 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/00c051685e7e27608a50f0c25240e1937bdf51f5 |     



-- 
http://autobuild.buildroot.net
