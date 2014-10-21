From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-20
Message-ID: <20141021063015.C21E7101334@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-20
===============================

        success : 178
       failures : 205
       timeouts : 0  
          TOTAL : 383

Classification of failures by reason
====================================

                beecrypt-4.2.1 | 57
                  avahi-0.6.31 | 20
        glib-networking-2.36.2 | 17
    host-shared-mime-info-0.90 | 13
            ecryptfs-utils-104 | 10
                libsecret-0.15 | 9 
                libsoup-2.43.1 | 8 
                pulseaudio-5.0 | 7 
   sound-theme-freedesktop-0.7 | 6 
       xkeyboard-config-2.10.1 | 6 
                   lame-3.99.5 | 3 
           libmemcached-1.0.18 | 3 
                  polkit-0.103 | 3 
                busybox-1.22.1 | 3 
libshairplay-64d59e3087f829... | 2 
               alsa-lib-1.0.28 | 2 
           modem-manager-1.4.0 | 2 
              uemacs-4.0.15-lt | 2 
                 libhid-0.2.16 | 2 
       liblog4c-localtime-v1.0 | 2 
                   systemd-216 | 2 
             e2fsprogs-1.42.12 | 2 
            libvncserver-0.9.9 | 1 
                    ruby-2.1.3 | 1 
            kismet-2013-03-R1b | 1 
              libarchive-3.1.2 | 1 
               metacity-2.25.1 | 1 
                    orc-0.4.22 | 1 
               libsigsegv-2.10 | 1 
                   duma-2.5.15 | 1 
                     tcl-8.6.2 | 1 
             subversion-1.7.18 | 1 
                   nginx-1.6.2 | 1 
                  botan-1.10.8 | 1 
                  python-2.7.8 | 1 
                  zeromq-4.0.4 | 1 
               uclibc-0.9.33.2 | 1 
                 python3-3.4.1 | 1 
             alsa-utils-1.0.28 | 1 
freerdp-440916eae2e07463912... | 1 
                    fltk-1.3.2 | 1 
                    ipset-6.23 | 1 
       opentyrian-2.1.20130907 | 1 
                     nut-2.7.2 | 1 
                 webkit-1.11.5 | 1 
                  prboom-2.5.0 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/bdf36b8b29d2c7e60cafe6b6ea18a2e2f1745ec1/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/e6e7d820c675b1241ddfe08a1285b061b462c9f9/
         arc |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/dda11ea4adb86791962c300fa539c7cd1483eb72/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/2c68ab8bd7a4c7ad60a354cd468241683fe0dabe/
        sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c1b818dc5c751acd828f24f57a1aac845a99a6e7/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6ee9fd9682d8a13972a734e47add7ecc26c35bf5/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/47bde348cb97f8dc58293df8ac83b89820d65fd9/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/2edb9e10dec8ccc0fbdddc4cae74ea2941637047/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/efac5c8965576836fc907f0371eb0019dd8a511f/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/999404b38ef6e30e23b0c440051b5390825097ca/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6481d53e6ef0602047935f1c021aa6fb2e969c34/
      xtensa |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/57659e65e7ee36f44d794af3e34bb5fea25a77ac/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f2fb9db99b563bb55d959200af295798e55fe36a/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/41ead3f99e7fc64680eb214169e9fc899ac07f45/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/64140fd9780c543e8e0d8723b687b2cdd363a712/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/fc6aee97d0ae6906653e31f55885c0dcddef2a71/
       nios2 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a10696818e547f68cb2560502dabd74b2b2a153b/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ab4fa4a7c02f23283ac9f034a40c0c5597f8cdc4/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/fb92e1743b160533927f88e619b6ac62b04d8c91/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8740da9670efce82df13238bcad83d45e5b43e1c/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6c295996ce13edb37f350ffc646223841feb08b3/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/15f8e76c7b33ca504cb728ff92ec7c2bc2ff77e6/
      xtensa |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/1d68ac09e987e21444050edc6524fd9de83f1b4f/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c0adddd63fcb32064b8ef3568aa19476481b53c7/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/158be01a1206f349a1cf64c4acdbf59b509337c6/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/15ceb9c8685ed6d13d871c613508d7e4d0ab3502/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/690ef458e0a002c7bb6f7b91c96bb07278c275ae/
         arc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5c774ffc9b3af3b103057a9c5e80e5c7721e8e03/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/29abe32b237a12ac1769116bf815eb7e38586eb8/
         sh4 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b4ab4dc727241b4ddac1326e1e800a7283726a2d/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/dad806ce5e41cfdc96ad852875f18420065cf25e/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/abe22a767fc02c3bd3a51354ba0081045c32eec8/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bb15ace778124718af283b1f9ec388d6f3a6401d/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cd401c47ee8217aabf6fc491495006aeba605aba/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/fc91a176a070c5eef404f2804921cdd3a228469b/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/82afcfc79f6818d65ef978346bd6eec0d6b7bb5a/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/82ff08a70e69a477e5d2ae86a30440a6f5200bee/
microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b72ca3b2bd1617d776583c799e02a63af223657c/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bc9bfef80d789defacbe77d2074063fab540f4fa/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b33155f7b99b3354001f3523d3e6cdb30e1c81ff/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b1e452b9904331fbb4ff1802c217def7651274d2/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/890ff3aba6bdbeb78b1793a044da8e0461dfd93d/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/48b43f35209c490cda154497837fc4c70d6922be/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c415935658d5607560dc82d8aab5b1ee54705ded/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3f52c3398b694acbe1520f82bcaea373612e7ce7/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ad9089ca4f91472001e2d819a8f34c61b53d8144/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c17e83eca701803db6e6a2580b16df435b802562/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ae79889d5d565b799d54bd456bcfe56a9f6c2842/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/55c531180ab07cd98445274678167b850caf320f/
       nios2 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d63ed5a6cbbf493584ead1cd7121748d71c2b75a/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8cfbd0c00e2357b8670d90dc1465cfceff3088dc/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e68993023e0367ff2fece15f7d04d7fe071db22e/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5b1e9ecaaa2c38963f9cfa313cb2bc693d99d254/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/578f4d658ea64f3d56e7b3b00397718aab7ea945/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/553f5bef6f15edf1f91bfdff061bd8c01cdb8668/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ba2a08526a5ac78bb2fa0058534baa132c076704/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ff4187c93a73196686119b4aef057ba3d6b6796b/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6ff360b3c2960ce7918adddc7e9642daf78f2c1c/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b0e096e11f6281501a23a69517e55fbc41540d35/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2639a11bf7f83c3817059dae7e846de29f16d03f/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2f7f11e4e4b15512f72dac5effb562c8098dfa8c/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1e625b34558ca664409a8822e45a5a224f48df7c/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bdea32d6b84c0922ff5fd74cab5225b2526eb00a/
        mips |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/423a5934c73049280765b9ce7e4b042da94761e1/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a070042b28fd3ad6efff3c3b9b6dd21d1aee7d07/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b872d69849004334e1c5ed16604a917350839a26/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3c5f61df39550c231712c58c53f5bfe1b0b317e6/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1286fb08a060890cc3669c8e20e84f8eda40a993/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/63b591fba47cf96a41bcc89479ffc2dbb34d5fe3/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/04125b15213f36621b96d0308562382108732dc1/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1f343e68b2cfda6dee311c9907b53d5a7472a8eb/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2488d5df5efe6a24ac1d8a249a59d14dd4a234e8/
        mips |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6f0eecf0050d4a52e05d7f66ba1900755b71c3fa/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/eb885c393c7875fa69fc8a2c6d7d0aa3ee566ca2/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e6c998afc345088616b7af8ebf2bf686949896bf/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/93cdc867861d82e9858a889970bfe34b0b7c65f1/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/58fe6a8f62164f9acef59b96d0d1ad176b1348a0/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/004cc01960354759d617b20e9d3ded9b121a8fcb/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/145b1fbc735afb4203cc5e4559f60105349853bc/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/f6f97467ced013f01fa4700ff8020c85c78c3f6f/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/a69ee110478e48ef749a94aadd4698dc646d8e42/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/c83141fbfd63fd873d00cfa298ce559d81fc730f/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/91f4dbb3b48140276e4d53dcbc36e5934e2f89cf/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/a7a3486b2bc0716a94783e48fc318aa8bbd22e35/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/448ca84009919a8af9731500b9a9e93647f54466/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/5041025fa939060067b51c2dedd0c05467af73a1/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/4dc47ee5c45bc67ef92b3d053b11f97690b70a4c/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/77e62b3dcfd1ca167b6e910ab76e6e621fb1fde5/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7e8e7d19e353dcc6796dcaf6e3fd8b0ee43b11cb/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/123160fd681eb7d33567b26ee34c59a7f12b19c6/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/be02e70b9c18f1832e5e8338e7f572b3cc276042/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/4d42e86941810390fbbed0d7855b83d447a73930/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/38ecd2733a425f56a3f144eadef8d2445f503b9a/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/16d8e9d800e04a6f14ea914552140ed76f1d288f/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/574ad97a763594c217648e4fa5e71d62bd6434b6/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/e7dbcdf220f2cdae78265579f9cdf23b6a711eaa/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7ca508ee27ea453a0b1eaf48a4e040ea93ba4a31/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fb399e9c1253b6d076a41da994b844771b3e222d/
        i686 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/db28faf1795d968db8296072f2572e741da5586d/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0eda5b0fe9f7b256b0bd3eef00bcdc7ef78a1bd9/
     aarch64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/b55e5bfc7e71a7629897e2b3dfe410fc926aa690/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/319d19a33f0c5a71cfd27bcc7188736da5d86eb2/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/05b4465db3d62f3e269fb208e5358a190271242e/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/415c09eb9486e20adc16069890931e345a06ffd6/
        mips |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/8214f8643284928fb1d3112705410fbc55eaf571/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5133bc75ab9be9e637062cd71f2c95fa4d7ace49/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/29c6e9350688bd377351c6b33844e43526047d45/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/316129db47d4d155e9eab4b6edf4c5d8229acc9b/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/4735ae38785cd35a54d8b97a11bb0ce6249b6a87/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0b045213bf79c782ed3718e08f6e614d186b9f88/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/02a8500f35e607bc147baa42d539b1e4d63aa927/
