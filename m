From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-16
Message-ID: <20130717063009.26C2552C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-16
===============================

        success : 108
       failures : 52 
       timeouts : 0  
          TOTAL : 160

Classification of failures by reason
====================================

                 libffi-3.0.13 | 7 
make: *** [/home/test/test/... | 4 
                  zeromq-3.2.3 | 2 
                      bash-4.2 | 2 
               alsa-lib-1.0.26 | 2 
               libglib2-2.36.3 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 qt5base-5.0.2 | 2 
make: *** [/home/test/test/... | 2 
               pcsc-lite-1.8.6 | 2 
                      pv-1.4.6 | 2 
           imagemagick-6.8.6-2 | 2 
                pciutils-3.2.0 | 1 
                  bcusdk-0.0.5 | 1 
                  ne10-88c18f0 | 1 
                       kmod-14 | 1 
              fontconfig-2.6.0 | 1 
                 libevas-1.7.7 | 1 
               binutils-2.21.1 | 1 
                  libv4l-0.8.9 | 1 
                  boost-1.53.0 | 1 
               erlang-R15B03-1 | 1 
               libsigsegv-2.10 | 1 
                log4cxx-0.10.0 | 1 
                  prboom-2.5.0 | 1 
                    php-5.3.27 | 1 
                directfb-1.6.3 | 1 
                  aespipe-2.4c | 1 
                  libqmi-1.4.0 | 1 
               qt5webkit-5.0.2 | 1 
          host-protobuf-c-0.15 | 1 
                  connman-1.12 | 1 
                     gdb-7.5.1 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/87a8622fe3255ccb1259c7ebeeb333ca105c357f/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/544f86114e1dae95daec1f1e37b95f8eca1a122d/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0dbaa13af0080cd6326ff0c0df0cee265ce248c1/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/dc02f3f4742f5b039ccf41633ff32d42b51cc2ec/
      mips |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/2b12868f8297a96d7abf7fcf526ca5eace73d66d/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/51e955992ffe5c80006b2b06af0ee67e54f02635/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/e6994e4b0bbe3c9474f8d3a048803aa446bcf219/
       arm |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/0581fc77c0f5a7707bd5bb399e200eaf9be5a977/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/068566dca22ce00139c0d5ef3a50d0e4cbf26df6/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/086f18a2684d61e60c045ceb15e5d55b14d30dad/
microblaze |                erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/6c8433cec580a621f08ccbfbcd2cab86b0590a4b/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/d3f82b694f53e9211ab0d0c5f176101ac3fa1a5f/
    x86_64 |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/6267acb95e1b87f8f34649ef2f15ef016307a20d/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/b98655e1012984c05bdb3623a1a843da451e00eb/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/43d61d14fcb6d286d738980391d8a30062a67929/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/1b01335293cdfd40a69ad31d5bf82665dc14b9e0/
   powerpc |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/5e0ada5bfb2ba6380cd5dac3459986bc7f92dda5/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/9b6321e88339517501c992a32ba7db45f0670d4c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/37888cf57684c57fb0678aba66d2ba8299cfdf60/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/71b74acf1032c6e925e84cb9e0c400b3376405f3/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a94e22d383ac364616b7fd2212b13726b6fd8a42/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ff0a800fe3c091a3d69435536744b5a31d5038e9/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a33a396dd74f6fb3c2500de123d2bc74d791376a/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/22952c1c7a9829cbb0cf30011ac91336f18db4ab/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b9c2c11c5fcbedd5ad7cf581ea10068294745cf8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/68240bef657c4c9f87d395b885e566069920b0ce/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b5c86be27bba00d82f8c48cb50c301f734a626fe/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/6ecfbacbc6079bf7262cc34fdb0321c5096802f8/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3633eda58d9f004b3d2a728b7fece5a817560a5a/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/b0411639129ef78cb3a5ad7b8bc8845b4147d7ed/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/6f5f61a01812d1fcb54181fd6f36bca623f26a72/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/264b8ccd8a0884eca35ba28b7868849588bc60fd/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/4c77315ec8cca138024e72136a5520c50b75b559/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/70f400c9117a5865009845d60f268d7fbf5bcd20/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/f856aca2f7fb8e5b30f3b2dcac26607ce39c3177/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/03591eec64ec48d20b2d7b5885e6675a2857f615/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/65186910259f6abbee13f6145b059b9cf7058f6b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0d735486b320e0c5d38ee975bf2c2fb71e57ea68/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/1d1b2659136adc1e1b69f7fe87eeb919487a7eb8/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/c8bc2c179b21b3cf76c6b73943a91ceae31fe3ce/
   powerpc |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/281afe79aa817bde807a56931585eae5c8643e5f/
   aarch64 |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/5e85df2592953015894add4ab4d3a5aff12259c0/
       arm |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/a34655c459c8acba15a71d832db079f92d96fd92/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/e4b40f5c1fdaf02d8b964c302f51937a7682ce1e/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/3512329b5d134b17e5b773e4a4c81a4b2365d8e7/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/e1a1732bd044edf7cf17c9a552a7bd2aebf8b48b/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/8279a0ff315f14102d8edba25f524c1514ba6e15/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/09df92bc81b2f8a1a006a21bbe38a1e8da5246a5/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b22b0b6edbf23150ef121e18120d8bb669b0c09a/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/8b93ae6755f3a8e783684a89abff7b810d7b59e0/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/a0db0cdcd25b78126738eb63d30cb1c7ccc05d2d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/15cad68e1a77b3ffa0609e4ffc69413ba2fe891d/


-- 
http://autobuild.buildroot.net
