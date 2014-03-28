From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Mar 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-27
Message-ID: <20140328073007.38ABE101277@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-27
===============================

        success : 55 
       failures : 41 
       timeouts : 0  
          TOTAL : 96 

Classification of failures by reason
====================================

            lttng-libust-2.4.0 | 8 
                   slang-2.2.4 | 5 
                    crda-1.1.3 | 4 
czmq-b5730c5f8290a611fd3b92... | 4 
                     wget-1.15 | 3 
             lttng-tools-2.4.0 | 3 
libubox-bbd846ec2d72b262975... | 2 
                    php-5.5.10 | 1 
                   systemd-210 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
              host-scons-2.3.0 | 1 
                directfb-1.6.3 | 1 
                  python-2.7.6 | 1 
                   ptpd2-2.3.0 | 1 
jack2-37976441044d69b91d61d... | 1 
                    gpm-1.20.7 | 1 
                    mpd-0.18.9 | 1 
                   eudev-1.5.2 | 1 
                 qt5base-5.2.1 | 1 

Detail of failures
===================

      sh4a |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e31d2aa15ea15ecec2432c773c62d82c7d9eb68c/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/49fee88cedc37901bf6652c51b3dc9ff1c4889ae/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a1d22d8a97b67ee02777b70c429ee9b5d850d3c2/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/9b2a4fa72b963f1ae07d2a646cdb121b5facbc69/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/e6a23b84b83d10121f761a723337ee321d712964/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/3a9fb040cccc56a31128a85cbce4a4f099b09c1e/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/781a6bde08adb10d9657a9bb6bbaf57d6be916ba/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/be7b5ea01531fe002f91ffe0d950c61e273a798a/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/85378544caff4d27d13a5faafe36d7edbd7f89f0/
   powerpc |                    eudev-1.5.2 | NOK | http://autobuild.buildroot.net/results/ab120981fc2eeaf137204a87b20fada76c10e495/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/cecebbea40292609c6cdf485997505d8e6e66117/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/feb311fc9b9d7a39dd6d40e078a2ef3a4cbfef6e/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/cda41ccfe58d85eabd5730bedb4471b87ab0b66d/
    x86_64 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/8cf655250ca18b1ed102b294bf3be94e664b4c9e/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/48af456f2a36f2b8e3d21d2458bc3433a0791345/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/36ae61525f2f03fc3c1815a596ca32cd654763bc/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/1d6f66c57ce694068203de3310dd5b2bf4283a97/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/2f33f692908f25b58e758e12e5ea58b92a63b8d0/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/cf9fba3091f866cf240a44717f8e37eab1447642/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/c0bcaeb9175241ac49ff7df70c16a9e45f4cb1c0/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/1e71f1d6c186f70b68a9659b07358bc56907811a/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/3be0140f8d3e7de73be04b992ae82b5295a43e7c/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/e53e0295436d276781d0ab7bb7567828bd3a3e01/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/e013adbbb3fed84ffd5b7d7c9d7f0c1a46760700/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/2bdfd2069b87617fd6f73e6e51cf2217e1373708/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/3d2dd38e63a4b555ec66ab5fec958161aae50a3b/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/623c08344056824438ff23ada6ff9d0cce552c1f/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/8ceb0405fbeb9d6cda43be9ee21e76353972c580/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/b753ed7df2ae0d5efd09aac5f022f7bc89661fdc/
       arm |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/c493ad496b7d3625287cc1a78897cebe293a29df/
       sh4 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/625eb8dbe5d33a3b01f44fe87666e36f6eb2e2d2/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/dfcdce040d518322e088e1ae6cf826452f014c3f/
      bfin |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/64336d3bacb6556011aa756705a0d36aadd31379/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1f12b5918d3c572a05851aa3147b836f8d8799ec/
      bfin |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/16f5342ea664a0fb189586f3b5f8a5d13f0e405b/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/df435d9cebbdc84b3581ba258b618123570dde8b/
microblazeel |                    systemd-210 | NOK | http://autobuild.buildroot.net/results/bcce95eb0748505c0d62db21a6e420aae3c3181b/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/7fed8159ce16066116e78bc1999e2d3d7e62e9bf/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/8da8169a7fae2fbc1ba230c1aea744d9ecf36a95/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/2e1144280da5556f0df28553f47d73935e0b869c/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/86af8a87403b80599950809575f8dc5cb18b4241/


-- 
http://autobuild.buildroot.net
