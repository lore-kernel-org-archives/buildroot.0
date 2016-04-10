From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Apr 2016 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-09
Message-ID: <20160410063019.D3C221026E3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-09
===============================

        success : 174
       failures : 55 
       timeouts : 1  
          TOTAL : 230

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 7 
                  connman-1.31 | 6 
      ca-certificates-20160104 | 3 
                blktrace-1.1.0 | 3 
            webkitgtk24-2.4.10 | 3 
                  cairo-1.14.6 | 2 
             lirc-tools-0.9.3a | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                      qt-4.8.7 | 2 
           lksctp-tools-1.0.16 | 2 
                  boost-1.60.0 | 1 
                moarvm-2016.01 | 1 
                 omniorb-4.2.1 | 1 
                    ruby-2.3.0 | 1 
                    quota-4.01 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                pinentry-0.9.4 | 1 
             ipsec-tools-0.8.2 | 1 
              rabbitmq-c-0.7.1 | 1 
                     vlc-2.2.2 | 1 
               opencv-2.4.12.3 | 1 
                    owfs-3.1p1 | 1 
                 lvm2-2.02.149 | 1 
               tcpreplay-4.1.1 | 1 
                 mono-4.2.2.30 | 1 
        host-gutenprint-5.2.11 | 1 
                    cups-2.1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 libdrm-2.4.67 | 1 
               libsodium-1.0.8 | 1 
                  c-icap-0.3.5 | 1 
                    pppd-2.4.7 | 1 
                 libgee-0.18.0 | 1 
                 igmpproxy-0.1 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f8fe9326f770f975080360e856569893fa74c5d1/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f13e4aab20c5029cbfabc7b2fd4c3429659ffe67/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/0122c4d6019dcb62ed3dd4d839d38df886d2d5a6/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/af13626ad6e145668e7063baf76538b74b2215a1/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/da62b80989df6b8f1b5557b4987d7a6999d30bb8/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/a0ff1d6ae8f9824b42596d02bd84465d59c9d7a4/
    mips64el |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/5bc6a3e15d085ed6418381304978d96544110212/
         arm |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/85a2b02857fa4b14fad8b428494e17dd1e45f170/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/e98d383dabc2b7234c0bcce22a64947a553594ec/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/343afc3fcbb8a0e5130942957b18b42ea8d1905c/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c885b3643f7ebe956b5c1303eaaf6ea06e9813fa/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/6f6dc7734d53a590da8281f5a291f08474b171c5/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/553d9b801060845e4b14d902bd559fee7ba98fb1/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/03ce9e877936a20a6d62c345e181f52ea4721c3b/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7b377ef18ebe5792b1ffa40b9bb571c992723f9d/
      xtensa |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d8478a2c0bd393f001610d7307cb1039173edf02/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/7099dfa2a92701df180b60eba267a46d4100ee01/
        i686 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/b111fa19f527258f17aef0d979a488aedcf5602a/
         sh4 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/a8751f34ab9acee46a856abfd714387dfcaaac21/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/83b037c8626b99bfc9871f252c91baf75be350ae/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/efafcbd25fdddce46b19b1ce544624b6cf61308e/
        i686 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/4f1853419c0b40f339f85c0348baf8fb02554720/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/38da0140741bdf2678e8ed2dbaadc66eb649afc0/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5364d2677f8a0616de07e7423f6e4aa462e0e221/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/7fc3f9ec5c70d807dcdd413e9d13edeb81cea1ff/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/38e198a535ac79a518286aeb7e025e2ee976789f/
       sparc |                libsodium-1.0.8 | TIM | http://autobuild.buildroot.net/results/26244a1b8347c0116a74919f14bc1b1334d8c37d/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/111bffe8f853a98ff6b816f5ab26240815bb1b83/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/b735915bf5998993c5e1340e4328ca2471b8f3d3/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/222ca1edd6e18c09b2cb1d9c7e5a8eb092e03431/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/ecf37ac1a39a021e4355e9b26669bd2fcecc1991/
         arm |                  lvm2-2.02.149 | NOK | http://autobuild.buildroot.net/results/ef9a59e14e845f767df688c968c9dcdfaf14db75/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/90472afb619d7cb0a88b5146a21ddf86ad59ec5e/
         arm |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/a6f92a7a903c5847e710d6ef5ce10283714f637b/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/bc904798a23d2ae1111cc1d4f790843f67c64f76/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/1baa99d737ccbcdab59d1bcc10f9763e2bbcd763/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f08d25cff2e2c6253f9b4b53218062b8c108c3d4/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e92f37f505a128ae61c6f43490ae4703bd39c70b/
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/858be038ecf21d9c55ccebb3157960500759c0fb/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2ee0d14c97246b19341468fd5deae41e8a1f68db/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/237859ea55ac514c1ae87f1b9c0280eea1fd8005/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ae7d9ad196420e475904df333196601e981d93de/
        i686 |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/37f4c50f661cabe719408da80c4b939309d835b0/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/434ecf6f7222b9a3a1abf5ab0a65fe86f03ea021/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/8f070a10ade6b7d7699ef2137e951518a617587b/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/4b3b46d3d1c4d730191fc127f1f0a86aba075304/
        sh4a | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a55bac5f0014beb7ca67607e0917705bdd320bdb/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/a3bf60a60165d0100712e5d23b9fe2a45548149d/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9c65177632c50df729e3d8835e97f74434ff8ebc/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/5030a1b8059b709a0b88e1e168ce3f8ec433dc3d/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/682e0cfd16ecea9bcb82a262cf23a17fbfea0181/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/07c72a809d0e47030d70c28ae19cdbb92b86a2be/
     powerpc |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/8c33ddac42d5b0de0b52897eb14c646f5d4b4cef/
        i686 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/641a39f25e5cb41215b7a0cc3278bec83e4ca488/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/3a4ad0888aa12e7acdd02a4092ac73308169187e/
      x86_64 |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/e9037aae2c528974b1c67b9d718f037855705312/


-- 
http://autobuild.buildroot.net
