From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 08:28:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-28
Message-ID: <20170329062829.5862020C8D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-28
================================

      successes : 156
       failures : 36 
       timeouts : 0  
          TOTAL : 192

Classification of failures by reason
====================================

           uboot-tools-2017.03 | 5 
            xenomai-legal-info | 5 
                    sdl2-2.0.5 | 3 
                poppler-0.53.0 | 2 
               sdl_sound-1.0.3 | 2 
             bluez5_utils-5.44 | 1 
             bluez_utils-4.101 | 1 
                    gdb-7.11.1 | 1 
      gst1-plugins-good-1.10.4 | 1 
              host-sam-ba-2.16 | 1 
                libepoxy-1.4.1 | 1 
                  ntp-4.2.8p10 | 1 
openblas-f04af36ad0e85b64f1... | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.3 | 1 
                      qt-4.8.7 | 1 
          qt5declarative-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.5 | 1 
                   systemd-233 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
               upmpdcli-1.2.12 | 1 
                 xenomai-3.0.3 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

      mipsel |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/bb60e088cb7c718bbc813021d083fe19ae91fbf5 |     
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/fa2816d951c7f62605b8201acd5c80dbb04e7f5c |     
         arm |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/0c84acd39d75e36da81ae8f196e2bbddfc7e0cdd | ORPH
    mips64el |       gst1-plugins-good-1.10.4 | NOK | http://autobuild.buildroot.net/results/2fa2d08eda0adff7cccbf97446113d8ce03d6455 |     
        mips |               host-sam-ba-2.16 | NOK | http://autobuild.buildroot.net/results/36a239dec6f2658f92b424b5771854063dc1a79e |     
      xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/e05c6d6c750012fdf9d6ae25bf658d7afb94e147 |     
      mipsel |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/ee4524dac1eb7de1c860537bced8a59a495d2ba2 | ORPH
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/8189a33f93b7e3be54acb78ec0365cd00d4cca6e |     
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/faa24367b34fe969e66c8013fc2555711657e16f | ORPH
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/2e226befe726cf7fea8a7bae2f09d7ba7057e573 | ORPH
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/b6f2bd0be6e40c5e404f892c087823dd0477d4ac |     
         arm |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/bf517ce0d38ce8baa9baad4bfc3dd2d837810cfb |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c23174484c4ce738464978af4319b929863bc04a | ORPH
         arm |           qt5declarative-5.8.0 | NOK | http://autobuild.buildroot.net/results/19c3f2f495fe600ce14bb0c5702ead1cb2a6675c |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/cc0e2c385664226c2e43740571daf59ccf9804c6 |     
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/d61fd804bd851dd39240c1862f2f6302e2d8cfdb |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/ce3c244ca49ce80f3a5475c6a3237e9c48a3b5ef |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/1442d8b3d966e3dd3dd6497ef53442223979e6a1 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/2da8dbf9eb831de751f82c9d2951820af1932c99 |     
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/eb06e21907d83c34e72b89360f40bade6bccbe72 | ORPH
 powerpc64le |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/ae5839b978244c434dd86d49b672c437a7b19a66 | ORPH
      x86_64 |                    systemd-233 | NOK | http://autobuild.buildroot.net/results/48ecf31eca9b22339a770abd3f9abdf1ae41cfd3 |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/d91550f1bc0629b216c1dc1f53a32fe46d905078 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/40a167f3b882a627c8ce9aff168f9f8026eada50 | ORPH
microblazeel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4be3462900cffe8e678a5875b479da355d03d955 | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/7f08f8dd0e465a624ea535caed178294a2675754 | ORPH
        or1k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6b6bbf3c72bb6ee913ace74910be4a358255cf23 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/5d6abe7c5eeb9be631ab9645d04bfe1dd2c94353 |     
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/67ef92a7a36c9136b8f652332641ccfc609765e2 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/bade08a296b15117969020115d0eca2914bf84cb |     
        i686 |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/7e1b1ac2481d88f68d22b3b1b44b74efac179dc4 |     
     powerpc |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/ea1cd483ca520a4f1511d154f66dd31b0b800afe |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/1da9c6ce8cea27f1cb8d49bb5cc67832ae85fd85 |     
         arm |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/e23a53c96c07afeb5e0289733d77bed54119f503 |     
        i686 |             xenomai-legal-info | NOK | http://autobuild.buildroot.net/results/36271406eb57e161ecc7795af0c03e50898b532a |     
       nios2 |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/47ab858c597616fb957e43c429fe11679eba5768 | ORPH

-- 
http://autobuild.buildroot.net
