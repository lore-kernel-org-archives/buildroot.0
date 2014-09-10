From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-09
Message-ID: <20140910063013.732CF1018B1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-09
===============================

        success : 264
       failures : 45 
       timeouts : 4  
          TOTAL : 313

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 6 
                    strace-4.9 | 4 
            libsvg-cairo-0.1.6 | 3 
            host-texinfo-4.13a | 3 
              librtlsdr-v0.5.3 | 3 
                    ruby-2.1.2 | 2 
                 webkit-1.11.5 | 2 
                 pixman-0.32.6 | 2 
                   czmq-v2.2.0 | 2 
make: *** [core-dependencie... | 1 
                 tn5250-0.17.4 | 1 
   150K .......... ........... | 1 
                  tstools-1_11 | 1 
                 cdrkit-1.1.11 | 1 
              libarchive-3.1.2 | 1 
               mpdecimal-2.4.0 | 1 
                elfutils-0.155 | 1 
               php-geoip-1.1.0 | 1 
                 libssh2-1.4.3 | 1 
            host-libxml2-2.9.1 | 1 
snowball-hdmiservice-f75c99... | 1 
               iptables-1.4.21 | 1 
                    tiff-4.0.3 | 1 
   100K .......... ........... | 1 
           libmemcached-1.0.18 | 1 
               alsa-lib-1.0.28 | 1 
              sqlcipher-v1.1.9 | 1 
               php-gnupg-1.3.3 | 1 
       opentyrian-2.1.20130907 | 1 
                  zeromq-4.0.4 | 1 
libwebsockets-v1.23-chrome3... | 1 

Detail of failures
===================

      sh4a |    100K .......... ........... | TIM | http://autobuild.buildroot.net/results/9000b9005d3a904e30c0c18bd7c7a6c0c98a865c/
   powerpc |    150K .......... ........... | TIM | http://autobuild.buildroot.net/results/c5721381f470591bbdd72c0478e002958496932b/
   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/ddfcffd5bf3b5dca5c72903fae9a533fa09e15e8/
    mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f4016b431e9686e54ae46a0b19295d87f99ba514/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/64a7eef2155248146e7f3a55e85fe60bc5b67791/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/00e34a2a52294bef2330c459cf921957e88633e3/
    x86_64 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/772a53bebbd2c421c05c91a0db3d792dc1b4a225/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/6d39a5b3f34b5f09edd0c70d6aa5fcea3d8df289/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/cd94e66a4e3d3664ef71f6c65f0aacb982ac7f33/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/8a194daacb0b851195ca4655f2fd3495e9cda3f7/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/691e620e473646bddc2a7a81f4209c0db81d1769/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/acbaaa7057ef63897b254b9221628c803bc0cc1c/
   powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/38ace3ddb594a542902de426adf14c735b6303c5/
   powerpc |             host-libxml2-2.9.1 | TIM | http://autobuild.buildroot.net/results/f14532d4ec4efd5402479246cf02838daaf1670b/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/be4e19d55b24c00b8b0fd12c9e5d1e9c5d8b0cb3/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/24d1701d39b9b73ef98e141d514592845baa4b8e/
       arc |             host-texinfo-4.13a | NOK | http://autobuild.buildroot.net/results/de070cd0eda96bbc96fda8e81cb54c0ae71652a5/
      bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/ca5c2bb6054b2e9104b9b5a8c2a63128f74a1b67/
    mipsel |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/f2639fc59b8ba452cf95268b6370c1093bf4aaef/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/64e0011591377cdbc0c26dc83d578d1eb31417ef/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/a47c9c59d92b637c2a022b11ac7d46b48527b3f3/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/db95775c54e651866e63d6e6e9f14793685b30b2/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/2095b5a5ecbc80fbb728f6de128951403e34e3c3/
      bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/640277c9e06672e4cd2b25f9e523c7b1ddd6cc17/
       arm |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/a59bcf408d3507dc39e34994b73d5747895dd87e/
       arm |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/3fcfc24c0b243321cbe15557b18c6de9f723cc43/
  mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/5f7121efe24c3b6f20e2c5b348e16a710c03e64f/
   powerpc | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/68de673d8b40562b366fbbee742430d64ec71443/
microblazeel | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/cb6799ebcb0f72662a11420e1963d97c4b1e912a/
      bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/f080043b2afd0c53f14968b487570bd88ada7e51/
      bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/c0c6d36cddb0fbc02bc19b44050c64d34b00d9f6/
      i686 |                php-geoip-1.1.0 | NOK | http://autobuild.buildroot.net/results/a5c396c815813c3bbbb143bea9466a2a1c2cb5cc/
   powerpc |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/3f4c35d1714b43989c1f9fe1bbfc99a4ce79cd5f/
     nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/41ecc895992803f6a70db158a7134e3ef460fd04/
     nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/d53c34bb5e54109098ab10365ff5ef2a74e0cf2a/
    mipsel |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/b29ecc567e5dd486aeed9d489a52c53ba9756c70/
      bfin |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/252555183fb6d77e3e44304239e96eb67ea26e6a/
      bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/1484925122442c4063da6742f6280ccbaa5cbe29/
      bfin |               sqlcipher-v1.1.9 | NOK | http://autobuild.buildroot.net/results/7937a727890c1b23ecdaddb5cd9e6e6a43272232/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/422036898f532f03856b643a1348d132553952f1/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/666ef0ae92249ac335610d5a62d84f15a878d352/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/a1e50d9420bf26197329ea27a9a3c12a7944e7c5/
      mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/d9728e07ac0ff9df743b3bc252b2dcdf2d58d5c2/
  mips64el |                     tiff-4.0.3 | TIM | http://autobuild.buildroot.net/results/64f4dd2e254344dea3d6b4b8d4195dd1fdc8dfd5/
microblazeel |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5da6949d1e1b101ae1204f81c20adca23f377a8d/
       arm |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/42051be7b2f7a885099b86601063788f7387402f/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3e1e8ec98add895ba52915816eea0e5e104d98a1/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/431fe97f7d052b5e5e2789b0a71e2f4c7d11daa5/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/d683eb6de65d8229157395b2c135d4ad57ecb727/


-- 
http://autobuild.buildroot.net
