From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Dec 2020 08:15:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-10
Message-ID: <20201211081522.9ADF086FA6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  1  |  0  | 13  |
  2020.08.x  | 17  |  1  |  0  | 18  |
  2020.11.x  | 13  |  1  |  0  | 14  |
    master   | 54  | 66  |  0  | 120 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 34
                   rhash-1.4.0 | 4 
               nmap-legal-info | 3 
package/nmap/nmap.mk:89: nm... | 3 
                  boost-1.74.0 | 2 
              fetchmail-6.4.14 | 2 
        host-sentry-cli-1.57.0 | 2 
             timescaledb-1.7.4 | 2 
       docker-containerd-1.4.3 | 1 
                     fmt-7.1.3 | 1 
                host-gdb-8.3.1 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                    quazip-1.1 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                    sslh-1.21c | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
               wireshark-3.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/68bacda459dc2df837466ea19a518715bfc47b4c | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a2a4e7e0eb2d0a99b76018655f98d8894871b299 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/23d4817380cae61256c2906ac0d725c5691017aa | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/268863e85ce08907ddb1403a1dfc55079166f4c3 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3c5f481a74969c070ee51fbb6450f3dd01cb0ad0 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c190d1ba6a31807fb068a17e50b39909a741c2fb | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f7c075cd063ba48913f2df0a8573335c33265703 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c1647d359859b1c609a2d6a110ac7a8ed7189988 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ee820781f1f05858375ebca86fa4b9e380bdeae4 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/524fe4ecf7b72744d55ae66285c2c7749c11c832 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fc0863ae6a80b77a179f008867c12b85c1bf4093 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c7db48520f6ff4ed55024744e863f69989322db1 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a3d8b76ed84d0dc02f41e292c4b023ba138bb504 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/07a0fa6a4cce0dec633b54d71be86bfa26dc60b0 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2c82a010923574f6fd00aba65c71a6a81cece921 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9a27ff7d24fd9ab3dc4e9d7ff0809857790e9ceb | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/44f79cf1f10467dc73257dd67c8f849d5ca853d1 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b993a253145980081bff648523dd03a20cec3461 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/969467f87fd349ca8d4bfaecf253521d0567001a | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/989369b73e623acf59c1afbdd43768cb412dcc51 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d21ecfe65ae4649da8a5460345a9f4465dc58fdd | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b6af48fe4f67f39b4914ddafff0632ba9c5b8592 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0889bf6b086b5ac1f68da9e4b2babb800f27cbae | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/79877104867ad7aa994cfe0dc0260b1f1deb50ec | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/84243db3d0854ddb3cc476a75b7b3a5704029e6b | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c38692f1dd6919156059919a4f22c37ff9160708 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8ad1aa6a9a91e58357ea0605c86885a35864820c | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7f7deb7553842b883148ea88dad777980064feab | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/28883432452b89c52efef001823106effbc43990 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/bfeacce4f82c6bccd37ee86797c4e79afdfc1034 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9dd588742be7c856a42db9ddf833a2ba75e2a964 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/5e67894d65efcebce1bec86261a003f9a9b0b045 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/11a78b620862ebe255b7d07903a1da388f9bbf14 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/10783a8efa6d4d40b61af0851ba23e61ec426fe7 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/aae67961b5c389f863d2459819d5ab01fed1b5d2 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/f74a9b449d11f78560af43d0c9991c7abbe1ccb3 |     
    i586     |    docker-containerd-1.4.3     | NOK | http://autobuild.buildroot.net/results/b506e1f601411855302c118ee8acd2542c03386a |     
    arc      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/099ee18d49c15dd8fd3681256b89973de4cc13d9 |     
  mips64el   |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/6629029ddfeffde556b29faeffbcd5bd5251d0ab |     
  powerpc    |           fmt-7.1.3            | NOK | http://autobuild.buildroot.net/results/eb71a96245e45487204ef3dbb4322002bb19ef93 |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/3a0fa544c2d829219443c777d0169630623a64bc | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb02a98880a3d05ebcc1f1dddaf3f9e5b4e15f6e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f2dba2b5d1a1a5222dbf8315025ec98c7b42337c |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/022ef83a1c8b055ea37ff1a19a196581f59bf568 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e8c71c46081fc064cb21edff12f14141a14fad58 | ORPH
  powerpc    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/c07a7f2f0d37f92637acc1fcc6cb288b1e709c27 | ORPH
    arm      |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/f2f47755f24f093b7f71662882e9b951644563b5 | ORPH
  aarch64    |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/3776c2de9c235d3e61938a1911777d7a43fb3b15 | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5706d9f7017d8755e11187bc636bc9516c44ccbd | ORPH
    sh4      | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/84e6490b713f34eaf72529d0f0139a1c121d58b2 |     
    arm      | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/eae48256925d1a99e6c22e1691fe186e195ff06e |     
    i586     | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/ae8a5b3b17d4af5173cb46271ecc5f8e87efc614 |     
  mips64el   |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/8a68435feec9c320bc6593285efa0ff9d646d9a6 |     
   mipsel    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7a9eb43f6353b635c9d4f07978247ed059a35ae1 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/95d17b5468d538b09a78071b7456d2a770b32b60 | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/4c6c2f480e3279e1960d1cecde0c9d19dcc697b0 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/2f2ba713dfe67b8f79832ae0627dd89b3a037078 | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/0008d3cec90e548a878859daa7585f395ca443d0 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/59a9e7cb44f93f206c26acaa5fdd118b6b4cd6a2 |     
  mips64el   |           sslh-1.21c           | NOK | http://autobuild.buildroot.net/results/d1f79bf7352963b5e528c8dd99850afbb9e021eb |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/98f67ee2ae14632ca44d395652ae920068c2ffb4 |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/dae4b9f9aa0deec4f84e080846309c0139d5bfa5 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/26ecd4b2ec401d62742ab2f895673ff4731c95a3 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/80b959312ae739d86400a441bdc368451aa3a2af |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/35b10a37c87bde44ad1aa8aca62b6fbf15fc2a5c |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/a623411c78477bec0d8ec166341fa85994081cce | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                    mpv-0.29.1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9d2f11a120a6480fd70185df59b4db4234b095f8 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                    vlc-3.0.11 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/8b91ac45f7bc5ce0e3cd3d957f8da8e7adff06ab |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              micropython-1.13 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/b447d37f4ca5c87ea466372a952bd0915c717063 |     



-- 
http://autobuild.buildroot.net
