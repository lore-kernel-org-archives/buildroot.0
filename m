From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 08:30:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-13
Message-ID: <20160714063027.438161018C5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-13
===============================

        success : 74 
       failures : 33 
       timeouts : 0  
          TOTAL : 107

Classification of failures by reason
====================================

               libcap-ng-0.7.7 | 3 
               target-finalize | 2 
             transmission-2.92 | 2 
                   dante-1.4.1 | 2 
                  babeld-1.7.1 | 2 
           libmemcached-1.0.18 | 2 
openblas-f04af36ad0e85b64f1... | 2 
              alljoyn-16.04.00 | 2 
                blktrace-1.1.0 | 1 
               runc-v1.0.0-rc1 | 1 
                    lftp-4.7.2 | 1 
                 jack2-v1.9.10 | 1 
                acpitool-0.5.1 | 1 
             bluez_utils-4.101 | 1 
                   ncurses-5.9 | 1 
                   perl-5.22.2 | 1 
                    mpv-0.18.0 | 1 
                  autofs-5.1.2 | 1 
                cifs-utils-6.5 | 1 
           uboot-tools-2016.07 | 1 
                  snmppp-3.3.5 | 1 
             libsidplay2-2.1.1 | 1 
                jemalloc-4.2.0 | 1 
                   fio-fio-2.7 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/7d16da3da287cee1911b8dfdd98ff083442bc761/
       sparc |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/ab928a32890903a2e7eec4721698fdcdce2b8647/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/bec5662ea76d1dd5d9a089a47b7abd2b1380c3c6/
microblazeel |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/11abd5048c363a5d480bd4c11b43a660e3cef08b/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/86f034066c41fd0e01abf76d92bf869d70283079/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/e3761b995b2a22db8ee6c17399b81935b502bea3/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/bb95771e93b4f88fd67df077451992fd17d3fdfe/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c99a13590aeb8e09385263e4fdd17f52a72e3068/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/84a0da505c9d566eb04e179988377d43f9ad66a1/
       sparc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a1ca2960a72ee2a44fa550fb1cce921ed5f0d1f/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e898b8ce5f3e889dbb88d3ec9c3c05df0e3e671b/
         arm |                    fio-fio-2.7 | NOK | http://autobuild.buildroot.net/results/2c9d127b741d56ee521cd10960417ff587102456/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2ee8f52efd2abd21c6339c915d96299ca3d0f2a4/
     sparc64 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/95df560b13be7abbce6aeeb3ed0f0814d597bd08/
        i686 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/9b28c0fadbf27584807226bf56d7182d1664117d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/957c4cb0d60ac54d062ec0b14c87950915ff889f/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/241df4be3d8223cade91dc6f5131a123c4951704/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/10b392002080bb11b6de228f54f91dcdc131a609/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5b4551e5e9f2956624cbb3754d2e4324979c8128/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a0ccb6a7b38df4963625e7a125d2f71ac6592c5c/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/8e3d80c944bd8cd1ca785f00ecfd3f9a1df0889b/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/72a897b24a452b591b763fbf350ec3ffc9697813/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/9e576453cc9646fd46119242c80715d83634c7ef/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/2fce9bfb556d9b4b3fc08820ce7be8b3a13a1474/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/1e8506a0d7b4fe1b773535f7d23ca422c03f9770/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/6cb78af82c6c66afadf1d0d3f7dcfe3b07268b1d/
      x86_64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/466631fc1dffc5bf9e5e4dae3bc11e6cefcf158a/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/52312aaa1c7ee04d80a42b9874d2a72ffc315650/
        sh4a |                target-finalize | NOK | http://autobuild.buildroot.net/results/a84098e28f41b01c64ad074f53ce53bada3a09de/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a9624c8d948c8a659630ce87227fa5a725668b50/
        sh4a |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/2b6043cff6338a8905d99d69bdbb46eb6bfe59ae/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/3a57ad1a18d668f7512ae5d90c806670b13ace56/
    mips64el |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/432b7f836ce0a4a33fc0c8986305fec642d9e74b/


-- 
http://autobuild.buildroot.net
