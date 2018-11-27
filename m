From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Nov 2018 08:00:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-26
Message-ID: <20181127070050.61930207BC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
   2018.08.x |  12 |   1 |   0 |  13 |
      master | 189 |   5 |   0 | 194 |
        next |  36 |  15 |   0 |  51 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               mosquitto-1.5.4 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

     powerpc |                mosquitto-1.5.4 | NOK | http://autobuild.buildroot.net/results/c425eb496cc5422ff1e2e51e59d4baf377bcbeed |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/4ec39eba6020ec5d08b7f26b865e2e27ec8fac06 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.9 | 1 


Detail of failures
------------------

        i686 |        host-libunistring-0.9.9 | NOK | http://autobuild.buildroot.net/results/ab12127b3edc3efd47695cef6a06adc4e6397893 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               valgrind-3.14.0 | 3 
                 minizip-2.5.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/99153c4a296a882c3ae56ffc7d9302cea75983b9 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/cc0ab162ac8f1f59a00d692e7b3bf9c0de286a3b |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/96a6b75de3ef1ac344a764b2af5a21c35588139c | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/2538d39fe66d5216551a0d6f4da30106fea6b6f4 | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/aa183515ff8d07a39871f1d9ca6e52ff906dc415 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-2.0.3 | 6 
                  linuxptp-2.0 | 3 
               pulseview-0.4.1 | 2 
     intel-microcode-20180807a | 1 
                  ntp-4.2.8p12 | 1 
                 setools-4.1.1 | 1 
                   strace-4.23 | 1 


Detail of failures
------------------

      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/9304b6612ecc391603a0e1f75d51a9901218720d |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/1550085058e02f07fd2d947bb447e0d36335b098 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/1d3f81c707bb5c31647cf985ab7ab6a7eccbba6c |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/96af7051699ad77f8200cd8840f4ee8c1ca7c9a0 |     
    mips64el |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/70ade258162adfa438304f3246da4bf493c3f48a | ORPH
    mips64el |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/ed1a4899b0fe5c05f6251c3645171c513a52ef16 |     
         arc |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/da0f710c2a145dfb1672dc97eacbe64561d27f2f |     
         arm |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/4445ab523b937568cf700f45011569376dcd47e3 |     
         arm |                    strace-4.23 | NOK | http://autobuild.buildroot.net/results/0763988c35a1de7d51c7094b5b002ed369f1a25f |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/f32a170cb8fe059ff97c2f22a789c0cb23361839 |     
       sparc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/ac15a2d9223e0a7bdcea5c749036c5c9e4b4abe1 |     
         sh4 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e1261bacb9210c5bdb1a7a31bb584cf70c830d6f |     
         sh4 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/47a74ba74a8fadd264f6e1261340d327f3c301f5 |     
      x86_64 |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8925f8f3d704b92655716d9356ee18d7df97d6d2 |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/c1cd9d98f17054be2e12229e087b9f873a7c7fe2 |     


-- 
http://autobuild.buildroot.net
