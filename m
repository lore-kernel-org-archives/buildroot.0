From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-09
Message-ID: <20151010063016.ECDF9101CFB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-09
===============================

        success : 186
       failures : 64 
       timeouts : 0  
          TOTAL : 250

Classification of failures by reason
====================================

                   mplayer-1.2 | 5 
                  mono-4.0.2.5 | 3 
                busybox-1.23.2 | 3 
canfestival-7740ac6fdedc23e... | 3 
                pulseaudio-7.0 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                libevdev-1.4.3 | 2 
                directfb-1.7.7 | 2 
              swupdate-2015.07 | 2 
                   perl-5.22.0 | 2 
                   bdwgc-7.4.2 | 2 
               linknx-0.0.1.32 | 1 
                 lvm2-2.02.132 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                 sudo-1.8.14p3 | 1 
                mongrel2-1.9.2 | 1 
               alsa-lib-1.0.29 | 1 
                   hostapd-2.5 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
                   atftp-0.7.1 | 1 
              gst1-libav-1.4.5 | 1 
           libfreeimage-3.17.0 | 1 
                    ustr-1.0.4 | 1 
libsigrok-fe473123ba836445d... | 1 
                    gmp-6.0.0a | 1 
             lttng-tools-2.6.0 | 1 
                 opencv3-3.0.0 | 1 
              buildroot-config | 1 
                 jsoncpp-1.6.5 | 1 
             webkitgtk24-2.4.9 | 1 
                 mpg123-1.22.4 | 1 
               qt5webkit-5.5.0 | 1 
                   ympd-v1.2.3 | 1 
                gettext-0.19.6 | 1 
                    zlib-1.2.8 | 1 
                    dash-0.5.8 | 1 
                  weston-1.8.0 | 1 
                   open2300-12 | 1 
              libethumb-1.7.10 | 1 
                   mp4v2-2.0.0 | 1 
                  connman-1.30 | 1 
                 dropwatch-1.4 | 1 
rpi-userland-b864a841e5a459... | 1 
                   erlang-17.5 | 1 
xdriver_xf86-video-siliconm... | 1 
               libglib2-2.46.0 | 1 
                    glibc-2.21 | 1 

Detail of failures
===================

      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/abe10b1ff6ab6fc1ade32268ad76984150cfed72/
      xtensa |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/ba6f5f76ec7dc82e73e912891172aee79930da4c/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/7787f0fd4b61593cf3f299c83fcd5374ff9ccb48/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/e05d07ab6421643ce2a3fc678992c24d2769b94b/
         arm |               buildroot-config | NOK | http://autobuild.buildroot.net/results/602b3c57c2b1bd2fd2bacb2d2bd46dbee1b7f9b0/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4f29a2f99a4708ea3319a93076f720517e108000/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/9549bd14d39480c861f4cc9b5b58c78590942b11/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e7441d328d0ed34d6158622ebd8db722d3a36ddf/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/dbfcfcb16c936506eb3dcfb05ddefccdf4b647f4/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fed11fbb66d0df7c05a3c40cecf748c3bf0c7956/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/4893481bab16903e455db9d7276589212a15ec68/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/bc156aa693b3376c0cfca63d9d27e91a4f761367/
    mips64el |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/ad5024ad112d69fcc48c8e060c11a01affe31a22/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a15cb89d4422b1ec4721bac115e5c2aebd83838e/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/2f372730af975231924fbe34d1eda73b056b954a/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/588789d98eee0835ccb162e2895bb2db5f66e439/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/bc1a5a87bcc3c3e64df82e1c64240012e8e4f0bc/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/d45e9918a57a138be386e88c1ab0f706e5adbdd8/
      xtensa |                 gettext-0.19.6 | NOK | http://autobuild.buildroot.net/results/39552c300cce508fbe498fb4e734d5e191380c98/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/a4ebdcc33665899b0aec4c1dfb8118c359a67e08/
      xtensa |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/c17f074fa9d7ad797909050bae0119dda918b400/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/14e21401adbd3d84dae84d8f53531a2b1b668806/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/dc28e97a8461c776a3eb80c34a47086e6331db0e/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/29289c125166630aeaf884ccc006bcf12c8aa0f6/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/8092097a6f9ecd8e9b3da269b1bf03daaef4cfb8/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a9af1f8c958b4c8f9678b9c14914fe1b9a6a1b31/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/42b217da9f42cff8ceed7f567c069711a402dfcd/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/ba6f6cdf62cee5bbf4e6370e490205a23dde2b5d/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/488b379cd3d0620f1bbd2c656471f79f8591ac4e/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/08ca69e37e35ad94ed00fb4fbdcbf5bdc957ee55/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c550a3d1bd2a5d7463be1bcff3ab23acecb51726/
         arm |                libglib2-2.46.0 | NOK | http://autobuild.buildroot.net/results/c96d4916621edfb57e231d36882886491a2ce7e6/
      x86_64 | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/6dd2e23e35fe1d8dd5e0e1c3a4abb9a0d6c5ec55/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/dc5116dac8f798d7c0d545a165b8abdca4c6f3fa/
     powerpc |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/5bb55552f058072f83dfda76ecd7c62477d7b9d8/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/f120c57ce734823bea82d396c262a61a6b029105/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/32de21f69ca70e20b4143def442dd04f408e5972/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/dfe7248762d4307c627fbcad6686dc0229429705/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e14b66dee9034ed1b3c93e3e12fd29b337463ac6/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/f1ef46276fab28e29f986ce926efa32e1fe6582d/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/53b6d50da0628e4f423382188c542e44f534d277/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/7a45dfec600c76f364f4100f0ad123bce20652ba/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d60bebc46e0fc091bdcdd306bdc260f60a8b5803/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/150411da6286cc467772b372e8a72725bbe11144/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ec8e78c059dd26d7b15deb7b09a6931a0b848902/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/179eb21885271277f7bf52184c05b40073b42d18/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f55b0908717822b9c4492aaf49908b11343d5134/
     powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/01b35af74c69a673ff2c8a32cc76ecc0ff6cab43/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/d250a65a945211da631443f696ed3f011185a3fe/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/22f8ecc24db150a2fcd0f415356ae1e5dee34f02/
         arm |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9a041af3fa062ab58fb318d5c7607b154c13174b/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/a010f4b32b71c012da1d13d8e8165827201e0e20/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/c7a69a8995cbe0ae099ac75b5e40050fdf64cfa0/
      x86_64 |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/af09926fdb97aa8b3f0028fcc6d8f6a47ed45051/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/bbcc7ae19ff686259e17d0d094e58319304607e9/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/5dc17388fc4a506e03076d17b7b95b6f4f2bbdef/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/95ee022add456ede332f092bc9c11804af5a94af/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/af087cc26afbc2ff51156342b1e4397a4d5039c9/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1af37ba19a6f8996d506335d9c2e213fc304fe2d/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/1c8989665fd39a3b32a64485bef7f7d891fae148/
        sh4a |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/664f412cd1c3f3708bdf8230ed915c6565c57f52/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/073105a692033665d31b2dc034eff2e0fdca7f10/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/ff98f8c5feecdce3670def75aaf73864c935f05c/
      xtensa |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/a3562143d905a52e3609c00595f8c7d98be0f4ff/


-- 
http://autobuild.buildroot.net
