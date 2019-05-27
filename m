From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-26
Message-ID: <20190527060054.C8BD222176@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  10 |   0 |   1 |  11 |
      master | 164 |  15 |   1 | 180 |
        next |  48 |  20 |   0 |  68 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 6 
             iputils-s20190515 | 3 
                      iwd-0.13 | 2 
                      ell-0.20 | 1 
libcamera-ab0188fc8bbb6f397... | 1 
          libcdaudio-0.99.12p2 | 1 
                  libssh-0.8.7 | 1 
libubootenv-8a7d4030bcb106d... | 1 
                openzwave-v1.6 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.2 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/672accb1835724609b572215df16aad26b024021 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b490a9afd5b2bd733d4897a02e5838a9f802d7e0 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/933559934a79892b896cf527b0ecc128af0d702f | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/95354db979635f53bb0cd9fe57d9dd585ee6c4ce | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2de07d94756ee9b9660ad6324ac96ee458e4f335 | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1ad2cf0656b28314403142e42afdb2c10dad023c | ORPH
         arc |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/1087072fb3f43486e9e64ed18d7ccedeb9340664 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/22df0c5404c104797b8e03625a9fd5eb875f5e39 |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/2013b5d93bc71e7f3facecd113f15c0241630484 |     
         sh4 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/ca6735bd8b9fb4724bed3a2f56d4c2abad438946 |     
     riscv32 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/40683ace0db2ba33363a4c138a68f43a371fd729 |     
     riscv64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/eb5d93191341eb22dc04f61f8255be1daacbab66 |     
       sparc | libcamera-ab0188fc8bbb6f397... | NOK | http://autobuild.buildroot.net/results/4fce9f87dba87ecdef6ecb4e8cea29b5707298f1 |     
     nds32le |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/8e66e17cefba5af06a50ff11aef336d912bdde17 | ORPH
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/90d223b7b285984354f3caa83c4b9b5fee5f45a9 |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/0cef297d7bf50b69bca56edd9b1b65d9648e8cc1 |     
         arc |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/745bb75ba11d75c8fd19e1192581ea848ebbff55 |     
     riscv32 |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/038d50784ec80b35e3daff1966df07a1b52780b3 |     
microblazeel |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/4e563f5fc38ec681a730a576c5f056bc092db74e |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/67bc128f8ff06e7c286fec9d82d4f3cd75b811ac |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 2 
                   netsurf-3.8 | 2 
             openjdk-jdk-12+33 | 2 
                suricata-4.1.3 | 2 
                  monkey-1.6.9 | 1 
                   mutt-1.11.4 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
           qt5multimedia-5.6.3 | 1 
                         snort | 1 
                supertux-0.6.0 | 1 
               tpm2-totp-0.1.1 | 1 


Detail of failures
------------------

         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/51ce52f42c3ce5879e97d396a531ca7ace77874c |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/7a888d1f4923d907cf35f69330fbba48eff63495 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/ae0acd83fd23310a3130f742ad88199c791b6d71 |     
    mips64el |                    mutt-1.11.4 | NOK | http://autobuild.buildroot.net/results/26c96f64e65998c4b46358cca566b8089dff7ac3 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bac4d10fdc3a5c736be648901202f4df473f3b2f |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d11fbecbda164f9ec0cd97e0c4e9fefe919b7384 |     
 powerpc64le |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/49a11b9549187c5ef36c2f0e9f56ccba58e7144b |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/bb1bb1cf8b58bf28039186866ed01521114acb72 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/1d12375334766d4cb9e18a905fea588132cc324c |     
        i686 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/3c6530fc7a037cc10d2c7efcafeab69186d91de8 |     
      xtensa |            qt5multimedia-5.6.3 | NOK | http://autobuild.buildroot.net/results/c88afcd365418e29c89f247d9d887b5f786b0ec8 |     
microblazeel |                          snort | TIM | http://autobuild.buildroot.net/results/2500faa51e96a06bab87c5aee0f9892c4d20de7f |     
         arm |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/b0b2e25af198d01713d1e2bcf38c77ae8ffbd7de |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/2de82d0155e37fdb843f5b856c24279557f1a4bb |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a2736a039f473b97dc9cc5eea6e38b65302dc2a9 |     
        mips |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/d5a0b8ab3f956068b9023951c8cc4786a05e4655 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                          opus | 1 


Detail of failures
------------------

microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/4673b9c47e4b88b05cb6e9bdd29787c9aa2bf3d7 |     


-- 
http://autobuild.buildroot.net
