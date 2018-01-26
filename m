From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jan 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-25
Message-ID: <20180126070008.3ABCC20DB3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-25
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 197 |  36 |   3 | 236 |
   2017.11.x |  15 |   0 |   0 |  15 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 4 
                  boost-1.66.0 | 4 
open-lldp-036e314bd93602f73... | 4 
                  ffmpeg-3.4.1 | 3 
         libcpprestsdk-v2.10.1 | 3 
        ltp-testsuite-20180118 | 2 
              wireshark-2.2.11 | 2 
                     apr-1.6.3 | 1 
                  cc-tool-0.26 | 1 
checking whether segmentati... | 1 
                     daq-2.0.6 | 1 
                   gconf-3.2.6 | 1 
               host-efl-1.20.6 | 1 
              host-erlang-20.0 | 1 
             host-gauche-0.9.5 | 1 
         host-libsodium-1.0.16 | 1 
                      icu-60.1 | 1 
                    mpv-0.27.0 | 1 
            nilfs-utils-v2.2.7 | 1 
                  physfs-3.0.1 | 1 
             qt5location-5.9.3 | 1 
                   systemd-236 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                       unknown | 1 


Detail of failures
------------------

    mips64el |                      apr-1.6.3 | NOK | http://autobuild.buildroot.net/results/e98171fa4caaad9f9bdbbfb8de83679b4db66a9c |     
 powerpc64le |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/bd137d01da52f43f3959d7ecb3b44114de68e97e |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/abf5145987d8fc01e55c5a65d3a91629ee14fd16 |     
         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c6503150d3f44135a7016f8c7def3245bc30ab4b |     
     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/925816f852125e27f86f57c2a847ca7496313c35 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e47bd038a958d78e1c9bc26223d9adcbb6c22cd7 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/db8f73bff68d1a1a7d32f731b867379cd92c2574 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/062a85fbd46e5021594b626bf7f3f76fcd6dfa74 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/386512ed17a2713e26521b3691ca4809cae61f84 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8cd32748417204e0b048a83e7fc7012a58bd2cc2 |     
     powerpc | checking whether segmentati... | TIM | http://autobuild.buildroot.net/results/763d28689b09e981a0b26ce24ec3b1def5b3ed8f |     
microblazeel |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/c89d5d191aa57726fb2df930f9d5ac639b5927b5 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/9d6c2d0131b9ae5ccffde35d729ae17ff5a52be0 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/7f5172fb24116078e2e20ccc8149837c08714eb6 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/8e434b3ce983bf1458efbb34b5c3a2d1a4716f4e |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/f4a37f6d03b94f49382016084c5496a911cac132 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/85872513b33bab2a395ea38831340c9ad1b69afd |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/b37de83119d32f7f2ebe43f098b07a65e88ab654 |     
      mipsel |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/6064fbaefa321df4647533e0d07b0e0a5d35b2a4 |     
    mips64el |          host-libsodium-1.0.16 | TIM | http://autobuild.buildroot.net/results/c826debc8d3cd50ef0d758c80de14b69ea524227 |     
        bfin |                       icu-60.1 | NOK | http://autobuild.buildroot.net/results/d1d238ec7b5650fad6707ee412f8c9aee63c1290 | ORPH
         sh4 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/3b3a396cb540784db27ba45f77d5264df63b991e |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/672d63d51d77dbf7408b4a995192aaa6ff444a66 |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/c50d45340793bb03a763b66a58a0f435895f6a03 |     
    mips64el |         ltp-testsuite-20180118 | NOK | http://autobuild.buildroot.net/results/96285d154abd65838ff5c66e96db309d9ac26c80 |     
    mips64el |         ltp-testsuite-20180118 | NOK | http://autobuild.buildroot.net/results/fc01921e8e8e1ea100461b29137c4219e6686c58 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/8d44db13685818571646436badf2aadb075b5b9e |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/43cfada5674a7b38ed17d11146eeb219864bdfd9 |     
      x86_64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/a11e778380a94632f70ee313c422734b5560b304 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/ddda9e72a2be89ae37024f93a622e41e861f140d |     
        m68k | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/d224ee98432b69bf3b7b53091cd651c8c4c18385 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/41263df095c4e9e79e23456404cb147b8bc315a0 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/7b19083df5cecb8570011de9dd97620604ba121c |     
    mips64el |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/86764750b5e0f28de2f89485f858bf7091d2ced6 |     
     powerpc |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/5abf9102229d0c25fc66fe2e9be6f9cb2278feb2 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/b7492ad2cb7626392b9eca64cfba141c3b214137 |     
        mips |                        unknown | TIM | http://autobuild.buildroot.net/results/53384cf9220aa613ea69c7142dae000ea995f1f3 |     
      x86_64 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/0d85c322502110e64b403361478312bb09049ea7 | ORPH
      x86_64 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/bca43f7e09aee9e403760fdb6ad82f74aa1197ac | ORPH


-- 
http://autobuild.buildroot.net
