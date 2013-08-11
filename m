From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-10
Message-ID: <20130811063005.A819252C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-10
===============================

        success : 96 
       failures : 74 
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

                  ltrace-0.7.2 | 8 
                 libffi-3.0.13 | 4 
                    acl-2.2.52 | 4 
              strongswan-5.0.4 | 4 
                  zeromq-3.2.3 | 3 
               ruby-1.9.3-p429 | 3 
               libglib2-2.36.3 | 3 
               alsa-lib-1.0.26 | 3 
media-ctl-ac40b79f002a2315f... | 2 
               binutils-2.21.1 | 2 
                libtirpc-0.2.2 | 2 
                      icu-51.2 | 2 
                 qt5base-5.0.2 | 2 
                valgrind-3.8.1 | 2 
                  libv4l-0.8.9 | 2 
           imagemagick-6.8.6-2 | 2 
                      udev-182 | 1 
           libcec-libcec-2.1.1 | 1 
                   cups-1.3.11 | 1 
                sdl_ttf-2.0.11 | 1 
sconeserver-d58f2de88c68193... | 1 
                   dbus-1.4.26 | 1 
                 libpfm4-4.3.0 | 1 
                openssl-1.0.1e | 1 
                   neon-0.29.6 | 1 
                  avahi-0.6.31 | 1 
                 wayland-1.1.0 | 1 
                 binutils-2.21 | 1 
                   attr-2.4.47 | 1 
                   mplayer-1.1 | 1 
                  libxcb-1.8.1 | 1 
                directfb-1.6.3 | 1 
               libcap-ng-0.6.6 | 1 
             gdk-pixbuf-2.28.1 | 1 
          enlightenment-0.17.3 | 1 
               uclibc-0.9.33.2 | 1 
             util-linux-2.22.2 | 1 
                  libusb-1.0.9 | 1 
     binutils-2.18-avr32-1.0.1 | 1 
                     apr-1.4.6 | 1 
             tvheadend-5956233 | 1 
                      bash-4.2 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/657c814da7da6456776e2ea03539530a62cac67a/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/e0ed33287bc96420306b07faa517552e7c2381e4/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/1ec10d2cd1d0526c2441025e4ff1e35ea2261b50/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/8515c5b0e8bc6916ca59ffa5c56f69f06d6856f3/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/be6ba53d00b8f80624ca09a67af6e83adfe79b06/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1b0e165c530902504cd51365b1248b62e464fe3e/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7708a9aba499ee260f829ef9a30efac2c589ec7f/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/3f51c7d871be81cb1306b539e632bc69f7f27824/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/1228e9fb46fc0af0490bf34f299f55f912a4b2c1/
       arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/36aeb5195a3f484c1574e7471fca9643f580733b/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/74fb08194b8ea6151f4f369fb099b72e8b254e61/
     avr32 |      binutils-2.18-avr32-1.0.1 | NOK | http://autobuild.buildroot.net/results/6c1632ba3afe0046793cb9ee84aaa1b3afcfbee7/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/2134cb1b24c1a2505aabcc5d0c1ad6801bfb6588/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/b5a3ebaf2aaa4c1e6069ded74bcd8a26b16a5756/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/a68bb07bd770131e80008934f34bdbf14d852179/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/d9bbed8d9590cbf27e3d09965ac908b53d7884fb/
