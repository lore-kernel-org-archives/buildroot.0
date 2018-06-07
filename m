From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jun 2018 08:00:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-06
Message-ID: <20180607060042.ED12520964@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   4 |   1 |  27 |
   2018.05.x |  27 |   1 |   0 |  28 |
      master | 204 |  24 |   0 | 228 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   exim-4.89.1 | 1 
          host-faketime-v0.9.6 | 1 
                   libnss-3.33 | 1 
                     php-7.2.5 | 1 
                       unknown | 1 


Detail of failures
------------------

      mipsel |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/11b96c62c9ed35251abd2b19c70cf2e16aadbb6a |     
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/a25c29e39d0cd6c1d72dc8e2991681012d5bd5b4 | ORPH
      x86_64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/86017140d51391585196071dd9877f98da91e693 |     
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/749235ea438f4b910a32991834a37192ce1cde3f | ORPH
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/633ff3884036327f88078aa1de4c49e5d06e7147 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 


Detail of failures
------------------

        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/315bc6adfd8073a90e0906025e6b1283480da580 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-flatcc-v0.5.1 | 9 
                qt5base-5.10.1 | 3 
                   libnss-3.37 | 2 
               mono-5.12.0.226 | 2 
       shadowsocks-libev-3.2.0 | 2 
               aircrack-ng-1.2 | 1 
                 libusb-1.0.22 | 1 
              mjpegtools-2.1.0 | 1 
                    mpv-0.27.2 | 1 
                protobuf-3.5.1 | 1 
                   trinity-1.8 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/8da7e9f29000a802f81aa568821f93faeaa09fd7 |     
        i586 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/936fbd2670411623652ac1e7affaf8a096cfac3a |     
      xtensa |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/acb9d61fb92ff95cfef8b297ae0945b66851b8c7 |     
      xtensa |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/d361fac9aa0c9ca94712980bc62523e394211b13 |     
    mips64el |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/b16134905cc23c50b1906c4d821d75da5cf624a4 |     
        m68k |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/69857393a47a2f89317f0e27955927318372365b |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/1284be2a786abb2a0e68db83b46f670a20f8ae99 |     
         sh4 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/0152d658699e6fd382338a0f55ac819825357a35 |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/cc25395089a8f2a903a2ef0578f850ac0bf52322 |     
     aarch64 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/8b1e985bbc626dba4913afe7006f6e4e03e29306 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/d5348a799d6204f4d97fb3bef801be49f4ea465b |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1f19dc7fb062a034cf714c6073518463e8656d93 |     
         arm |                  libusb-1.0.22 | NOK | http://autobuild.buildroot.net/results/a212ee3e5ec174f4e6e7d582f777325dac035bfd | ORPH
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/0620d6ac7dfe192191b7373866e426c918541266 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/6bc84a001b021be800629d8cc796f2e09fed42af |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/0bf4fe10d80574c526ee880b435a5aa7d5bd05a7 |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/119d1dc934ece27ec85e21c35c83e68b051a4706 |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/7a352fa2d493203491193855f48a8be46c78953a |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/31bb140f0c15c4301ae033b6a6adaccdbed23bc8 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2212a2ee8a1f6e73f77977f1dcbe11f950059380 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/27a8bf3d33ff31b2c40e9a978126bffa1fc4d69e |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/d00c5f9e1e7a6a40fac5763a06977b351b7875da |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/0612f2dc09a8763fdf2111ee8d0c223c8531262a |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/41fead6d53dba2539ba246f682973e0b5967f3d0 |     


-- 
http://autobuild.buildroot.net
