From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jul 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-04
Message-ID: <20130705063008.1F1F952C168@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-04
===============================

        success : 102
       failures : 75 
       timeouts : 0  
          TOTAL : 177

Classification of failures by reason
====================================

                classpath-0.98 | 11
               libglib2-2.36.3 | 8 
                   dbus-1.4.26 | 4 
                       kmod-14 | 3 
                    acl-2.2.52 | 3 
                 libffi-3.0.13 | 3 
                pciutils-3.2.0 | 3 
               libgtk2-2.24.18 | 3 
              host-elf2flt-cvs | 3 
             iptables-1.4.19.1 | 2 
                openssl-1.0.1e | 2 
      gst-plugins-good-0.10.31 | 2 
               uclibc-snapshot | 2 
               alsa-lib-1.0.26 | 2 
             gdk-pixbuf-2.28.1 | 1 
               sconeserver-212 | 1 
               bind-9.6-ESV-R8 | 1 
          host-protobuf-c-0.15 | 1 
                sdl_ttf-2.0.11 | 1 
                 libpfm4-4.3.0 | 1 
                     m4-1.4.16 | 1 
                 libnspr-4.9.6 | 1 
                 nodejs-0.8.22 | 1 
                  prboom-2.5.0 | 1 
                cegui06-0.6.2b | 1 
               uclibc-0.9.33.2 | 1 
                 qt5base-5.0.2 | 1 
               audiofile-0.3.6 | 1 
          host-gcc-final-4.7.3 | 1 
         matchbox-keyboard-0.1 | 1 
               czmq-cb9839cf90 | 1 
                libtirpc-0.2.2 | 1 
                      pv-1.4.6 | 1 
                  fbterm-1.7.0 | 1 
                  libxcb-1.8.1 | 1 
                      icu-51.2 | 1 
             lttng-tools-2.2.0 | 1 
                 cairo-1.12.10 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/bae2d876553f4c55a6b87e85d1b384b1e629e75e/
   aarch64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/9c307c2a1312ff1355af4e5434ca1c9a299ce1f6/
       sh4 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/83d49e922da308b9f687eafcd2fa5139217c7f98/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1fa9baab3755a110a270196df7fc316d067b1b36/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/49c1fc0dd0fcee0b480b6c03cc7ae2b35739a1c6/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/441a12fdfb16fa7e976dba7b0cc50cace04edbc1/
  mips64el |                bind-9.6-ESV-R8 | NOK | http://autobuild.buildroot.net/results/107b0523ed5dbf34486181caaee0149d59ea56fc/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e875b4de52ca992f250d6eae7b746b760c938bfc/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/431947fcfc3d3c48765bc76e276e88e418f41f1c/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/b047ae011f4cbb9b669b30d6679e30d5d04655cc/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3edef9b4105c691df286641146726505b880bd9b/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/ea32eee809c9bd971760149e789f052b5f233928/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/8497648c0b21390782eecc5b4aa91281bcf58ad6/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/679924869bc728c5b92590debb5d6de4f6148d24/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/21f62e84247d4594c83cc9cb908545cd530917b8/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/2bd39ffa821bc02d64998bc9e8fe178d3741a1d8/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a115f3dcb01ba86e5052d7f44b3cf3e0698d6e0e/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/9d050fd0781ba9fce391549e4bbfbc1dd96d1cba/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/e3be6d6e7b0ed3e761662ca1cba5c8ecc787cbdd/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/98fc03df2e041c1b1d29a7c9bdcbab5e6ebc3468/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/79292e97d32d743dcf059812c73a5514853efe2b/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/45ca854463d4b489011d7c7488903faccf60b95c/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/9b7b82c50b22d0bd76d2d004b83c0c7c05485141/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/6baf7812cb444ac2451edffbba4bb2458f1d6209/
  mips64el |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/ebbffa747f0548c4eb363f922f64667f3e3a8a18/
       arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/a458f624fe1ae023a79e14ad9efb208981f4b0a5/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/455469281158121444ac3d905ca36e15dfd21f0a/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/85f909c0f97f6addc0a8430a92b40d1870c9e1d6/
   powerpc |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/efebcc0ce3112ffd6c69a9db5ca8e88e58612ebd/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/0b0d2eacfff4d81e98b9ae2daebc3527957cec49/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/5e674e3085d69dc0618b94ae5be33b9419021a02/
       arm |               host-elf2flt-cvs | NOK | http://autobuild.buildroot.net/results/737be6be84e63a076ad5a2fd43f94ae24275bd7d/
   powerpc |           host-gcc-final-4.7.3 | NOK | http://autobuild.buildroot.net/results/0dc32f07273cbeee97010bc3f5c4ea0cc7b5c18e/
      sh4a |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/10cc534d138b7c61a3fc3679491174df2502769e/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6976cdee0d9fd5ef9a11ca76c3b7b07df6668038/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/773e6b35fa5608d178228cd699ae0d15f067ff44/
       arm |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/b657fac13b67de44d5bfa6eaf75384de8860208d/
      i686 |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/7844af3651015102685a9e39f8398bf7fb7ab77d/
   powerpc |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/a50b815c800b1b08c5c7d2cddd8dd9fd8f418c25/
      i686 |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/c5ac8b7b608c3a00c4ddd37ecabbfcf106f1750d/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/15e741a8382bb489db3e5c4d75048fa29d54e2ac/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/71047b9349e447ab24c7a71fc0c96a4d236cbcd2/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8f0b588e3fcbe127a451a5ba0971b85dfc69ec4b/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d37c83bd39141d386e406db0c52f614d0e575c60/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2b1292f41b2f92a75da3ed1e39c594e97dfac5fb/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8a31c6e4e18cc281db1ca56a0e1be6dc152f5a9d/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/824edd22742fd7b73354bf9bb6ba70e95cb3c3e5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9db447433d8e74a8db6808da6f8748c52b48a7cf/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4f682049b642f6c657625ce4de7b4bbf39ab4e16/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1318c0e03d9ebc2791603891c84b678885a8e7c3/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/26f883d6981bdfdfcda32d9482f53e153afb2283/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/af2a3d7425553616c5a84039867412c0e769a275/
      i686 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/7a39e060be4f0aebee43837f264a01fb2c79c7e4/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/22696c72c7d106aae009fca7b1c1bd9741ec2aa1/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0b6832119265cd1ec9722144d0979a9bfb44fe32/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/4f82156dacf79b838620829c0e9ce32b5f2c405d/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/85959199ec6765ad4fb0627ac88c9fea77725aca/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/16ee75702a5dec35902d1c93193119c65fb28c30/
   powerpc |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/69ce6a230abae2737fff52eebe3eab42feb2c254/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f5968ba7941f2aa12d207dc6a6844b0cc23ff3b0/
       arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/ff2d51bec6907bf0ee265ffb4ea7237e50c7d701/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/ba5483a0fd8050b65b0f69886c469b734e11d3c5/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/0253fd20d93f9b6dd9fc10d1d67ed92543884a5f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8f5a44626465b351ba1436639f0b5713870830b2/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/283d6f6760207ccab28315a8d09970e37fd03102/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/6c3949e273b76646ab364aa617d07a4f28ab7cee/
      i686 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/ffecc4c4d9cb130d76cc37bf7f158b0cb6f0f954/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/8e8275f743293159918c6fc15964224d8d943382/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/15a05a07ca67056afcbee5cea6752f4d8443f0e5/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/2a6a1bef7b2a468e273babe88e209cda7b712e90/
     avr32 |                sconeserver-212 | NOK | http://autobuild.buildroot.net/results/4b430f6a819218f991e79d401217c0ec7b306ef8/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/ca02eac92b78cf4f2d73916931da480688d93372/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/7a45fb1379307a788047ec859a4ce2c42d6eb077/
    xtensa |                uclibc-snapshot | NOK | http://autobuild.buildroot.net/results/b021b296309d01405ad45344055863a5761abd70/
    xtensa |                uclibc-snapshot | NOK | http://autobuild.buildroot.net/results/48cfe350310a451e53ecdd2245c6adb4d91a17a3/


-- 
http://autobuild.buildroot.net