microblazeel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e800e3fec02a476b3d869e3c3a4baae770aeceb9/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/7fc1ffe0978b4160d3d94073625b00b4ef0a3c11/
microblazeel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/5a9e2a1fe79c8fde8ad88da54c6adf7818930177/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/47cbdc4a9d07eaa0d423563e8437e0666abe457a/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/9a990972509ae69b90e3cfd7e971880f67299fdd/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/886ec5507ad5b63876a1d598018c3588a8752473/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/be31fe186bc9c396a14e88faa7d88969153658b5/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/35c835e88d7e0c4bdd26a3350232cb798b271446/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/bcc07f8f0eb7b3db211d6eb11223129823dfb7b9/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6433f866f446a8d90def76a837f097a28b15119f/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/135cf19e9a290b4015d4b57c9c3996228dfa27dd/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/0b7d757565975dacd74103b773be74ca76331ec7/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/998f04795d28521263c41aa4445994a2d7bb393f/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/72133c0e58a79e3e0c96c3430165c786963fd383/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/4c6969cda3ff09acef084bad9a91a01a0ec253c1/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/f0bccf58fdd56ef036fa1097324da8355cd5f701/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/33fad70b1b4845e3a88ed659f7d5726714aad2a4/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6e6f86378dfc019e317e6647a434f4f414b06e94/
      x86_64 |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/c642336390fd1d448d50abb78a88f7e28a4c5a7d/
      x86_64 |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/3667b6c0ada7df97f81180577cbb7db1adf97984/
        mips |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/9ae6f218709ae0d9a030bedc5e2454c05d6dd990/
     aarch64 |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/75114ddc580a1216632c16987cc987df720fde43/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/5d38eab1dcb3ec288f1ec8e122070c61c961f815/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/5b0613a8abb9a4305b3c7ccee9c1e3642a609cb0/
     powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/eeffe5aff946c7448a1193f825c87b4840d2965f/
     powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/6eedb69f1c966876dce4a4433b4d8eb1d8fe4dd4/
         arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/ce8bbb7fe83bea4c9fe44b910bf380e4e5a18f8d/
         arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/940ea63d9af33aac4b15812c589f5bb35d98600e/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6f7d75965969c861c9baef40fa33e35ac88e1ab8/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9a09227aa30e910666b58613db7768e3e72c6514/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/dde78ed3b7aaf51d79d3496fd75fad5c7176c7f7/
      mipsel |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/34004cb0dabb90690b220753056fb8ffd89d7899/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/19691fcc96a7d30d03b9aa93c68c63a583b189c9/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/5f1e9d8e85305dccb3386344d7f3346eab88b074/
     aarch64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/4684e1edb45ab7cbf2af9532cb7a34a1ecc097b9/
    mips64el |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/198f3da1c6c76d640b71e11bf47cd0b646750ca6/
      x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/d48923f7a399bffb1159e873bb58cafbfd588823/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/8991101810233b1a1f8f3e6fd9b12c1b3830025d/
      xtensa |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/47424e118f994ccd06a7cc195760614e374ab6a5/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/eab55db0cac5c7984bd00386499cb08a8b012f21/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/f68136bf3259224a490041da766544dfe3dbff8b/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/5c437123825a07bd0456d7e8b4cee7718a948ab5/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/99d54d4c9ff82351a0eb871869ae241855d514a1/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/90a058163c8a4dddcb0bb01ed5be3f1229f4d5e0/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/56955f9a73172b1292f9762ebe694edebaa08fae/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/8b4bb5461893a2832211c36f1d1383a5a8e0d5ef/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/6eee7ed9b883622adeb0ea63d2174d6a43090330/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/add1e264b8d0553341c2d061f30b366c4113e9fc/
        mips |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/702a5a9d73268d451c29b9eceabe578f682789b0/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/1cef0bb6c8e4edb7459ec5dfdc935570b378e993/
      mipsel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/30cd0152fe954dad7dcdb68a0976f00bfbae03ae/
       nios2 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/154b6c55893a0c8c152db29c347f7d85fd60fc4e/
         arm |                metacity-2.25.1 | NOK | http://autobuild.buildroot.net/results/c4bc6678b70719eb2c995687a19c4b9856ffdb51/
         sh4 |            modem-manager-1.4.0 | NOK | http://autobuild.buildroot.net/results/9028cf48494033b479cd05e28286cb2138c6f1f1/
         sh4 |            modem-manager-1.4.0 | NOK | http://autobuild.buildroot.net/results/1975e833a0982dd2b0861a6d3a6d64efd2951cf8/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/596a273c2aca3f59c5dde09c6960528c5c5cf9f6/
     powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/f4c5ac72dc175c0dcb39afae0ae592a86ea5d46a/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/6ef68b1f4f085bd3c70d5ecdf3765f3333f0be94/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/935e39facc4f8651ce42c99595bae3766fda66a4/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/d7a7584af1a28101b0e066ffbb8c29211618408e/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/5120b69f873cad974e9d27449eafb00dfeba176c/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/43d6d1058cbd621ee01ca59b442852aacaf5dbf0/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/81949e75a2440435091204af489cbe794c89972b/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/206f2e59efef0ca17bd7516bcab8b9d89e8b0fdb/
       nios2 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5e2b9f9fbd8b3d591ef60961b0c56c9976128534/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/1644159ebb3127b4b6e5122142b98399667d7c36/
