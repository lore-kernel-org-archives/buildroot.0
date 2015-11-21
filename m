From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Nov 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-20
Message-ID: <20151121073016.91418101854@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-20
===============================

        success : 127
       failures : 33 
       timeouts : 0  
          TOTAL : 160

Classification of failures by reason
====================================

freerdp-17834af7bb378f85a3b... | 3 
                  ffmpeg-2.8.1 | 2 
                busybox-1.24.1 | 2 
                  connman-1.30 | 2 
                espeak-1.48.04 | 2 
                 mesa3d-11.0.4 | 2 
       kompexsqlite-v1.10.12-1 | 2 
           host-openssl-1.0.2d | 1 
                   mp4v2-2.0.0 | 1 
               dvbsnoop-1.4.50 | 1 
ltrace-c22d359433b333937ee3... | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                mongrel2-1.9.2 | 1 
             lttng-tools-2.6.0 | 1 
                   erlang-17.5 | 1 
                   mpd-0.19.11 | 1 
                 lvm2-2.02.132 | 1 
                     rpm-5.2.0 | 1 
               libnspr-4.10.10 | 1 
                   glog-v0.3.4 | 1 
             util-linux-2.27.1 | 1 
                    php-5.6.15 | 1 
         conntrack-tools-1.4.3 | 1 
                collectd-5.5.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/99d90c222d035c576646c7a3091f17f2fd9090ec/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/c3e5761712b52f30cdf155d5da5bebd6fee59349/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/084dbab23387382ec01cb6234a1f02fef8935d17/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/ca14a9dd83e25580addc5f378b624c4db8304c62/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/9d06c90c1bd5a19167144a7266ad7b9f95d94ebb/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/520e8f327b9bd7eea59657bad702c35c632d115d/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/3e6051b38786e38dfdea859df8b1d1436f0e0d3d/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2e25913be06c37bd95e842b89d9b7ff7d37f8f0f/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/5b46ffb8c956af1ed80558ea0d2e4d7b25a31c42/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/3b2ce25b182cbd18e942a4c6733ef57a096c76a2/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0e52ae82c6aa3695d04d7c365342aab9fb25cba2/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/7597dff4c8a2724c44395dbee9bcd9bc3417f442/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/d62b7669711321c82ba2275d465a3719176a16b6/
        sh4a | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/cadb2fb90ce66b1fa3051a6fcfb7c8142f420c31/
     powerpc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/50a5c3a2e2debac4a3062668ee3df0c785e9a576/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c20ab7879efbf6e7e9e11e1cac4b718a05d8d514/
         arc |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/ec8b3d7f94eedbe1eba0ee585acae746b5052ca3/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c0b65be99603a2c2f07a38078f6b5622353915ca/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/6c272f6ec9ac5b59057ca3b74dfa025284c84f54/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3ebb97b240879408190f7510d2d72a1e711eabe9/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/3003c7cb051958d385bc95f016d49eb4a768a90e/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/0470689a0e38a94fb4fdf7b5e9ce12a50554d827/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/fbfabcf3e9512a585cdbcd19129bc7d832e1e2bd/
      x86_64 |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/cbc311251cd35ea2ef1ae3bc33b16e004a788d7b/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/a62c8c2fcd0479183944aa40191f152c78114c64/
        mips |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/88e7c1c89c8a4ddadaf80964adc66ce1ab2d94fe/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/07603eff9604ce5bf0412d94267599c7955ef366/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/6b4ae86dd3836f5f5054412156ea7efcf2510f5a/
         arm |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/5acba9b0ed852512fc88e83973a3b5389e6d54be/
         arm |                     php-5.6.15 | NOK | http://autobuild.buildroot.net/results/8df836b6c241954449544c7b4c74a1cb19e7ff7b/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/220c97ab3f39b97ff375d4c1c14dcb6002d1b6e7/
      xtensa |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/aec30c8a109faa48a2cefab19d43e25ca6e7574d/
      xtensa |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/0fb660cfe4d8809a1f8c835f0ea568e1baa93b38/


-- 
http://autobuild.buildroot.net
