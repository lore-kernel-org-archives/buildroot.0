From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Nov 2018 08:01:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-17
Message-ID: <20181118070114.2592A20D73@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   1 |   0 |  16 |
   2018.08.x |  18 |   0 |   0 |  18 |
      master | 179 |  20 |   1 | 200 |
        next |  36 |   9 |   0 |  45 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/eab421e3a5f51462a13cbc9fcfba5f1001d033c5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               boa-0.94.14rc21 | 4 
             gstreamer-0.10.36 | 3 
      docker-containerd-v1.1.3 | 2 
                 libv4l-1.16.2 | 2 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
easydbus-59c340f2cd2c92ded8... | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.7.6 | 1 
                  mender-1.4.0 | 1 
                 minizip-2.5.3 | 1 
                   mpd-0.20.23 | 1 
                qt5base-5.11.2 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/8fa1df4aab3c32ff3f867e287488301da84f501c | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/512a6a20928e803a5653a2be12adeb6f11202aa1 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/d91ddf13788d1d798add5301df15d7a4413c8e57 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/8ceb9c3f16da40acb40658e8b49253f209c37f9a | ORPH
 powerpc64le |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ed8fbc96c60c517b8ae822e58868458c805ee6f4 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/d95a5a940ee8f3d931fea0d1b5497c2119d45f8f |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/a1d3f4ae8e44ed7bd86f2c6e2058dbbf68633acf |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/c10bd1bfe8431b128c9b799bd6e2bbd27f891bda |     
     riscv64 | easydbus-59c340f2cd2c92ded8... | NOK | http://autobuild.buildroot.net/results/486c3cd98124e7415dee2fd1463bd5e0fcc9ba91 |     
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/4a2b64434caea1fa7cb97a89ccaa040e1ebb4726 | ORPH
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/2a4a47d5ffe32d1f91e30538d472a45a56544a80 | ORPH
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/dca32c929350311fca1a85e251d318b43c4a3177 | ORPH
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/7b450fe3e5e7530114c2ae9eb4cce36b1055f46e |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4a770ae6cd4eab568ad35658c221f119f8286364 | ORPH
        m68k |                  libv4l-1.16.2 | NOK | http://autobuild.buildroot.net/results/7d5139e480f1a450647bb838748f0f2b6bdc9568 |     
         arm |                  libv4l-1.16.2 | NOK | http://autobuild.buildroot.net/results/447d792ce21c0e33a36ca9384fee46e099435ed8 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/a474b2bdea3789a1fb6cbd4bbd000329f04af668 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/0499bfcef85d217e6deb4451ac1e7e09942434a3 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/29ae473f42d68d4f6a8889f2a402ef9f05d70d0c |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/4db7d1b4fc4b4891c8757e81124b8cb241db6711 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/103ab699160a5208ff8d2a2502726016882615b9 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                tpm2-tss-2.1.0 | 7 
             gstreamer1-1.14.4 | 1 
               libiscsi-1.18.0 | 1 


Detail of failures
------------------

     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/70c7164739075395d93e3176dd0a01b9bfb9efc0 |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/789e359e4e35e2ea88c68e4289bcbbaa9f3bf784 |     
         arc |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/f863947a7384cb754706e6c346d222be59ad4136 |     
         arm |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/cfc3bfef5e93329bf944a57947086d9ddc4fece3 |     
      mipsel |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/ceb824033888086f6dde22c66d5b5f692a253c7e |     
    mips64el |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/f230fe6bbeb8b22d2b5b7cfb3f0ac4b3b936dc37 |     
    mips64el |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/e469b47a6c8f1e8812325fd2860345105052316c |     
         arc |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/08b2a8a4bdd1c38703626a4fc37dab31dce98f49 |     
    mips64el |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/44221140fb8e2ddcb7d624e657b92a59375c02dd |     


-- 
http://autobuild.buildroot.net
