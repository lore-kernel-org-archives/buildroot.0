From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-19
Message-ID: <20140920063014.26C27101696@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-19
===============================

        success : 225
       failures : 44 
       timeouts : 1  
          TOTAL : 270

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 6 
             e2fsprogs-1.42.12 | 5 
     openvmtools-9.4.6-1770165 | 4 
                  thrift-0.9.1 | 3 
                keyutils-1.5.5 | 2 
                    ruby-2.1.2 | 2 
                  zeromq-4.0.4 | 2 
                      qt-4.8.6 | 2 
                      gd-2.1.0 | 1 
                minidlna-1.1.4 | 1 
make: *** wait: No child pr... | 1 
           libmemcached-1.0.18 | 1 
                 omniorb-4.1.6 | 1 
                 libraw-0.13.4 | 1 
                    orc-0.4.22 | 1 
                  tstools-1_11 | 1 
              uemacs-4.0.15-lt | 1 
                  cppcms-1.0.4 | 1 
                    ola-0.8.33 | 1 
                     eudev-1.9 | 1 
                  opencv-2.4.8 | 1 
                  ndisc6-1.0.2 | 1 
                 lcdproc-0.5.7 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                busybox-1.22.1 | 1 
               iprutils-2.3.15 | 1 
               libsigsegv-2.10 | 1 

Detail of failures
===================

         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/ab47e47d2718a159cd82c60d1f9c731b3e0bf6bc/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/005fe2700ff13c6ad905404e384edddd0a6b64f0/
      xtensa |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/91334f9763621a3fdc185e0f7ca2a11753ff72ef/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/e6e7fbb6d5e7e8a7fd2dcc7a4e0d50ea62d37cdd/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/e7519635bf0b33798a3e87ad7020371220c88ef8/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/6a49bc6c9a7a1d83a958ab2db2b9d781dee90537/
    mips64el |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/12e61442b9b1e9269cb27d96ae1834aee57df9c1/
       nios2 |                      eudev-1.9 | NOK | http://autobuild.buildroot.net/results/c35f348dbce6a84285d3f41201f3319c09358d18/
     powerpc |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/9c5545c764e3a2fa929ea27c2d9e560bfd743076/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/4dd53b37fc8fae127043c68948844507782d6035/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/a566d7f6cc4bb2fadda49464fbecc58462054662/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/7497b2b6f44e4347fba5c5ad99f075dd0d6d0394/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/0798a804bc42f2f7ef6957358a87af86ba28535f/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/3831eab224a5e6e7cf3fc6886c8c360fbac5915f/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/92af55396670685f12ed0ebcddfe2d082ed5aeb7/
      mipsel |                iprutils-2.3.15 | NOK | http://autobuild.buildroot.net/results/7a3e3dc469007cba41a69c126275d72f4e1a5592/
         arm |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/b987af9c71fbee4e61a373ef1e67545ad84bf5ef/
         arm |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/1ac8b4ab347ee77d5780955ab2f9ed56885921bd/
         arc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/10bd9456e21d5cfbe8924457515afe0312ed3646/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9e28f6ff2782818433dccf304d46c777004a6910/
        i686 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/6f0526c54cf70c9229515ad69e7402868405bc89/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/bea12a5a22ae0a22c3d92b2f1e4d2b7f8bbc4b48/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/4f4c34d1f81d6ecde5b76dd7e5277e098fca6524/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/f49de32521305c3712c6c833429fac26a160a511/
         arc |                   ndisc6-1.0.2 | NOK | http://autobuild.buildroot.net/results/dbba85ffba244ee06d287708bb5316cf93388832/
        i686 |                     ola-0.8.33 | NOK | http://autobuild.buildroot.net/results/a5ad79203adf9745d689d07e72fbd309a3aa0042/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/422aab89d524c4520c71c0a36c6a2964c8470089/
         arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/34e8ac8030a0e5aaae862b6d4bbf20f0037f2e2f/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/eed23aff28ea2c57b74a37f94d2ff074d83fc079/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/af349bd1cebe94aee2d618d5398fa911d23067e0/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/832191d58a8640059ad5fe6cfa699649522137ac/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/63dc8f03978e6fbcde669c70b679b9318a4b0c3b/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/bdaa36f2855843bb5e97e5a6165c6d5301dc2626/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/49faf43b24cd1f2bf0ee6f8e5d5c085da407975e/
       nios2 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/1547bdb2b6c12c64f3fc3d70e00e4a6c6a516cb4/
        bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/108c16b595c4e632160b0a5cc495255fe516711f/
        bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/38bc94a6d4c830eb05d96f65fa6949314d7bb10d/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/a59e5d430c518a49d879c37465b97669207a6fe6/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f1cfcd350d0efe43d7fed3c27932515a840e1fa7/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/66e718278c6d677fd2db776b1dc1930ea260b7c5/
        sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/865b5850272e51efb0be362d618958f352c62a16/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/a4e82b4e23ed1db5ac75f6532511998a8ef988b7/
         arc |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/8535c56f703fe7021a1e6e30f7c18ef9983417c4/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/5603a548b5566122f4b1eb3976646edf0e840151/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/83e1e5e0beca57e41f11b6ee08cfb9a896518d0e/


-- 
http://autobuild.buildroot.net
