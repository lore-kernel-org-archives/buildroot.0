From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Dec 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-03
Message-ID: <20131204073002.8453B101504@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-03
===============================

        success : 70 
       failures : 148
       timeouts : 0  
          TOTAL : 218

Classification of failures by reason
====================================

                  gnutls-3.2.7 | 47
                     gpsd-3.10 | 27
                aiccu-20070115 | 11
                  connman-1.19 | 9 
tvheadend-c7d0335eb10d02b78... | 8 
                  libeet-1.7.7 | 4 
            libvncserver-0.9.9 | 3 
               libglib2-2.36.3 | 3 
                  nettle-2.7.1 | 3 
                  libv4l-0.8.9 | 2 
             gstreamer-0.10.36 | 2 
             iputils-s20121011 | 2 
               audiofile-0.3.6 | 2 
        glib-networking-2.36.2 | 2 
                 binutils-2.21 | 2 
                 ffmpeg-0.8.15 | 1 
                   ncftp-3.2.5 | 1 
               alsa-lib-1.0.26 | 1 
              gstreamer1-1.2.1 | 1 
             libfreefare-0.3.4 | 1 
                 dmalloc-5.4.3 | 1 
                  squid-3.3.10 | 1 
          qt5declarative-5.1.1 | 1 
                 rt-tests-0.83 | 1 
               uclibc-0.9.33.2 | 1 
             xlib_libX11-1.5.0 | 1 
                      udev-182 | 1 
  toolchain-external-undefined | 1 
                 mplayer-1.1.1 | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
               qt5webkit-5.1.1 | 1 
             alsa-utils-1.0.26 | 1 
                 cairo-1.12.10 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
                  samba-3.6.21 | 1 
                 libevas-1.7.7 | 1 

