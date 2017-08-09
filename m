From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Aug 2017 08:30:54 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-08
Message-ID: <20170809063054.C1F01209C0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-08
================================

      successes : 125
       failures : 18 
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

snappy-be6dc3db83c4701e3e79... | 4 
                 qt5base-5.9.1 | 2 
             transmission-2.92 | 2 
                dbus-cpp-0.9.0 | 1 
                  dnsmasq-2.76 | 1 
gmrender-resurrect-33600ab6... | 1 
                     gpsd-3.16 | 1 
             lttng-tools-2.9.5 | 1 
                    mpv-0.25.0 | 1 
                     nvme-v1.3 | 1 
              swupdate-2017.07 | 1 
                       unknown | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/ef9a2f82403c737420d2e562994c2a1aac9839f9 |     
        m68k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/bed48c28275926b7204042bb2b8d1b64b5f3c7a2 | ORPH
    mips64el | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/6067b9f40f228e215ccf991cdc1491ad3e6d7c03 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3ae2d2b8ae41112c653575557c463ec0c0d7ce29 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/59baff40aff749c69119fd28f0893ef11129f540 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/5f41be67d2c75b6a5f6a8c65193189f360ad620e |     
         arm |                      nvme-v1.3 | NOK | http://autobuild.buildroot.net/results/e263ffbf8947374c2aac73ab42edcbf4d9a3600a |     
      mipsel |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/0b61ebcae17e949720ca88eb4dd4552b0917fab6 |     
    mips64el |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/81abae52455d81b1853bee2090424dd7185ad8d8 |     
        m68k | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/9e8405360d1da6824a741fb4ac45495f9e806358 |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/50095cae347eb95a6912df33f455b6284fee73d4 |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/8dc9e147e5f41a979aafdfb1ab98121e9cd491b8 |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/e3f88d92bc88159119b16167f4e1805826af09ff |     
        mips |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/a7df617770e301381808ab9796e62c7f2d5eef2d |     
         arc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/452aeb77995e530f1ca0d37837e5dddba816db92 |     
         sh4 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/144fd694c46f3b629190d67b8d3830fcc5ba24be |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/457ff2c4eb8a37b09fa70d9e3485eb5c8f8c3e07 |     
    mips64el |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/43332a36c4d9c9a28e886e456b02ad1fe7943eb0 |     

-- 
http://autobuild.buildroot.net
