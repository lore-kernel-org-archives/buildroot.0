From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-28
Message-ID: <20130529063005.BEB9E52C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-28
===============================

        success : 116
       failures : 84 
       timeouts : 0  
          TOTAL : 200

Classification of failures by reason
====================================

                   flex-2.5.37 | 28
   host-lttng-babeltrace-1.0.2 | 5 
               wvstreams-4.6.1 | 5 
                libtirpc-0.2.2 | 4 
         host-gutenprint-5.2.9 | 2 
                      gpsd-3.9 | 2 
                 pixman-0.28.2 | 2 
                 rt-tests-0.83 | 2 
                   dbus-1.4.24 | 2 
                     m4-1.4.16 | 2 
                    acl-2.2.51 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                  iozone-3_414 | 1 
                    fbgrab-1.0 | 1 
                  python-2.7.3 | 1 
                 libiconv-1.14 | 1 
                  libv4l-0.8.9 | 1 
                     pcre-8.32 | 1 
               pcsc-lite-1.8.6 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                       kmod-13 | 1 
                 netsnmp-5.7.2 | 1 
               qt5webkit-5.0.2 | 1 
                   icu-4.8.1.1 | 1 
                    nettle-2.7 | 1 
               alsa-lib-1.0.26 | 1 
                  gnutls-3.1.9 | 1 
                 binutils-2.21 | 1 
           xlib_libXdmcp-1.1.1 | 1 
                   bzip2-1.0.6 | 1 
              e2fsprogs-1.42.7 | 1 
                  gnupg-1.4.13 | 1 
                      udev-182 | 1 
               qt5quick1-5.0.2 | 1 
               czmq-cb9839cf90 | 1 
            qt5jsbackend-5.0.2 | 1 
               aircrack-ng-1.1 | 1 
               sconeserver-211 | 1 

Detail of failures
===================

   powerpc |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/4069b810aed8ee6b1178e976ec9794484e716f1c/
      i686 |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/a9b0596a4835f504b5dc83e44e8205cb6340f0c5/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/b33d13c6f521d7a3d9f864cddca0cab880613026/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b2ebde6cd4b048410b92add39bc2ba53bc9cf934/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/3f4d7f67ee6823252aad7ad44831d9346bfe9115/
      bfin |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/91ef29128f9e4e68dd433bd87d61c60852e741b3/
      bfin |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/82140fac4c2a2cef3f38f06cada8f17fd7f0078b/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/ec6f8459a2c94bd88f8218be371a726d8cba362c/
   powerpc |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/3b82e6e373cdc63b5aaa3f9ebf387b9df14f6b2c/
      bfin |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/c82ca2eea52dca496624286d4df6bd45f15ea5c4/
      bfin |                     fbgrab-1.0 | NOK | http://autobuild.buildroot.net/results/89d310d95059c6c3f374698425b6cd8bc21164d2/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/61a72355b19e7f1e45a602f62bde3fcf3b9b4684/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/d7a8ae4489437e11e45f8608bf06eb92592e3c06/
   aarch64 |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/43ff7673076d555eb6461a9cbd8019f405d17566/
      i686 |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/8bf6524a688f1ee4ef11ada284f25f3dc1692421/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/01da0ce19b843e88ce2f2cec1dd0f1cda1787fa9/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/54c50786d305f3e96c7c3f58c6dfef4ceb4652fb/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/bdd263ca6ed49423edc46e5f5934698f5b305d49/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/46aa670c12893131fde923b38200e05098759d6d/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/fcab3af9a91999ac9ef5fddb490d5eefd17ce282/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/39a88d9c1f19805efbcff68bac60beefa1b50dd5/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/465c16cc4b079e9c83e8192ea139bf46601d8814/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/2979934f655ab12ee0c859ee59f455a726b85d15/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/42fa7e032c8bb279e76124aec79323672d23ac57/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/3a957600c9bf4f7198ad61ddf2c3165b03ad3533/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/11b80fe5e8074955021f1fdbb28d1527ab2dc117/
      i686 |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/159b81f06e666f05b916b2cb616be9448eb7fd27/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/a509c1a210bc9be06163a5a235ef9ed502c1dd9e/
    x86_64 |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/5c14c85a84dad627ac7bf18ded1d418b75d5fd56/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/b6c8e3c9b65f9b23ca38b0856654a95fe41ab34b/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/6026eb706962bf0b742295e5cca6f21b28d589d9/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/4008a7d404561d5e7a0edec4bd0714b5968a24b5/
      mips |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/3d4dc97b50b0fd19dcf33429a805bb74ad406a1f/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/3cbb82544d493ab6a9102e15018cef470385217d/
   powerpc |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/cf7e9b37746a8d919dded4cd23ca81f428d6348f/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/27e67adb10926452f6d863aa2c71800af277a8cd/
  mips64el |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/15a3fd771e1cc81d4055dc20dae8208666e777ad/
       arm |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/c47a35846e476c19bed0882f1aa2749ecf52c2a8/
    mipsel |                    flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/8d4ee584f4021be0e86b1ff215828e9dfbfe63b4/
   powerpc |                   gnupg-1.4.13 | NOK | http://autobuild.buildroot.net/results/76b14b31036c28fcac1543a4c2052895c3fae2ce/
     avr32 |                   gnutls-3.1.9 | NOK | http://autobuild.buildroot.net/results/047093416f9e81a0bfc53f82bc084a0b256b7c9c/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/2f5b202fdc0a1af581d664371f3e1812d9d13a9a/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/da5f141298d297a8d108eea1160c4d06e52d3e45/
   aarch64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/adba76b8280b823df2ff18d92c6bc84b340b07d2/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/8f1da2d88bbfc75ca67d704f6529377746f3f66e/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/699c0df049a15ebf7b9ccb7751cc37385bfa904c/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/c62d3167f8b9070ec5408961dd9d597075a0fe65/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/49216052c161874f41738e41e6e0c89a6dd04000/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/c29ca1db16428dbc1b12519b204479cee21316be/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/6201d1d853e4c18c94028f7358c6c22074aefdf0/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/70ee1737f8be489f042dda9361efffed1c814fe1/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/717160f16db647f627b108b5d40a985eba6b5192/
      mips |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/42e8bf8d26677e88f47ffd0ec339a5a34fbca6e8/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/dcd704083f0b276883ead5d8df77594890214e1c/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/425acc820fb1f4f90b6c7234f8fa6c2bb4f21cb3/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/01e78ae9ae1825e92e7a404d332261d49fdf3040/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/58b16449065c16afce11ba120db56839efb2b1ea/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/66e41fbcf0142fabdb0809aaf2acd065281ac821/
       arm |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/c741ca445a63ce9ab8b0e5b87f3126d7b6051009/
       arm |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/c252ad57bb8e25044adb181da7dd1a5455f8683b/
    mipsel |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/49502b2e33a346b2fcebf5e2da00af2661b54d6e/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b67d035ea8fcf8303827c25ca0bf590e0d654be3/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7f5a2228421cfc7b733277eb9faf63f2280837b6/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/4e0701275a5f116584c839bdb6d068902d58808f/