Detail of failures
===================

       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/6a2bcade333b4e7a363aea04480daa9200a1813a/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/86ccc09da08a49f4c8949cebd7388e16b623585f/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/b738bef8a6adac9c97c435e6d0d52eeca0b06db0/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/0d84d66f303ee4c5eeee859d9db26f85a60cf03e/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/48d5c6364fec55e84309b2fb6986f206699f1800/
      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9705b4488592943e0ccfeeee02eb9d017ec7b51d/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/29b4f92cce7d25ec6757b9e459fc680c016d3a3f/
       arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ca55ea187aa77073dcb8378d5d8df9d6e9221a1e/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/8ce00f07e0967ab3bc26d8ecf8a5c04a3f85a0c0/
   aarch64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/eb88c1a2ad10deedd4bd2565b62ea61e5b466627/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/10e2cb7966c6355e32cc8595def05a01520e5b1a/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d2dfdcd6b7cb94de1586601d5d9f074f506c7203/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/91850895a61b40d95394fe4183f992ab891eea51/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6fea7c5990debcd8874330113fc06bc2e8cf21f6/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/0e1df1e4aafa8168dd019792167e7c8d9b7e40aa/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3b3d630c137b265b22c5849b9ce21f3c442ccb8b/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/a78b1f81bee41fb1d0f55f587f963cf62aa1ccd7/
    mipsel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f862ba1c4cbb8a7d96fee5a8b378f2abe48f7269/
      mips |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/b635ea2e38ed0b2b451da96047b8f8c9214cc1b7/
    x86_64 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/240bed21a22874b9838e3dba9bff1d928b39bdc7/
      i686 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/53299fc0ae6eefc95d6f8130bbcb814d2e43adf3/
    x86_64 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/9dbdf4714f4a0895b3d6be7310bceeca058ba987/
      mips |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/ffd45127d7b302112c91db40af671ac0d662c9df/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/6dbc7cf96c334ded454c0ebf7e761d56313fa2e8/
      i686 |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/5b773f3499351c82ddedb12eaa9814804086d223/
   powerpc |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/8ffe25aad2559f6108b0bf08b7c8925cb3bdbb9a/
    mipsel |                   connman-1.19 | NOK | http://autobuild.buildroot.net/results/ce24728d7fbfccc50835203920a895ef4417a911/
    x86_64 |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/f2cf94982e26d097f6dc2bbc0c50515587b5afbc/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/c657566d49d2e0ab86007c3e4b8bb6a69990ccaf/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/39c70200635a3eaa1965d738dce11f253a15e449/
      i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/1227c9be132eec69adbdbc6b6d7061262af67659/
      i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3740557412148ee2402c42a98469f2a4c90b5220/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/322998b3465b171f50ee2dbf706836034ec1d150/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c54528ef7f633ac6e508412f237579dac05e4ee1/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/9a34a3e252a5d0b789875b327cd5396b81729fec/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/340af8cf2db9656b787db9164b5379770b6bde93/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/1082cbe829c19a5e6ebfabe822cd185d48957786/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/41acbeef4447256e582b31d65dd8fe39c8e862f2/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/b897f5163a4f4824ef37f716095837389fbeb4fb/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c5ab8a2f1f52f461d7e460d036bd64b2d8300229/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/f69928640f85ae9843e1501337d38f391aeca774/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/1c64a4ad4c5acdf98a882a2defb0e723b0db7b81/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/17fe2ce996c07501dcaf8a5a8a52efd27a702c63/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/7526d707a9268b1b25396ccda5cf989f4f6d42c7/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/a81a5e3f74baca67eb73870dc40fbed9e6c65f48/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/60fc9345fb9cdddd8e3408e995192b763f488d90/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/27b2938e04ae20bb19fb9bca87bbe4875fa1a0ad/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/7c062d3c3df71c7ca51fd332cb7e164939182678/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/693e61c78b1aaf255ba9c153a68145215f22369b/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/b3ef52c759c8f3f3fd9b7c0a0e176c30c23fe4ed/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/f72ec8fcb1acb007d99bfa7282ee05612acad623/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c02eb165b03e8b0804217966307fa6b62bff9e4b/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/2f02ecad2e80130544f51b46df5f08615f221c03/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/112d9a17833689aabc53a01027844df5daa00477/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/ccc5982ea6267ec812c00f92f196dcdbc2b4fbd1/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/15a7d7d3556cabed51ee38a2d8af9b937a9e1d2c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/f3bc73ecde53951540514ed9d3d61d69440f20cd/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c04ef4002cde00b91974359593c88497a95756df/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/cc0a6255543ae88615962e688838d21f6ef4cdfe/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/cabf15f136d7d729e623954030f4d8c796dfd0be/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/51b65d9c070bca40e6671fa6b4c78a0099ff6805/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6cbd9dd5d53b293fabaf5d3ff9a09b999dd7073b/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/cc17b621f577de88ed1caffab5d33eef3f918c93/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/75c4b304627306a99736e512e922294dc2525268/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/a35454ad45b3d39782b39165048608ccb7823981/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/613670d31fdd856e7340142df550d7fef5a2644c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/63e87302fc34bfebceaa4823c7fe79fe6cd270cb/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/f6449d52a867f30b2c968025ae4cea5fb0d22853/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c1ae0427d3cca41cee4e021ac4231f3ca9910aaa/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/966d754e0290906f586af3bcd52dc17773251239/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/937a43d68d8e90d7c749f4c991d0b35d55abfb23/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/3462e3f57d201bf570f2bf5fd0a579318a062e1c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/e006a4b36d18403f0a3189791dc4b6ea2f685d80/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/1c36bc5019ac14daa60163c89f0ac5a645df4c60/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/259ee961768ad107c4da8f09040dde5e894ab944/
       arm |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/c3cfb82cef181d5e4fc7d149ebfe3608d0c1ecf9/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/6e52893256577e2cbe83b55b51ff07d6966e685c/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/5cdab72aa98df9cafa2035f4798b982ba8fb6702/
   powerpc |                   gnutls-3.2.7 | NOK | http://autobuild.buildroot.net/results/577003f731077d703c82d73d7a9d9b0e18568ddc/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7254e40ae55b99e13645aaaee6c4df4948ee2a7e/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/6d71c276cd0b6f34a9aa2349c0d115f9ff8344b8/
    mipsel |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/c547391920f3d55f7c300cf8fef29d3cbf0236ef/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7bdbf730006167e49f209ffc85138e5f6edf8881/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7d438acf2db6be18e411b84251bb5759fa6a2cbc/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/da88eac480e4f7ed45bbec8174551bb95a72cb49/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3cfe95ae8b6a7b164d7327d9f17914e95c3b6e22/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/473e6d5fdcf3864e69b1c56d545678ddf7dec88f/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/8fca2072743ecda1478c66c6aeb37bef6475e85a/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/bfb63549002581c97a73781839bd049c0196b4fc/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3f4744058325990678e18c7a395ce4a0744b03d8/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/cba89aad527593c1c1c6ac9a281ce247fb5ccbac/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/b31d1e97da0a833fd4f8cc26fe0624e715dba730/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/81873b7b37622ba52c6ef14f1e416a7870f2a579/
       sh4 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/83182c385d955a1e524f4e213475205d2aa78cbc/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/8c8f39d0bf2f1fcb73583ec658be124d9ee8d55b/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/fbbe8464f4f172d71dbf59358ab4780a28a7fd1e/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/ce278324d4178e32f0c78160692bfcd0de491617/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/aaa4f434efad3ff474ed54ab844cbb70a1d58bcf/
      sh4a |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7dbb56e8d110ef853495f0cfc89c00e44635c315/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/7dd119d1639b799a54974ff125178fca1d9d3c00/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/ccc32f487ddb41f893b15c94453ac7e54f353df7/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/08ac20be06fd2b1f89584c5ba3cfc2d7da55e7c8/
      i686 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3805c690fd5aed6353a1b6f563112f9c02ce3db0/
   powerpc |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/736a700e016cbe79c157fa0a1db63d08ff8f1227/
       arm |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/1aad91b6625ff21c10543f2f56f8515549128c48/
    x86_64 |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/3e82d1aa898113f0d8084576fda1218967627459/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/98704c3410e21bcd6f069684891312016c29ea5a/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/9598451bb05bd705045d2a728ca1fff7285f4323/
    xtensa |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/ae1898fe30128220ce0e5790e81c65ebd92bc110/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/5515d860df2cc65c7a534de5a532b01fbb72677b/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/a6ddfb7d89f1cd272e953f17b558bd2c48ba5cd5/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/8c87b86522856049a97277f0d3afd96f05eab9ac/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/66f480307bc8915199a60217a58db015faa8edc9/
    x86_64 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/496c1a1c22102d9787fe08a37e29af669941e606/
      i686 |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/379f3d5cd3551842294fb73124296fbdfef6bb80/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/91823f083e1ea668c2f95e573e84451a7d09512e/
      bfin |              libfreefare-0.3.4 | NOK | http://autobuild.buildroot.net/results/f710f3271f95c3df7d17852f75ec657d5974d5cc/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/08edf05cb3c9c74479ead3630ff21c2dda3fb509/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d3c5c3471d5c9b9cd0ffae5968d092870825ecd8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6efd86dc32e81aad19d2b9d698fbb1ccecc4eb21/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9958561e27bfb66f327aff6cdcea057690a7358a/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/42f56cedda66dc306a93a9aa3a87fc23a6cbf3b8/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c63db6e289de270f607240ecf78e80082ecd3b94/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/638ed7e5548a7b23ac8cc78f88571eb0e3df9b36/
      i686 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/39ba3ad434d004de369fd8aea3ea05d03a3ab004/
      bfin |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/57069091b7ea3224f0da988afa60cd4b09cf1e99/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/15873afb42f98db44f10d05e6a6aea032b682921/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a1a9ba37d662b5db31cffcf78c7aed7a5423ca23/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0c3558a252b5c5f583afc89d67e7257db48a0253/
   powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/079d050595839856875dc2fe800775ebb9745d55/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/ae3ccff99c6fea46fa1aa58676f7dde2ddfa603f/
      sh4a |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/41fbf123d9c5dc5a1d5e52b55aded3bd98f3e202/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/35406e2aa9210f436c750b889a79c65fd8f5ded1/
     avr32 |                   samba-3.6.21 | NOK | http://autobuild.buildroot.net/results/2b4b7bd0f5b2c24f60f32c577ee543b87dbbbf2e/
       arc |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/cd4914ff331a3c1b50ab744b2f457ce172731879/
       arc | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/50afda2c2149835ad5af7930c55ec113a378c6b6/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c0db99873494c96eaf8cfd68be171ca0fefcc321/
  mips64el | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/c096a4169dbbfa5ae98ada5ff2a142fe478427cd/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/7173e7a1bcacc516277435d9c9f613f340d3b2bc/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/d49247c4aa9900d9368ccf9b26156fcd28f2d564/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/f26d2cb29b93ae401d0357a2c32a792877aea97b/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/7c85db0dfab98808c97a5ef17dec9d1071dc0d49/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/5cfc920de6a1bdcc9803f9e7acb3cc3143de880f/
    x86_64 | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/3eaa17b94975477263fe12e201eec9cbeeb2912c/
      mips | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/780c2c3ccb3e7bd892bd3a4067b087726e1a5e07/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/794d3ad76019841eb9e5808ea5f7b5472ff25eec/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/5b5f772d597e54fd675ff87101ea898f504a53ed/
      bfin |              xlib_libX11-1.5.0 | NOK | http://autobuild.buildroot.net/results/a47c5d96f880af04b85bb6773e87d04f9d7c2864/


-- 
http://autobuild.buildroot.net
