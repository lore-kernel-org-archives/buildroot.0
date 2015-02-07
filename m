From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Feb 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-06
Message-ID: <20150207073015.8AF1B101559@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-06
===============================

        success : 313
       failures : 34 
       timeouts : 1  
          TOTAL : 348

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
             libselinux-2.1.13 | 3 
           libmemcached-1.0.18 | 2 
               host-qemu-2.1.2 | 2 
               ding-libs-0_4_0 | 2 
                     rpm-5.2.0 | 2 
               libcap-ng-0.7.4 | 1 
               dvdauthor-0.7.1 | 1 
                  zeromq-4.0.5 | 1 
                 webkit-1.11.5 | 1 
           qt5multimedia-5.4.0 | 1 
                   lame-3.99.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                gptfdisk-0.8.6 | 1 
              libarchive-3.1.2 | 1 
                  thrift-0.9.2 | 1 
                    qemu-2.1.2 | 1 
       opentyrian-2.1.20130907 | 1 
                    strace-4.9 | 1 
              host-erlang-17.4 | 1 
     x264-20140930-2245-stable | 1 
                 qt5base-5.4.0 | 1 

Detail of failures
===================

        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/bc34c732aa1cb4c90e3c641735ac698920430223/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/e6953b98ea462cf029343f698c5c2bca03c30e44/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/438a8266220a2cd1eceed46e4a8da26dd4c19d17/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/c8270abda78ed094007782d38e24b14b6e08d966/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/93c4bb44b2f6ca491b7b6d5dad972120f8f21a38/
        i686 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d189d7f75ffbb3349b68a5c312b14ea5638bb903/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/13d094e91b240de78096800afaca61c0af55d54e/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/831f3a03321cea1b753f3e7dd8d3c6354d51d3e7/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/581e96ab05073fea2814120bb26615aed32f7704/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2c8761b0db073254b1a990a19c16362ec06fffbe/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d5b16572b555b5dcf9ac303394af6d1e1e20eeb8/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4ece4b89a474ca85f03cc243447b551eb76b5265/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f8780338d425bc33286e9f61e5facf1eb1d5be15/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e0fa2b81e766b8ec3d24858eb4fe03ca54b5fbb6/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d6051a18af10cfde1b1f75566c1b2e96d45142d8/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/6f5e20a4a99eb0db650430bf6285c844fd940711/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/cc70b4497ab4a24599b06973a18ab82a292c7836/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/91d4b9d3f2d3597b071a1bcec8339eaf2a9c7981/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/ac66dcb2b23deb3b0c365a61099095687a57a68e/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4ba242a66b94b76fc2c9a30d6af50bb47d0f3ef9/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/88918a8d9fd9307c75ceddc042da51f0076e0be0/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/68d77efb27a50893d3bd327ab191d42c941bb8b4/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/09b8cc34a120917cce33d92c74ceccfd7aa9dfd0/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/fec3dcf07bb022e2d9bad3e6e6b84ef6d32f7066/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/954f63057e72bfc52055315190987b11fbdfb81b/
        mips |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/1be84c3d1e2234ea4a340ed7f2772a6525105bc0/
         arm |            qt5multimedia-5.4.0 | NOK | http://autobuild.buildroot.net/results/79508e6af87d6dc29d3b3b5fecf66ea5836291b2/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a7b0682916cb27254bd6e0e9ea8248aaa720fa40/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/82a31b1bf769d72253b4206ed1aa85c1651b9b85/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/86811f35a73f7e9147b9515052f2f02e8cda0531/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/156fdf296cc6a2b9a5b6e2b0e3fcd6f1ff2c9a3c/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/60020e444539996e97530dec326430e126b27b2e/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/0f8b1167ba23a9a2cd9bd6b6e1baa0470523d47d/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/a97f3a8482f2f57c786b89abb4e29bbf711871f9/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/ed92f8db252838dc85763d76700a0f8e838249b8/


-- 
http://autobuild.buildroot.net
