From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 May 2020 06:27:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-16
Message-ID: <20200517062756.522BF86C45@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  4  |  0  | 20  |
    master   | 171 | 62  |  2  | 235 |
     next    | 15  |  4  |  0  | 19  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 5 
                    atk-2.33.3 | 4 
             gstreamer1-1.16.2 | 4 
              host-audit-2.8.5 | 4 
              host-erlang-22.2 | 4 
                       unknown | 4 
                  zeromq-4.3.2 | 3 
                   gssdp-1.2.2 | 2 
          gstreamer1-mm-1.10.0 | 2 
           host-openocd-0.10.0 | 2 
              ibm-sw-tpm2-1563 | 2 
                       mongodb | 2 
                openblas-0.3.9 | 2 
                 rocksdb-6.6.4 | 2 
                 samba4-4.11.8 | 2 
              spandsp-20180108 | 2 
               apcupsd-3.14.14 | 1 
                  apitrace-9.0 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
                 gnutls-3.6.13 | 1 
               host-efl-1.22.3 | 1 
             host-gnupg-1.4.23 | 1 
           host-nodejs-12.16.1 | 1 
               libtheora-1.1.1 | 1 
                   mimic-1.1.0 | 1 
                   mpd-0.21.22 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
pistache-73f248acd6db4c53e6... | 1 
                qt5base-5.14.2 | 1 
                  rygel-0.38.3 | 1 
               wireshark-3.2.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5059e58aebb52f52a060d7eeb067fa5c06397ee1 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/a8880d9f832f266a34171aea030eecce121d7a54 |     
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/e696764389eb242106c4e81191c7424d2f84d582 | ORPH
  aarch64    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/368dd7c9dec17dfbbbfa6cf2598dea815c0b563a | ORPH
    arm      |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/aa9ee3925168daec014016245dae00413254d93e | ORPH
   mipsel    |           atk-2.33.3           | NOK | http://autobuild.buildroot.net/results/f49bb57a6ec2890f489fbd55ced9c9249d066334 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e67f1be2ddea638993f2dadebad6ce381fe43e6a | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/f8bcd927753efef3c9044f5f559d5c2e36e94337 | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/8e8922033dca6a51052cab018b49934e3787c46f |     
powerpc64le  |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/62401d6589b6a6c206d866ca061f7dd65d58c276 |     
  riscv32    |          gssdp-1.2.2           | NOK | http://autobuild.buildroot.net/results/ec5273ada47fd101f1ceef394e97dbd7b9c8e786 |     
   mipsel    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/fcbee2e08fd85503d1a6c75b51e3b8125aa16378 |     
