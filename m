From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-18
Message-ID: <20160419063021.B6BFB1019F8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-18
===============================

        success : 135
       failures : 46 
       timeouts : 2  
          TOTAL : 183

Classification of failures by reason
====================================

              freeswitch-1.6.7 | 6 
tvheadend-cd9f07fb865e57001... | 5 
                    yajl-2.1.0 | 5 
                blktrace-1.1.0 | 4 
                  boost-1.60.0 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
               valgrind-3.11.0 | 2 
flann-04b4a56533faf8c8228d0... | 2 
code/CMakeFiles/assimp.dir/... | 1 
             lirc-tools-0.9.3a | 1 
      ca-certificates-20160104 | 1 
                grantlee-0.5.1 | 1 
                   mplayer-1.2 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                libpjsip-2.4.5 | 1 
              gnuradio-3.7.9.1 | 1 
 make[1]: *** [all] Terminated | 1 
                 jack2-v1.9.10 | 1 
                    ruby-2.3.0 | 1 
                 rsyslog-8.9.0 | 1 
                    pppd-2.4.7 | 1 
            webkitgtk24-2.4.10 | 1 
                      qt-4.8.7 | 1 
                 mono-4.2.2.30 | 1 
gmrender-resurrect-aa3d02cf... | 1 
               ipmitool-1.8.16 | 1 
                 mesa3d-11.2.1 | 1 
               iptraf-ng-1.1.4 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/da005cbfc641e5be0f89b279110d8cc7a52356a3/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f8f4dd88ab262d4956b2addeb45adba932291a7c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/578661cdfd1c62b57250c09db4a363e3c7b6efd9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/971490542f1e9f840b9cf87fcc332c578ba1daa5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f73bc00a45b10e3b553e753f7721eaaef417054e/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/645a3c6185e5315383066288ccfb8147ec78a390/
microblazeel |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/fcefa6864e5cb5e2f6c989ce74d27b06e1a684eb/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/4301849f82d26df4c3723e0c53758a1cefd3c6b3/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/e8428e677c8ffa32728e2694380367c52a74ccb0/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/efd76c308755828c04908374af207b0d9970603e/
       nios2 |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/5649ff1b50a1eaafbd0e1a329bff87a65ce18da0/
         sh4 |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/ffd572d7bb68d8ed46ce76b2af824503c587449f/
         arm |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/c1ac61f9a77635962babdb6bfb31dbecb7f4d439/
microblazeel |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/e53e356451aa4541a76e26722fd71051896e774b/
      xtensa |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/c60f97c6aafb1a94cb4ce344953598eae8b4a912/
      x86_64 |               freeswitch-1.6.7 | NOK | http://autobuild.buildroot.net/results/98b401f36242b91faeadead879e442c12b3afd66/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/e0eb1f64b74fe539892b17aac3d980b9afb66b96/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c7ebb614bf27e16170f53000ceea1aea853cadcb/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/3526acdaa1cee1e2023c6e5725a9d7c549b02af2/
     sparc64 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/3b67e7b877678c814ec94b6c824b61017883eba3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/17b86c4c41ac56a905d4ad14c0c01c68a0de9dc4/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/e1aa5a12b227da1c8ca543478eac75a1d9aca63b/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/1c7ecfe4fa24fd8e4e417f799c963cc6ef5540c5/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/c4320156e832854d2bbb0215cddd895eee3c8ce1/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/82dd248469b101518829befd5c21008873909415/
         arc |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/75ee45b746ab8b80eb84297e2e4babbace1b5608/
    mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/1ecc878dd23f9d07940769e18c41ec4feae1a481/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/56a98441d28393299a9327c00076d655ac7a9026/
        mips |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/2face65b937140835510a574ed35cac05932951a/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/4f56cfce51fa9920331a615a554c20ca59009cf8/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/351941d13ef522c4cc45e292c42114c48fc0b819/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c7eaa592fa725ce9843fbe454e7fc1d4669cd150/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/24f7c70bd2e169e3f94fd432cc598084519c1da3/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d2c3ff0d4dc92603e2c1c95c68a1b056ae54ad1c/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7a55b343efaae8239f2472dc496e92d7dc0e591d/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f0d009dd6151ac9e2dc1cf1032f1da3912770274/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0cf66657ae67d64a59ea611500586d90ce56aba0/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/380e1b82bbe92fd24b22fdc5aa8ea36e82f9eaba/
        sh4a | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e59c63232ebbc81d384615a5061f0e169130a0ee/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/d85de639b136a14ea4d4fade1cb2b3914de1f054/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/d2d33423f8c07aa236f806430c804b5634d4cf07/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6a839068050c84063beb840eb5936c325eea6ce1/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/caff2f22b648fa40c5345ffe84f03fa91574d13e/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/1322c4d216e384d790959e9fa147bd1c1a05ce5c/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/aad64e6e2f60b21349c220ec5973f8edc212e698/
         arc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/82194f059a875331624deca37e4b451e76408838/
     powerpc |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/3e9ff31b47e32300adabae5f5749922ed2e84f51/
         sh4 |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/1222196a291e4b4cf4878a00ec42a586242658bd/


-- 
http://autobuild.buildroot.net
