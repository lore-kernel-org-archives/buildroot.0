From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 08:00:57 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-19
Message-ID: <20180920060057.96FDE208F4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   4 |   0 |  31 |
   2018.05.x |  24 |   2 |   0 |  26 |
      master | 177 |  89 |   0 | 266 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                poppler-0.59.0 | 1 
             qt5location-5.9.6 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/c749297687b09f15b5a7a6b61f6f2f1d1ad66722 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/23dc9502670a54dac37d53cb9476d546e86c2908 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/addb016816a5aba84e2253d2e88fd68ff16715c5 |     
        mips |              qt5location-5.9.6 | NOK | http://autobuild.buildroot.net/results/37f90ac51ded33ebbaa2ebe48ba90e5bd5b1472e |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 
              host-bison-3.0.4 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4c23692ef9214b95f1b7fe46b812b1667d14019d | ORPH
   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/30c764a93da5c0513c7b18b64a75bfdb4992d07c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 29
              ptpd2-ptpd-2.3.1 | 9 
 Makefile:708: target-finalize | 6 
          synergy-v2.0.12-beta | 5 
                    brltty-5.6 | 4 
                  monkey-1.6.9 | 4 
               tinycbor-v0.5.2 | 4 
                   dante-1.4.1 | 3 
              glibc-legal-info | 3 
                blktrace-1.2.0 | 2 
                 lvm2-2.02.180 | 2 
                  boost-1.68.0 | 1 
               bootutils-1.0.0 | 1 
                   botan-2.7.0 | 1 
                 dc3dd-7.2.641 | 1 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
              freeswitch-1.8.1 | 1 
                 gadgetfs-test | 1 
                 libv4l-1.14.2 | 1 
                   luvi-v2.8.0 | 1 
                  mender-1.4.0 | 1 
                 midori-0.5.11 | 1 
                   netsnmp-5.8 | 1 
package/glibc/glibc.mk:134:... | 1 
                    php-7.2.10 | 1 
                   qemu-2.12.0 | 1 
               qt5webkit-5.9.1 | 1 
                     squid-4.2 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/284543bd14e82cee643bcf40e8f976995e1c5bdd | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/9b0354930f20d5bfae3addbea4a8c931b8c171bb | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/f683df5a7851e9e25c0f70b931660cd4d2bdb8e2 |     
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/1fe91e75f5b8fb857d982fb747c1e09ddca5d874 | ORPH
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/2ab1480e3440f1c416e8ec2591eca1bd0b4ee0fd |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/be3b21c285c8be925673d381481ffc0ee066dccf |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/0a12ceb665bc1568e5519c2bde55ee3bdba9a6c6 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/11b44ed19a746a1f307cd9335f07f9473c9b990f |     
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/adee712be9207f295fe2fbb1ef19154a7f7d88e8 |     
   powerpc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/5ca29d8de4ac745c3dafc709112c7aadfc7c84f1 |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/8578c2d366efd7f7e0cf7c6e842477a76ee88bc6 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/4a5c6811e84d44726b3cac9031c08250d04a628e | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/0cca269681137d91aa24910a3848e4eb10557e19 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/37a7aa51b5bfeb2686d9c591dd9de21fe0fbd8e1 |     
      x86_64 |               freeswitch-1.8.1 | NOK | http://autobuild.buildroot.net/results/9cd9634d2f1a8a2fac9696e2fa1faa3ac0c8c64d |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/faae18c1af1f6673fb4452c64ff5aed3abf5de6e |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/7aff83ad90dc349fb209a0c85c62e74aed045ec4 | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/8fc550814f424708ffcb75f18daf886eca76d46a | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/696c2ccae540e8b623b01069cf7aa4a9647de59f | ORPH
         arm |                  libv4l-1.14.2 | NOK | http://autobuild.buildroot.net/results/f3858970c1bbb7b0201389f7656c9ccf15a59fda |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/6b0ef5e8b319f2693364a4300d0cae49e125a310 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/95ea73e645af8e19ea3db4254d4eea8ca35fcb55 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/34ce479fa1cbc72980cb2daed7922731e81e76aa | ORPH
    mips64el |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/3aff4d97d31dfccdefe81f75552f802152bd745e |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/5b4a7a9ae7d4918ba7caab42ae9a3699e2509246 |     
      mipsel |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e010c69522eb962921a12e96693c07c2cfa9893e |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/aa11662612c5391984793f4f27f5d8067b5bc5c1 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/e4a887d39125d57353176a594a71237b1df61d6e |     
        m68k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/745bf22cdcf1afb981d9bc9b7deddc65771a5f04 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/34aafac726bc11f20f3848de66bed62067ef0efc |     
      mipsel |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/97fe86da89f36cb2d4aa00d9d092466f06070b32 | ORPH
      xtensa |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/c6af204c128ada748d45c1914df276fc3ac3a81b |     
     powerpc |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/37aedd2e16cadb76069e6e1db34d8739f2ffa36d |     
