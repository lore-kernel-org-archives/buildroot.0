From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Dec 2018 08:00:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-14
Message-ID: <20181215070020.1951820C36@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.11.x |  20 |   0 |   0 |  20 |
   2018.08.x |  19 |   1 |   0 |  20 |
      master | 101 |  73 |   0 | 174 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/655f054c5855a5a91316f0e27307cb35d5836c80 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              webkitgtk-2.22.4 | 1 


Detail of failures
------------------

      x86_64 |               webkitgtk-2.22.4 | NOK | http://autobuild.buildroot.net/results/8ccc0c6575deedfc122bb01c62ce604a3a1d7c85 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 27
                   netsurf-3.8 | 6 
      libva-intel-driver-2.2.0 | 4 
                 mesa3d-18.3.0 | 4 
                  ffmpeg-3.4.5 | 3 
                  linuxptp-2.0 | 3 
                    php-7.2.13 | 2 
                   strace-4.25 | 2 
             xapp_xclock-1.0.7 | 2 
           xapp_xditview-1.0.4 | 2 
                xapp_xfd-1.1.2 | 2 
             bluez_utils-4.101 | 1 
              drbd-utils-9.2.0 | 1 
                   eudev-3.2.7 | 1 
                  grpc-v1.16.1 | 1 
                       kmod-25 | 1 
                  libssh-0.8.4 | 1 
                openobex-1.7.2 | 1 
               pulseview-0.4.1 | 1 
               qt5webkit-5.9.1 | 1 
               util-linux-2.33 | 1 
  vdr-plugin-vnsiserver-v1.5.2 | 1 
        xapp_beforelight-1.0.5 | 1 
               xapp_xdm-1.1.11 | 1 
              xapp_xedit-1.2.2 | 1 
              xapp_xmore-1.0.2 | 1 
xfont_font-cronyx-cyrillic-... | 1 


Detail of failures
------------------

   powerpc64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/538be525f0b8f1de2d9f7083e5571b4129938aca |     
     aarch64 |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/c426fe8f8cf6a60d6a4268a2cb336fb6c45eee13 |     
    mips64el |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/fd27fc00916877ac2d2cc24155ec93f5555ddf4c |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/5af6d643a4dbf6d8dedbbe78f93d7443b694a0d2 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ee1dc8c4fe24712640fccdc62f1e27e79b35addc |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0dd5ee8e27b9d5c044368d0c7823ef8dfaaddcc5 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6c816bf76ed5295661a60cacc9482f71eb78df1d |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f464d6cfaf0e7ad076968b9ff384e9d285b59151 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a62b98fbd3ec120a7a7749a7f7922fe34aa6419 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/33a25543f971eac49483b72edbc4bcaddf177f58 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/faccc872651e7e8f983982ab85ec3297555f456e |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a15d0010d367bd113d6c06c0ed648a50f05be926 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/26fd14565a31aa15e9f639825654d12094a59d1c |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4ccecd269185c1195a50b85230d3f9be7af7805a |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/28ca11da4c5b8ad76f4101ad775b66d00e461b87 |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/73ea1a60351b1697996dd9f69b39a2b858a1715d |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7f19b82bd9dadd4ef73308e2ae225f36275974fc |     
        i686 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/16df25074d2bf1f2a584c76bb12a95ae7493522f |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b6b2ee8f62aab03cd204950a3df56e5393d08719 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fa1767593a50815dd3399b32d1c08aa9ba7f850f |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/7ae7d4137e707343e863c5e7396f7c9959567b8d |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e8d9a4b0864565b988655beddb29accbcff526e9 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a81560ca424d822c5e23288b0e9c1c779e6b105c |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e385d86df09fff9fc39054d56caf642813a0e807 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4496338b9aec35ddaabda4e7a680c466f604edb2 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/85c85239975bf99e8951ab10246e5e8167c0d27f |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a2680562ab7b13c51b49bd2a00c9c0a4baef1aa |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fde6bd488ba67847301edaed01d84969b12754f6 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/848335a1b6b767dcbc99f4aa5c620e731e53f218 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0cc37eb2c621588c6a6f18e836258c1dfa9c8d8e |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/96cc3fa9481579d195a52043127671fb16142e19 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/59d329e2efd661fe061d2aae09b413284895ea33 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/04cf530818729accca0626856e286d4240508ba4 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e21e7cf1d6363b44a4316511fc02ce5006ea0225 |     
     powerpc |                        kmod-25 | NOK | http://autobuild.buildroot.net/results/f8a1f956333062027294e766ff0ddab5c35d5887 |     
         arm |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/f9f17380e48294a7c166e6e72026dc6e70f98ec6 |     
        i686 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/ec2bb9a908882f5501daf297d06dbd4d5c717f5e |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/1165f0a3b94c4ceca6027cc4d74945d3d9b4721f |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/0439bd34d196d9b4adbb17dc89dccaac7a9f86b2 |     
        i686 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/2ff23ed3faf5393d7852c6aee43747c241a8f892 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8ce469a7acae85c96d2514119584388cf2b535c4 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5cacdc16f5c3e65321b38d096985cce8872193b7 |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/36e017f4b69eb1aae553131e76d6e3f79d4bd776 |     
    mips64el |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/a4ba206a14ce151ebaa90a85053f731c94569518 |     
         arc |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/059af72483ab4726174547a049a033411fdc7db2 |     
      mipsel |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/f3f2748d5e2be8ac35353146f23e2a1e1629146c |     
     aarch64 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/25bcb446bfe3c774501f7b5cc10f5fc42b43a25d |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d0860dd2b78e92ea7a01b32268c3c30ef5ab2d44 |     
        mips |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/63942da85dc7d0072f63f2a551a412a9a9c48fa6 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3216decc6c270af46f4d59c7042c9cba56afa1ea |     
     sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bdf24a37496e5825fcfb5f338a3f6753314d0160 |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5a08d783b6b50abd5425a42389b82600dfa28e12 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/79914e380c4c0c1f872f7ca058538a20b7f2a800 |     
     powerpc |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/8cd8fa0eaa286029d4d17e38f1e8141c934269cd |     
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/c746f1d1d680372d3009ddec94147c38b5833ca9 | ORPH
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/c80792f871f2c5f02fe3faa1fc654fef760b8e2b | ORPH
         arm |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/71c46fac3bd30c7d30ac89ce43e411a9772665bb |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/03fe581786733c85fa43f7af1f273d5999a8fdb2 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/0a279459379fa5f3b6ad9cbc5a26e493ee6588c6 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/8f82e6c5251f8814169eb9524dc7bb25503aaf77 |     
