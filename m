From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 06:30:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-09
Message-ID: <20200610063017.E4DD222849@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-09
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  4  |  0  | 12  |
  2020.05.x  | 12  |  5  |  0  | 17  |
    master   | 102 | 43  |  0  | 145 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.15.0 | 9 
                 mesa3d-20.1.0 | 4 
              host-grpc-1.25.0 | 3 
             c-periphery-2.2.1 | 2 
           host-wayland-1.18.0 | 2 
              ibm-sw-tpm2-1563 | 2 
                 openal-1.19.1 | 2 
                 rocksdb-6.6.4 | 2 
                       unknown | 2 
                  zeromq-4.3.2 | 2 
               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
                    brltty-6.1 | 1 
             freeswitch-1.10.3 | 1 
                hiawatha-10.10 | 1 
               host-go-1.13.12 | 1 
             kismet-2016-07-R1 | 1 
               libupnpp-0.17.2 | 1 
                nftables-0.9.4 | 1 
               pulseview-0.4.1 | 1 
                     qwt-6.1.4 | 1 
                wayland-1.18.0 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4eb3443175244f3a6c7f35f102c160836a3d4c74 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/22186ddd2011b69a3d9d509e80532971b6a93bd2 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c3a43e55da905e82514f1d898a3accb2c943ff78 |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/7d59d6122460df52a85a0833813ca9669e695399 |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/9294d892b648bd9dc2f2eb8dc797de5ab6ef59bd |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/170ef9197a6a5d54b1b5413276d6b671f49adcc6 |     
    arm      |         hiawatha-10.10         | NOK | http://autobuild.buildroot.net/results/67f75566a20ccb65920f6240a42b67f7021c777e |     
  mips64el   |        host-go-1.13.12         | NOK | http://autobuild.buildroot.net/results/4c5ef74a7c41cf0adccc74f07e9f012ac95ab9a3 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/818ca9176bfae01fabab16c52133554a6488e267 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e71eadc42cab5ff6172562c285b3d32955d856ce |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1f034eac24742e63b00c1ac169df1f7afefcaeb |     
  sparc64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/b53dc967d6821705c0b5efcca97cf7f7a32adccb |     
  powerpc    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/7cc62a276f6ffcc15b089bc00083fecb4ecc8ea2 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/073ace7f4e7025ca8a23990274089bea763e745e |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b8c802955289457013dc1d78cacf379fa37ea00d |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/671136dd591824411037432cd0aebcae77c653b1 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f777ebec63f4f0c402550692305fe910b437effa |     
  powerpc    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/fa424b4e45ccd1e3af909667a01cc6389dd2f250 |     
   x86_64    |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/14d3a81425e98ca41c2bab6741b632b48a3fb3d8 |     
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/8674fbfe41bc82e69fc8be1577ae27add16f60b9 |     
  mips64el   |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/1099ca03d11efd219a73d8de7b61d98b1beeddca |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/545bf3c858b6142c4283d46cd336d7a7599683a5 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/6359c0fbd09e39ec221a97270ad42f229982a6e0 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/3a4937b3fcf85cc9cb2cc0da015576f8a8ac8b13 |     
  riscv64    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/4a47044239f74ff9198d4ef758acd2753e981dd9 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f3647db92a65d68d76fc0948368745a1bc528919 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ea166773c5ccbcac7321f4df1b521f35ec0b186b |     
    i686     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/aa7ca4b1c74600e68737e8313986037f7b546e14 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/07194da62723582c4380eb1cbdd4dff4c86f5e01 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e2a392e79a450deba2a5b2070f40f38e2a2f9940 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/2e5f2df0ca9233ded10492364bc65d9fdda30151 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/90cc61fcb3e107c46b20307c938837ad9a94bdb6 |     
    sh4      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/fd328d5d9b51fac35ee6ecffdc0bb3670e0540d7 |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/d56f88799252c24e444a2326705b582d3b66e8b5 |     
  powerpc    |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/27ac3c09048744189236bd67aa643163d0d01ad5 | ORPH
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f8c20974323f307461a783245c905242427c4b22 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e75f252dd7ae2032e45526af9f00fa588ac8258d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/f690b7dc08210abe16ff828a21692311568760c3 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd9eee55cf7ba111f714c79e48babc1e3450bf14 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/8ba6ffae0dee20059c062bf79c97fa01eb61dc59 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/c6af146f28693729baa5f2210c523c6913d147c3 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/edb80b4387f8fbb8bda14f5298544da8ccd5150d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a50dcb3fd52dfaa2c931cb85580e226dbf2526c5 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 1 
                 mesa3d-19.3.4 | 1 
                 rocksdb-6.6.4 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c656870c6dd14f25ec915b04b23c2eab962e70c4 |     
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/f705232f957de4598d5e274c22b81ab657ecda6a |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/ab769f4ac948c14aa8cfc838ed718743b304580f |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/738c9a4c0d7b6965930417475bee09d416183388 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                  assimp-5.0.1 | 1 
               belle-sip-4.3.1 | 1 
                 jack1-0.125.0 | 1 
               libgtk2-2.24.32 | 1 
                 openal-1.19.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/b5e92e3d43e3653adda1e4052f3f1967d16a9f8e |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/65d603d60266a6760682ad5012e6a9319d82702a |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/6e929812d2c60b90e69d4a435fd99cad2110f199 |     
  aarch64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/546ff73c0ddec4791595e2dc87eceb5f205f0515 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/18a774a5410711fedaa287e4bee362d58c42b6d6 |     



-- 
http://autobuild.buildroot.net
