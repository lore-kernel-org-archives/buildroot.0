From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 Jun 2018 08:00:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-05
Message-ID: <20180606060050.ABE9D207B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   2 |   0 |  25 |
   2018.05.x |  22 |   0 |   0 |  22 |
      master | 196 |  23 |   0 | 219 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   libnss-3.33 | 2 


Detail of failures
------------------

       nios2 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/6da0a77513be7574533accda1da3cf513d4caec2 |     
    mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/b64a9586fa1a6f550d8a51a3e46bd6353a435a56 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         python-websockets-5.0 | 8 
                   whois-5.3.0 | 3 
                   libnss-3.37 | 2 
               mono-5.12.0.226 | 2 
               aircrack-ng-1.2 | 1 
     docker-engine-v17.05.0-ce | 1 
             host-dfu-util-0.9 | 1 
             host-libftdi-0.20 | 1 
                libmpeg2-0.5.1 | 1 
               mono-legal-info | 1 
                oprofile-1.2.0 | 1 
                protobuf-3.5.1 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/245d3bcb8593232484277e48821a537601fbbd07 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/3b47fa9e20255f0ad5268c943a0974a093160c6f |     
         arc |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/41664f1d662769127d2810bacf2cb2e6028c72d0 | ORPH
       nios2 |              host-libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/4375ef80410fc54542e2f11ee4bca6ab820747fe | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/215ed9b9938c1fbdaea2d4d704c9adcc3d34b137 | ORPH
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1c4ff85703d341c2e2b86ddd8040e01793d12496 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/c433a5dd915714b3700532ac7875c68bba546234 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/063a6cb39cbc257d670119b3a7f1505bba710b1f |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/02e26a7c654e202ad4508f5c9eedef6ada1bf9f9 |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/0b0dc71caa90ec1cd5a0ed93071b9ced36b0c321 |     
      x86_64 |                 oprofile-1.2.0 | NOK | http://autobuild.buildroot.net/results/39ba30f4ec94e176e3d5d5b5ced37a0aa030cc5a |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/fce298997c25249e0ec0ffe9f99c1a123e48773c |     
         arm |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/438edeed741352aa58d1ab4cf08557c098fcce18 |     
microblazeel |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/8ef0b2ac38450aec83b37986c924af514f2e0308 |     
         arc |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/c79f7ee173ff3ffda6e08e65be2bcedb6b3d1318 |     
         arc |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/801e60a1f2dff431a1f1674ddeb414ac14c1f238 |     
     aarch64 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/84b3d5dd2fa14ee910d3f603a9d37548c384aef0 |     
        m68k |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/b0f4ee23715d17c7744b13f2e2a274089259f7ef |     
      x86_64 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/1fad73aa2a400b4085d465a655c3300570c45659 |     
      x86_64 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/3ac917fd39038c1768363f6ae520e1e4a385529d |     
         arm |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/89f4e4f8395543c5a8f1d7148fe5ececb8eabacc |     
         arc |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/a7611f4ddfa0825314b681876645988f7f922b46 |     
         sh4 |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/4d2ca14580cbc73f94e86ee834fac6d2541298ec |     


-- 
http://autobuild.buildroot.net
