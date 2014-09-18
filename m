From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Sep 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-17
Message-ID: <20140918063010.A2AFA101426@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-17
===============================

        success : 283
       failures : 44 
       timeouts : 0  
          TOTAL : 327

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 7 
                  thrift-0.9.1 | 4 
     openvmtools-9.4.6-1770165 | 4 
                 webkit-1.11.5 | 4 
          perl-net-ssleay-1.65 | 2 
               libcap-ng-0.7.4 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
               openswan-2.6.41 | 1 
               alsa-lib-1.0.28 | 1 
              librtlsdr-v0.5.3 | 1 
               php-gnupg-1.3.3 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                 libpfm4-4.3.0 | 1 
                elfutils-0.155 | 1 
              libsvgtiny-12121 | 1 
                libinput-0.3.0 | 1 
           libmemcached-1.0.18 | 1 
                 pixman-0.32.6 | 1 
             e2fsprogs-1.42.12 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
                    fltk-1.3.2 | 1 
               mpdecimal-2.4.0 | 1 
                    php-5.5.16 | 1 
                     tcl-8.6.2 | 1 
        gst1-plugins-bad-1.4.1 | 1 
                  python-2.7.8 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/0f97d0478a69e01719ce96108fc6da18bd1951d3/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/ccbaf1b10a84d08dddf391531394f1be63df1fa2/
     powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/02252824088378355d29629c37c635e323f4c928/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/c5528725843bb481a25b145f44f0b85442516354/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ad82b3ba0ef5ee603f18d4a518d7249cad29a7e7/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/296adc4ad145b2d8c4bf98c52a476d7725f5a5be/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/0a990c6bed1414a82cb7bae31782ebb1dd82958a/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/86aa06fa85bd75516e7eacca1c6f0b3e593239d0/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b69747141c4f3b8767d69ea0628b628c5e285b02/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/d1509adb5c118115523d845bfdcddd3ece8113ea/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/a6f9cdfc1911d9e3ae6a6eb8b136efa21c84fd62/
     powerpc |         gst1-plugins-bad-1.4.1 | NOK | http://autobuild.buildroot.net/results/c1e8ae913629624125f828394f4492ccae3915cd/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/504301213c50d927d5b6c49201a5d0f8004c9b85/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1c4aa7fc46bff654a0a448142ae364c10c9fc210/
     aarch64 |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/25da4428630717b9af3bbb927aa5c9bf48603cdc/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9714bdf5571347e9c82082ef212648b7d3e59c32/
         arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/b9b654882f0f8b24e81eff61b38a74f89d941cf4/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/ceac895e911c627308453ce0912627b9b9fc4491/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/6fba0d708d35a1e728dd802207de9ad557d14b91/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/67bd5f36eea0b74f37f40a6d6b87224577dc2874/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/4e4bf1557a4d60b718d3a046d9f06b62ce849e67/
         sh4 |                openswan-2.6.41 | NOK | http://autobuild.buildroot.net/results/c10a5a52e80baee4ae91185f33c5d04098a1a1bc/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/e5fa44fbf2fdcbd59d640b7e0b69bb275d92942c/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/51444f0288cba3ba53e735d7a8ba0833c5a1535b/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/cf83739db864f259cd4ecd3cc79f702d30de7dab/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/69ed75e4c61b4312fdd69f2331b286258bdf387c/
        i686 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/06b4f251e0121bfcb631e01b8562144508477bcb/
microblazeel |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/c2af31c5064ed1632c38e47a590cc061698c8303/
        bfin |                     php-5.5.16 | NOK | http://autobuild.buildroot.net/results/7393766e3b152199e63f087cfac4edf1e909e42c/
     powerpc |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/fa0916007e63bfd9e27667d386ef80edc2c96b1e/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/fb2d9c119e8c1b5d2542cffdaa1d2ced419c07b5/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/5723b3dd88124bd04fd966fd509dc71c39a21ebe/
      x86_64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/eaa51608df77c20a1803296f8ab7258bcbbbaa35/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/744deb31a2a80e46372c3cc1f6703b19f9d054ca/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6dd00c67af4352db0372a617813aa7ed05e57714/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/433745c5c7327127aab498dda25bfb76e8906f0a/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/63a453526ebda2a601c780232134bb08699d0635/
        bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/2f3b67cc45ac210a98ff2baa6faef9ec434e1753/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/0860eb4a4a29500e85b8de84c19983dba3357378/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/4579d819c9282ef384862ad28aef458d072e3e28/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7f08a3c03dea577a6aa1b483bcae5571b2059b3e/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2df810cc8b067a4440c1f73b924141e293039c97/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/057f764fdb5ff70bf8cd030319f169f619c28bf3/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/11526b8fc62a80b2b8b59be75ff73fa258ad83bc/


-- 
http://autobuild.buildroot.net
