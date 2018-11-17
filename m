From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Nov 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-16
Message-ID: <20181117070018.7BA2A207BD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.08.x |  24 |   2 |   0 |  26 |
      master | 182 |  16 |   0 | 198 |
        next |  34 |   3 |   1 |  38 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

         arc | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/6a0d5ffc85e898aa54c85a9b34270bcdfdb00af1 |     
     aarch64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/bd1236659dac10d77fad105104f558a556fe9469 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

           musl-compat-headers | 1 
          shairport-sync-3.2.1 | 1 


Detail of failures
------------------

         arm |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/67e975378bf1674fd3f70ab8dbf4c877dcdb9609 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/ace188c90deb877dc858b1d7f0e338acf3e7e5d1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 3 
               boa-0.94.14rc21 | 2 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
       gst-plugins-bad-0.10.23 | 1 
             libid3tag-0.15.1b | 1 
            mesa3d-demos-8.4.0 | 1 
           musl-compat-headers | 1 
                poppler-0.59.0 | 1 
                      qt-4.8.7 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2b68745754ac8399084e19152e7d44404c684f9e | ORPH
     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/384c7f20905b3fae4054ce7199aed8210e1494c5 | ORPH
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/008a287b31e7f720e5513ed8d0b61f0262beb47d |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/bb5ea22e4ac79508e7ccc37ddcd42880b6235f08 |     
        mips |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/3cec1fb8ed637729d2ef6f23f957d54d71e54c1c | ORPH
         arm |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/ac3870208aab6001db6b790b6c5dde64d08f7669 | ORPH
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/4da45322834d52c9358e2a50e9c895830a301c19 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/94f629daeb929eaae9d7aaeb0a8e6f314b0d2217 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c6cf715c4d4c92a75cbae05f5a0ef9b0b5438c69 |     
     aarch64 |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/356de83d2f00ea69a1cde703b6574890d5a1c38a |     
      x86_64 |            musl-compat-headers | NOK | http://autobuild.buildroot.net/results/796d26509f748f0f90b50c5e2292c8b11180313f |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/2fada81c3fc6b13de4705ceac04225c85f882511 |     
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d7e302a7e163a5ff4ea80db6da144dbdf9e9a79a | ORPH
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/5f1ababa8d9bb4c94391e65c6bd929c3ae321835 |     
         arm | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/a316e2b48d84da6ad5fa1dc873d272df33cef931 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/917d9ec5fbdf70e98c837465a4105c42647aa58a | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               boa-0.94.14rc21 | 1 
     docker-engine-v17.05.0-ce | 1 
             gstreamer-0.10.36 | 1 
                host-libsodium | 1 


Detail of failures
------------------

         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/324f3211332ff5f443e758946f993ee0469c510e | ORPH
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/0505e31c0feab9b38235b4ef5b3a1ef47c538a15 |     
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/da6dff69a9a008a80e56100c2cf6cb5daacb4706 | ORPH
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/fa624a4032da5116dfface072658bc77bc9b8062 |     


-- 
http://autobuild.buildroot.net
