From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-17
Message-ID: <20181218070027.249162072D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   0 |   0 |  10 |
   2018.11.x |  14 |   2 |   0 |  16 |
   2018.08.x |  17 |   0 |   0 |  17 |
      master | 102 |  71 |   1 | 174 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

       gst-plugins-bad-0.10.23 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

       nios2 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a6565473c2979d4c70aa8725c03f11bf099927fb | ORPH
     aarch64 |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/dbb3c4634d5fc726ca0b27c2dac0befbbab70912 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 21
                   netsurf-3.8 | 7 
      libva-intel-driver-2.2.0 | 5 
                  linuxptp-2.0 | 4 
                    php-7.2.13 | 3 
               asterisk-16.0.0 | 2 
              drbd-utils-9.2.0 | 2 
                  ffmpeg-3.4.5 | 2 
                  libssh-0.8.5 | 2 
               util-linux-2.33 | 2 
        xfont_font-alias-1.0.3 | 2 
             bluez5_utils-5.50 | 1 
             bluez_utils-4.101 | 1 
                  brotli-1.0.7 | 1 
                 dmalloc-5.5.2 | 1 
       gst-plugins-bad-0.10.23 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                openobex-1.7.2 | 1 
                    postgresql | 1 
                 python3-3.7.1 | 1 
                qt5base-5.11.3 | 1 
                   strace-4.25 | 1 
                supertux-0.5.1 | 1 
              swupdate-2018.11 | 1 
                 upower-0.99.4 | 1 
                xapp_xgc-1.0.5 | 1 
              xapp_xmore-1.0.2 | 1 
                xapp_xsm-1.0.4 | 1 
    xdata_xcursor-themes-1.0.5 | 1 
  xfont_font-adobe-75dpi-1.0.3 | 1 
   xfont_font-micro-misc-1.0.3 | 1 


