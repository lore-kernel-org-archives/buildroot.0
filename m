From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-02
Message-ID: <20141103073016.794FA100E39@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-02
===============================

        success : 194
       failures : 106
       timeouts : 0  
          TOTAL : 300

Classification of failures by reason
====================================

     adwaita-icon-theme-3.14.0 | 36
                 samba4-4.1.13 | 11
libwebsockets-v1.3-chrome37... | 8 
             lttng-tools-2.5.1 | 7 
                 schifra-0.0.1 | 6 
           libmemcached-1.0.18 | 5 
            mesa3d-demos-8.2.0 | 3 
                    qemu-2.1.2 | 3 
       directfb-examples-1.6.0 | 2 
                 clamav-0.98.4 | 2 
                    orc-0.4.22 | 1 
                      bmon-3.5 | 1 
                  tstools-1_11 | 1 
        gst1-plugins-bad-1.4.3 | 1 
           gst1-validate-1.4.0 | 1 
          sane-backends-1.0.22 | 1 
                   argus-3.0.8 | 1 
               sdl_sound-1.0.3 | 1 
                busybox-1.22.1 | 1 
            libvncserver-0.9.9 | 1 
                  prboom-2.5.0 | 1 
                 gnuplot-4.6.6 | 1 
                 rt-tests-0.83 | 1 
                   libcap-2.24 | 1 
               alsa-lib-1.0.28 | 1 
                  python-2.7.8 | 1 
                 cdrkit-1.1.11 | 1 
              librtlsdr-v0.5.3 | 1 
                   lame-3.99.5 | 1 
                  avahi-0.6.31 | 1 
                    fltk-1.3.2 | 1 
              uemacs-4.0.15-lt | 1 
               iptables-1.4.21 | 1 

