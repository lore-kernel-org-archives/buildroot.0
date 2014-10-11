From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-10
Message-ID: <20141011063014.808D3101081@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-10
===============================

        success : 177
       failures : 35 
       timeouts : 6  
          TOTAL : 218

Classification of failures by reason
====================================

                elfutils-0.155 | 3 
                    ruby-2.1.3 | 2 
               valgrind-3.10.0 | 2 
                  botan-1.10.8 | 2 
                     rpm-5.2.0 | 2 
make: *** [core-dependencie... | 1 
                libnspr-4.10.7 | 1 
           libmemcached-1.0.18 | 1 
              host-erlang-17.3 | 1 
                       kmod-18 | 1 
             e2fsprogs-1.42.12 | 1 
                       unknown | 1 
                 pixman-0.32.6 | 1 
                 omniorb-4.1.6 | 1 
                   nginx-1.6.2 | 1 
           xapp_bdftopcf-1.0.4 | 1 
                  tstools-1_11 | 1 
               qt5webkit-5.3.2 | 1 
zlog-ca6162be1608839e99c638... | 1 
                  python-2.7.8 | 1 
                 libtpl-v1.6.1 | 1 
                     vlc-2.1.5 | 1 
               alsa-lib-1.0.28 | 1 
           imagemagick-6.8.9-8 | 1 
             alsa-utils-1.0.28 | 1 
              librtlsdr-v0.5.3 | 1 
                 opencv-2.4.10 | 1 
freerdp-440916eae2e07463912... | 1 
                 lvm2-2.02.106 | 1 
                libosip2-3.6.0 | 1 
                 webkit-1.11.5 | 1 
                    flac-1.3.0 | 1 
           dialog-1.2-20140219 | 1 
                 libdrm-2.4.58 | 1 
                 libplist-1.11 | 1 

Detail of failures
===================

        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/453c7bfe7d64321cd62337688f50ea4bf7a66b27/
         sh4 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/e547303e3cc44457918d4f52d38f42fd37d8c130/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/2fffc72f77395e292546c9c33726417252433eec/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/7fc03e909696e2f99c51e60caab2fbd8e2c076bd/
         arm |            dialog-1.2-20140219 | TIM | http://autobuild.buildroot.net/results/3a18d456671b2e9adb902708580d15eb7a978685/
      x86_64 |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/d4009065efff8bcf15cd61230b2d0e776af17eef/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/ec2669842d8694630c3264ab0554a7b19bedc2fb/
      xtensa |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/89ae9f1c546adca819a2d68c4592c8458db53ab3/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/9f4164d6746e865fe1340dfe7dc8c5b39f0543fd/
    mips64el |                     flac-1.3.0 | TIM | http://autobuild.buildroot.net/results/a070fed86d05ddb5b53373238b925edaed154f1f/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/d93a966fc83ccc015b4c7dc55e73b2afb876af30/
        i686 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/d98b362d3da67e4db19e9a938b371d012ebfd2f3/
        i686 |            imagemagick-6.8.9-8 | TIM | http://autobuild.buildroot.net/results/0527032455c83db9be8a58dd70792886501bc265/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/c974693aedcce9bc034d27b27082a52513aa6499/
         arc |                  libdrm-2.4.58 | NOK | http://autobuild.buildroot.net/results/3f3254141a8f04d9065e0ceb8ce569b4a7a1bd5b/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/3d5024487ccac3baf00cc64abd1d2fef3a7795c1/
      mipsel |                 libnspr-4.10.7 | NOK | http://autobuild.buildroot.net/results/cafee4b5f5c62019bed49205512599cce6b122ed/
    mips64el |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/97b5b0bd7ec17dfabe62fc3589d97c37208d5522/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/aa4488a3b1461fa51312045f35508b4f1aed8eaa/
        i486 |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/6ea3c44f278890973348dd41553a723f6141784d/
        mips |                  libtpl-v1.6.1 | TIM | http://autobuild.buildroot.net/results/c04fef2b6771f6da2e39708ccd0f30b855aea933/
         arm |                  lvm2-2.02.106 | TIM | http://autobuild.buildroot.net/results/ece7ad8286ec69160034f4e9f808d467597b8773/
         arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/2a5da5d900e668c947c70ad9f8a95ed63c491d82/
        bfin |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/2240f11fc52e07ff64913844078e2616842a63dc/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/83df64eea0e88df5f21d473d163f7cbd8c160c92/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/fa62e07e19a362536e165492af45c6432cbe57e5/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/62ec1855b068f926fb29f4ad7bfd91ae8cccd75c/
        i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/bef07a6369f4eb18025197eaff5dd3418140c62b/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/b79d27951ba13a1cc12e94ca16c8488b98ef3919/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0cfcb020e2781a4d79911aab05abe19acbf7c172/
        i686 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/9bc256885a26d3777f6c5285330419b6ae595ce8/
microblazeel |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/e0ea72afe0d7ffee3643ccdf1e01a82dcc33eb2c/
      mipsel |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/c9f448d598845a94039369fdc833f90d21ad50a6/
      x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/47b2fe82af2bcf53434022074742604421c26b45/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/ab4445dac6004fc027f4d24cd07a9fb6e8a8992a/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/126f2bc01119fb4f84d5330cedd8c56903e97b8e/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/3b1cbd56f31f6ef1f3875cdefb6573d9b1fc4ec1/
     powerpc |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/8d7ab751df8770a7ac6b3a025b629c573c973969/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/8d1fa3b99fc8e32461b360a23c956e2f85ea0ea4/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/cbdde5cd9f6f066041b7e94ca50360e78626fbdd/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/482c344b86dd9b55ac44d26feae893f25f1ec4cf/


-- 
http://autobuild.buildroot.net
