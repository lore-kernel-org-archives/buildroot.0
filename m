From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  6 Dec 2018 08:00:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-05
Message-ID: <20181206070019.2A26920C36@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
   2018.08.x |  17 |   0 |   0 |  17 |
      master | 172 |  46 |   1 | 219 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   qemu-2.12.1 | 1 


Detail of failures
------------------

      mipsel |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/862c2c293a27e9e82a95666fccec22761209f9c5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.3 | 10
                  linuxptp-2.0 | 5 
             stress-ng-0.09.47 | 5 
               libiscsi-1.18.0 | 3 
                    efl-1.21.1 | 2 
                   eudev-3.2.7 | 2 
                  grpc-v1.16.1 | 2 
                  libssh-0.8.4 | 2 
                qt5base-5.11.2 | 2 
sunxi-cedarx-b8f52d913f7372... | 2 
                        glibmm | 1 
             host-grpc-v1.16.1 | 1 
     intel-microcode-20180807a | 1 
                  libftdi1-1.4 | 1 
               liboping-1.10.0 | 1 
                     pcre-8.42 | 1 
                 qt5base-5.6.3 | 1 
             qt5location-5.6.3 | 1 
                supertux-0.5.1 | 1 
                   trinity-1.8 | 1 
                     vlc-3.0.4 | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/49419a4b7b182402d17afae190e27c8045304403 |     
         arm |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/b965e3de5401f5348dae51947bc47a43d93c8c11 |     
     powerpc |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/e3163c15ede572a10e6d62d02ba04b27819e18f3 |     
         arm |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/f92998a2f2ac8bc536c1c7d74b5d7fa6b9ba6428 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/09d0e58b5776efba896c7c7e3435d51fccb59edf |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/2f208fbfe4e9da94be5b9c030dbd278cb8ba053c |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/da2502b90826f2d7c083148629262ca63f27c6ff |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/423d93ab8ba6264a0335a4b598d83830fec9b1a1 |     
        i686 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/2b1dd8a70d503f0835ea72601048c23a8a6375cf |     
      xtensa |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/2694897f7e036af70415422ef5a1e34bd8322dd9 |     
     powerpc |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/5f2032e9ea2b882b90bfb579499a37f3916d3ac7 |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/8e9f55e7c222df0477048d1d27059b198c57f7ed |     
        or1k |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/0a8a2f4fa5b85289db2cfc46db3b21677448233d |     
         arc |                liboping-1.10.0 | NOK | http://autobuild.buildroot.net/results/b12d86388b495a96194e0bcbb5c19a4e35cbc53d |     
        i586 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/a38f0099949c51c1340048ada4d7b642a48b0f1c |     
    mips64el |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/9295e5a19be20a66c8406a515a3942131a2a8e9d |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e439468209f6857a2e3c205eb2ff07ee94e71b50 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/eee8881e189b30ea3bb809a24b7d9b537b0757d9 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/399f4f0c52234c6dca3d23d88830072bbabae7ad |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/b57a5ecdd61d25bfb0c3e4b67f2457c691206fb6 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/64f44464bfab0067e5e20058855c4c83fe7e7497 |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/88ce67188fa13b0e8a4693791508eaf78b200fcc |     
microblazeel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/4afadb209af8244a0693042b7f1523f5a68d52c6 |     
    mips64el |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/1f00bd57efcb1a62d00d7e5a9f02a5765345a6cf |     
         arc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/a83c15b111cc2bccb628b2c66fd61e6095a5a188 |     
     powerpc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/6754efa56c6d421a4c4c9ef2afcf18fbd22a1715 |     
        or1k |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/dc475c5aef745de31c9d807fac07e43660da95eb |     
     powerpc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/22e0a035ebb8caf0d693378411f763a08f793bd8 |     
      xtensa |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/3fc115ca9cea5a6e4b8e20d3a6589a2ba80c21d4 |     
microblazeel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/02843083a85c2e6a7ec24250f3d4d52dac96d0fe |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/05872f278233a0e5d9d07f1f5e8e43a4bb242e03 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/f8bdfeac869d1909e01836166f6f7eaa6a348ac7 | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/9f469e5e66c5fd99d80018219b82fa04616632f7 |     
      x86_64 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/c79dfdf2a5eafc957d574eaf1ac359ef773f8071 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/483d0c0c8e761e4c0171062c9fe1e360ec8bebf4 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/a6a2c08dc193b56addf63bc521f5e138dfc9fd8d |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/a88558aacafd2dd7c10c0076a33f63c9fa89f87c |     
      x86_64 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/eda34d9a6221ef6d4cca6bde2bb5afed98b924af |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/ef1afe197e50d893fded689c0d842aca4101f298 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/7b857f9cea9a57c3438815457f3ea76b10257be6 |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/595d96ddca02f8e2c80bb3b660a26945b985634b |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/7b37212e996b51899b59a1e5c4a7159afd4fbe2b | ORPH
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/8bb4fd4999dd6e56b60770e03c8343d08b10bb4b | ORPH
    mips64el |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/f36ef0d1acad2dd38a17cef3e3fb931a1686b648 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/7e9f34567018fc7ee50dcd3a066a241ce9fabd8b |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/257d6cea4d3a253a76767e20036cdd9f5be4086a |     
     sparc64 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/a7a2727e191d1abfce1651891d0435769c123cc4 | ORPH


-- 
http://autobuild.buildroot.net