Detail of failures
===================

        mips |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/709798d4c6416b441e655ce17698af1a85b3229d/
      mipsel |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/83427123612e8a2470e4ac141d7593c97d77e900/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/10eb05e26a1450f5e6986105d5e997bc79bfaa8a/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/31687f65f76e7bb3f6f176ea8e036e299616aef4/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/cc0bc935dd9b0e70d16c23a377fea3da80e11d55/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/45b6e131ddc6804f53477747ae5abe2c3002a7ed/
         arc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/0c09c6a077e4a8c7f80291cd40eb514e93539a11/
        bfin |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f4924ccf8ac9d02dfa7411cc80289b184f66d9c0/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/97ec73515dd31321ff9f8e158c128a64c4bc6323/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/5532b64d088cf47d7d2e320661dfe9c61d9ed8c4/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/a20d55bb1081c5d91f92a9e510337ae0b4428ba6/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/a830fb4c0d40a54f5c8df32be361803a4dea5d46/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c6617a2ec84950fd7299a0beb638dcb0deb3d523/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2fc9e16200a7986f08268e9907afe573490da55f/
     aarch64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/5d146c07cea9fce69db33dd98de3a8c1459d3fb1/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/864fd3d20178fb2d51078cdd9f6d7297939debc6/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/539b980214c2da467ca4ff8f2e03997af7a0578c/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/dd98c73ba8a9105b26f099d2e19f5d3c1824728c/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/ab10480e44a71b8fcca216979ef916ae7508a057/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f9fa33add1253659c1ce4f305168e02d35cad9ac/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/242a64c91acb56691aa00bf7f431bd10dbe2a964/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/dbc6a6c427537b9d25a197a8e63e123ae47edfb9/
      xtensa |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/7aa13baa75e898e1f503fb6c3a152e0b27631cc3/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/376717c64ea31a82660c7295e336ad34acfb0d7a/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/09e1d4e3e3cea6a46819edb8da1c4563ab782387/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/327f03f684ceed53123df3a267b96b038de81e07/
        i486 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/819e6ce235ce20196527e5b208e39bd240e3ae0f/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/598c2dc7c74d3d4b4f8e041e4d7e97a443547433/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2a21c6316c9edc000c810bc9cb724da74fb0baa4/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/9f37115724a4734ecc8c34d864d18657417a092f/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/e33b70f6adc2c04501d7a9ccba0662b49f51caf2/
        sh4a |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/68d0ce1980b46d8fe94e53e1f08402fe0ad26d35/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c2946a9b553158257b901e6030a3c684e913d47f/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/70fdd30dfa7fb330200f92dc1758a2cbce40c9b6/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2818ed3d219550e79d2324c7e31adf06c7e96824/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/25ce761a9e43223332a9d8d89ec4efd49dcf973b/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/dfcb042a972c7bf0d6b47576582daf1c7baa3985/
         arc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/aefe198e77f4f9a03201358fb9f0d033b92cc90a/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/012b66e2f39eab002c53ad90e5a4c46d889ccf8c/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/ecedb554893f0a88de075b1d8c4d50e969a240b8/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/fc32aea3ea4f5484dd3e16a97fd9d4683d5e1da7/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f3c513f053882dcaa7ceb161096faa20fe226a00/
         sh4 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/2a68aa790b1e8d6fd4dc41f2ab724dfc03b3806d/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/3532bbfb68d73288976817855766e981cfa51c39/
         arc |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/46d585171d9bb231a182b82f5472c2e43cb26ad8/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/5453da641d2f84cfaabc0b06360d7cd01762e262/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/bf3cea3b6faf610ce83b53d57a2c2dc00a7088d9/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/7f392abeb7a058c9263c107b1640356e2583987a/
     powerpc |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/54b4247bcb3f50ab2260a45d54d38ee628dcb302/
        i686 |            gst1-validate-1.4.0 | NOK | http://autobuild.buildroot.net/results/e8c27db2a0935c2daef173d5650f6a2b3a219493/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/d3e90a3b488067dd4d10df28a11b3a5433ef4224/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/72cb3bfe7ea00be7c1f7f379c0b6c000d7dddbb1/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fd3d2ceae3dc1d8d5a72ec7a7ffdef2d70d8fca0/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/78bf7a08bbc896c0823d89ca6a6ec8e7150318c7/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/652bdc599dbdd1d2e3e842373232ad6152d4b9a2/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/555b1e2d6a5c7dc1e3d7312f713a22d4da7f7052/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/082dbc5ebc366f3788efddc8cd3eeccb0a4cefea/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b8edc6bdc1f6353f776587028a935749fd8b09e1/
     powerpc |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/59d9ebbf111d86b263e280fe365b497344286950/
       nios2 |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/200d6ff9b38e6172a7b47fddffcdf3c94cc948f6/
        mips | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/e4a1b298e7e158d3614b89e61d40ef9a00e7ff67/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/b4865489e377f933637571d000d0157c13c54610/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/a771e99c85b600ae2180d0ce0c2a11447b70a9c0/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/d917998a7437cdb461f288426cfb832a61705a0e/
        mips | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/df2aa531defa8f1f9fd5ead0109c3a0a1f641208/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/ebbd78cce091d63f8d6eddff06b496606e7f5077/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/5e24a90058111f7d5618047410f809b45bc165f6/
         arm | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/1b98fb83963d11e7376b1aabe835063aa8d8b83e/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/e07701fe3d00b2de20c49ecc3ecd2d6dd84fccd8/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/809ee88484ed2bf14d43864af09ce526bc612386/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/40b2164c5f1a9b9eea62f3bf3588223bd44d8066/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/a2ab3c526a3f67371524e1b076512cf1f8058c72/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/167df325b65d3e25898aa5de58ff114d2548b8ca/
      x86_64 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/26085d7d336976d1416cea0741fae64be126899c/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/bf69b414b2f085c8634b6f08371f6b1a264bc269/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/aef73a3bc770c3784025642f6a2c276944117112/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/d51d22754a37f790d2de5a4836237b8eea417124/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/347b2f79111548ae00f40879c1b5f3c4c1c7091e/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/0c0e514fdb5bb45a4a3db363856939afeb043a09/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5a58fa9c0ec93d7fc31e47036792de6075b361a1/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/6949fc76d631f946a15513d53417bb65c8be42c2/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/fdaf2acbb9654e4fcdc3897ae742d9391c5b73ef/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/18a43df80616280506a44ac3abc327ddf0e7b079/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/44c00b50248018c4e81f4fbb1041d35b78f89640/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/b8aab0bb49c6b68b8be52420080cb3967708677b/
         sh4 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/079b47455849c3db6344b7bdb0c1ed7ce0cd832c/
     powerpc |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/a6479fc0a4bafd4871855f0049d5686ac9f9e365/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/e5a9bb138495572ba9a935d8bbf83daad1d845b1/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/e51a8119bde9270515a74e075da3294da45d0bdd/
        i686 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/726c7b301438ca58621e7b7f619f2ff6f39750b2/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/561aa133ae355c0816a287d5d4c8f962e502ed3a/
microblazeel |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/31d0584f8dab263fb02a2c2b5e1eb715f8aa8357/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/cb30397a9345552303a745459141b85dc76acba7/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/0bfded9dad4c23805dcdd07619997f058e231f3f/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/ca01bc3795ba63890f72ea581e795ffa1d1d1354/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/36980eb526826feef78da83ddcb58b637c99a6b8/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/3f19f98b61361a81f41d372f00d4e7eca68d40c0/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5b6ea867073e043a6a27250502d146e7f55f4276/
         sh4 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/f47af7c3b12ece6709724a11822d1dd21d3460e7/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/320219ccbd3b683012390b6512c3ea5d71b3e14d/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0ffa10279d2a31d02118bd17e22f65b573211b39/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/e6c03bc1e7cf9a7815615ed26f2b8d1ad19eea3d/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/18b8c50cc4457cd48884e606106aae4ae1c21f95/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/19e46117d476cd3c76ff39bd07d507df42893e9d/
        i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b9e2a207ca3054926b1949aa409260183f271cd9/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/77c298dbdbd0b3732a6b50e49ee38e3f23b515cf/


-- 
http://autobuild.buildroot.net
