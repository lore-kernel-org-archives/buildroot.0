From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-23
Message-ID: <20150224073017.32CEA101A06@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-23
===============================

        success : 301
       failures : 25 
       timeouts : 2  
          TOTAL : 328

Classification of failures by reason
====================================

           libmemcached-1.0.18 | 4 
                  python-2.7.9 | 3 
               libecore-1.7.10 | 2 
               ding-libs-0_4_0 | 2 
                 qt5base-5.4.0 | 2 
                  thrift-0.9.2 | 2 
                 python3-3.4.2 | 1 
               logrotate-3.8.7 | 1 
                lmbench-3.0-a9 | 1 
                rtorrent-0.9.3 | 1 
               host-qemu-2.1.2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  zeromq-4.0.5 | 1 
                pinentry-0.9.0 | 1 
                    sdl-1.2.15 | 1 
                  fbterm-1.7.0 | 1 
rpi-userland-ba753c1a7f68d7... | 1 
               qt5webkit-5.4.0 | 1 

Detail of failures
===================

        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/8a586b781b6923444857ef58de659e5f0e8652ee/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/028690aea7b5589104283bb28509324b04aa2c8a/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/16e3cf4242ee3c537128c8d435fa38bcd43a9e5e/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/96fd8727fab49088307ea1f0664537697f0d435b/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/c570898e5cfabf1223ca677948473c59ae1c01e5/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/ac5ed119ba06d24e6e47e8bf4551b0e1d9c6a170/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bbc14e9df00bf535f71e99872f4ea86ad716f085/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d9bba54d98a67f93ef28300e13629cc6e044fab5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4765d079fecc15c66f4bdb24fc294fdcd57c9b0f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5caf29f0c8eaee4a80801a34c76e2978f639cdfa/
        i486 |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/89ee35561d3a49f38e9a747ed78a5846be4764c8/
         arm |                logrotate-3.8.7 | NOK | http://autobuild.buildroot.net/results/159bf5730414ca7f73dcdae95090177355193636/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/5dd8f0131b40be8ff4ab3d020db4e682306986f7/
     powerpc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4d1fddfaa058296daac62370db6b060f1e4548ea/
      xtensa |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/133aa5796cd0c30fb794d9d7f0d346dc1ecadb85/
      mipsel |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/ec425306a24325b98b34a88aa716f0a3fdeda7b4/
      x86_64 |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/46fa2c8025c1d42d62f1344615532c28da6c8b03/
      x86_64 |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/8ea75d5db676685e8b49af932dfc994b7de7874a/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/7e17676fdf81db79de2a83750c4035cb66c6f35f/
      x86_64 |                qt5webkit-5.4.0 | TIM | http://autobuild.buildroot.net/results/e070e4b2ab58ab4a864daa3638a09763978c108c/
         arm | rpi-userland-ba753c1a7f68d7... | NOK | http://autobuild.buildroot.net/results/ec769f4cc7bf5eeb141774fafc63365038c7c3a7/
     powerpc |                 rtorrent-0.9.3 | TIM | http://autobuild.buildroot.net/results/96298c6a99387cbeed7fbd56defafe267cf5ddd8/
     powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/452add96fd27f4039df291ed99dde23c25463b06/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/3c8fe449163238196d4088e98598c31497215d64/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/42ffacb7f26312b9ac40893afe5b441e0e7740de/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/bab5478be5a410f68124c9053b4a899363790152/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/9b99a262109dda60951d37a2fed59cf858158422/


-- 
http://autobuild.buildroot.net
