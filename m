From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 08:28:43 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-09
Message-ID: <20170310072843.AAB7D207DF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-09
================================

      successes : 105
       failures : 15 
       timeouts : 0  
          TOTAL : 120

Classification of failures by reason
====================================

                libepoxy-1.4.1 | 3 
            netsniff-ng-v0.6.2 | 2 
                   zmqpp-4.1.2 | 2 
             bluez5_utils-5.44 | 1 
                    gdb-7.11.1 | 1 
                 ibrdtnd-1.0.1 | 1 
                libgtk3-3.22.9 | 1 
                lmbench-3.0-a9 | 1 
                     php-7.1.1 | 1 
                 qt5base-5.8.0 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

     sparc64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/c8c3815dcd4965f9abb04d6a0f58e8f3a8e173ee
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/719a441421030b79c0aa1bbfb707130f3ac87338
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/6ff683a52b285c4eeb039ddccb65fbaccc76dce2
        i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/3eca5ba26a521f6cc5a611309ba066472af7769c
     powerpc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/cf9ec7da196d70548ae1413e4a3730314f6434d6
        mips |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/069b80101afc4719db6d6d41cf5fc923be21ddc0
      x86_64 |                 libgtk3-3.22.9 | NOK | http://autobuild.buildroot.net/results/38d7774afb0e0f80d30b7f057a891f17244e1878
microblazeel |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/c00d94452beb01bfa0114e00e5da30c5ca4bfb38
         arm |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/65ce9807116ca70908e0aabae59a36c7774dfa7a
         arm |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/58d7809cae739f728c58291f2111684d6c0578f3
         arm |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/b89361c22b1cca716598276b9cbb2831a4a2b51a
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/cab2bcd6750c11eb0d96ba6394f971f931854525
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/a5b7bf695bcebefc0f891416698dbabb7003e456
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/095463fc83f1ac9c62f16ed7d10a26c607f78966
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/1222236c37e46802dcb3a757c8453bf7fa849b44

-- 
http://autobuild.buildroot.net
