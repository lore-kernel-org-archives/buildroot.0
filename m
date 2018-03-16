From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Mar 2018 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-15
Message-ID: <20180316070036.26F2320731@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   2 |   0 |  23 |
      master | 164 |  54 |   0 | 218 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.3 | 2 


Detail of failures
------------------

         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/d3340d90b197ef9f2f0120ae3fec485c88d85add | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/cae480fd5f9828d2354a337c748684ed89d2605e | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 15
                    htop-2.1.0 | 12
                  host-go-1.10 | 4 
              keepalived-1.4.1 | 4 
                    liblo-0.29 | 4 
             libmpdclient-2.14 | 3 
             bluez5_utils-5.48 | 2 
                  udftools-2.0 | 2 
                  cc-tool-0.26 | 1 
                   exim-4.89.1 | 1 
                  flashrom-1.0 | 1 
                    make-4.2.1 | 1 
                     php-7.2.3 | 1 
                poppler-0.59.0 | 1 
            safeclib-v03032018 | 1 
                tpm2-tss-1.3.0 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ddc0a2d01d76c9a5ccd0122af8bc3ab533f0d05c |     
         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/d416bcae5abd98b6443f134dbc0b7757b02543fc |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d3dfee275eb0f066f2391d657a6ee24557649a95 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/25c6ccbd74f2db9397fec93a5b535a42b114c63d |     
      x86_64 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/90900ff5b3c879ffb069b93702283d93781112e6 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/95c2225fc19082c5e7428882191601e805a9af01 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/cd42343117f591d7a8cd16ecf8cb65e615c9f63d | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/f88e6cb16f8aa47832ebf941bf06db0a7eb54788 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/432a02564a30155276be076b58382a2c21a63dff | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/34de27a37f7ae1e0577d76a7377aed23dc57332a | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/436acb99cdf803eaae9ac04c7da5ffdc939660ea | ORPH
        mips |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/ab950d5237e03ca9a93aa8a76ad99f68a5b29963 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b11b9a7d33327f32d12f369509e0b56850e58b43 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/ff42890f20984e2abc0d53f71542f3556f9b7b2b | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/1c8ebd59584a2d671d3238578f2f50ce3d01c447 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8a1b5b6bd70f817a1f21abd99d2a2011aaae0c87 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/824468d45f55353e3351fbe5e949ddf6db82c022 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/2cfc8b3c533c21e7d6230882c651ec6b9f621850 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/caa436801de807f8222258b2f6f9d7fa9766f152 | ORPH
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/794cede0a92887075d3f36a0b18b2a6188649243 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/aacb018fe75b9c3d149b68ac3be06f609b5c607a | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/ad978fa5dbaddbdd6849bc447bb8bd8a8fd4b004 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/3d1ae60206c416064a490bd66d03c2c9f8e7fbf7 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/dcccb06383f5202b795cb7ac2340240b0a8c6a6e |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/3322333baf0cc666becbbb8ed72ca3b0328614d4 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9e9c4ab2b4d02c33f30ec3d3c1afe34890c78925 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1ea28e3e22b25bae547efc6497924d4bc4cb23ad | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/2194874b8673f00f9b8069ba7e7038a20212171c | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/5d02fbb4c66f596b3e41570968d1b49f479efc6f | ORPH
       sparc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3ccbebaea01b074c8e44a1bd978d30c4367d45fb |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/52aa9ab6463b9d07e4506ba67139684fa6068be4 |     
        mips |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e317b8dcc7cfe219464ad2f4bd85bff020083363 |     
         arm |                     make-4.2.1 | NOK | http://autobuild.buildroot.net/results/5ccee6bb332e800e81052a3094746edde83403b1 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/ae353b12051054e4b959eeddec156e4231dfa640 | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/44fa402351a91c036bdc3b6a69a47f0fa042cb3b |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/b4b3e6f67d18de042d7627bb09a5f38e9e4f79b0 |     
      x86_64 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/e9e730623fd2672242f79aa00b74557bb4f2dc21 | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c1bc687dc3b555f99e47cfb8013fc421f0020473 |     
      xtensa |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c94cb634ccc764bf51a8df5ae1127b521b2f3e2d |     
       sparc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/0ac5d8f80f1ec7ee989afc79a65d29e206bad3dc | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9db8a894f8cdd5db6d7198fe3af9a4aebf9c8c64 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/841f4d4b5be078cb08ecd9b8b3c3fe19fa798866 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e09307eaf5babe9fbd38e6f12b7f063f3cae81a4 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/b558f47f514850937ed6f39692aa5a34ff3522a1 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/45d0c0135e63ab7eaef4766b29dc45013f94dd9e | ORPH
         sh4 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9209dc3bc9403c059964ace4dd7e2f2650c7a657 | ORPH
        i586 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a3989394aba0bd3a52146e2a5e6b87b586efb6c6 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/50cc6aeca9b4248f92f3963e8b652e3a19831af8 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/3655b25598beb1a3469a57dfdad1c7f9bdb7a617 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2bff74db092b2ae855b70d57e840aa7248198778 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/060e0f50f1aec6431cef471b5427aa7898026a52 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/165751490f2fa3e016a3f38f35afe8782e7416f9 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/ccb7142ca0af2760fb0b93e872fb48f704d581b7 | ORPH
        i586 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/b3b3c06ea565125bf9f9ad2ebc16bb21f6c7228f | ORPH


-- 
http://autobuild.buildroot.net
