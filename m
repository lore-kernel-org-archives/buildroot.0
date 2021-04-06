From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 06 Apr 2021 05:10:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-05
Message-ID: <20210406051013.DDDAF60888@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 34  |  8  |  0  | 42  |
    master   | 132 | 39  |  1  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                      iwd-1.12 | 4 
        host-sentry-cli-1.57.0 | 3 
                  monkey-1.6.9 | 3 
               capnproto-0.8.0 | 2 
                 dc3dd-7.2.641 | 2 
                directfb-1.7.7 | 2 
                mono-6.12.0.90 | 2 
                 openmpi-4.0.0 | 2 
                rocksdb-6.13.3 | 2 
                 dmalloc-5.5.2 | 1 
docker-proxy-55685ba49593e6... | 1 
            erlang-jiffy-1.0.6 | 1 
             libfreeglut-3.2.1 | 1 
             libopenh264-2.1.1 | 1 
               libtheora-1.1.1 | 1 
                  mender-2.5.0 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
          perl-dbd-mysql-4.046 | 1 
                 python-uvloop | 1 
            qt5location-5.15.2 | 1 
                 samba4-4.14.2 | 1 
               valgrind-3.17.0 | 1 
xdriver_xf86-video-mach64-6... | 1 
                xenomai-3.0.10 | 1 
         xlib_libxshmfence-1.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2d353363647f8a25d797636764c0ca68c6f40127 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f4a4be33f238ee97a2d33b76c55e82ababc9faa9 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ce88acf8a6967b0581f4b9f5e348af07eef08e26 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2d1f5b1eb99df1b4841a538791ca09ae47126157 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/5613fd7e549ceba74fd083c0ec24cf128fdb60f5 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/6f096d432868d81b1c5c107b142998674bf63063 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/a925fed1b054fd16e122049c315c905557247621 | ORPH
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/6e8aa9c8e2e6d468380b5e203e40e3654f5918e6 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c659fa8c16c53607a710f9b0b1e8a34d3d612c4e |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b76b2aa4e5a9c0bf654cf89d7327fc8f6caa4374 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2d16660661cfb9c9205bd61ec4098134017e4561 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/291a16e63a1550275b5e4cabc866769939ac0ffa |     
  aarch64    |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/93dad8fa61920e52d20b1a117945636e69a9311b |     
 powerpc64   |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/44e243530cbcec1c88511bb22f5e8e4655c43824 |     
  powerpc    |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/6f968ecfd05530935f288a69194c7dce07366d28 |     
    arc      |            iwd-1.12            | NOK | http://autobuild.buildroot.net/results/541f9f8bdd9f4e0fdf1b01a770d253d7fd6e73ab |     
  riscv64    |       libfreeglut-3.2.1        | NOK | http://autobuild.buildroot.net/results/48c11cfc19784cc9c3ba5c6ba3d91ddae192734e |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/16620112cc8d375ca511f20f2df18a92dc0f14a7 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/631e4399a33959ce96535820fd19d6b6dd3e4ac6 | ORPH
    arm      |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/74ee72b3f73e2783e377dfd7c3dde847a63bc71b |     
   x86_64    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c3c64bc98645d8900b9a44605fde5b3adaf671e3 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/596a1e027270efc6542b5ecb4284ffe5b2ea950f | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d6bf2341264083d00f3249f040c780deace14ad1 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/aa17a6462802001aa8c51d50c19de2a08e09376f | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1446668cd66721df88d36beaf88dc6413cab51af |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/680b8d18169ea40af436c99b96cea4e33129a20f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3e295f46756263f9163a37ec1396c1b8a34308af | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6462bc82aee0144dd0256b095c3d9b2db382a0bf | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/acc7ffcea9aa6772d61e65defe34096d36431112 | ORPH
   nios2     |      perl-dbd-mysql-4.046      | NOK | http://autobuild.buildroot.net/results/0734c973ca7357f65c22f3a9e29fc1263c600b68 |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/1da8110dbf14a4520c48a87dca83d80d1542830f |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4cd8f127c05542c63819282a9a7e977fe38fc18c |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c311339e3dbacaedd637a18f140f7ec94b5cb12d |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1803a39ebdc43c4d1ec43e097034dc22b805e79f |     
  mips64el   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/2cd675e31af7ba2f491bdfe62c084219285aa5ee |     
    arm      |        valgrind-3.17.0         | NOK | http://autobuild.buildroot.net/results/b106be44d6e7d82a4e3ad16c995366a46d39ee3c | ORPH
  riscv64    | xdriver_xf86-video-mach64-6... | NOK | http://autobuild.buildroot.net/results/c5f118d8c20117b903804db670c49ede2a40294d |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ea7b434ceaa9352767db3d7d08393c3d6425fcc5 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/b3523e35fde0fac04b96a6278cbc6ffdfe56f7d1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1d32bd37e7b85209f46932a9e89fb39dbf7c4253 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
android-tools-4.2.2+git2013... | 1 
                 gerbera-1.6.4 | 1 
                  mender-2.3.0 | 1 
              netopeer2-1.1.53 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/e009b42abfb721c3d312b665c8a14c4a032eecf0 |     
    or1k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/94f2bb3463c203580af978d64b0c64c81140799e |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c065fd6270722152cf03d3a8d205486ff274840e |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dd6abb9930b26c5b3797ac47fd0c3098fa7c8145 |     
    arm      |          mender-2.3.0          | NOK | http://autobuild.buildroot.net/results/15e631c22626d9f97f49a113a4836f26244e0d7b |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a2668d66469ba0251c9b541ad37b6f442ec4c26e |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/09aa124a0ca5baf7cf5945f5d3b3d6a56c453e60 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c6835e3fdebe09db9d05cff301fb528823fea04d |     


Gitlab CI results for 2021-04-05
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975854  | ORPH 
...ystemSystemdRoIfupdown | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975843  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975845  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975847  | ORPH 
 TestIso9660Grub2Internal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975824  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975826  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975828  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975863  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975865  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975860  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975849  | ORPH 
             TestSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1152975829  | ORPH 



-- 
http://autobuild.buildroot.net
