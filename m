From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Sep 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-12
Message-ID: <20140913063014.5A587101076@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-12
===============================

        success : 253
       failures : 47 
       timeouts : 4  
          TOTAL : 304

Classification of failures by reason
====================================

            libsvg-cairo-0.1.6 | 6 
                    strace-4.9 | 6 
                 gnupg2-2.0.26 | 4 
          perl-net-ssleay-1.65 | 2 
                  thrift-0.9.1 | 2 
                 tn5250-0.17.4 | 2 
                 python3-3.4.1 | 2 
                 webkit-1.11.5 | 2 
              librtlsdr-v0.5.3 | 2 
              libgeotiff-1.3.0 | 1 
             fxload-2008_10_13 | 1 
                 gnuplot-4.6.2 | 1 
                  tstools-1_11 | 1 
                   geoip-1.6.0 | 1 
        perl-xml-libxml-2.0116 | 1 
                     tcl-8.6.2 | 1 
                    ruby-2.1.2 | 1 
                    php-5.5.16 | 1 
               php-gnupg-1.3.3 | 1 
                 pixman-0.32.6 | 1 
libwebsockets-v1.23-chrome3... | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-10.2.7 | 1 
                 libpfm4-4.3.0 | 1 
               wvstreams-4.6.1 | 1 
           heirloom-mailx-12.5 | 1 
             xapp_xkbevd-1.1.3 | 1 
             lttng-tools-2.4.1 | 1 
                     vlc-2.1.5 | 1 
              xapp_xinit-1.3.3 | 1 
               php-geoip-1.1.0 | 1 
              libseccomp-1.0.0 | 1 

Detail of failures
===================

microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/401042dc7200d1a4acf754ef00e55d8f47d38e3b/
         arc |                    geoip-1.6.0 | TIM | http://autobuild.buildroot.net/results/1b0d793dc3fa7df5cf422d656c35066bd926247b/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/b0ef19d7616fc92b1331b0b3356918cef9ddb3a7/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/cd6bf58182cc756ab4c966f623125f643d0754f5/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/4f91b6da0eadf0a644d6ae5e8ffd7f5105c01b26/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/a734bc2dde84e898266f003dbe2498d78326c9a4/
        bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/fd16a63bd9d8396cf0c7f4696ab755d9f94dd977/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e316da2a2a7abcc8733e41b0750c81e57716aa09/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/b07811bc87fd02dcb9a1abe156b5303a94d22f7e/
         arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/2ce6986265045028fe795b43c18657cbc888e414/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/a3f7cf517190980985fcd0074c7ad128b07b8599/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/b76c2b31d9c6e7ff000b3b295a1d53d4a5dd227e/
      x86_64 |               libseccomp-1.0.0 | NOK | http://autobuild.buildroot.net/results/04f268c79b6ee97c9ad54b5a6fd9b8bd716bd1d3/
      x86_64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/cfe6f71047c0b4ab23c668eea3bcfdfb4cbd0535/
         arm |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/8cacc48b60bc18779b374780acf147bf4363587b/
      x86_64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/0d74966d2d33c086d4b7cf1f836f54dc1a6d024d/
         arm |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/7a68fcf50c9967ce0b76fa9d179c5480eeb5f89f/
    mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/379a16aab3ce26a913d631ca505c45b1432c8b58/
     aarch64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/175c3c0cb02fbcf5c47826b41570a0bb318b572a/
      x86_64 | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/40021553be92b578dce2ca3ab9fe54521a91e9da/
     powerpc |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/4f3c9e8d532975aeeaa5c3b79c7d0573e70a9a6e/
         arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/1ef93456fe1266863987bbbff86e025a41d4ed9b/
     powerpc |                  mesa3d-10.2.7 | NOK | http://autobuild.buildroot.net/results/0dc791234eb3f432338b53cd6ee410e3fcf5054b/
        i486 |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/3d820e9bce87d936277a7a26d0488f1626c28a62/
     powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/9decd72150ac5384619b41cef6106d836ab6aaf1/
        sh4a |         perl-xml-libxml-2.0116 | NOK | http://autobuild.buildroot.net/results/70cfed568713586b4c78a4ef3d17c2e269b523b4/
        bfin |                     php-5.5.16 | NOK | http://autobuild.buildroot.net/results/03b5b9df1e3125e07bbe32422679252bf99343cf/
      x86_64 |                php-geoip-1.1.0 | NOK | http://autobuild.buildroot.net/results/990d658bdfb031a2b8b39d7f28d5af111d4fd5ff/
    mips64el |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/cb638674028bb42c6967fa55ae3d5d4d19000535/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/db04864f3618adf8e09bbc8a7c244b1c3b97cb06/
    mips64el |                  python3-3.4.1 | TIM | http://autobuild.buildroot.net/results/f691af00ecb67f1f09f349e0146c324a55e0c5f0/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8c1de4a4f96e77ca29ec089ddbc97cc1cfa5255e/
        sh4a |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/4ef53e9c09fae4d606c6a09f0346ec7d747b0a05/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/e9d83f61863f45ff8731984a60743272576d5e3e/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/04aef0936b5b4df2df2fce030c2b889f4c5e7652/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/9ddc683c80fa28c759de8cc0860947351b2bdced/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/b10649ce651dd1fe58397325d78f6bfbb5975d3d/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/61ce08eaa0f0a58d76a3e88bf226c5ceca3e3adb/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/1b9030d8cdcdc99f1c19d3401c8fb77989ed077d/
         arm |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/22a547283ce8c2319ddfa8d1d74c9caff68cddde/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/8510c04bf652df12ae8039726c9aebf65bef5f61/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c20c39af107dd8113173b7d3fc7b850d991bc57a/
         arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/1f384b89d148852fa9f727e7901a2ad29372452a/
    mips64el |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/84cc85d9992f8f00abe56e2567a25c05f692899a/
        i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/cd4c00774f9c4eeb878869bb1cf11e55782b1fb6/
         arm |                      vlc-2.1.5 | TIM | http://autobuild.buildroot.net/results/ecc070de39b6c89920bf1cef926ddd62f46140b4/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/04c0beafba409e6a67af2f47d759c42d10834c43/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/bfc01b8f781bf535994081c5154069211d554a6b/
        i686 |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/0e6732689a3522d1232b37f8f6fd6c77d4c483d2/
        bfin |               xapp_xinit-1.3.3 | NOK | http://autobuild.buildroot.net/results/df3bb0426f734a7929e7d77e7b1356298eed1663/
        bfin |              xapp_xkbevd-1.1.3 | NOK | http://autobuild.buildroot.net/results/18d7be8e2e181a6653a4fafc4902c84e23773720/


-- 
http://autobuild.buildroot.net
