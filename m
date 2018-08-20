From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-19
Message-ID: <20180820060018.CB0F620DE0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   1 |  16 |
   2018.05.x |  17 |   2 |   0 |  19 |
      master | 190 |  25 |   1 | 216 |
        next |  37 |  25 |   0 |  62 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                         mimic | 1 


Detail of failures
------------------

        or1k |                          mimic | TIM | http://autobuild.buildroot.net/results/8d6c8016b01c8214b69c8a2513113159000f6b8b |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

     glibc-arc-2018.03-release | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

         arc |      glibc-arc-2018.03-release | NOK | http://autobuild.buildroot.net/results/7fad06eee3b9e002f930bb36e494d4901340eb47 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/8ad1896be0d10671f698abde20eec982cae83a12 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 4 
                qt5base-5.11.1 | 4 
                  boost-1.67.0 | 2 
             host-guile-2.0.14 | 2 
              python-pyqt5-5.7 | 2 
                  zeromq-4.2.5 | 2 
                    efl-1.20.7 | 1 
                libmpeg2-0.5.1 | 1 
                linux-firmware | 1 
              lynx-2.8.9dev.16 | 1 
                  mender-1.4.0 | 1 
            micropython-v1.9.3 | 1 
              mjpegtools-2.1.0 | 1 
                   mutt-1.10.1 | 1 
          openpowerlink-V2.7.0 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9159450d3ac9bd20fab7dc701e4619fd32e5522c |     
        i586 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c8c9c9cca7b54c3e99bcd5f14c5fcf7f7f4aa6f9 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/c0c8b03bfcfee3680b7f219f87390d06dbd1d1e7 |     
         arm |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/ccf17d10ca08c20ced88a92db7e90105ed482039 | ORPH
      x86_64 |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/53e2ce4568e0be10cc7f3d4bf199529dd23185bd | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/74ddd77f099815344dcdf89f961f075086f838ba | ORPH
         arm |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/b54863ddc6c0b05ef29af827b225ad2b10b037c2 |     
microblazeel |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/e4c109c28faacd251a46368576ece12fad2f9c36 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/9059c8bdac2450cd2b3f6b027a0e63739895c307 |     
        mips |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/4c1839ce04d62a5e028fc2699ceb0216356610ef |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/e7092881e0bdf50a0167a0d79c62d4faddb359d2 |     
         arm |                    mutt-1.10.1 | NOK | http://autobuild.buildroot.net/results/177da8f4798f69298db5385957184f1c53cca923 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/f1be3be0f3f80fca9fc0a67441355ecc4e149db2 |     
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/d8d1edb132552be6d4288d613a356bfed53225d4 | ORPH
    mips64el |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/c155bf04c0b4466a65f675c3c769c9e1d5b2009c | ORPH
   powerpc64 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/cf5c9738a472329d11f6d4d20e49c65e2d9183a6 | ORPH
       nios2 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/0830373beacbba856a2ec18866a8420887d79de0 | ORPH
        i586 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/140c986bfd91ffe502dad684c967c17c0b3162f5 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/2066b8198c13c4514f7d43230a5ce25edbe69dfe |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/9e27ee5bf27164b0add7f7e874688b82c379845b |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/df46abf31ba746d34333a7c6471f01cb4165af68 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/df9f786a568bcf1d278f01f99f782fa1f3bb4f5f |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/b1936af0e24b5a0559dbddd2bac68ae8f9b94190 |     
         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/7f0627b48a129deb2dc28b70cd9172bea1e8ec6f | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e731c08981fdb2d5314ec6cc207fe44aff0a90ee |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1c06ae2661a04fcef79fceaac0220f99b95d1049 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             host-meson-0.47.1 | 11
            host-lvm2-2.02.180 | 4 
host-python-vcversioner-2.1... | 2 
                       kmod-24 | 2 
              host-cxxtest-4.4 | 1 
                  mender-1.4.0 | 1 
               qt5webkit-5.9.1 | 1 
               target-finalize | 1 
           uboot-tools-2018.07 | 1 
                     vlc-3.0.3 | 1 


Detail of failures
------------------

        or1k |               host-cxxtest-4.4 | NOK | http://autobuild.buildroot.net/results/44e8753dca21713dec18422a2c3db29a87fe5222 |     
         arc |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/99894e76a4ff0c590c7003df5d23acb740b1c5a4 | ORPH
  aarch64_be |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/78cda7a90f042e3a9f631cf49a6ebc20906d93f7 | ORPH
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/31d015871b3bb528ab90c6ccae32f51bb536a46f | ORPH
         arm |             host-lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/75028343dea992e3c53ada0329ae6d8625308dc2 | ORPH
       sparc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/e6378bb90752439ba205f0f6bf8955ef59a8e4f2 |     
        or1k |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/b5c95bd3a6d46cca495a77f0eaedcfa832aef8d4 |     
         arc |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/4425ef592f6538c7a22c7c906953a59b6bb73315 |     
        i686 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/9b510e5d7b644bc9c9281cb279d5a4aa10b8d743 |     
 powerpc64le |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/904d135397443fa8f694cf2d32a798818c34f141 |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/eb9de0b7e3ef625adaa4632cfa1b2e16222f15d0 |     
      x86_64 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/76d62f20292bf2c8a004e125e34b83b020a121d2 |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/8368459a0f4bd41209177a1ef372a11cbacdc2cf |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/699d6154b6ff7c4d57f0f12ef25c8881d99a991d |     
         arm |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/17ea65d4954fc6c12c811d73265c913ec6ecd913 |     
         sh4 |              host-meson-0.47.1 | NOK | http://autobuild.buildroot.net/results/99eb91573e74a39d395212f2c470ce55d0412ec0 |     
         arm | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/2653d65d3a2b78b4e19dc213b41a2a4f0436d817 |     
         sh4 | host-python-vcversioner-2.1... | NOK | http://autobuild.buildroot.net/results/94474cf3541b5c9cfdc261702f02160d1215eb9f |     
        or1k |                        kmod-24 | NOK | http://autobuild.buildroot.net/results/b392ee5e62b63c156413ca894227e3efb60e6c80 |     
 powerpc64le |                        kmod-24 | NOK | http://autobuild.buildroot.net/results/5914d32f7a11faf0148eceab7ed852f67357b0b5 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d7dccc968493066c343abfb81acb35cd52cfaa05 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/18d3d0b50a50b8f0ce8913f23e6239f5fe4ac2ba |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/b47e3c1fd9f1e2f2f1e747add6c66cddd28563f6 |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/84b92f39e7fdf143a0a037404cb8965aa1ed63f3 |     
      x86_64 |                      vlc-3.0.3 | NOK | http://autobuild.buildroot.net/results/9764856c4ee5785ebaeb2ccdfeb7292330b0f8db |     


-- 
http://autobuild.buildroot.net