microblazeel |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/865bc2446d51effae0daf275fd95ed8ea70476c7 |     
         arm |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/7a2ff67c64b07dbdb8ec8d675b7b1014d39319cd |     
    mips64el |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c1821ee6af960c89bf101cc700d19941df128303 | ORPH
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/790ab51839c4f51cb578d87bf19cc20252140faa |     
microblazeel |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/b4c0f7c3729b1baf5627fe38809d3c3a98bd5228 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/824652158e61e7e45e07042f7a2f53cfa24f7b48 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/b15224109b5c892dd34fbf79057d308dbc569482 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/564fe3a4229e36e89df7db39b31012f4fa06ac08 | ORPH
       sparc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/40e69a76370b6ced5e16fa161bf73cc20decd203 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4936fc60c683d8a0787a63b395fd0a013af2d66a | ORPH
        mips |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3284ff7be5e9075bc16845cdcdc4dc36552df040 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5421775c1a5c47f7cc00a817a4449ee40a235425 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/34181e99ad859be67eeea5b99bee1ce310037988 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3bbff3df214fb0c9c3a030e3e34dbfc59ce28bb6 | ORPH
      mipsel |                    qemu-2.12.0 | NOK | http://autobuild.buildroot.net/results/03687baeb245bc928c3018c7b66ce3f6a107f065 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/63bfc723e70de76f25c425c9fbe435ee4830befe |     
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/470dc67ef4fd6269209ef12679b6b0d24b1e2e72 | ORPH
      xtensa |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/55a803e994859406e075ba1dff09dcbd872218b5 |     
         arc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/74dd0baa26a11791e0952128da7245c982b841f4 |     
  aarch64_be |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/f0ae423d8332500b6fbc7c8539388aef177f0fa7 |     
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/366b637f4eb38ab2afd0ec2be239e20a29c21bea |     
        i586 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/771cea4039cea472515e05e944238fb0bd6dc707 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c5b7b6ed40045a9164349c734c97968aa3840ef5 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/9fbdfae37c58faba5109801793d3faaaf55b40c6 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/8296b472a9f901bfc4b125e42e3b8a32a5d8c60a |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/5bec348639f2740722af768d4a896a8b2302f489 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9bcc65f64614a550e1885ac17bc1577df078d583 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d183c367a85822527bbef0f2816c64b87ad031a7 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/221c8fc171536facb5081b9d3e211871b47b0d1e |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/7dd359c0c60617cfa61913b438e549d8c5b62c22 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/2d6b98c2a15b912b6176723d3af9c265cd9d585c |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3a94189498850c65f9b85bb5fa5d0f64ff5a2780 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/69425904fb9fe2c2ae8547d9c8f2c1cba7cf23b1 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c5bb32cbf98160a94c747d43bba597464f8c9dc2 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/534b6b8b3dfd2a23162f3a1cd6166fb2aa754a48 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/67d20a0c60a74632452d87fab4fae61368058ac4 |     
        i586 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ebf19419af04165a6e85a490fc03b4248dce38ae |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/173cacc8cbc5a3cc5b34f4f704e2375dbfc14ead |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/9a990fddc7d42e60134ba36921947eb3143df7e6 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c318540f326fa21e3798c9f01b21f0f3214d04fe |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/085c88dc03824d633d39abe92a4b2b4b4332349f |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b8b94dcfd1ddaee549ef692621c7b9efbd7e39e1 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/0521cc4a886fea0efef1039632e275d8a04defd2 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c6b0a1d1a5aa2a342cd74c3b3fb70587880fd4b4 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/65d709f43419d46275fd1e0c88f1bc67c703dacf |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a20de04bd8d9d0c0c168d16909d9977a186ca4cc |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/d708d33541b7e3ca411a9812de2aadd2185e1fef |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/e2c99f11482ad268b4f55ceca38fcbfabd3ca615 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e5dbe9d87e6a061485fb5ecbcb6b744bd52731ae |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/8973eea9fd0b2faab3939970967e2ff30d86fe51 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/50b875da9bb953916aeb2789e25975c5632f485e |     
     powerpc |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/e08814e106a0b86160d7f86b02745cf2c04a34e3 |     
microblazeel |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/bc2a62213a21c380fa328f62e192745310c9968f |     
        or1k |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/1c2930ae3d0a0ff9574aa1db57d26389476cad69 |     
      mipsel |                tinycbor-v0.5.2 | NOK | http://autobuild.buildroot.net/results/772d9c3c17ea5b1cac54cbae07a20bb6062cfe08 |     


-- 
http://autobuild.buildroot.net