powerpc64le  |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/185cecc6a5829ad32d4ef6a7ecf9239a31b6c548 |     
  aarch64    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/660e18b8a41aa5ae5b16879fb8d33e0f965ba6a1 |     
  riscv32    |       gstreamer1-1.16.2        | NOK | http://autobuild.buildroot.net/results/0f877b733c798ef85056852ae94182307ea6e63c |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5bc48669e93651808a8e95444e184e6d3e467d2e |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7cbdf89dce9eb3854cd7cd8456c52d174f18240a |     
   nios2     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/c4bba80e9fc476247c7ba28850831c6a8edd559f |     
   x86_64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/5ff9ee6702730a03ea22a19f96dcc416a9ba24e4 |     
   x86_64    |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/779548dee73d81da1fdb831b9a4f5ebeac5da5c4 |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/63cd431d3c14c43601399a4e8d55093d2cff68fb |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/e3175620b118c9cd1dbb095d6ba64562a66524f1 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/23e39ffd74cce9c415d6407315d7282a188a8d2b |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d20931f3b81449f3dcc71a5e682b8b27b392ba1b |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/35b372d40c628ffb8125c422db0b6219e7540e4d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/831b6b24c1fda10dad6f0e78223d45ef671599fe |     
    i586     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/c90f5c920e2e3b343469177c9d9d9c65bfb6e6e2 | ORPH
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9787e6aab624a39faf0ce206b56cf1158f5cb4df |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/53bf4a318da58df85335e39745d4e8016d1ddc81 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/16dc8929c035580b8a0f6f2b744a7a0a83b94bd4 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b588d004f3cf77747d2f303e16857b1b5559fd0c |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b61a569616e5fc304d8568aa3f56a7812e534130 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/33f22302921c2dc1b2372cf71849ebcacb5f4113 |     
    arm      |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/dd1eda2379a351aa22af34875f7ac003a4b6d53c | ORPH
  riscv64    |      host-openocd-0.10.0       | NOK | http://autobuild.buildroot.net/results/fc7d11ce5085f6c5941908a27b1fe9e04f4be437 | ORPH
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/44d6e00f34d71aa1ec0ee6b6151ec14d6e7adcfc |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e84662a8e995b6471fb05cd94154df72b2ab45d7 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a4bdb1708beb1faed168baf1c2fe716757b8f867 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5c0d2de430f4c7c668396bb8dd7dca1addd1ec45 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/ade593c79c30a7628dd0594f0dbc4aa26da9c27f |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/085d6faea8bcd04f6e625be7ae1d82255492ca36 |     
  riscv64    |          mpd-0.21.22           | NOK | http://autobuild.buildroot.net/results/be217a8810ec1ffd68c137e9695e2d1cec85bc4d |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0b88046755173c171a9bb2c188631c23cbaa0325 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/49067fb916a4d08b932d71736c654119ba6dda9d | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/98efe368a344f30a4ca80c0ef952ab882f2d506e |     
    arm      |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/a57c0140a2f326a31018593d232d1daf4af51810 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/13bdc055dbea29a21d112f5b60f133452820a2a5 | ORPH
    i586     | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/3ed42be111cc8c3b3d1d4f6504ae548730ab6af6 | ORPH
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/669733a7232612ef13955bef6e3cae8d4637969b |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/3b707a34184c41c643eebd6a532653ca04fc51fc |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/45008bea3c6d9f51319b4b0be8ff1909717b4f3a |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/40ceb498083e5c5eeaff3a39f51ca7fda925d99f |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/04c90a7731b8de4f043ba993d6cd1dcfd0c1c87b |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/09e84d15efe755bdefa9f8c6b8355c49ddbc2f65 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/5d37dc51e2b00f72d048f480d53394f9a4a8b2c6 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/9d168d0e09591791d73fa575c57bc71aea9c065e |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/452098c9113577b6f7ce3b2bfc19a203ef4592c3 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/401d0039dce86938b4c71845db99184415044b33 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/061801a94b53dba913fad211fd537b61c1d56663 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3746c721ce0ecde78c4bddc84823e8b4b70e347b |     
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/d1d71d5ea154c8359936d0f7a7162645f63b7a76 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/ee329a2eecb932b01c5920adc3598b88e36bca33 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/414cf36adda3a07a64cf597038b6093587be3ede |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d97cb95a44a364128fd2775cfa224793598071fa |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554829967  |      
                      beelink_gs1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554829971  |      
        olimex_a20_olinuxino_lime |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830087  |      
       olimex_a20_olinuxino_lime2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830085  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830138  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830215  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830230  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830241  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/554830434  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 augeas-1.12.0 | 1 
                 gnutls-3.6.13 | 1 
             host-gnupg-1.4.23 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/26009482bfe0116d43efafd915e9a8813dd5f30c |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/95753bd58bdaddaa933c2c3227d6d51e8edfa185 |     
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f9b71b2e1b54104b6e8fb4f1289999bde89a1fe7 | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/4ae06a6cb4ace581da1854c98aa8c65ed5c99bbf |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                       unknown | 2 
               apcupsd-3.14.14 | 1 
              exfatprogs-1.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9b75ac655f71a8b091b2098efd5be6724e75c072 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/53e5a816144739203088273c4113b0159686f9d2 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/b17158ced41ec9e75816e633ec09a5b20b33e757 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/9b758b5d706f989ac4f8e347095497969d520f53 |     



-- 
http://autobuild.buildroot.net
