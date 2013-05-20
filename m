From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 May 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-19
Message-ID: <20130520063005.626E952C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-19
===============================

        success : 111
       failures : 69 
       timeouts : 0  
          TOTAL : 180

Classification of failures by reason
====================================

media-ctl-ac40b79f002a2315f... | 6 
               sconeserver-211 | 6 
                 pixman-0.28.2 | 6 
                libtirpc-0.2.2 | 4 
                  ne10-88c18f0 | 4 
   host-lttng-babeltrace-1.0.2 | 3 
                 zmqpp-31220ca | 2 
                   dbus-1.4.24 | 2 
                mongrel2-1.8.0 | 2 
               wvstreams-4.6.1 | 2 
                 libnspr-4.9.2 | 2 
                libiscsi-1.6.0 | 2 
                  boost-1.53.0 | 2 
                  iozone-3_414 | 2 
                     pcre-8.32 | 1 
             util-linux-2.22.2 | 1 
             bluez_utils-4.101 | 1 
                   icu-4.8.1.1 | 1 
                      qt-4.8.4 | 1 
                 qt5base-5.0.2 | 1 
                 libevas-1.7.4 | 1 
               audiofile-0.3.6 | 1 
               aircrack-ng-1.1 | 1 
               libglib2-2.30.3 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                    acl-2.2.51 | 1 
                busybox-1.21.0 | 1 
                openssl-1.0.1e | 1 
                   bzip2-1.0.6 | 1 
         host-gutenprint-5.2.9 | 1 
               pcsc-lite-1.8.6 | 1 
                  gnupg-1.4.13 | 1 
           imagemagick-6.7.8-8 | 1 
                directfb-1.6.3 | 1 
              e2fsprogs-1.42.7 | 1 
                  gnutls-3.1.9 | 1 
                     m4-1.4.16 | 1 
                 libiconv-1.14 | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/b25dd1317473e4dc152ba1f6a1f595062bf89974/
       arc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/ae47c1dc64e9a6a003bb0c176e6915fb3c51957a/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d802b4615598226babba85e984994c80bd6a24d5/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2965838e90fdcd1283fbb0a6db1198cbf4586caa/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/fbdd040419bfc5bda8b7a3021ebff26ad8d347f4/
   aarch64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/ccbd3e55a8b0827d178c290d10be2c04e0988628/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/c0c7ee004020ac1cc89bcfd8bb8f229d18d0ce12/
      bfin |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/2b96c07651d238d326cf69c25207f3b105aa3b0c/
    xtensa |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/4f5517bd2fe02a301b31d2c7afa4f9ba765795ea/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/856a42cb601910f4b261cc3089b82353e707c4e4/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/266aad8b81a8bdc2430c2f64c9a075a3e4d1eb9f/
       arc |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/4fc0339855c420be17b48bf5f4715edccf01380f/
       arc |                   gnupg-1.4.13 | NOK | http://autobuild.buildroot.net/results/4b1402e230b30a76a2cef0281b4f2a2cf0fc0afa/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/f9461a021a82c29888c82c0a31c3158af8c24d8a/
      i686 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/e78c3f4e2c1fc3ab9ce950505946e60208269170/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/c7ad6ac9a660932e680d05d98fcb522c73e99480/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/e89109850843d4de9fe48ce6e1aaa87d9985c30f/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/db744a2dbcbf1e7b3421fd65010659c6435aa8b1/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/13a5f51e2e8fbaf00c35e6f135e03ae6837ad268/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/e1ded1cca5412fd6e824e76962971419a81e1bc3/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/96a03194d679d23357c126e433afb35e090a1485/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/fe742d559500e26890697a9a409646115e8a7f8f/
       arc |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/3cfa132b038f0bd550ddf86d3cc5e2dcde487825/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/f13729233eef4c8f80ea4f63fe6cbd9a54890631/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/e1e6f3499fa9ee30eb584c38265a3876b9693cd0/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/24b0673873017abe76dc22ec87c9545dcdb06b98/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/80ef658e5d89e09e9bf01f67135e54ac72df3349/
    xtensa |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/eb0d1e1e536085186bc467a8b9c040fe57c70653/
    xtensa |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/38ccffc353280e61f04a4cae2de18a6557a027a3/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/faed712151295d85cd583f1d8939f98bf6f31a8f/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/e0e9f18b627b6207bcc79a759b2038272c36f6bb/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ec5eaeaffc5a84387ac2a8158b7432d9472b5a86/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/15cb521198392d2f017f56ba7f8025e228f18fec/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/012cba2b860531cb11297f4f13b8b984685e1624/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/c9486823ab9f161311f4239c864b5bc2630f708a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/e7eb6a9b3b294d64f1d9e69c63bcdc7624333a10/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/68d625896bcabf85f5c52fddcabb14a1b9c0c7ab/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3fa58aba79ce107be936acdcddafe5679ad86598/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f7f44c2f8e0214393df32053f01a73a0bcfec3b2/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f019ca17633ad25bfc6e942af73173310894bde5/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/4951e8e2a830ac859877abe32d249c7f9b14d597/
       sh4 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/c00c51bc4ad63f4f9267679dc2caab40c58b786b/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/565098580db67b047a6855f8dd87bf94a65899cc/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/fc381f0e606682754e0b94f1ff22833464711270/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/1198197c3246ad76e861779de4678507d79023bb/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/89eba1e0b04d62e4901c36f4c33550159896e24c/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/c9c652d77c57bff40731065dd63f8b3e11ffd2c9/
       arm |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/2ee208753d39a5a4d6bf63348381693efd232438/
       arm |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/9778a5626ce8ed052a91d7abd1e1dda3d44cfefc/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/38aa4f2a2269b80226b910c46e0c9abe7dc38ff8/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/b882bb068fc7d383e0b6213cb0f7398192f67cb6/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/f625d4f7baaa01c135bbd0ee150e92474cd56a42/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/b51f38f68e21c7dfa7ba6587cbdab91c792d282e/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/5a26a18b68b7e4b33541fad1642d589c91d9720e/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/821909cd7a28125869b3ac1a8b3b16eb1c5ca874/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/10c44f6b0126361d65482e07571443476cd74c4c/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d39dfdaaceee444c04c6ec4487d85830dabe5c5e/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/24f00ba62d285c1df2f3b1f18ab9a6cf5c7f2459/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/4a4b469117d208d1a3604391f91d2ed8910b5300/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/2245a954ef9380dcf4a397badfa87c1f48602d91/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/7d4c85e44402b71ad69fa9e09538afa887b43713/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/cb4de34f65e3b223eaf3df935ea743a38cd8045d/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/ddbfe22a76db223384a6f929cb9627bd1bf42128/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/e614ba6d8d423a42b1a33d872668a8b9513c54f8/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a164edb79c13835389a6fa6ed41506f5f8971947/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/beec036389aeb268c82b9c4ecb264059b92936e6/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/f995a57368d7b9b12ddf119948b06e7fe5d50f0a/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/4eab74dbf8d120f89e518ef19bd8d4dd7504737d/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/ff4754a574ddef5aeb4b30fe684f29c04859c094/


-- 
http://autobuild.buildroot.net
