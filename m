From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-24
Message-ID: <20141225073016.187EC101423@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-24
===============================

        success : 318
       failures : 81 
       timeouts : 2  
          TOTAL : 401

Classification of failures by reason
====================================

f2fs-tools-baac4b4e6f41ceb0... | 27
                  guile-2.0.11 | 11
             libxmlrpc-1.25.26 | 7 
                      qt-4.8.6 | 3 
                gptfdisk-0.8.6 | 3 
                    libcgi-1.0 | 3 
               ipmitool-1.8.14 | 2 
             bluez5_utils-5.25 | 2 
                     rpm-5.2.0 | 2 
             smartmontools-6.3 | 2 
                  sispmctl-3.1 | 2 
                  perl-gd-2.53 | 2 
           heirloom-mailx-12.5 | 1 
                oprofile-1.0.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                    fltk-1.3.2 | 1 
                     ntp-4.2.8 | 1 
                poppler-0.24.4 | 1 
       opentyrian-2.1.20130907 | 1 
                xapp_xfs-1.1.4 | 1 
                 gnuplot-4.6.6 | 1 
                 webkit-1.11.5 | 1 
                  thrift-0.9.2 | 1 
  toolchain-external-undefined | 1 
                   erlang-17.4 | 1 
                    ruby-2.1.5 | 1 
                  zeromq-4.0.5 | 1 
           python-pyzmq-14.3.1 | 1 
           libmemcached-1.0.18 | 1 

Detail of failures
===================

      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/f96c4bf7716f18c6dd297c3f915f27b64aca5e24/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/16c0532f98b284a2a2f4812a3bb843e15670cb48/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8ec82b35fb0715662f1f76fcc727d478155d4469/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/e36f00b4906e5889083b117c573e3639b2f0eaea/
        i686 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/c963243621ec42edf01dc6baafe9617871716da4/
         arc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/01a204a9a7efc0d5b809a493086f2183359b0876/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/fd1c6e41ff00ed485ff782bfb8f8d0b9b63818db/
        i686 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/4a85170a206a7ed28200e4a188318e2a59c654e2/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/13974cf280a3b8b9d638b5f32ec69e303ed109d1/
      xtensa | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/1f74f571d1be06a793c8968334b1f05bde52a43e/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/c4bff09186d91beba3ff20f72117cc2cb1712ed4/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/2dee716e6322ba6c600f5cb8615bef6157ddf760/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/ea61c8500ef8b0e85a4616e1f6cfa7452df8f331/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/0df7e43cb88733f630d87ba98e9e855be8af0162/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/b7ef39d69d50b8d4ff7d2cbceeef0d1f05f43d7d/
         arc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/2529a82d870b2867b8ccc41a16b0bb04df3eb181/
        bfin | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/c896ba6eaeedbaf699a6f414b996db4987a822b4/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/b6efa0b3be0d9bcf8a38062d075fbc9debe22f5d/
         arc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/f19d055a471df87f99430b02027b266472c3a22f/
        i686 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/fce57776bb68a94a6d5dcbde1b025b4af095c6be/
      x86_64 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/cccda49fccff3dd34267b61eff6838550ed08c25/
        i686 | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/a18ba0c092abd56e535d779aed0a128a85331844/
      mipsel | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/e70dc8f67a7c210d69c0ef5a40295489a50260f0/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/fa113bb68d3ab45d1a69fcd4bfc007a514d62caa/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/8eefc2c30574952e24e6f32f4c24cd86d1d968c9/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/f16cdea36f86447c2e1d8fe98214240230f08e7f/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/33cd262022defdf4ce541f45ed62901ddb626bcd/
     powerpc | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/16eaa58c5ee37854bbf31d31d1ce0f7c3cd807ef/
        bfin | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/045ab4b338e5dd6edb48fc7dece6ac1615d0f351/
         arm | f2fs-tools-baac4b4e6f41ceb0... | NOK | http://autobuild.buildroot.net/results/df5e495e4c24006ccaa08f6b57de99211824c7f1/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/96d254438be93fdf1f738342fad17e3e1ad12392/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/0f0600090988a07b0b6b4b5c39c9035153daf913/
       nios2 |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f818517339da5c0e99c054eb8064cb98f3209ff6/
     powerpc |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/7538060076f683b1ef32c8576c92340085c190c4/
     powerpc |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/66e86dbe7dbf5cfdd6f08e23458e4768b6b6a168/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e37d0454f4f90143088dc5fd7671dedc933a6fad/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4d61a70e4afdac5f2207edd80d89d6fe16a6d95e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a053aa48a81571485859e9be07f2e4d8b9ba8614/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5b0e214fbda8bf87abc02935f9820d9a3e19cd70/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/488d7589af99bb633ae5aa9c38047dae93ae87cd/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/793d6e34cb49a115a5e9e9573a91ceffbecad6ef/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ce53e018026e0754d95b64e210702f8768d13d6d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bc5ba0c1217be6c9db5251ea98789f71873e0278/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/aac55734574e6bb25fe25e906d8a5965b64cf83b/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8abf62d5301735373f7026a59a55caf0f084b2eb/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/49b5c7fb770e6a89132850e8741c3b6f50ca70c6/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/f09508741874bc40ea77557d3c19e32eaea82b01/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/877b237f77c32cb5cc3c4bb1629f5af608bd9ca3/
      x86_64 |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/d6fdf7e752fb571e18fb3f3cf0f8f0cbbfdd22b4/
        bfin |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/d51b3ec609e88f74c1c0b5e84fe5da54e873abae/
    mips64el |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/d1df0c76f581a81566c52b97ed0150e2274a3ba5/
         arm |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/5137964ec6e9619bb27e7bb3c3219f144487c52f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2033335b4b7a1ca8a96dfd612a5ee74b0e004884/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/4a8e69d6d1b92542288542162eb0cd7ba7b08ae0/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5ee3b158e310d8884fc1329a06cf5ecbe4d38fbe/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2b69bb75ffe091ef11a1f1fb2c7eda903af5216a/
        sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d4dc6ded0e2cd1b52617c70b884e7f602b03b17e/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6e5e3d1e3eae3203bfdeda869c354dc59c4064ff/
      xtensa |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/ec04c8ba88556c2d15ecc2e4bb25541f4ca3c0cf/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/fd1753411a8c27a09571dedca13ab1558809dcaa/
         arm |                      ntp-4.2.8 | NOK | http://autobuild.buildroot.net/results/9c4757e7b42694371af5e226ae13bcf77a1d8fbb/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/f8d8010867abd908f200e2451ca47035e30527da/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/2ca958c8bb679181473c405abae863d895597bd4/
