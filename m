From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-28
Message-ID: <20150629063017.2EFBB1000F1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-28
===============================

        success : 128
       failures : 69 
       timeouts : 0  
          TOTAL : 197

Classification of failures by reason
====================================

                  uclibc-1.0.3 | 18
                iproute2-4.1.0 | 10
              pure-ftpd-1.0.41 | 6 
               upmpdcli-0.11.0 | 4 
                   tor-0.2.6.9 | 3 
               openswan-2.6.43 | 3 
                 empty-0.6.19b | 2 
             berkeleydb-5.3.28 | 2 
                collectd-5.5.0 | 2 
                  opencv-3.0.0 | 2 
                  tstools-1_11 | 1 
                libtirpc-0.3.1 | 1 
               libsigsegv-2.10 | 1 
                   glog-v0.3.4 | 1 
                pulseaudio-5.0 | 1 
                   ntp-4.2.8p2 | 1 
                   audit-2.4.1 | 1 
                   eudev-3.1.1 | 1 
                 setools-3.3.8 | 1 
      binutils-arc-2015.06-rc1 | 1 
sunxi-mali-d343311efc8db166... | 1 
                  zeromq-4.0.5 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
                 lvm2-2.02.121 | 1 
pulseview-198f9bc74d6c955a7... | 1 
           host-nodejs-0.10.39 | 1 
             sofia-sip-1.12.11 | 1 

Detail of failures
===================

         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/3f118a2339e188b68a9756b3dbf45377c05b2d05/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/80ebf0382992b277fd94743815bbf0c7426a3654/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/717f3b37600a56262badc6f7cb64d7949fdacb67/
         arc |       binutils-arc-2015.06-rc1 | NOK | http://autobuild.buildroot.net/results/53d333850a82f71c4e708926d3519093282a6cdf/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/c7f2339c7ed7de3d85a2f9881da99734e0fc36d4/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/a70669c0410c4e11bdca0732f57307d7bed14c9f/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/53db871fe076ad96cdb7aecd3930a86092b9833f/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/943876e5c65707de11cc5890f1ef62537b92b631/
         arc |                    eudev-3.1.1 | NOK | http://autobuild.buildroot.net/results/76ea39dfd70329e2da1e8dcc288f2eb3f6715b7b/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/127cd8f014dba5a51384a106b49cbcc33933c684/
        i686 |            host-nodejs-0.10.39 | NOK | http://autobuild.buildroot.net/results/0c80058e0abe8e17c06adf62778950696b07f718/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/dc5fe3a47c03c6711acec1885c1756a6399a19db/
      x86_64 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/7174a5207cee77bb62eeec515769718e5f004b54/
    mips64el |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/97b4cb10c55d63e227b7661b35ea885c7c8d1de4/
        i686 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/4530e095ecf86c61c1daf2e7e024c4e9c8428a39/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/fcf8b2d1b2bc025c3a465dd401be6fe033d0f002/
         arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/beda62691d95950c8f2fcb20c9b1979a5838bdae/
         arm |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/139c3845339d3bf43028582d6432955b10448a0b/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/895aedaf5062236847a342c5b62b9953f99bd844/
      x86_64 |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/cde1d3a898ea4a71c65cfaeb98214116aa99b5ae/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/2c3a7e43ac51c6bb1b4bcc999b86ecfa0a07006a/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ce38c8d60563bfe33efba4c0277b156d49dd2351/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9b009eea7f0cb239a40cf0ed75bbbde097227d80/
         arc |                  lvm2-2.02.121 | NOK | http://autobuild.buildroot.net/results/0fbf372e874e41162f5d6dc697447846b51c26c1/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/1e767fc3cc5199c363fd844d7b9568d4743088e4/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/53c5a16003d50c9f57f75702715c6d728f4dba2e/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/7670f46cb05b05bbdd5a65805b0f75d53ec06e27/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/34ee9c13d220bc543f9aa49d7df1147685e77386/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/cfd1d6e0952f4779e8ac1e1f794435723a560024/
     powerpc |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/95f1faea2e109391285e548b8d34a701ca0fd388/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/be44ee62ec369fea8b6bc435edf3a45a25bdc332/
      mipsel | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/c398e13de4da6659a42cfc9333e3f0ece6651e41/
     aarch64 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/ebcc24b7ef00a1de4e31b0a3995b2ccb4aec7dfc/
      x86_64 |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/d6f6eea980363145d89b882b1996584da0d181f7/
         arm |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/38b90a7e5423bbeef3f3d7b309ffbebb3e09e4d3/
    mips64el |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/e9b27277edc2fc5490745e3a5bd5737fbd2dac05/
     powerpc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/71647dc71b7beb0f43905af23805a304d1047c17/
        sh4a |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/3d2815a761f5bbd74f7d5887536c5941fce314ef/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c20bdc960eac1c1c19df98bd0805422142bc6e35/
     powerpc |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/0b7ec16a4c476899791dd7bd420273a89916cab2/
         arm | sunxi-mali-d343311efc8db166... | NOK | http://autobuild.buildroot.net/results/20d7f86f0e4ad5f87252d0084e1a383e1484cfee/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/ea08eeae05f79598809692a4f9a4ecfdd64a63af/
         arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/ef073e6f9db499317ac66398c11ddd47ff19c4d6/
         arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/596e3386c9d59f29d22fb0e10a8280406b64f994/
     powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/2bf4c547fcf02f5b8b513d970bd7ef4939e73c2e/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/43dd5c5da0d003b654fd252c989d49c2e5872827/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1453601e035db1e70fd845b6b6b3b6cc9931a5d4/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/14fe4f1326837254cac7f37c07211b7632464dd0/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/cfb438f933ff7385d612d65798b0b8ed833a6476/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8ba9a312b43a38e92d6ae93956057c8332622dad/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d11003c25f08e97f7362d2ac365fb365e44b4d98/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/796a0adc4c980b6b463054002907af179fea2f1c/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/6a08dfbf845ada0ad7d82ba4e14461a80a6fe0b2/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/19b489610606044e829f4d20c7641987b0249c79/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/efb3dd3557a1cdfa24fc03fefc0f04120e807761/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/af3102dc14aa4054d7330f9d554f47d58701cd3e/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/60069117b9724fe9a1c5220fc216ebcc982f4ba7/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/62bfd314121203544533fd87e15227980838ac8c/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/cac9209b2742fe063867cebcf8754f7488f2fb48/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/950478d0783405fee11c092c1343f44c9dd378ca/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/49ed13878447a58a0bc6ee97f0e4f7c3691e9f15/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/29f19ed84a0ecdb646094784f22bd1f53c86c605/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/9448b303c03d12fa795e782cc4f54312029ad18f/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/99012bcaa9bdf8db35f56f9f0771203856e1d8e6/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/9ef8066f2c10bb77f35123cb560f1ccc700d3454/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/055e53d3db664f90d2ff78c6ce02c360e7e81ed2/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/266d06b05e7b2a04a46a75f4e1fe174cfbd381f0/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/18264bc3e8ec699919ad3b59d596ca1b5bdb32f9/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ff2144e21abb048b0c86ac382b08830b96999122/


-- 
http://autobuild.buildroot.net
