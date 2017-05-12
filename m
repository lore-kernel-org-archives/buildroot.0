From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 08:29:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-11
Message-ID: <20170512062950.23CF0220A8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-11
================================

      successes : 244
       failures : 21 
       timeouts : 0  
          TOTAL : 265

Classification of failures by reason
====================================

                 opencv3-3.2.0 | 3 
                  libcdio-0.94 | 2 
                 mplayer-1.3.0 | 2 
                  ntp-4.2.8p10 | 2 
                    radvd-2.12 | 2 
             bluez_utils-4.101 | 1 
        ltp-testsuite-20170116 | 1 
                   mimic-1.1.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                poppler-0.54.0 | 1 
                protobuf-3.2.0 | 1 
               skalibs-2.4.0.2 | 1 
                 sudo-1.8.19p2 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
               upmpdcli-1.2.12 | 1 


Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/07e2f952ec974ab765acdf9209d2026504d495cc |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/6c305d720062c651dd856ed0bc5d30ab5fb31285 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/ebc83038f86b49bce818bf43b4479ca5df86b2dd |     
    mips64el |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/b448569c1f899f08f704e556208b1db2be04f46e |     
      mipsel |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/a814dc78a9fc7bc80d0b82083817ddfe9cdb3c29 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/525048619d7d4438092ccb2f5d5da8c1e8929f1e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b4dfa228118c20737e47323650194e9202567381 |     
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/1e5d70b1a48bdda4e2708ab584b61a966cbef62a | ORPH
        mips |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/c2a945855172970736a8ffea9c564f029a023344 | ORPH
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6699b89f96ed7095a14bfa18248444534eb81083 |     
    mips64el |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/421ba36bae19ead1bbe366cc7eac429b45a29990 |     
         arm |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/6b89c74c72694f61a5e86e5f8c26263d9e0afe47 |     
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/32d6ac30ca5621b45f7090abb5fb76d9f577c066 |     
         arm |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/1cc931a2d9658beebf2b82f10013c04cc3823bdc |     
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1a328ea6e202898d5e39c904f713da3667b25806 | ORPH
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/7b9d92c859aa5ba11d6a1b10b482f887d8201eb1 | ORPH
microblazeel |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/949a75d96299394e4ac957746fa23a4b52f31b43 | ORPH
       sparc |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/85062b5f9dbe74d7d1c6edfeda085268ecaef4c2 |     
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/ebbb4c3138b5023a0c8bd938db1932a25ba5b6fb | ORPH
       nios2 | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/8a0eaea2d3b2fb76bd68fab22623e118e00173cb |     
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/251c6ea384f638a8ab6831394b62373baef6f63a |     

-- 
http://autobuild.buildroot.net
