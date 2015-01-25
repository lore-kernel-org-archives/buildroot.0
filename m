From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-24
Message-ID: <20150125073015.49B3C1013EF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-24
===============================

        success : 261
       failures : 45 
       timeouts : 0  
          TOTAL : 306

Classification of failures by reason
====================================

              host-erlang-17.4 | 8 
                   mono-3.12.0 | 7 
               lightning-2.0.5 | 4 
          sane-backends-1.0.22 | 2 
               host-qemu-2.1.2 | 2 
                  zeromq-4.0.5 | 2 
             libselinux-2.1.13 | 2 
                   eudev-2.1.1 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                      qt-4.8.6 | 1 
  toolchain-external-undefined | 1 
                 libnss-3.17.3 | 1 
                 gnuplot-4.6.6 | 1 
                  thrift-0.9.2 | 1 
                    qemu-2.1.2 | 1 
                    mpd-0.19.8 | 1 
                gptfdisk-0.8.6 | 1 
               qt5webkit-5.3.2 | 1 
             fxload-2008_10_13 | 1 
                libsrtp-v1.5.0 | 1 
        gst1-plugins-bad-1.4.5 | 1 
           libmemcached-1.0.18 | 1 
                 openocd-0.8.0 | 1 

Detail of failures
===================

         sh4 |                    eudev-2.1.1 | NOK | http://autobuild.buildroot.net/results/1abc0ccbb2d0933fdff6f9314b9b1fd0146cff21/
         arm |                    eudev-2.1.1 | NOK | http://autobuild.buildroot.net/results/e552e9c84bd74cdc46d6ecde67a9dec6cbc80377/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/00a540397d6edffb92484af503ed4b20f9cb3305/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d183f7ae90baa43e2ea2eeb183a17b7349836c40/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/500527e810fb55044173a0363ce01f371b161e4d/
    mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/3b455db77cf93ee901cb0747f51206b0588b21dc/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/059fce25377dbd44873ad184a5399fea6520851c/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8e8d326c590f9b10ef6e313539533fc26f41ab72/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/bf8bc11678cee13137406ba6a7a587fced67ab67/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/654874031cdaf6d1f26a23aba3d292c9880ef3be/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/134807558722cb798e43e12e94f48e30430d5053/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/99665fcbf6d78c944dba96f36949ab9113308941/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f7cc95b94ea3cb22ef7e15cd8de535eec2fc2943/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d7c594a9ffe814de0018613951efcadc11f349b5/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0209f53ad3bacc913ea38af7c3190907db8062cb/
    mips64el |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0957c111cb9078602d0d95e1f4ada193b2c1bf58/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8c7160af035a83a3657839595931ac9289688100/
      x86_64 |                  libnss-3.17.3 | NOK | http://autobuild.buildroot.net/results/b89970395e2758ab1759086181445076007a0974/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/9e25e908d100886ad0c0a108000c7a283c2e350b/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/af38d7a4199372f49f1e22504fbbfc321d7234ed/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/0db2df30ffc7251b38721abfc7e4385e7fff56bb/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/f0d1f4a6cc7f4b4fda9e0fa46abf257689b61d90/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/24520e569391935a1d1b105df1f1db9be9931e1c/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/ea9cbd7e99302a74e6ef3f3bc7915112a9a858e8/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/ffd5a932abe671a838992c0200731b55240dbe83/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4d8c9b6724e0dcedda5475b3eb3fdf29f8a52fdd/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9a6db398bdae9bb454dcb1cb07f3894e6c59fe7d/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a27458e2d55e3c9fd6565850b0e2f394266bfd85/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/73d2f58dbb9a0dc115957b65e9b8bcffab751458/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/64be993d5a0160ca0c244ff5d5d43b91d0fae87c/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/86495adec2676b0e8267f5bfba2e23921066fd9b/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/925b6aff50662ee24325f1dc749e9aae6d81559a/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/12649fe833833d483962667e90a1d9e84138b86c/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/44c5b57da96832aa6f9be3286dacd24c1005a927/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9f6ce72a9831b13c31340325d190ca86341276df/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/546b4b23a014a3e806a74ca84383f24ef806cf89/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/f6f891b3c3c2259eba35ea9fbcb5960ce5e47be5/
    mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/cf77fa21149c69b6105daf540809de53464390c7/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/c26a4a1cc46fa4266cb5da69819a15a7fe5e9874/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/9a8268e7c7fe626b871f613609b2ed8d1c9e87b8/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5cfea3ec7bbf26b7092415348f6136731d8a103f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8526f1cb36f6f76f68cca8d063a68f259c4c7428/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/bc7e2c595cafb549cfe083cd7f3110bfa705269f/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/5bd9ee763eeda46a8df393380fcd16f177fb84bb/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/07adfd8d0a26eb79c779a665e79243d6dc494b93/


-- 
http://autobuild.buildroot.net
