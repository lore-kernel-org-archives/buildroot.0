From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Sep 2017 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-27
Message-ID: <20170928063059.A7C0620915@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-27
================================

      successes : 200
       failures : 78 
       timeouts : 0  
          TOTAL : 278

Classification of failures by reason
====================================

                 wsapi-1.6.1-1 | 20
                host-mtd-2.0.1 | 8 
host-squashfs-3de1687d7432e... | 6 
            opencore-amr-0.1.5 | 6 
                     nmap-7.60 | 5 
              lbase64-20120820 | 3 
                openjpeg-2.2.0 | 3 
         python-gobject-2.28.6 | 3 
             dbus-python-1.2.4 | 2 
      host-uboot-tools-2017.07 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
               iproute2-4.13.0 | 2 
                openntpd-6.2p2 | 2 
           uboot-tools-2017.07 | 2 
               asterisk-14.5.0 | 1 
                  cc-tool-0.26 | 1 
             lttng-tools-2.9.5 | 1 
                   mp4v2-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                openobex-1.7.2 | 1 
          openpowerlink-V2.6.1 | 1 
                   pcre2-10.30 | 1 
                      qt-4.8.7 | 1 
         qt5connectivity-5.6.2 | 1 
                   tor-0.3.1.7 | 1 
                     zsh-5.3.1 | 1 