Detail of failures
------------------

        i686 |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/9cb8734c96ef220b9f433553c862ee14bc692e5c |     
         arm |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/c4b14d41f0ce5904bdc4340f1f686f558e8df1ad |     
      mipsel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/333f565ef4e41d5925d1546eea76292a69b4ecf4 |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/1fb75443fc7181773a43cb9f6cebe5fad0845be8 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/d25e75142503b9fedb249d5539d9edb3c7962315 |     
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/65eca64b4cafa7c0b9649e98ba2263221dd820db | ORPH
         arm |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/9bd29782b5fc0c0d8efb9ba4363013de12b0e964 |     
    mips64el |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/7df932d21deb4cc85299d4655f0c217a62899c90 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/4df45621809f548179ca6b497efa2fe6714cee19 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/8b125463a443b5c814ce6f52cb03900b7231ff99 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7f97c36e8bcc18bff3c54a525b80e0cac11b4e69 |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/13b5dd9ab17c9fb41e167696104ab987d04470d3 |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7a682377580e13f154597410d5912ac0ab531ca2 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5456f208b1e6c13c4c111312f5ac1591c97bfc21 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/029f6743c72d27339e49d0f97913e57f2727a33e |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/69b2eda6fa03ba89e7e369e0569cbc6452fbd512 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e95e1d1f2f371656a81b3b4fa3236dfba790753a |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1fe098a54744c154bb5cd3bc1005eddee706006a |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d803012bfdaf1c19ec3ffbb4fb32b3ac2fab9977 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/efa88a665997eb486b6977014f9fe9c351a73b14 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ecbf649594e8221ae111372ee393f64932d8bbab |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2312e0ed236ca598f7d221f3c5e26657eda21c76 |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ae15e61825d00d6a226b9763eeaa02582c7fb826 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3ed43d2c3d7b828b2a857b243a81a7a635cbe105 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4c12d999fe9da546cc40b62d833b804af193b0fe |     
     sparc64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2884a2c794e02e0c98e031b416ccd001e11137cd |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/62f0a1d9c06e5b4751ed489709442ac10e7c4b81 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8ce74b0885e9581917f4078fb3052cf27a33a731 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1d8da4a751a350b74ce9d82e26caaefcc3fae8b8 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/da8abaefb2a3540f2d9e1ce5dc519400a959029b |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0e770aad4a90619221e2b602d7f27212ff581213 |     
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/9eeeb33fc1282d4158266055e73934010a378999 | ORPH
      mipsel |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/295cfa8a6c4f4a82bb221f3888aa25d0d3031072 |     
 powerpc64le |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/80e514300ba5db0fbacf15f57fcf2f8c6aeb6dd6 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9a99405363ac5c10d49146b8bd3547e5a3f0a305 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/7e863eec6191302aded53a7fa15ee8c4657ab2b6 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/00d14bee8b122545f98cf85aeb091a8b863ac6af |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/7ae411e4ebac5cabef1bbe0e27c3e1f370677638 |     
        i686 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/bb1faed7017a7d362d6196fb5788bb89dcb78c10 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/3ed0043db02cd617b61569860904d8a0a195f806 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/08023b22a88ce944cdaa4471167a1e2327f01669 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a5f0f4ae7984d4fe3f97986173b045f19b82d195 |     
     powerpc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7812d514cabb787a722017599ca810ceedf03cfc |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/cdc395934211a81c74947a2e11155423f7816e6c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2ed15027ae30c22c93cbe037088f0de53ae32f93 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c9fa930d7db52924a9c5f5a8208e2daa974eafa0 |     
 powerpc64le |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f54962c71846f85827987eb886e88c3bbf4f30fc |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/672683fcc07ac4c8c73ee220954b308e5b135a1f |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b8ebd60cdb62dbf9c40020d535c61191f650a9a8 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/33ce1dd7176a686baa9223a4a25e9fb36e0a1e9c |     
        or1k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5e9dd6b6339b6da7aa3d7cbe2b525f61ca4fcdd5 |     
         arc |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/8c83bed3a34b101fbbfbf5fa7a08a67b62ffa16e |     
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/1bd1d7016e532e3f407435c1319ce7fb06cb27f6 | ORPH
         arc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/6c8beea1be7ae6887fafc805a2ff5abf8b2ac5ac | ORPH
     sparc64 |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/d9d9e19e429717dc130fbdcdf97876e09b48245a | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/940a906efbcf7544b4c88e637161058b06052d34 |     
      x86_64 |                  python3-3.7.1 | NOK | http://autobuild.buildroot.net/results/24b5f7d56a87ea0b072c40e5a34c68de03ee2428 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/91e7359df3fa8ce8419262e5fa81f79e3ec0bea6 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/1c608ac25ab39a0994e1e3243f472cd6a4a2ada7 |     
  aarch64_be |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/61c2e1db3c3e8a9aa771f322b49f8d4c2ac21a6a |     
  aarch64_be |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/e6457f911abfb1846d9318e78625793d20dc24e8 |     
         arm |                  upower-0.99.4 | NOK | http://autobuild.buildroot.net/results/5d171d83d2f056abf2365b1653003b29156ee72f |     
         arc |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/4ae49ecb32353b76205b763e2c52c9e8c48360f6 |     
         arc |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/c524fbb192a9f12f147568a7d58849bff923e897 |     
         arm |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/53737048d12fef2a30305cf7d5195f6a77e51c44 |     
        or1k |               xapp_xmore-1.0.2 | NOK | http://autobuild.buildroot.net/results/49b613593c47b4a96b2a4ad71eb933243520e5ed |     
         arm |                 xapp_xsm-1.0.4 | NOK | http://autobuild.buildroot.net/results/b0652c282760a302f46f3b7ed62186481a55904e |     
        i586 |     xdata_xcursor-themes-1.0.5 | NOK | http://autobuild.buildroot.net/results/28835beac815a0f1c4ce2a8c7676793882d6a26d |     
     powerpc |   xfont_font-adobe-75dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/da8e3aa5f606c8171843e0626b607415691c2061 |     
       nios2 |         xfont_font-alias-1.0.3 | NOK | http://autobuild.buildroot.net/results/845c6807de7d22236a87299e80bd8dfd6f5cbcd1 |     
       nios2 |         xfont_font-alias-1.0.3 | NOK | http://autobuild.buildroot.net/results/10d8af571bff2de549c7568e6bbfc0ce5c7a81f9 |     
         arc |    xfont_font-micro-misc-1.0.3 | NOK | http://autobuild.buildroot.net/results/dc38f78d7408ff5763963eded097bcd826922d85 |     


-- 
http://autobuild.buildroot.net
