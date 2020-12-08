From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 08 Dec 2020 08:14:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-07
Message-ID: <20201208081456.83C1E87436@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 15  |  1  |  0  | 16  |
  2020.08.x  | 12  |  1  |  0  | 13  |
  2020.11.x  | 11  |  1  |  0  | 12  |
    master   | 67  | 62  |  1  | 130 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 21
                   rhash-1.4.0 | 8 
        host-sentry-cli-1.57.0 | 3 
package/nmap/nmap.mk:89: nm... | 3 
           python-pybind-2.6.0 | 3 
             timescaledb-1.7.4 | 3 
              fetchmail-6.4.14 | 2 
          gstreamer1-mm-1.10.0 | 2 
               nmap-legal-info | 2 
            qt5location-5.15.1 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
              asterisk-16.14.1 | 1 
                        bustle | 1 
               capnproto-0.8.0 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
                    git-2.29.2 | 1 
                host-gdb-8.3.1 | 1 
                    php-7.4.13 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
               wireshark-3.4.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/10ddd2e7e86693258ad33704638fd78f3ea75603 |     
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/85e0825dc1db7235d61427fcab07a8457b9b2dd4 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3872956c1f94417ea5b58eef35b1f2efdb903997 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/28959707196fd90f1a0b9b2dd8563f62cee69137 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6520c188cde0c93b48a2c42b9ff5acd15df1ab00 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e7812777204c33ddcd77d9eca6622600554cc9d4 | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0d1ceab844d0423fb9e8d19a065bfa60b6b4207c | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/45813ce952300708315a800a95157941ab447600 | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b9a68c08ee6536ff48611d33b016b600c9412e87 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8bd9daa3359428d7701b7f205c259922516ec978 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/076b88a2cc090b5d964d6bc4fdd038d15a2c95df | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ac5c1e1888fc9b5807f9f47d40787886e3ce65da | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/73b0b6ff0ce6f290454b0e71d36606b00c62c60b | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ddbcc527cbe195461aed22a597a65366c9fabd74 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8e81c26479280d7c8caab43e66244cd3cf873658 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f157de91e4064ee89c062abc86f85ab08a4083cb | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6c3f39f147302e8d91a586f22ff44e547e94745f | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1295ee49dc0dcfe0464ca532677cb9b40556d84c | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c3b3ad247e032f4dc9e6394ee6d270bab23f3cab | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/394ffee36888a195a98f52caf860073a630caeeb | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/76def4bdc33cfb336da7a925fe992fad59bbbf48 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b4e5d6ee56341ca3b0e5216e91a128f3afd8f370 | ORPH
   x86_64    |             bustle             | TIM | http://autobuild.buildroot.net/results/3171a7ede623955bfa3f0ba044b4d9143310502b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7da0a181635293beb33f6711f838da5e94c6631b |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/88ac840274e66b5e0d686f0d3815fc4c0127744d |     
  mips64el   |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/26ff22a47202dae6de3c4fb32e14e8d52f9b0bc9 |     
   mipsel    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/1127334809813dd88c325d4d045d2527930b8100 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/4221e5b49c3925de624e83e471aefd8b069cb50f |     
    arm      |           git-2.29.2           | NOK | http://autobuild.buildroot.net/results/24be87540d84aea4386200a008a3b3f0923e0945 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f6ed74dcf611fa34172eb814df3f8eb2c9aed846 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ac50a4eb10bdacc25159291a180857475e213ed0 | ORPH
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/6c5f0116487b8eac506dc109e01d17d898619cae | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cb10247ecdfa1babd9d2f7c1ccc4f4f2d380386 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d07e4510cd2d36f0e087d02b5233b699da1325df |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f2938fef87c7ad84a28d8fb8afb82d5a5778a103 |     
    arm      |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/fefd82a2c4f855beeef749322dc11c04575d78b9 | ORPH
    arm      |        nmap-legal-info         | NOK | http://autobuild.buildroot.net/results/063767412164b68d7ed3ae60cd88d1c28b0c6776 | ORPH
  riscv64    | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/c3a56575b145a70c56fea0de3319c2dbe87e250b |     
    i686     | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/187348a6aa09b291b27ead863234b31e34f42a5e |     
    arm      | package/nmap/nmap.mk:89: nm... | NOK | http://autobuild.buildroot.net/results/7fb20d172b73c0f50a8ba2682d380b9077f29275 |     
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/f817e9aa7446d781b3ee4dd79ef604cdebaff60c | ORPH
  powerpc    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/7f9fa228076517eb649f3a8a42237ed9344bb39a |     
   x86_64    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/b5501b518e72ff3e3ee2e5920efb9264b4b51915 |     
    arm      |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/a4e1d53808219ab322d565c7fd60b16a5e71cfc6 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/75d3b5864403f38fba8114a43a268777f7f52bdd |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/f6c5eda45cf389a699f61e838122149e4627edd2 |     
    arc      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/2f4a429bf55e4000d05a285d696a8b44805d6f0f | ORPH
    arc      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e5b4000f92b761472b7a812083d5c345375c4719 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/6b4aa19122d6453b561a7790e59ac9d446756efc | ORPH
   xtensa    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d483736b7235f4f35f832b5f25a49b06edef7ba3 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/19d7fce71bfeb56c33b940a4a101b7f7c8a8202d | ORPH
   xtensa    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d1e879a7964d4eb596eab811bec84b1b49e258e4 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/066ae5d567d9891532b21987296a5aabc7910113 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/221ce50b397c59d533f40537cc2658bb1b7a00cc | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/e74b1c9ad10bbb9899ea3669e96147a8ae3eba8a |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/39c7210c02e18c228f37a2439dddb4258ea42c05 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/d4dfcdbc37485b7dc89287a2adb93e45113253f6 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/738fa33d9373cbe4e83f19ecfc4b62c7247b1277 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/0911ce5039778ce77d0efb0e6dc70b630245f522 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/cbc2a04e476e4cb13a9eaec54e1d714cbf420519 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/101d67e7a8c8b9b543956c80ec057dd38cae1c3b |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/c17324e4aa3b0d8f4309204d50c707f4e355a1e4 | ORPH
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/01f68480b0db771068971274c76a0d52ef17b8ba |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/32ec17144ce9fa0b02e8dff20f3ccfa51a5a2375 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               host-go-1.13.15 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/c62fde4e6c8feb9cfe0946262c225690915b0ef9 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                opencv3-3.4.12 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/ecae9dd401401db1d190a1ddecc6634b8db5cda7 |     