microblazeel |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/caf352a66aa5bd94b93aac39a90b4fa33b39a708 |     
     powerpc |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/9be3719f7b2137a5f039f3c4209c3bc7edeae2b4 |     
         sh4 |         xapp_beforelight-1.0.5 | NOK | http://autobuild.buildroot.net/results/8d518004ae32cb214fa4885502b373415bc1ef22 |     
      x86_64 |              xapp_xclock-1.0.7 | NOK | http://autobuild.buildroot.net/results/ea028467a981f419c395158c55aa9a6d16e3f2c1 |     
    mips64el |              xapp_xclock-1.0.7 | NOK | http://autobuild.buildroot.net/results/1427d443a0598a1fd25264e02420644a2a55120d |     
     powerpc |            xapp_xditview-1.0.4 | NOK | http://autobuild.buildroot.net/results/af70962c59ca3dd29d85207033125b2e7eda3e81 |     
      x86_64 |            xapp_xditview-1.0.4 | NOK | http://autobuild.buildroot.net/results/796a0cfb67a5b836fa7b9cc63af2887968b1c032 |     
         arc |                xapp_xdm-1.1.11 | NOK | http://autobuild.buildroot.net/results/08bcba7d7340f34dc66b5b2ab8fbcfbaee309e37 |     
microblazeel |               xapp_xedit-1.2.2 | NOK | http://autobuild.buildroot.net/results/1b46f950fc0d957d04c0a60a24176d701ff16bd9 |     
         arc |                 xapp_xfd-1.1.2 | NOK | http://autobuild.buildroot.net/results/ea9884f4d676849d643d53275ebbc8668074a418 |     
         arm |                 xapp_xfd-1.1.2 | NOK | http://autobuild.buildroot.net/results/b5a2017c77def4c8674d592a24f2b91e4999aa00 |     
        or1k |               xapp_xmore-1.0.2 | NOK | http://autobuild.buildroot.net/results/7cad9c16234527c7500590f3a2bf277b3fc4021e |     
       sparc | xfont_font-cronyx-cyrillic-... | NOK | http://autobuild.buildroot.net/results/c0329e6af2ed7841c259b469eefde1926df3b9b2 |     


-- 
http://autobuild.buildroot.net
