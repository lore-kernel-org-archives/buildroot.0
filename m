From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 06 Jun 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-05
Message-ID: <20190606060059.CE1772047F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  19 |   0 |   0 |  19 |
   2019.05.x |  19 |   2 |   0 |  21 |
      master | 170 |  52 |   0 | 222 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-cargo-0.26.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/bb046dc9da57896fded30b8fb1de4663f815081b |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/310b1efbcd334b8463a8cc0ec8c4b9b1ac349e9a | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 16
            nanomsg-legal-info | 11
                poppler-0.77.0 | 5 
                   libva-2.4.1 | 3 
package/nanomsg/nanomsg.mk:... | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                     vlc-3.0.6 | 2 
                    efl-1.22.2 | 1 
             host-cargo-0.26.0 | 1 
             iputils-s20190515 | 1 
          libcdaudio-0.99.12p2 | 1 
                   mimic-1.1.0 | 1 
                openzwave-v1.6 | 1 
                 python3-3.7.3 | 1 
             qt5wayland-5.12.2 | 1 
tvheadend-17dff3e5ffbd67174... | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/cb50c0d86fedc90b9da3320eed96e96f873a81ee |     
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/9a6731a14a1b1ee93348ea68460254351a7f95d9 |     
  aarch64_be |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/5c5e51d065a67736fe5ddd1f6eb3f49ee898b89e |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/f10e94a67149b0d87986543db79b0db121468fc4 |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/18d113b87e4b29c278f7c347f4fb008da7906c21 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3c0f7184506e638f61e491f855d4d3bebbbad4a1 |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ecbc8e1e6b4d0c05301f219190e20fa6c0a525fb |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a52d9b4d83d8a62af47d02186ad170fbf65758d0 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/da423127043d3411f18a08b5abfb783b36a7e9a7 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/b66b3f41f33442bdb61ba6c0ddda4a2e6fcd73e5 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/81bc91ea25e959e3da75034d2e58603a1a678030 |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/aec1d3a66a739be9eb4682e460a2bd40de5290fe |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/19ecf344bbccc8c46784e2b7e77736c8ba2c4956 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/827e50689e098f04226fcf9e837d0c40e9640c95 |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a63189e4d3c3034a3556a98b735896d7cb54bc6b |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/9e1250153f94504ae3aca22f099322d1e2f87b63 |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/de129e8a456e86f5834e7266b4f720230b2eff98 |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c6764b1257fb74ac68a92bf580956c35e3a2550b |     
        i586 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/fb698e3e903869978bd5e69d791ec362317b7981 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/3271183df2887ed6a51724e56e120783804a7a95 | ORPH
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/cbdb54401892d831a769aee0696327f59237e9b1 |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/e0d2f1b1798f3d0328aa0fb93e881f330f8b5989 |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/63321c258756eaf4f69a605cb0bb6c264fd7be1d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/2ccfa084858e62e7cb482ca6bddc7c3fab2f4102 |     
        i586 |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/5d2c6289c336cb9f441056f49ecc8bc58553366c |     
         arm |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/fc5f015e9df802fec25bb9b32a4d02a5153279fb |     
         arc |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/d34b3b5890c3987ee01acdface6f7df70671578b |     
microblazeel |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/87c11a074492d242814da12a67e87b4e110699fc |     
         arc |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/e2d0af32e2613c7fb7e19e6dbcf00d7b0e545ef9 |     
microblazeel |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/560236ec8e19140f7c938fbf7bd6ec8ce6918129 |     
        m68k |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/5a5d0adec4d2662c1b0c4fb64922fbfe9d83bc8c |     
         arm |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/044a2c303c543faf024eb8029fd62d33c3194a4c |     
 powerpc64le |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/8977b36c9ddac6279de17ee1115941faa733c96d |     
  aarch64_be |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/01afe5a19d3b109737fde9f7fc35c5d2247b2203 |     
     powerpc |             nanomsg-legal-info | NOK | http://autobuild.buildroot.net/results/d8b03a08a32e17726f3c7a1ac44eeb4b5cee2426 |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/34a15cf6f2c289be50783986081509e62ea7d621 |     
     riscv32 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/1306ead9cba10979f638fb8977eb616bffb96bcf |     
        i686 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/ea6ee6f0a2ad650b719eb0d0bcea8015839e946e |     
     riscv32 | package/nanomsg/nanomsg.mk:... | NOK | http://autobuild.buildroot.net/results/105fb58a897a19c612a3917e0d4b7c415b67cf2e |     
     riscv64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/ea06332063878ff2c4ca120bd51e5eec692d8478 |     
 powerpc64le |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/cfc926e209a5f22535829aa98b4be55d401e66f7 |     
      xtensa |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/28bb3b59b391b8e1fe0c6268f44eca399238a15e |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/142a31a9c3ccb96c1747e1535bd97cff89ede224 |     
     sparc64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/c90f6a5af43102f3b4ac5805e925f1b230aebbdb |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/d159346269635da474deb290717a1b2922c5bf0d |     
     riscv64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/897bd5bca17c93420e6ef1634b9eb8835ef9aa77 |     
     nds32le | tvheadend-17dff3e5ffbd67174... | NOK | http://autobuild.buildroot.net/results/7b79d25e3dd758592ab040a339c648dd48a39138 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/e399f75243f74c493185ffca09f5640ab79a9683 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d12de589a63683db13ba3cb3c21e8212c3d38ed5 |     
     riscv64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/df03b6bfe7d01f13de92653bd36b2d21f258e9b1 |     
         arm |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/fe12eb4c293fcf62aaaae9ba23c055ac1fe6438a |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/d48c01d254b4d2b41a944f0ed3c021d8a6f085aa | ORPH


-- 
http://autobuild.buildroot.net
