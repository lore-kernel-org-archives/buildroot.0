From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-19
Message-ID: <20181120070029.3B0CC207B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.08.x |  21 |   0 |   0 |  21 |
      master | 184 |  10 |   1 | 195 |
        next |  27 |   9 |   0 |  36 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

  host-xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

        i686 |   host-xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/347f1c1177f326d8d484599a93d405b530a5eed5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 3 
     docker-engine-v17.05.0-ce | 2 
runc-69663f0bd4b60df09991c0... | 2 
             host-gauche-0.9.5 | 1 
                host-libsodium | 1 
libcorrect-ce6c17f1f988765a... | 1 
                qt5base-5.11.2 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/5fcf9483b67c3599dd4683795080c35f35925019 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/6f65943264a4ff80c85265e0f9ba4abeeae43338 |     
      mipsel |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/0bd31c9906734905ec127f5e39c9efef6ec4d154 |     
     aarch64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/599cf67e949d0c4a3478db125bb8b28c3eb0510e |     
         arc | libcorrect-ce6c17f1f988765a... | NOK | http://autobuild.buildroot.net/results/221d6a418e75b39fe645c3a56cee676518d2cff6 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/677f9c8f793dd312c0c2b13fd714f3e887d9c010 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/3c9cda00fef2e87ed9cd2df58c38fdb38463e63f |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c751b3e951341c25e2b3c961aa16da488eea693e |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/6f3d7048a020af0669ffce579233e27f8316b16d |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/6df0636e02aed578782523b1b0c853573d63ae88 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/e4cb78d2a3520501ad6339b1caeb53700fc253d1 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                tpm2-tss-2.1.0 | 5 
      docker-containerd-v1.1.3 | 1 
                libmpeg2-0.5.1 | 1 
                 libv4l-1.16.1 | 1 
                  mender-1.4.0 | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/ed83a4fba5b60414cf95d7d49534aa6a7fda20e2 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b6ffcd45cdbd6e105c7b8129107da683e4b90974 | ORPH
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/b6ef7ca306aadb27227bfda05b15efa747ff5003 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/8fbb063dd5ffb91aa74626d209073f221b3ed719 |     
         arm |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/76ffd371eb60273987951aee00df2550af48f8af |     
         arm |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/d91d86fa1b77e083ef0ae0f6f27d58e573701493 |     
         arm |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/c95d5558963219d2751c3cbb8dbbe5eab1b3442f |     
     powerpc |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/b50268d6445bb445d6fd5462cbfbafe497de61e4 |     
        or1k |                 tpm2-tss-2.1.0 | NOK | http://autobuild.buildroot.net/results/856490d995e0178264e245daea796d656799fe42 |     


-- 
http://autobuild.buildroot.net
