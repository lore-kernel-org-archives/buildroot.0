From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2019 07:18:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-27
Message-ID: <20191228071817.C07DB82D5F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  0  |  0  | 11  |
  2019.11.x  |  7  |  7  |  0  | 14  |
    master   | 107 | 33  |  0  | 140 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

       alsamixergui-0.9.0rc2-1 | 5 
              host-grpc-1.25.0 | 3 
                       unknown | 3 
                libgdiplus-5.6 | 2 
                apr-util-1.6.1 | 1 
                bitcoin-0.16.3 | 1 
          gtksourceview-3.24.7 | 1 
                haproxy-2.0.10 | 1 
                   i2pd-2.24.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  leveldb-1.22 | 1 
                   libnss-3.48 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-19.2.7 | 1 
                  ndisc6-1.0.4 | 1 
                    owfs-3.2p2 | 1 
           python-bcrypt-3.1.7 | 1 
            qt5location-5.12.5 | 1 
           spidermonkey-60.5.2 | 1 
                 tcpdump-4.9.3 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
    xserver_xorg-server-1.20.6 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/decc092f8c2d0259078810a033d630b69a8218c9 | ORPH
   x86_64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/b89cf4b1ce40df6ba3d2044fb2657077fe66399a | ORPH
   x86_64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/1a868e66530877c192704d42259119e0c90dcd00 | ORPH
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/24248028ce54ca5c7593cee2b051769d82dc24e1 | ORPH
   xtensa    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/830c15cb28485153a658c3f8456b750f3b0ef48d | ORPH
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/97cc51e9d7eb6810307a4312e43961e9035c9ca4 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/7ccecd0220d52e6469ae6a5556c81d6877f11019 |     
    i586     |      gtksourceview-3.24.7      | NOK | http://autobuild.buildroot.net/results/f3cb3dffb67188399dcceec98516cf4f1002704e |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/21bb147268007a55e7387a1ae3b8a407855faa7e |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/07b3c5bc4a06360577d411c2631dbd4a359e7759 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8423039ce605675f32df0130bec746f082c09d50 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c29e7b43ca8ffd581c83f8c9e8af31032020b6ed |     
  riscv64    |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/ceddc1a8a63a842773b69289240920e161c25e87 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/615e6b3c0a4b683553d16c213d7156d730996e7f |     
   sparc     |          leveldb-1.22          | NOK | http://autobuild.buildroot.net/results/1e309b50bf06ae5a35a1b46355f2d44a66d538a4 |     
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/0ea1cfc0ba73aec15c0a311334ef609829ae30c1 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/3f4681cc4406e1535eb9ea63a1f909ed96a26933 |     
powerpc64le  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/e42005d1bb70b3f2741eb77242b2fd8dbf2a55d6 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/2cdcb9cfd145a02e9420e0c0aa7c393d2e621ef2 |     
  mips64el   |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/8960b950f79be82f81db20be41fa4b47bc76dee8 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2e882d399a5feb24e43910e954b5b96b301a31dd | ORPH
  aarch64    |           owfs-3.2p2           | NOK | http://autobuild.buildroot.net/results/2ec48dbb60d86d8c9eb931dfa438e4d7b557a44e |     
    arc      |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/0a44e29067ad526fa86ac56e25117cdaa972cf0c |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/a593cfffbf05132e945d7d6efa5888a2646d5486 |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/d8570ac19d2a49501906b959d6e7b34cc4d75858 |     
    or1k     |         tcpdump-4.9.3          | NOK | http://autobuild.buildroot.net/results/8c04bd06ec45a4761adaddef76e969be54e0de5d |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1a7418b9cd11374a250f7509d5bddcc864375e1c |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/190dcb6c7b4df382dd5e43ab8fcc2688639031ea | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e509b7e095120ea2e4679ac56813ac2a6448438f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/cceb9a4de9565451e43a015fa7d6e92f3a949276 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/71d6ea20c2c8a128bc59a3c808d283a0cfe39f7b |     
    arc      |   xserver_xorg-server-1.20.6   | NOK | http://autobuild.buildroot.net/results/de838a843f97673d1381a55fd4e9b07164693913 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/25e884f6f0f50dae8966be37e6aad927fadf6883 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451644  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451727  |      
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451762  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451835  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451862  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451889  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451992  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451983  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389451986  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389452034  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/389452076  | ORPH 




Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
              host-grpc-1.23.0 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-19.2.6 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    quota-4.05 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/8ff4990f5caa60310ded5269e0c94bea63e25cc0 |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/6a7a27230748a9faaf7923ea468f084d01dafde7 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/def45f8133c977863e6c5427650b240909c13463 |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/6cc3499d7976808eefe232ee99c8b35361836521 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/481bafb33c2aa544dfa10a75b7554a8666189a15 |     
  aarch64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/3b958e2a98e6d04cad6baff40ef748d0287c847d |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/194d52402a3de58fc5a502b35b42faa965b40153 |     



-- 
http://autobuild.buildroot.net
