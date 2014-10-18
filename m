From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-17
Message-ID: <20141018063015.2707010122E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-17
===============================

        success : 200
       failures : 88 
       timeouts : 3  
          TOTAL : 291

Classification of failures by reason
====================================

                 libxml2-2.9.2 | 19
                  avahi-0.6.31 | 13
            ecryptfs-utils-104 | 5 
        glib-networking-2.36.2 | 5 
                 libplist-1.11 | 3 
                  polkit-0.103 | 3 
    host-shared-mime-info-0.90 | 3 
              host-perl-5.20.1 | 3 
                  botan-1.10.8 | 3 
                libsecret-0.15 | 3 
                 pixman-0.32.6 | 2 
                    qemu-2.1.2 | 2 
              host-erlang-17.3 | 2 
    bandwidthd-v2.0.1-auto-r08 | 2 
               libcap-ng-0.7.4 | 1 
                   nginx-1.6.2 | 1 
                  libv4l-1.6.0 | 1 
                 webkit-1.11.5 | 1 
               alsa-lib-1.0.28 | 1 
                    ruby-2.1.3 | 1 
                      gd-2.1.0 | 1 
        gst1-plugins-bad-1.4.3 | 1 
      host-uboot-tools-2014.07 | 1 
                  python-2.7.8 | 1 
freerdp-440916eae2e07463912... | 1 
               libevent-2.0.21 | 1 
                sdl_ttf-2.0.11 | 1 
                libsoup-2.43.1 | 1 
                 rt-tests-0.83 | 1 
                 python3-3.4.1 | 1 
       xkeyboard-config-2.10.1 | 1 
                  thrift-0.9.1 | 1 
                pulseaudio-5.0 | 1 
                    orc-0.4.22 | 1 
                     rpm-5.2.0 | 1 
   sound-theme-freedesktop-0.7 | 1 
                busybox-1.22.1 | 1 

Detail of failures
===================

        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/c4cd1c1c9b0d2292090d1a8e6270769f7740e4aa/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a80b6f4e83b055316eff1f3a9b18f9150ac6c60c/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/06e9692137fb50dbf60d062a6b207986d9a5a35b/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/84118037515d5588b74943e86de675d9d914dca4/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/23bc88c38ea9bdca3f5e34232626aebb8b938291/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6881a8f6366085f89bea0d8b3a77fa23af26f3b7/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5ae32591ce4f4275b9117a1280b93247b6453f9e/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d615698b877bc5bcc0a0e49a833bfce383752663/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0966e2b1baf38f68f4278ec6edf7592c71896ead/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/373e3bb6cce76c7a35cce7ecb67303408562ea5e/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9d77a55690789ce4d260e8c6fd5db39e3b019d47/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/52d82aa26916ed8e050f7341e6655bca3b5c3354/
        mips |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/cabffdb0cfb0c02c16c6bcefe8f5b264c925f8c8/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/cb86c6fb1741ddf67e312328ed70e6670210ef31/
         arm |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/f7078f39390e7a062797a00cabc1173326c07cff/
         arc |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/6975c8d02e6b59042ddf8da7f2ff1a2c46b27193/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/3be797f2a10e3378fdcb275e60bb6caa632fb905/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/0fa9e4786eb84d79eb28829c79b18d4cffbe1088/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/81a3a90b5d427562cf523fc2d6518cd8061cd61d/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/78942c866b9d8e8e3eb5c0f14b491889d454243e/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/0a945a780d7717cdf8fd9ca65f24c43de165ecae/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/474250a57569820a5a85e1e4809f15d16c884cca/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/d65f87f0d5d6324f1fe38dc53d9bd54538ac152f/
         sh4 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/dd8a4d053000ae99ac993197c6526710ab942cbf/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/088b81400626e7c9fdc1632c4aed05ac774688b2/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/d43692bcb68421c60a4dfe2353dd2253f2c699de/
        bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/a0a7920d75fa028fdeebb6ec94ee1d3968f2c423/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3ca10e61e0ffcb193c576a50d9aa76eb7339938c/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/6bf31aaa0c69afd116f718c4225373a90ebb7e3b/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/eb25759cb0da5a237779dc00b628a11ad749b208/
        sh4a |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/b28e6d648a486b9d6e29356ab434baeb0c5ef7cd/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/d68143ec7745854c97df6c5221b03ff586dec1b1/
     powerpc |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/46c4556891744f07dad523b952d863462fe04ff6/
        sh4a |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/ec6740535b8cf988b409b2ad49b98b7236940d43/
        i686 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/779ec680c31300cebda10448d5075887842062fe/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/3f54c46d3277b5ab8f747aa7feeb07d3d54e3e50/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/c7b0d76f20f3eaf856623313466f4cb0301b4b58/
        i686 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/13e6a0727ccf4a3cb853bbcc6cac7b4be5878795/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b128d5e16049836b438bdece73289512334e29f1/
      mipsel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6d6d3b0fdf8cfdc25c96263b82516cfda70759ab/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/80b9ed5128c2aa67b7f26782014578c61e0c63d9/
    mips64el |       host-uboot-tools-2014.07 | TIM | http://autobuild.buildroot.net/results/3d32f29cf1b36719ce7fdfe6982869b90a5c08f9/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e228aa250ee2d856302b1d6129b6717e46a22aa6/
      x86_64 |                libevent-2.0.21 | TIM | http://autobuild.buildroot.net/results/54156741ebd34182baf85ff83c27ad2bbed059ca/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/f915bc407d6ca39c71d0a13ce7510a910fbd6314/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/4049e834ae5788e5d0075ec5a0ff815dd9943dd5/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/678d4cff5d85944df321c0ebd8c1d368b9a80fd5/
         sh4 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/c59a96f711664aed9322ea48586d17416fa27593/
    mips64el |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/b6993ea1d85f2d9a02002cfd10f79ff121ef435f/
        mips |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/28758a81673d98d80199debb4a7cb36d1271475f/
    mips64el |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/aaf91380953ebb84c582b38b46cfb180ff6862cb/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/2207541442e251f56715bfd721e4be266aaa266b/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/3637c3788d4b9562699a4b5e0c175f22f519e664/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/a9149859db4bb2a58f9f180a8e36466386c01276/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/bb64939d74b943f5684e2b9b1bbfcc95c47f1cc4/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/2f6bd10c687d7d30bd37a3f67f5112ba12fead20/
       nios2 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/01d8feedf52cb91fd7f4cdbda9cc2c9c79900931/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/5e6fe840e611205dc2b9b5244a93f9a6039d2ebf/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/704f7318bd5fe790518192cda3808986c456eebc/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/7dce8045d152e4e4a8c3cc837931fe55bdee5cc3/
