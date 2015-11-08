From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Nov 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-07
Message-ID: <20151108073015.E3017101ADA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-07
===============================

        success : 77 
       failures : 45 
       timeouts : 0  
          TOTAL : 122

Classification of failures by reason
====================================

liquid-dsp-df5a459fa05dba41... | 6 
  toolchain-external-undefined | 5 
        python-protobuf-v2.6.1 | 5 
                   mplayer-1.2 | 5 
                    ruby-2.2.3 | 3 
               libnspr-4.10.10 | 2 
           libfreeimage-3.17.0 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                mongrel2-1.9.2 | 2 
                  qemu-2.4.0.1 | 2 
                    ustr-1.0.4 | 1 
                directfb-1.7.7 | 1 
              strongswan-5.3.3 | 1 
                    libuecc-v6 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  gauche-0.9.4 | 1 
                     fastd-v17 | 1 
                 mesa3d-11.0.4 | 1 
                   glog-v0.3.4 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
       kompexsqlite-v1.10.12-1 | 1 

Detail of failures
===================

         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/96b9bc91f2a2844451468158fd806241c83b28b4/
        bfin |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/343061c5bda8ee317987146b015c2ed7cfaab080/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/c773a737c53f63174e71bd03d037ba250a3dfc73/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/975d8f7258a01e07674fc85811e867003aeca951/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/1e4dd0eb8d4ef8bc111f68034ccd6e9e2cd12869/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/9968f11c7ed7854b30ec34300c376665c17adfd7/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/4389cd29c58fb734e7ae68095241b3e8d3091584/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/e52bce5cea5c4fd22a1edd379b045e3eca111c65/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/97c1cd399d44a6809461f56952d4a6c1f613689c/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ac7baa6b005477304aad01a4789db535b250bcfa/
         arm |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/f72a8688e97d739378b5dacfed26e8febe98dea5/
      x86_64 |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/2da78d221be5d9f0ba3d86a740ddcbff8a4e35cb/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/a17d81a90688b146a0eef4e9cd04b9fda555a949/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/8af29e59ef39ffba68782cabbe85e6aa8a48d001/
        sh4a | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d43574b8f487648bc440fbe0b63b2a08b309dfc7/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/9275b8b0c7d172f3883130fea4f09f640c8b3062/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/63e6c8dde2cbbc6e20b07259bce3c276ab98c5bd/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ebcc298b7fc14f7fbd4cfd5b4519576bf6f55860/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d1e5d0e3ecc492bddd577a891f6496e6c63ce0ff/
      x86_64 |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/bb258a77d4d650cf0abc3f2a9839b5c8337c1bde/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/c5ecfe4a5ad3712d65293de517a24e76c4376c57/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/79634a5cf60805525f2d795ad300f97f5b133761/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0da41414b57b3a524473eb6ea92c7cdaeeb571d4/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6acd9cf25c3088d313247510db47a214fff30c67/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e718974231e65f1c49900545f9c7228149c502e8/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a6cedc5127274450d0ad61005f30e64b9235d422/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cef30d4e14d39ab64bb27a6514a0390755f4a9d2/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/c4432ac3adc710ecea8486c7d4c74ca8cade99a1/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/5e76ccd29b8aa580b9c362d1cfca10e8379881ca/
     powerpc |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/16e8c41f3b6627ecee96fcf5ab3b22f1b7513ba4/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/360f11ddf279f1c7f09e298a13e5ea9035bfc619/
         arm |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/e0aaf874c9acb4ad284c5c4f6b0d588b58b0bec2/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/58dd3c712f0900075deda23e9f0cece252f71d3c/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/7b80b3ae18d59a91ddebb8211aba6008396ba671/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/32b072e1d1a2f927dc85c1455dcc4609c0dd2847/
         sh4 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/2baaedabfecbf962a58f4365f972bb6c10e38331/
        i686 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/61ca4bed37dc814ed732a1d5cab3047b894afdfd/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/e09e26085d40e3ed4ad2d4127e754867c279d891/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b3ba09a83c6aa7b4c224d5635773fecf5a18c94c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3c96b5b57ea36b149c622307d0d69296e080e8a5/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f9f8880184eb0b312f0731aadcb934bd0a41c499/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7ed93ede42c82e87e6a5137c8dfbe795f5eecd3b/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7377d15fd4b6c190ce97f78c06f1b21f250898dc/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d7b89bcdce61e04f4f6dbb17c0d817a51cca3871/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/5455172b5dd13c922e0c4517db226f03fc1b8103/


-- 
http://autobuild.buildroot.net