Detail of failures
===================

 powerpc64le |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/98c608d88a323df2927e97348928f08703b21afa | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/ae4cdd3b5f4897d5d1cc28487e36fb0f8d7116a1 |     
         arc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/9c81dd898ecdac3bd938a686df351050f3508e0d | ORPH
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/5dac1190b044102124672eaf3327af874fdc844a | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/43647d6570de3dcec890050c67a58d4ddcec3c59 | ORPH
        bfin |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/69f579af55de39c44592a9a86a6ee73711074736 | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/63fc436ba41323d8cd7651555a5eba16e8f10182 | ORPH
        or1k |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/8c613a2190122cc12f2a4135080ed2f2f5712671 | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/e3c0b90d205da0eb39073c62ae4aa20e99603da0 | ORPH
      xtensa |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/281e80a14dc022a38ff0b0b78997095a0674b092 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b17f3376f2ac3f3706303cdf5046d4e8a43a35b4 | ORPH
        m68k |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/d05ec3e5c7cac180c54c28d63ee04157a0adcb2a | ORPH
     powerpc | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/96898f7e283c14fc64d67c74c55cf09c546290e3 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/9ee6d88beccebec31cf061dddda88654d1e8a045 |     
        i586 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/9547347f5e7bcc882c956f2870607161e2b03d72 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/654d66d20025c1c3e887c7fc33dcfe0ac0eb148b |     
    mips64el | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/2be71d76b5616c27a7a02ef3a3b1b107c066d8e6 |     
     powerpc | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/4061e69a21346a782ce51a4ee1d81a141c18ebf5 |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/f70b6a1404c417fa48ff9dc3c48b8f692c3ad7fb | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/241fb84f11ba7aff52197b3720e00dfbf383248f | ORPH
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3fcd0085aaaf7f942783f082824b4e0172ae7598 |     
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/438d22a938a322d934313e1aadff792d3b4a9563 |     
      x86_64 |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/65c572810852b768494bc8fa8302130052a82cb4 | ORPH
        m68k |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/1e5f960b06302006467b382442d06456ba6fe5ce | ORPH
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/92802bdbb61f2ff2ca8d19ccc0c37656753738a3 |     
microblazeel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/29ccb3b83a4cfdba6b442e183ed9bfcfac4a8b01 |     
microblazeel |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/256f20aff84dcab619ed60c0d60935ec60b77992 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/054cb80f204bf3d8484e42e928a85c6eadc09451 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/2620823e244d5e0aa55739557fbbf61e1e5f637c |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a8d0bf1b6b64e0fca34ef506600e4c2a0540484e |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/fa7b1d4c06a46e9f22a89434d0a1e82c16036d03 |     
   powerpc64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/85ecd190a16c1f65c13eae23dae1f6fe449fdaaf |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/a75bca1bea19e9b0e193151eb663bb9d809629d1 |     
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/2006ad977e09b4b4b7fc12c9b6ffd5241a1f3e33 |     
      mipsel |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/eea3ea4aa3cd9658d4c5f0a6e0d6799099da85f9 |     
        i686 |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/f60cacc17da13ba6ef37b97aa5c27c8f42cc301e |     
        or1k |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/29e6e91352c5e880ad5a7c26378250724281018b |     
       nios2 |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/a22a66033598eb0d36eacdd70321d4a75897dc41 |     
    mips64el |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/b581a38a88c6ea7d4501eb1b2177b545e9b5fe40 |     
    mips64el |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/288803629afc0ab69f104371fa8c672474787746 |     
        m68k |             opencore-amr-0.1.5 | NOK | http://autobuild.buildroot.net/results/28a7f7ff84c1f3fc9731b8f1220f9c54b7f492cb |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8406dff25f078c7f235faa7210e38dde968a1d5d |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ec72944e7e941a099eaaad2cbcb330967699186d |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0c84f8f566f5498718223379c7c19f1c5d7b2cc1 |     
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/7da71263a6e9b780031f1f6185c760d11dfc994e | ORPH
         arm |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/7675f4cee373e77f10f6ea55e65a16cb057a690b | ORPH
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/f0336deae6250a57196676cf713ee638c9729954 |     
      x86_64 |           openpowerlink-V2.6.1 | NOK | http://autobuild.buildroot.net/results/3c1f6be91d25ec88ca60b36dc5e5933e3878abfe |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/44f41751ebf64580c59814f934faf3a8c3fb48f1 | ORPH
    mips64el |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/00e7c211e7570c7b5211de92efaca7b5129305ab |     
   powerpc64 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/57855620122fbed3763919c033016111f2251788 |     
        m68k |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/1699fe8be92737d51a550260ec5ea16c94ad81bc |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a367c6143176e0ac15653ed9bcd8fffbef7eabb7 | ORPH
    mips64el |          qt5connectivity-5.6.2 | NOK | http://autobuild.buildroot.net/results/27fda6bedf9294632e10b795eb20dcae73770678 |     
      mipsel |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/a932660d6a6635b9d19cf1a95835ce60fdbc9577 |     
        or1k |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b60c9f1b4c90e75d9a0193e850651e611e79a719 | ORPH
         arc |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/14429d0e82fecd73c9f288571775a01cce4e76a5 | ORPH
   powerpc64 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/8914c882141df108b426dd754ff8092b40fbd4c5 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/95c8fb90a055e827c6cda1f1df6d1cd367ebb802 | ORPH
        i686 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/6d512535cbde75bb037e62584a409808014cc856 | ORPH
     powerpc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/aead5d5808ea6046fadc0a1eca17ef16cd23633d | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/7841ee922320a939fa54309f6f03ea0b4e8d4737 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/019bba63a15d615e8090ccac23433b4ab14e6767 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/63750f766c7b7fa6f48a6591a6e67e623545f8d0 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/dcaf231108e3bb4e30c01fc639c3f69549836c32 | ORPH
        i686 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/05e21918143cf43aecb02f43ccd986a0ba4f7602 | ORPH
      x86_64 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/275d5e51f99e102fefb7c3373e4b81af5d95c6c3 | ORPH
     powerpc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/4df85894a36260d2979164cc3f30cc9e5a259cb7 | ORPH
        m68k |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/1872042f4ebfe7d1d301915de04c0812f69b2465 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/2ba428fd0c38e8b6b8cd89d1440544f5594ca5f3 | ORPH
    mips64el |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/c9cbbdf719cd5c36cef00620ba14fd9da193d471 | ORPH
microblazeel |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/75f958783468fd93501e92bd86ec83d623c645a6 | ORPH
         arc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/64dd3c92010888957ecafd93b9808d6185d8a1db | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/4d6fc4582113211eb50d5a27fb181cb6e3d6c3dc | ORPH
      x86_64 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/ecd8bd57fc7cb68046030105d138c7f3e0bc5a30 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/f607b0c33984f173f60a20cd837564e16e5dbced | ORPH
     powerpc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/cac28ecf269b63be03946aa70ec609416b1d7063 | ORPH
         arc |                      zsh-5.3.1 | NOK | http://autobuild.buildroot.net/results/c8e30a1eb6e77ae76292b6a01bede5abb2b1b7b7 |     

-- 
http://autobuild.buildroot.net
