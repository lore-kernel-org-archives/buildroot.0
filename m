From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Nov 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-11
Message-ID: <20181112070015.59915224E3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   7 |   0 |  24 |
   2018.08.x |  21 |   1 |   0 |  22 |
      master | 180 |  23 |   1 | 204 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                p11-kit-0.23.2 | 3 
       xproto_inputproto-2.3.2 | 2 
                   attr-2.4.48 | 1 
                  giflib-5.1.4 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/81cbe2a3fa03a99c05f68d49f7f971449d81f6c1 |     
        i686 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/95b4c1aa0d7baa31cf0840c580e30860b2154144 |     
         arm |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/5f4a8520522a20e31ecc1e26afea208645abd5b0 | ORPH
      mipsel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/86f2d7e6893a1913bad791efd4c0a42916149fbb | ORPH
         arc |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/0803d40f5316a48cbeb0bef94268cef6cbb0d027 | ORPH
      x86_64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/d60f8095f9f440889b6f5bde2aae1b6ecd6514b0 |     
         sh4 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/c828db59951f3f378f0c8ff2fdc2185455f28cb6 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                p11-kit-0.23.2 | 1 


Detail of failures
------------------

       nios2 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/8fe00a73be653589ad169819c7cdafaf4c6518fa | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libnspr-4.19 | 3 
               boa-0.94.14rc21 | 2 
                   luvi-v2.7.6 | 2 
uclibc-ng-test-c6d62cbc6050... | 2 
               wireshark-2.6.4 | 2 
                beecrypt-4.2.1 | 1 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
             gstreamer1-1.14.4 | 1 
                host-libsodium | 1 
                libkrb5-1.16.1 | 1 
                libmpeg2-0.5.1 | 1 
                    ncmpc-0.31 | 1 
                    php-7.2.12 | 1 
runc-69663f0bd4b60df09991c0... | 1 
          shairport-sync-3.2.1 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

     riscv64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/738ef4918da263b8f79a9478b79f2720d6acf1fb | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/fc28b5867ba84df59edd80258569bb00cef86828 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/28e903429aa8fdbf4034e64d2d754fe1e1e0d6ce | ORPH
      mipsel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/662d07012558451d2a70d1c37a8aad25a4c6bce5 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/dc3695de27cbf7e4ac690e83fee09f6770bd9b1e |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/ca49a2a406f2ad688e00e32211eacf8a15d91dca |     
     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/07efafadff75ae2fb1d2b8d420be72345906af6c |     
     powerpc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/a0661c6fe04c658d28d2a964bc1078f17dc198b2 |     
     riscv64 |                 libkrb5-1.16.1 | NOK | http://autobuild.buildroot.net/results/39a51d0c3feab74edd8a17c9174d031ccc7ffe1d |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0d2731a3834a2aca3e24ca59150c697ea551ce04 | ORPH
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/10d61bbf8c554d1a35b24871a5e66395c455be17 | ORPH
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/9311d15dd65bed72618ff08b2e28125c34996dc5 | ORPH
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/d93db06451f32891da91a299ad7911d68a88fc61 | ORPH
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/2244cd30986aff29b763fb7183f6fc27a82bd7fa |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/01938f7f018dc69d564c22489933647b1daf62f3 |     
      mipsel |                     ncmpc-0.31 | NOK | http://autobuild.buildroot.net/results/4822b195628b3ce0d3fd6428bcba2cca158e92be |     
      xtensa |                     php-7.2.12 | NOK | http://autobuild.buildroot.net/results/d58043d0bccb166c43df20659c47a45cd5423728 | ORPH
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/b949dc134bc3b75258094cbe18ec6f6ad5417ec7 |     
     powerpc |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/7b081a1d0ea78b71eb1853138f233776fc1d7609 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/d465c5686867a57a47afc98a11d5eb254229ecf1 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/3287fc8426d46a0a2e8048c98cf98f7b281b6a66 |     
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/b2c1e22cabf44503a7ca420bfbc1e0a1e6ee7593 | ORPH
     sparc64 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/7edfa5aa8d512c226c1d874d13190cd3501501ca | ORPH
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/084354a33825cf4e723e0a9f1e9656ad2a212a15 | ORPH


-- 
http://autobuild.buildroot.net