microblazeel |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/f304422cbf07f092cce237adfd726df29cd59c57/
     aarch64 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/40ca0e09573a675c5fa26bcb785969a561222013/
        sh4a |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/3e5bb019a1448a751dbb12fe26a4327541afcb80/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/5e50173bb99d8783d440da103fdc0e40178f40c6/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7e294efffb9d18288334736b8aeddc238252f40b/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/1a46268fbb58c0a3289d71374c9d839e6977c800/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/4de547c5f170d961b0b995b0d7658c43030dbee3/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b98af97c5ca9d09f1be52a1ecaf4dd4ddf2295c7/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0999802fb482793aae80486e96254976cd50e6b8/
         arm |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/5bcbeeea1a79cd9c181d271a57be76918141d873/
    mips64el |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/0ba32039e5f7d14d34413df92bea1de7d15a7925/
microblazeel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/9c2a8f5294a951119b3b8cff083ca55f5a71adb5/
     powerpc |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/5098c4fd5e7f01aee6f7ba485ee55de52ede1b4e/
         arc |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/c90b27c9043b7894ab545b7d6d12e9f339bee391/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/2259fbd4c5309830c3be198548c1f82f92c11320/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d3ff4ae18863fdf12623d9c393848d4ad0e3e7a8/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/a05df8aad3b0a32aa6e08c82a20fd7043927f336/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/c097bb33a30950a15604696e3f99fdc551a3c115/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ecc97ad6c8b146fb83923a792d07b63c451cd032/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c9d472f6c23c69f8519c5094805b8dd1ff4054a9/


-- 
http://autobuild.buildroot.net