Gitlab CI results for 2020-12-07
================================

Detail of defconfig failures for 2020.11
----------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887070908  |      


Detail of runtime-test failures for 2020.11
-------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887071419  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923817  | ORPH 
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923818  | ORPH 
          TestATFVexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923819  | ORPH 
                 TestAtop |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923875  | ORPH 
           TestCrudiniPy2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923876  | ORPH 
           TestCrudiniPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923877  | ORPH 
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923878  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923879  | ORPH 
               TestExt2r1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923845  | ORPH 
                 TestExt3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923846  | ORPH 
                 TestExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923847  | ORPH 
...rch64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924051  | ORPH 
...tlinAarch64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924052  | ORPH 
...arch64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924053  | ORPH 
...otlinAarch64MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924055  | ORPH 
...ch64UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924057  | ORPH 
...linAarch64UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924059  | ORPH 
...h64beGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924060  | ORPH 
...inAarch64beGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924062  | ORPH 
...64beUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924063  | ORPH 
...nAarch64beUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924065  | ORPH 
...750dUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924066  | ORPH 
...icroblazebeGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924113  | ORPH 
...zebeUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924116  | ORPH 
...zeelUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924123  | ORPH 
...croblazeelUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924124  | ORPH 
...tlinMips32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924133  | ORPH 
...ps32elMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924137  | ORPH 
...32elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924140  | ORPH 
...inMips32elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924141  | ORPH 
...nMips32r5elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924144  | ORPH 
...r5elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924147  | ORPH 
...Mips32r5elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924148  | ORPH 
...nMips32r6elGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924150  | ORPH 
...inMips32r6elMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924152  | ORPH 
...r6elUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924153  | ORPH 
...Mips32r6elUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924154  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924155  | ORPH 
...Mips64eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924156  | ORPH 
...ips64eln32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924161  | ORPH 
...64n32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924163  | ORPH 
...s64n32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924166  | ORPH 
...nMips64n32UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924171  | ORPH 
...eln32GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924172  | ORPH 
...ps64r6eln32GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924174  | ORPH 
...6eln32MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924176  | ORPH 
...ln32UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924179  | ORPH 
...Nios2GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924182  | ORPH 
...ootlinNios2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924183  | ORPH 
...enriscMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924185  | ORPH 
...tlinOpenriscMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924186  | ORPH 
...riscUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924187  | ORPH 
...owerpc440fpGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924192  | ORPH 
...c440fpMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924193  | ORPH 
...e5500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924200  | ORPH 
...e6500GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924203  | ORPH 
...erpc64e6500GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924205  | ORPH 
...4e6500MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924207  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924210  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924212  | ORPH 
...pc64lepower8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924214  | ORPH 
...ower8GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924215  | ORPH 
...rpc64power8GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924217  | ORPH 
...power8MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924218  | ORPH 
...erpc64power8MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924220  | ORPH 
...00c3UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924229  | ORPH 
...erpce300c3UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924230  | ORPH 
...werpce500mcGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924233  | ORPH 
...owerpce500mcMuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924236  | ORPH 
...00mcUclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924238  | ORPH 
...erpce500mcUclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924239  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924242  | ORPH 
...scv64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924244  | ORPH 
...iscv64MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924247  | ORPH 
...Shsh4GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924249  | ORPH 
...nShsh4MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924253  | ORPH 
...otlinShsh4UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924261  | ORPH 
...h4aebGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924263  | ORPH 
...linShsh4aebGlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924265  | ORPH 
...sh4aebMuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924267  | ORPH 
...arc64GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924271  | ORPH 
...tlinSparc64GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924272  | ORPH 
...orei7GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924276  | ORPH 
...X8664corei7GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924278  | ORPH 
...nX8664corei7MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924280  | ORPH 
...linX86core2GlibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924286  | ORPH 
...6core2MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924287  | ORPH 
...tlinX86core2MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924288  | ORPH 
...ore2UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924290  | ORPH 
...6i686GlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924292  | ORPH 
...86i686MuslBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924294  | ORPH 
...otlinX86i686MuslStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924295  | ORPH 
...i686UclibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924296  | ORPH 
...Xtensalx60UclibcStable |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924301  | ORPH 
...ToolchainBuildrootMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924038  | ORPH 
...olchainBuildrootuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924040  | ORPH 
...xternalToolchainCCache |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924041  | ORPH 
...ernalToolchainCtngMusl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924043  | ORPH 
...rnalToolchainLinaroArm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924044  | ORPH 
...ToolchainSourceryArmv4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924046  | ORPH 
...ToolchainSourceryArmv5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924047  | ORPH 
...ToolchainSourceryArmv7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924049  | ORPH 
                 TestF2FS |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923848  | ORPH 
              TestGitHash |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923842  | ORPH 
              TestGitRefs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923843  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923838  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923839  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923880  | ORPH 
           TestGst1Python |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923881  | ORPH 
           TestIPythonPy3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923882  | ORPH 
  TestInitSystemBusyboxRo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923859  | ORPH 
...InitSystemBusyboxRoNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923860  | ORPH 
  TestInitSystemBusyboxRw |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923861  | ORPH 
...InitSystemBusyboxRwNet |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923862  | ORPH 
       TestInitSystemNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923863  | ORPH 
...InitSystemOpenrcRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923864  | ORPH 
...InitSystemOpenrcRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923865  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923866  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923868  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923869  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923870  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923871  | ORPH 
 TestIso9660Grub2External |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923849  | ORPH 
...0Grub2ExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923850  | ORPH 
 TestIso9660Grub2Internal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923851  | ORPH 
...slinuxExternalCompress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923853  | ORPH 
...so9660SyslinuxInternal |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923854  | ORPH 
                TestJffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923855  | ORPH 
                  TestLua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923890  | ORPH 
              TestLuaHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923898  | ORPH 
              TestLuaLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923886  | ORPH 
          TestLuaLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923888  | ORPH 
        TestLuaLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923892  | ORPH 
          TestLuaLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923906  | ORPH 
     TestLuaLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923908  | ORPH 
             TestLuaLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923896  | ORPH 
          TestLuaLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923900  | ORPH 
          TestLuaLuaPosix |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923912  | ORPH 
           TestLuaLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923902  | ORPH 
            TestLuaLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923914  | ORPH 
         TestLuaLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923916  | ORPH 
           TestLuaLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923894  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923910  | ORPH 
         TestLuaLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923918  | ORPH 
             TestLuaLzlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923922  | ORPH 
             TestLuaRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924028  | ORPH 
              TestLuaUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923904  | ORPH 
               TestLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923891  | ORPH 
           TestLuajitHttp |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923899  | ORPH 
           TestLuajitLPeg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923887  | ORPH 
       TestLuajitLsqlite3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923889  | ORPH 
     TestLuajitLuaCqueues |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923893  | ORPH 
       TestLuajitLuaExpat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923907  | ORPH 
  TestLuajitLuaFileSystem |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923909  | ORPH 
          TestLuajitLuaGD |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923897  | ORPH 
       TestLuajitLuaLyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923901  | ORPH 
        TestLuajitLuaSDL2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923903  | ORPH 
         TestLuajitLuaSec |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923915  | ORPH 
      TestLuajitLuaSocket |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923917  | ORPH 
        TestLuajitLuacURL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923895  | ORPH 
        TestLuajitLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923911  | ORPH 
      TestLuajitLuasyslog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923919  | ORPH 
          TestLuajitRings |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924030  | ORPH 
       TestLuajitTurbolua |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924037  | ORPH 
           TestLuajitUtf8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923905  | ORPH 
                 TestLuvi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923920  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923921  | ORPH 
              TestNetdata |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923923  | ORPH 
           TestNoTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923840  | ORPH 
              TestOpenJdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923924  | ORPH 
         TestOpenSshGlibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923925  | ORPH 
        TestOpenSshuClibc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923926  | ORPH 
                 TestOpkg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923927  | ORPH 
                 TestPerl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923928  | ORPH 
        TestPerlClassLoad |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923929  | ORPH 
         TestPerlDBDmysql |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923930  | ORPH 
     TestPerlEncodeDetect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923932  | ORPH 
          TestPerlGDGraph |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923933  | ORPH 
       TestPerlHTMLParser |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923934  | ORPH 