microblazeel |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/1a1deca467ed10367cfd10680d8e4b50be3a46d4/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/eab29b3d48362dda1c5fe8949506560d50bfca72/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/d155f8cfb9b0cfe5d5b8985f76e970c08b78f94d/
       nios2 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/2d5ac1925a5118c361a0d1d5e266dc0ae7514562/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/00eb729451c1d7009e637f1b35aa697484ff0770/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/8d5c9ae4fce457dc3bd7749d6a0f8a2e8e2ab850/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/11a220b9086ff11c3c2688ad84fefae8d44f901a/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/fe8cdac117e43ccee4c2965318a13c66e170a1a3/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/3924950963a0077093165784c3cd5ec54103a727/
       nios2 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/aecef5eff72740bd09d3f8ca034741affa2a7472/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/d2c60e7b63f68f7e53d4e48d3d9ed3d9c6aa640f/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/65125bbb1116ea0671841a9d24fed70c3941a307/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/4b166c2b191ed1c08a10102eaa5e52ced7f51d69/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/a4c7923a826c571f4e6491478008756bdb76206d/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/52def43285681ca5ccfbb21ecbaeb1c664ac22a9/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/1824b0a0cbea2095dcdb582d5f7836d1062bfab6/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/77087d4a680574a3b58b08204b3b8334562a7e66/
    mips64el |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/cd4dca26137bc77590c9304cdecf8b2ac473b957/
        sh4a |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/936a0a5f0d6ca38be96d6c4ef53abddb73cdd5d6/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/7f81360703146f431467e68ce2104b61de873cad/
      mipsel |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/0af9586eef207c18384f09ef2d536d3db8bb2cf1/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/aba27e2d49d3d6cf6d8e3cef10e8fcb2f6513cef/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/436876abbd20816db48a30ef79d070f7df27fe04/
      mipsel |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b000693dcaaf075fdefd17f2f6ec6b65631aa03d/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/b425c694e51b19edfaf58b7785433d948a4d5d10/
    mips64el |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/5aa14bbf8511f48ca62d22ce5f5e80b5aca8589d/
      xtensa |                 sdl_ttf-2.0.11 | TIM | http://autobuild.buildroot.net/results/57dfc472147c1774d2a18bb858e0691bfba07af2/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/3f48a73a2c659d6d188c2d82bf1e7e40d68b17e0/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/03efb8b21a240e064c01e893e9214b9a6aaf62cb/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/f61bf97758dffa45df6f297d0ce82b66c38d71f7/
        sh4a |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/3cf6b73bab4d5737129e765afd5e90b1b36b6fc0/


-- 
http://autobuild.buildroot.net