microblaze |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/a9c5b63d6cc33fd362d17be2d77517d950acb16c/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/21677bbcacff4cdf6ef792ebf568aa3a8887ffc6/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/a371d3e50eaf570a28447c3751911e8dff8a224f/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/47f12b856b7158438511f2d8426e608f2e12c2af/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b8a857573abe0977c2e02f033a9b1743cf9d2ea0/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ffc0568088bf25fab0e50f065bf3207dec53a117/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/d64c69070d82faf5f66fedeac7ed263ee9ee79e2/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/fe7b8e8615847cf668b49f2dade542ccd3bd95d3/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/2bbdd8f63bea97f97fa18979179f2a6a02b6bf5e/
   powerpc |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/545d15d25109c22bf0332b3b28ffe8110dc4cc4c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1877c979920fdf7c2645d4d057d1dc9190462a1b/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/78805b789741ad504e636490d99d15e31bf7f6fe/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/0d619da9eb72a703657d539b06851737ff2284ae/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1d0799c63a2bf239ddd0dc94d1412fd1f136e9ae/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/487732d976b177307d62558459bf750f3872c7c6/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8b6af6548a258da04e3f62680a3d446ea79dc130/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/8f13aacb2ecc3ebd315b48faf1f5e3ca3e439c5b/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/c8261e726bcfcb07078638d98cdf1d19f5812cf2/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/5acb3ea847889483abb4163d131f122572893609/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/9a858890467b5765bc95fb75cd69c9fbcb07c2b5/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/4fa970673522c6ab834531bd7109c13f7bb520f6/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/a8851e14bfc2bf7c5d096705cf1b7357aeb15497/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/fe6bcfb52ad70e08c2acfbc4690bc74ee2816bad/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/5ff5e14cc2bce05180a7b29ce907b2097ed580aa/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/29ba67aba55dc03297e2ea165549aba2e5bea90f/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/4c56172a1c695d601ad406797b8be4f9a6c4c9cc/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/02389c067be8e19b366a59da5ec0d58e79444354/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/178c111d1d87b21a71d6dae8ef24fce3e1d95315/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/b1ccd879bd4b6a673bda80747186255d731e48ee/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/62c9546ea46d96018dbab9f7773d0d6aa8c5fdb9/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/327532b492d2fd90fc213010993281332e9afaba/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/dd7cf44189e2cb964756cca1789326d8cad3f8ce/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/efd48f4158dfbf90718c37f3ceef79f87ffbd87a/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/092a07d006449b8c654fc6fc23c6c5562a58d67c/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/cc4458a1935b9952fe1349334d1158a6ad4ddf3e/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/762499b07fc8808c199d2b0b2ba8ee1613b343a3/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/ae2466c09efc12b9d9888680a6335ed7da6c2d05/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/39c3d843f64bc985747e890ec3d90653b5ec4475/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/fff407e3918e0802528af5f53f8d7481157b6f3b/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/f9f40afeef2993f701c011d00c3d8aadfda8a082/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/b32a1daffff92bd03ac67310312e1b8181f271ff/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/841b6e167a76e718e8ca60196b3e7574342233d8/
     avr32 | sconeserver-d58f2de88c68193... | NOK | http://autobuild.buildroot.net/results/99c8f369263c830c1f69615d0e4cf3961b5439ad/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/b83b79285d641a39ddfd08df22ae1c80ac3ce3ba/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/f8f81333777286411dee4021cfe9cf7e53f7d329/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/fd063f11899bc49d20c20e11d21b1473924fe51a/
       arm |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/da88d8b74ff4188d818efa00945088fe3d0c6a2d/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/9f8c61661442cd4e77ebffef263d09cf77524b20/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/6d07e16956b1ad1d8d2280830ff8a261b4bff1dc/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/0ee47ff4d023a9132859551fc43d5119263be939/
   powerpc |                       udev-182 | NOK | http://autobuild.buildroot.net/results/0f074322ec09a2ed4e48b061a30e2e7b8b3ea5dd/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/cab2050f66dc8394746aa39ce4302c3aabbcd572/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/2a3900bf84089c6556efa32f5c468cd80bb809d6/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/9edcb7acd6d16f2aed3a6df515353d435f1836a6/
     avr32 |                  wayland-1.1.0 | NOK | http://autobuild.buildroot.net/results/5afc0b5dbfa6a6f1e1ccc6817ffb00f885b08ca8/
       arm |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/2eb13b5cc2eef4f326aa95fb31cc0afeb70ac768/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/793e2b64e5fe0911d28eb9facec633c880bd5207/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/773a1256b2654c5cc1d1727be2368a8bd6c2c971/


-- 
http://autobuild.buildroot.net