TestPerlIOSocketMulticast |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923935  | ORPH 
      TestPerlIOSocketSSL |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923936  | ORPH 
 TestPerlLWPProtocolhttps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923939  | ORPH 
         TestPerlMailDKIM |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923940  | ORPH 
              TestPerlX10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923941  | ORPH 
        TestPerlXMLLibXML |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923942  | ORPH 
       TestPerllibwwwperl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923938  | ORPH 
          TestPostScripts |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923831  | ORPH 
         TestProsodyLua51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923943  | ORPH 
        TestProsodyLuajit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923944  | ORPH 
              TestPython2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923945  | ORPH 
              TestPython3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923946  | ORPH 
           TestPythonAvro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923956  | ORPH 
        TestPythonPy2Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923947  | ORPH 
       TestPythonPy2Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923950  | ORPH 
     TestPythonPy2Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923954  | ORPH 
   TestPythonPy2Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923957  | ORPH 
         TestPythonPy2Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923959  | ORPH 
        TestPythonPy2Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923961  | ORPH 
       TestPythonPy2Click |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923963  | ORPH 
   TestPythonPy2Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923965  | ORPH 
  TestPythonPy2Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923967  | ORPH 
TestPythonPy2Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923970  | ORPH 
      TestPythonPy2Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923973  | ORPH 
    TestPythonPy2Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923978  | ORPH 
 TestPythonPy2Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923982  | ORPH 
    TestPythonPy2Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923883  | ORPH 
     TestPythonPy2Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923986  | ORPH 
     TestPythonPy2Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923990  | ORPH 
      TestPythonPy2Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923993  | ORPH 
      TestPythonPy2Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923998  | ORPH 
