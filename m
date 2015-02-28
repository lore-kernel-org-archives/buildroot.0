From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-27
Message-ID: <20150228073016.83B1910103D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-27
===============================

        success : 275
       failures : 20 
       timeouts : 5  
          TOTAL : 300

Classification of failures by reason
====================================

               host-qemu-2.1.2 | 2 
               ding-libs-0_4_0 | 2 
                  thrift-0.9.2 | 2 
                  zeromq-4.0.5 | 2 
        gst1-plugins-bad-1.4.5 | 1 
                host-ola-0.9.4 | 1 
            wpa_supplicant-2.3 | 1 
                libsrtp-v1.5.0 | 1 
                    php-5.5.22 | 1 
                    qemu-2.1.2 | 1 
                  python-2.7.9 | 1 
          libmicrohttpd-0.9.38 | 1 
                   tinc-1.0.24 | 1 
                 cdrkit-1.1.11 | 1 
make: *** wait: No child pr... | 1 
                  poco-1.4.6p1 | 1 
                     vlc-2.1.5 | 1 
                pinentry-0.9.0 | 1 
                    bdwgc-7.2f | 1 
                      qt-4.8.6 | 1 
                libupnpp-0.8.6 | 1 

Detail of failures
===================

         arm |                     bdwgc-7.2f | NOK | http://autobuild.buildroot.net/results/1ba511c629f724eee8b75b9b34fe8db154b3cfe1/
        i486 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7c973b005702455a672f04d42339d003b26347c5/
      mipsel |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/76d249f5a85da72cc53a3e66202c372dc33c9c38/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/60f85a2144b167f33ed674ff5979c1ef20bc0555/
      x86_64 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/8d71e645ed00d8248f81eae7bccb371a56fbce08/
         arm |                 host-ola-0.9.4 | TIM | http://autobuild.buildroot.net/results/d16e8a51c3cb970bf0a2aab9166bf071f8d5f0ee/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/545282f37758e8c8db28e99c9ee7cae83a36077c/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/834422f2665d6593b0d22d18e1ea2dacafaecba9/
     powerpc |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/71c94fa60b3056190b95d37f8dea417b16c935cc/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/a770318af841610e0c10f61cf61bdae298aa59a8/
     powerpc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/566e1510f94670d4ff642c7bfa9918c1d9ec583f/
        i686 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f773b7fa73126db2c3d8398755c70b94fc4b94d8/
        bfin |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/3852864d10b8f86b7eb12cc45dd188f1609fa617/
      xtensa |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/88a8a330195cb9a8f1a0d49d6e7f6b1372dd24e0/
         arm |                   poco-1.4.6p1 | TIM | http://autobuild.buildroot.net/results/7f660bcb7483ed185647cbadfe7842c496a162bf/
         arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/c1d2751d46b9f8033698e8b916bf8af36846fd90/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a5299917457844cfb4f81eb177a4be6637337067/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/28fdf83affb7797df081e1db6a1e6c4b190e5ab1/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/fda28fde230bd010d576e02cbaea816d95f9f62f/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/9d1cb114230b74df2a987508c710a5a483f0f381/
      x86_64 |                    tinc-1.0.24 | TIM | http://autobuild.buildroot.net/results/2e9214e5904a33cc14f972ac3ca4887722774c79/
         arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/b35d4918759a1401c4cb34934a0f26e47a48c325/
        i686 |             wpa_supplicant-2.3 | TIM | http://autobuild.buildroot.net/results/02693c46a8bb4f0bc3c703c016037d43795cd857/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8b9a93f105748cd0989474e3014fa6059f05b56a/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/d6af8c0653643217b01c4a3983f672b0d6346d38/


-- 
http://autobuild.buildroot.net