microblazeel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/88ad467a4dcd315d888acfffd855cc95b445b432/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/b126abaa8f7ea2cdaa08bee25e9076429c2fd33d/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ab09ef93b4e5e5eea471d5140f8dfada8e58607e/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/d6a222dda7174c6c93cce456439d72f4157527b2/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/a5081927fd99c8192e940bf809e38d4706caeefc/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8fd1fdf5f02365278a280d50adce98303fcc9a2a/
        bfin |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/c96548ad8cc12f0a72b63eb2e633eaa9b8b8ba29/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/29960c497b1ee76663e647561763d84b1007cb65/
        i486 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/bbb73dc4e84b26839c4de90f2fcb10a3f174caf1/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/6117b202db6ce79cdad3506bb26681e9f2e15f95/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/e1e4fb38b87249eefa0a74f0fd3e6059070060ae/
        sh4a |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/f2b53e4fbe2f7df4aa0fd6241817662fc2404123/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/1496b08629a3d69af720b4d42c2d0496043e241c/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/658533cb546bffdc8ba07d769821dda3c8925b34/
         arm |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/a360d68d508e36783bf6b4ea0a04021f7b7d515d/
         arm |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/8921283f38649bd2e8027bc2ff3bab6adf2df61f/
     aarch64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/dad59548aa1c4598568d076c80a7a84f9e2b457d/
     powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/64218b2bf9bc240be10554342fed0128679d94c6/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/c9186f60b0a7bfd832df7c261cec5af26548fc45/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/f4b83426c8d3aba5ebc3484ef95763287753d213/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/9aa9537a91834feb05888585be1b3071d5cc726a/
        i686 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/982b3de63723662a284d84ab040ff87463615774/
     powerpc |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/41b3c992f34c5e2b9bf5595f2ef22dc609de76c0/
        i686 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/c0aac6c9ebab32f5b909be739a148c3635747240/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/f1a5d6203b8e709ccab17cdeebd1607e4baf2de7/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/4a82ccfcae6f5969056bb19abe611bae75e3b09d/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/556abda9ff7cba6acfc0d6d6c478f16c385d7294/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/8ff0dfed197d19d1ab0ff33cc756051477a15948/


-- 
http://autobuild.buildroot.net