...thonPy2ServiceIdentity |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924002  | ORPH 
      TestPythonPy2Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924004  | ORPH 
TestPythonPy2Subprocess32 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924006  | ORPH 
        TestPythonPy2Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924007  | ORPH 
     TestPythonPy2Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924010  | ORPH 
    TestPythonPy2Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924016  | ORPH 
      TestPythonPy2Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924022  | ORPH 
        TestPythonPy3Argh |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923948  | ORPH 
       TestPythonPy3Attrs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923951  | ORPH 
    TestPythonPy3Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923953  | ORPH 
     TestPythonPy3Automat |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923955  | ORPH 
   TestPythonPy3Bitstring |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923958  | ORPH 
         TestPythonPy3Can |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923960  | ORPH 
        TestPythonPy3Cbor |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923962  | ORPH 
   TestPythonPy3Colorzero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923966  | ORPH 
  TestPythonPy3Constantly |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923968  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923969  | ORPH 
TestPythonPy3Cryptography |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923971  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923972  | ORPH 
      TestPythonPy3Gitdb2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923974  | ORPH 
     TestPythonPy3Gobject |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923976  | ORPH 
    TestPythonPy3Gpiozero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923980  | ORPH 
 TestPythonPy3Incremental |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923984  | ORPH 
    TestPythonPy3Libftdi1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923884  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923988  | ORPH 
     TestPythonPy3Pexpect |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923991  | ORPH 
      TestPythonPy3Pynacl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923994  | ORPH 
      TestPythonPy3Pytest |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923996  | ORPH 
      TestPythonPy3Pyyaml |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923999  | ORPH 
     TestPythonPy3RpiGpio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924001  | ORPH 
      TestPythonPy3Smmap2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924005  | ORPH 
        TestPythonPy3Treq |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924008  | ORPH 
     TestPythonPy3Twisted |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924011  | ORPH 
       TestPythonPy3Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924014  | ORPH 
    TestPythonPy3Txtorcon |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924019  | ORPH 
      TestPythonPy3Ubjson |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924024  | ORPH 
                TestRedis |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924027  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923827  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923828  | ORPH 
         TestRootPassword |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923832  | ORPH 
        TestRootfsOverlay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923833  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924031  | ORPH 
              TestRustBin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924033  | ORPH 
     TestSELinuxCustomGit |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923834  | ORPH 
  TestSELinuxExtraModules |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923835  | ORPH 
...ELinuxExtraModulesDirs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923836  | ORPH 
       TestSELinuxPackage |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923837  | ORPH 
   TestSELinuxSystemdExt4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923872  | ORPH 
...SELinuxSystemdSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923874  | ORPH 
             TestSquashfs |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923856  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923829  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923830  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923820  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923821  | ORPH 
...sLinuxX86_64LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923823  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924034  | ORPH 
                 TestTmux |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893924035  | ORPH 
                  TestUbi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923857  | ORPH 
               TestYaffs2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/893923858  | ORPH 



-- 
http://autobuild.buildroot.net
