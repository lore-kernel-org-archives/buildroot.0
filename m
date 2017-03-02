From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Mar 2017 08:29:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-01
Message-ID: <20170302072929.3F9D4207EB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-01
================================

      successes : 165
       failures : 30 
       timeouts : 0  
          TOTAL : 195

Classification of failures by reason
====================================

         host-e2fsprogs-1.43.4 | 4 
                  cjson-v1.3.0 | 3 
             fontconfig-2.12.1 | 3 
             lttng-tools-2.9.3 | 3 
       opentyrian-9c9f0ec3532b | 2 
             rabbitmq-c-v0.8.0 | 2 
                  boost-1.61.0 | 1 
                  cppcms-1.0.5 | 1 
              e2fsprogs-1.43.4 | 1 
                iptables-1.6.1 | 1 
            lttng-libust-2.9.0 | 1 
                 midori-0.5.11 | 1 
                    mpd-0.20.4 | 1 
                   ncftp-3.2.6 | 1 
                     php-7.1.1 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.2 | 1 
                 sngrep-v1.4.2 | 1 
x264-97eaef2ab82a46d13ea5e0... | 1 


Detail of failures
===================

         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/464ad564076e972437c0a9e2512efe206db9ca8f
         sh4 |                   cjson-v1.3.0 | NOK | http://autobuild.buildroot.net/results/0856a137bdd47845c40e58e6998d41745b9a13f8
       sparc |                   cjson-v1.3.0 | NOK | http://autobuild.buildroot.net/results/96817e0911d5a89403fe982af62d2fdf32812e55
       sparc |                   cjson-v1.3.0 | NOK | http://autobuild.buildroot.net/results/cfcf3bc8066159dfddd1786954d78e8527858f2f
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/bc8c5e3a647a56ac08fdaabe78e18681fe632127
         arm |               e2fsprogs-1.43.4 | NOK | http://autobuild.buildroot.net/results/dfea29317e678047ea375fb199d17f7975163d63
        sh4a |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/054b56978bd75980658fecb44d46416fa60ac98b
      x86_64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/fcd27645f47f28b989bebfec2d65f5fdb72329c6
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/3f620e6d66e97b9449aec725692636883ef07c61
         arm |          host-e2fsprogs-1.43.4 | NOK | http://autobuild.buildroot.net/results/ccb9f142d793362da7b4294a87d84f5f2a744028
    mips64el |          host-e2fsprogs-1.43.4 | NOK | http://autobuild.buildroot.net/results/95fd859fcf057946dc81ee1a8034ebd6b86eb6ba
         arm |          host-e2fsprogs-1.43.4 | NOK | http://autobuild.buildroot.net/results/80383e83c991a030c05471a21f5c90f113fddf34
        i686 |          host-e2fsprogs-1.43.4 | NOK | http://autobuild.buildroot.net/results/1832a75e1f3f9d8c6be2924cade770a7157a6a90
        i586 |                 iptables-1.6.1 | NOK | http://autobuild.buildroot.net/results/bee20b689345b593378cfd91e0abc48bf381d3f9
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/9e25abbd1adccf19781537ecc7ca33402911f435
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/607d59bacdb81d7c00593baef00b55ff70ba30fc
        i686 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/2426762ba73ad712640390d348b0b9b8e50e3677
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/f5500327d1af9bc7c50ad5782e3a434d9039227d
    mips64el |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/705d9d46d871e76c017bb30068472823eabae61e
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/2f7dbb767736e86cf1aa940ab445fa2598fea4c4
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/ff55ead89498bb124664589f46c10ea46cb5348e
      xtensa |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/f44fb68a89392954cbe02de27f1d0c8633c7b405
      xtensa |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/d06e35d5ac6d29d9f8e66bf86ad45b0b611928f4
        m68k |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/5db4fe554f74051a0ad0ec2ac62efd94190a4bb2
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/306a8009205ae0b92744734d528d14b753586dac
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/c170afc5946725fee229af2f167ba51f24ae7bf1
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3755014a94815fc927acb7be00aa9884e64a9a3e
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2db0d6576a0997bb6c5d2e0208d3b9a9e3580f88
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/911143de823b2c749ac0a59dfa06adb6ddd3de50
        or1k | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/2994de710f0602756dd1a3ce903813d8a714f1c1

-- 
http://autobuild.buildroot.net
