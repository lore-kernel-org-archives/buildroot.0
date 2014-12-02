From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-01
Message-ID: <20141202073015.4C8FA100BBF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-01
===============================

        success : 186
       failures : 34 
       timeouts : 6  
          TOTAL : 226

Classification of failures by reason
====================================

                elfutils-0.160 | 7 
                    flac-1.3.1 | 5 
           libmemcached-1.0.18 | 2 
         conntrack-tools-1.4.2 | 1 
            host-libxml2-2.9.2 | 1 
                    qemu-2.1.2 | 1 
                    bdwgc-7.2f | 1 
                  prboom-2.5.0 | 1 
               libcap-ng-0.7.4 | 1 
                  zeromq-4.0.5 | 1 
  toolchain-external-undefined | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                  python-2.7.8 | 1 
              host-libxcb-1.11 | 1 
                 qt5base-5.3.2 | 1 
               madplay-0.15.2b | 1 
 34450K .......... ........... | 1 
                host-gdb-7.7.1 | 1 
                   slang-2.3.0 | 1 
                      qt-4.8.6 | 1 
                    exiv2-0.24 | 1 
                directfb-1.6.3 | 1 
                    php-5.5.19 | 1 
          libmicrohttpd-0.9.38 | 1 
                  guile-2.0.11 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                rrdtool-1.2.30 | 1 
                   lame-3.99.5 | 1 
               iproute2-3.17.0 | 1 

Detail of failures
===================

        sh4a |  34450K .......... ........... | TIM | http://autobuild.buildroot.net/results/f0ddcd331de6a9dd87932c81178d05ee21afb5c2/
     aarch64 |                     bdwgc-7.2f | NOK | http://autobuild.buildroot.net/results/529b0b6dd47744c13f56e59a4c669a3f5d56530d/
         arc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/dbb9f19ba177a0587f4c4e0694c8bdc2d99bf2eb/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/966586734952c185152d5b0e4fb724ad7f70c0bf/
     powerpc |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/b5aade009949b118f522d1aa92ad8ab76acce02d/
         arc |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/26afb92dc14fd0f85c0800dd4e034ea86af19fe2/
microblazeel |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/60ffe2ba89ed5023869a1baa2b97fa875e5b3d3f/
     powerpc |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/0533cad68120a9728df2b50dbb9fe80c246568e3/
         arm |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/9abc59f7cbacd016c633774e4eecca3c4904af57/
     powerpc |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/ef1b562f0e276e42b6fb2678c75f54eb1d39f69e/
         arm |                 elfutils-0.160 | NOK | http://autobuild.buildroot.net/results/f2dbcc1142a994f87b920c2026e7dd2c80b9d9bc/
     powerpc |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/1166068a64733d22a2f891849177ad826347dc9f/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/b94a790541148625f0c7a5926900c76676fb2595/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/660722e24efad3b3052a9d062c102201714b4d06/
         arm |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/3e8304eafd4ccd46721bfd46576889f3789b0d87/
      x86_64 |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/2ac44afdf3b4aed878697b6f02d7d91c1d532dde/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/844db1d7904cd9bd696dfdf6caf4675a5bb36768/
         arm | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/1a4065aa03d8bbbcd0ece9cd0258f2d2b62f524f/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/78635f75e2903ea28317513a735d3f6b8c4925d8/
      mipsel |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ef487b495e57f098af0fe9508d430b56b0750339/
         arm |               host-libxcb-1.11 | TIM | http://autobuild.buildroot.net/results/6162c151ecb108e0ce5317a05607d4ff539051bd/
         sh4 |             host-libxml2-2.9.2 | TIM | http://autobuild.buildroot.net/results/b2e58e22437d858f3c5ff8016f2d1cf5082f0331/
         arm |                iproute2-3.17.0 | NOK | http://autobuild.buildroot.net/results/60f3db675d8a82165f512a7d62494408cc99369b/
      xtensa |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/b7e466580561e32fb584399e5914cd61a37bf7e9/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0b53c933fa406985a969fe5cd35cadea995fe641/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7a44e0c1a464140d2f56f7a2956b1c9c89f5beab/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9223c186d4e3fb8a546f6b1ae8bb995ca7996d6e/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/3b7a88a3e19dc300dec289b5318b820e3f055955/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/b2fcf81466650bab4d3e4597456688165a398052/
        bfin |                     php-5.5.19 | NOK | http://autobuild.buildroot.net/results/3865ae19c56d9cf8fcea7f16d572f4d4cc65de5b/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9ba92c01b2c6b6eae2dcda60c2b80d66d2002d4b/
      mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/9150fe96d3f4f4afdf808358c4ec836e9654e34a/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ad9db243b25bdd53a29260e8abbc14b4b68683aa/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/8ec6c3255b3a2f427d8c7eeefbe55e1efd75ba2b/
         arm |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/15600b20e5dc13d00395b7cc62507147eac04439/
         arm |                 rrdtool-1.2.30 | TIM | http://autobuild.buildroot.net/results/a7f00b84dbf7d03ad43a6ab8dffe20f2211b8aab/
      mipsel |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/f124ca3737baf5aca32029226805133d3544715c/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/25ef0abc7bbe68f6b409cbd3c0c0a4f786a4a727/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/f485d00041ac3052314e2a190820877baa445c52/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/0d3b6e11ccffb10a4520e600758dda416ffaa062/


-- 
http://autobuild.buildroot.net
