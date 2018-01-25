From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Jan 2018 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-24
Message-ID: <20180125070036.5C0D420C53@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-24
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 279 |  34 |   2 | 315 |
   2017.11.x |  26 |   2 |   0 |  28 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 7 
                  boost-1.66.0 | 2 
                busybox-1.27.2 | 2 
                  cc-tool-0.26 | 2 
               host-efl-1.20.6 | 2 
           host-mono-5.4.0.201 | 2 
       kompexsqlite-v1.10.12-1 | 2 
open-lldp-036e314bd93602f73... | 2 
                     avahi-0.7 | 1 
               domoticz-3.8153 | 1 
                   gconf-3.2.6 | 1 
             gstreamer1-1.12.4 | 1 
              lynx-2.8.9dev.16 | 1 
make[1]: *** Waiting for un... | 1 
                    php-7.1.13 | 1 
                  physfs-3.0.1 | 1 
           python-numpy-1.13.3 | 1 
                      qt-4.8.7 | 1 
                   systemd-236 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
tvheadend-e06ffd87beff16103... | 1 
               upmpdcli-1.2.15 | 1 
                 wsapi-1.6.1-1 | 1 


Detail of failures
------------------

         arm |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/e7754bbdb219550b1da5b8e2f86bea1fbe3170c6 | ORPH
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a592228c07e46a5f8be5528a479e2142642c50aa |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/52f0398b067f3ecaa36c15d5a58c98d2947a06ed |     
     powerpc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/65f04857f64431641f0671341bf5d67ce8f4137b |     
     powerpc |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/b9d03dc8f57697112e7a10013b5e3cf3318b2bcc |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6ccd633ea7acfc418d58595756e547204a44e86a |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7044529b1a75ac97cf78f6873ec966a765775c55 |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/e402b3db006e81d6f762f1acd7a65f72d7572fde |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/86632106367911d820db093673b889fc17258c3b |     
        m68k |              gstreamer1-1.12.4 | NOK | http://autobuild.buildroot.net/results/e4e122dee90409cb2654cc6b4ade574014423f57 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/e7ae347e197d74f234ebf30ba8f6ecac3b6c9ac1 |     
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/f7360fb7b60d44663ecd9a39360499f0cff11ec1 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/b6f32aca8b9621df6c143b679a94388fa220a871 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/f24d769cd747a80957d6627a16dbfa4ca761b13f |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2dca2372ca88581400bacb058da9450c590580f5 | ORPH
         arc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/606c4f88d5f237fe8df3711a8d20c79be08c76bf | ORPH
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/6edf3102277d2aa5f65422ce22e9fb9c7b5af1ae |     
        i686 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/69b9d5c17c2772cc512d1a419593a95fef6e82e2 |     
        m68k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/9849e286f24703cad655a08a3a81acbe94ab77e9 |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/06e54dbf95cd20fd4666738a560b927bdd10ff8a |     
         arm |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/03b1b2bdf90a7269c2786a55ca4f5a701fcd4eb0 |     
        m68k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/d622d310e2a937af26e5a971b6cdd9f0913d5e80 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/d71be3050060ea782d4edf0529dd023274d8c91e |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/51ce2732b5f2168168d6f44d9fc0f4a93a1621f1 |     
    mips64el | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d5aa1602579f6993834c5ad438135c66096efd22 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/e326b8ef5f01a30b7d3c432460d2e33ca2d3f580 |     
        m68k | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/c19f417cbcd8ff486d35e642df6c52279373ad6e |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/00f74a6439e1d520c9e0e459b17f7d65724f23a7 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/b39f1d30c2a158b4127c9a66c3321360671e526e |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/136e4ef3aa055b87b8017f0124f799db8471345a |     
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d9339d0ab4c046caa1fe93384646b36e389bea4b | ORPH
      mipsel |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/31335aa8057f1cfe17cea3fdaa335d5ec09717f1 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/728c65600b0b54ebfead22800a9e20d4d2379db6 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/1e4d9a57aa4478af3997261b0c106866c244516a |     
         sh4 |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/b1fa843d020b38f0d9da27ca50eb6d785d359841 |     
         arm |                  wsapi-1.6.1-1 | TIM | http://autobuild.buildroot.net/results/e6d0d521803dc3abd4f18ecf6a6dae2bf2510e0b |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

              ghostscript-9.22 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

microblazeel |               ghostscript-9.22 | NOK | http://autobuild.buildroot.net/results/eea564cd6f8cddbf90edd69c5b7673808518bea4 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/353bf4bcb9d875c49ba182effe2e2e5873f659e2 | ORPH


-- 
http://autobuild.buildroot.net
