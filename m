From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 08:31:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-23
Message-ID: <20170724063119.7BAA52090F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-23
================================

      successes : 142
       failures : 25 
       timeouts : 1  
          TOTAL : 168

Classification of failures by reason
====================================

                libressl-2.5.5 | 3 
                paxtest-0.9.15 | 3 
                      x265-2.4 | 3 
                  cppcms-1.0.5 | 2 
                     gpsd-3.16 | 2 
                 libssh2-1.8.0 | 2 
                busybox-1.26.2 | 1 
                  cc-tool-0.26 | 1 
gmrender-resurrect-33600ab6... | 1 
                 libpng-1.6.29 | 1 
             lttng-tools-2.9.5 | 1 
                  nginx-1.12.1 | 1 
           oracle-mysql-5.1.73 | 1 
     python-cryptography-1.7.2 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.9.1 | 1 
             transmission-2.92 | 1 


Detail of failures
===================

       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e992acdeff20dc185eadede60ad027cd4d753cf8 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/ae5711d0503cf949492f5e392890119d2a597b08 |     
    mips64el |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6ae1a49f58100a88465dd29c00fefc94b1439e70 | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9fb67828c3ff36b880e057982670243c8f924f26 | ORPH
         arm | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/846c423d2ec98a7f7cc996213ab51c61e903853a |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/a4ef25fee5ec043f846973ca4e8238993512da20 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3bcbfd887b288a437ea8740345fff4fe0b1d84a4 |     
        i686 |                  libpng-1.6.29 | TIM | http://autobuild.buildroot.net/results/54364e5394fcea39f7f10cb6924769fe2d8aa7ba |     
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/22da379f1fcdf7bea5e995ec48bd5a35ddbc305a |     
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/07429d3016c900894fa0ca19b7dad0a928e32e3f |     
        bfin |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/1c1325d1a7a7aa98172d2d93d30322165af62348 |     
      x86_64 |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/d8b700117f7a3138fd7a7d10402a4d99e693114b | ORPH
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/362b1018c0296760c7c7e1bc602eb8bb7350887a | ORPH
     powerpc |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/8fcd2257fbacc5b5527857a9e40291fa9f1249ce |     
         arm |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/feb19961b5ceb98bfad2350e75d6ca8d5c8773e6 |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/839324e8d8e1e27563bceef8ed21fbdadc8234db | ORPH
   powerpc64 |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/dd99092de3da38e646c1df301a52573f0079d3d8 |     
     sparc64 |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/c636bc027d12e6d20e20acb84730f0d5dc397afc |     
         arm |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/01031422c33f4f007a953e19b8b000747b9dbccd |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/f7fa482cbd5b7f8bac0c00242d483c1fe43beb05 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a72f98862b98cf9714b7d5bcd8ef3386cf99d8e0 | ORPH
     aarch64 |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/3f696a082cc867a95436628078254ce988911919 |     
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b8fdaf37698bcfef6b7198a62ab835c15faf50cc |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/41910d44ff98c60a6bb9fd3b6a10bd4d0b98d646 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/907e2ac277c2018805a758d7a1b8ba51c7bdd350 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/cfb91581cc38c97d96a5d3b2a306c1ad524d26bf |     

-- 
http://autobuild.buildroot.net