microblaze |                     nettle-2.7 | NOK | http://autobuild.buildroot.net/results/141d158db23aa307ea7e68d1545ce9ebedd2db56/
       arm |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/4cfdcad8bcf4ba0da220fa75dbbcf9d91b736906/
       arm |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/be6ad7a3d6bba1000319c1ee97093a6b00db2c19/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/96d3da561cf73050414ce64ff6ba7e85f01edcc6/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/1604dc652248184f37de28ffe4c114453e7809ee/
   powerpc |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/82ae79ac3cf0fb0e40008ceec25ad4f106d43bb0/
      mips |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/a2e62e2deaa28ec9d4d957523a00ee0b7a634950/
       arm |                qt5quick1-5.0.2 | NOK | http://autobuild.buildroot.net/results/81842f129ecaf800b74d78c52bbc14f33aac234f/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0ba93bd90463dd0de0896a38a14bfbdeb9b9b418/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/d96407ffc398c793d89260dafd1ad3133289bdbc/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e7011a45d105e7f989fc165a41065bf6d1c10a02/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/d0ed1954bce2edd5354c50168ef1d7a3abf7078e/
       arm |                       udev-182 | NOK | http://autobuild.buildroot.net/results/0e82557c73db45287ecabfa75160b0ca25bae8e9/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bc4c617a5d7740b6eedcfc0dd24aeed5bc888f6d/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9273e913ca08e22c7328aef03def43ea512ae645/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/7ef40a12c1e6e3c2107f2e9aa2cf9a22fa164931/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/3a3db7476295361b7000722a4a6a8f7824f46e4f/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c1c0b3d2aa16f9140feeb0db641bd6ea5b214428/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/7ad5feddc24983738aa5fccf6d52c5134549fd7f/
microblaze |            xlib_libXdmcp-1.1.1 | NOK | http://autobuild.buildroot.net/results/5f81332528ecf849c894be638e97659c3781fc2a/


-- 
http://autobuild.buildroot.net
