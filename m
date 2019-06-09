From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 09 Jun 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-08
Message-ID: <20190609060057.1B1F785C7A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  19 |   0 |   1 |  20 |
   2019.05.x |  22 |   1 |   1 |  24 |
      master | 141 |  53 |   4 | 198 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                       lmbench | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/609c203306cd71c83eca37358ebadcbdf2326d80 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/4e11f3c1be01905b2b05d2532d19092916f75079 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 23
libwebsock-3c1615eeadb0b582... | 14
                poppler-0.77.0 | 5 
             iputils-s20190515 | 4 
                     vlc-3.0.6 | 2 
                   gpsd-3.18.1 | 1 
                    gst1-shark | 1 
                     host-llvm | 1 
                   libva-2.4.1 | 1 
                       mongodb | 1 
               qt5webkit-5.9.1 | 1 
                         slirp | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

       nios2 |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/6b7e1bd34a761998b8986b751ffc45ac9537c55e | ORPH
     powerpc |                     gst1-shark | TIM | http://autobuild.buildroot.net/results/8a7465e4df5fd793b6a88d156232b8b3bf3a44d8 |     
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/e5f749e96615e69e19b8b7cc75a91b4ed98f27c3 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c5aff4085e4219a0f61f095e81f9682bbb061a26 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/eae0761af9e92ac74e30a3c823a9d85824cf7e33 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0a68d908f3f709b2c5f7a630643c6aa1dd29fd6a |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ab772630908e61a3f62d68341dd3e068dbee13a1 |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/beb88181345650b1a7aa9eca67489a15b88a6a3a |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a853b6c69cbc2a0ea67e3a42bc91d7afd390ed6f |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/af8e47f1b6ccce03376daead75692aac44bd9c33 |     
     sparc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3ccd7e3bef5426c948fea92c12b54e8d68d50f5e |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a0d0bad7b7d1b1624db10f22ff703cc629fcdaa0 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/97460ee8c631a2af691bd9fbf869e399d9fd1316 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/4d5104f1e8824c9d0e8fc445c8f0c51cc51d3167 |     
     sparc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e1a72db25d1a868b1af3d50e5414bd370fe585d |     
         sh4 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/50fb4a7605ef86290865345b33a94ad711655824 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/14ed3129f4203548aedca7e616d1a0bd18e41f6a |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3a9f061db428097f19f3fc8209c8c87c5a649484 |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/1e5a0902d28e4ee0a5c41a7c0f8022e7219f3462 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/4868c0ddbb2ad53b05dd4309c72660dd874fd3a0 |     
  aarch64_be |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/5b06649b918640222d1633ce225666a22b5a3f21 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/aaaf4640f6d326a5752a5ccb837beaf97da3493e |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/85417299acc7b8884f52ed6f9cdbe94e69da75f3 |     
microblazeel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3f665b59df399d791d5a068a87286d9464488ec7 |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f38d728e4415fe48d3817dbcbe98f0faeb923845 |     
   powerpc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/44a51c97d2cb8e75918411d2fb0929ecde81230a |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/711718ecf20d6cc28953e089a6e5516cfb4b9031 |     
   powerpc64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/821d99a0710ab3bc1dcc7cc90073878ca034a5d1 |     
        m68k |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/9f7955f2137e2be561ede47cd9b3726a4af5f1ac |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/059dfcd234b71c51be56c79bb09854a1923f0ef9 |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/26fce3252ef8a0bada22b9a7c9919ed65079589b |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/4d3549959e3b9d43d43cb8d029c8ce17c254ace4 |     
         arc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/57e47466c1c7d644295a7296cfa0b2ad74318994 |     
microblazeel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/8458ffd76f975e897fa61480245ed3ca2c4f9687 |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/a891a5930f94ab79e26489e0203fd544bed1ef37 |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/d3fc9a627ebc60a2b3b02a81d4747dd390d75f5a |     
     sparc64 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/6e2187170857b88b1085cc5f5cb64a3b85ab5680 |     
      mipsel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/45c37229900918758069ff785916be7534747112 |     
         arc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/ac47012413422a5bd663d0d790bfdd19efa14de9 |     
     powerpc | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/6409d0badc3baf0f186de77ff50116eeb45a855a |     
microblazeel | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/1d8aa9d26ea47c431be0725b41afd3b2aa2684d7 |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/2ddecf6e89c3dfed93976bd13a7d1aaa1732c145 |     
        mips | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/6bea280c6acfd2a4d53309a64d05f83417531129 |     
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/40f1addf2b2481b94d878d10f721be204639561f |     
     riscv32 | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/be32afa364a6b387195cdb5166fb23e9610451a7 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/0cce59ac40ccacaf9e7d38737e7869b7042508c3 |     
         arm |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/debfb597f6c3600d440752ef6b473db6a9680f48 |     
     powerpc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/900a76b8e1f0cbd895b08a20fb9e137f9e7df612 |     
     riscv32 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/d402098d12fd746ffeed5e121d9aaee8bc5f0cf5 |     
    mips64el |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/5a8469a8ac4c7d67284aadee7e5db7a678118b64 |     
         arm |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/e409863724005a0c182476612187a322a16a7db8 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/7861daecf94354f6abc0b2be7dd77149ce59751f |     
       sparc |                          slirp | TIM | http://autobuild.buildroot.net/results/84d66b33fd381269aea823d43b1de20cade774a5 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/b0b0975d0c94dbf888c3275bc844a5c11851982b |     
         arc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/03294f61652e9e114c602c35b882655389108a51 |     
        i686 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/78af283dc2e5bb745a40d38b1009810fa5d6dcce |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/e7aa22fdf01788752e9482449705524999056b7d | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 


Detail of failures
------------------

     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/989ed00eb29a8e78cc41ba0bb1630c5d3378a8ad |     


-- 
http://autobuild.buildroot.net
