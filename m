From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Nov 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-10
Message-ID: <20141111073014.AA83D101626@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-10
===============================

        success : 197
       failures : 49 
       timeouts : 4  
          TOTAL : 250

Classification of failures by reason
====================================

                 schifra-0.0.1 | 20
                    qemu-2.1.2 | 4 
                   libcap-2.24 | 4 
           libmemcached-1.0.18 | 3 
               alsa-lib-1.0.28 | 2 
                    fltk-1.3.2 | 2 
                minidlna-1.1.4 | 1 
                      bmon-3.5 | 1 
                   czmq-v3.0.0 | 1 
checking whether /home/peko... | 1 
             host-mysql-5.1.73 | 1 
                 clamav-0.98.4 | 1 
                 tn5250-0.17.4 | 1 
                nodejs-0.10.33 | 1 
             alsa-utils-1.0.28 | 1 
               mpdecimal-2.4.0 | 1 
                  zeromq-4.0.4 | 1 
                pulseaudio-5.0 | 1 
                 webkit-1.11.5 | 1 
               qt5webkit-5.3.2 | 1 
                 libssh2-1.4.3 | 1 
                     rpm-5.2.0 | 1 
libshairplay-64d59e3087f829... | 1 
                  python-2.7.8 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6ce1ecdf2bf1f14f1497e9960a1b6689568a3658/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a990b0deb0269e91bcd7fb008eb40a2e00350114/
      mipsel |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/045782ef114689c2cb7171b15f63f2770139806a/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/4d0c3c8b68b37f532378f19041379cb5c5798950/
        i686 | checking whether /home/peko... | TIM | http://autobuild.buildroot.net/results/a7763e614d960e044d757eaf971c8a2777485f23/
microblazeel |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/2bed33fe03c8e49e7766f14020beea0d8e205fc1/
      x86_64 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/8a8ddc4c9abda5366a3e76ae98f99b821aa52b09/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/58a36291201a848a0a11cbb2b200c2b39434046c/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fe53d0e9ad7c152105cb37a18e4d712bbde3398d/
      x86_64 |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a0ff4949d621caf4cada6ae3f66ed38f569d34b9/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/be3466bacf99f8796d4cb73440e40f29041d7848/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b2140fc00e3de3ac401a49d2920bcf695f6aa184/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b6ee496683e91d73fd55111beb0e40fc6fc90be7/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6eadc312e621953345e6c25c89625da6e6d54868/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/afadd15313ceb5b2dbe3bcef48a9bc8a5108b061/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/cc599de01d56177a74c5563cc0b9932754a34d55/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bd6575362a3ce97e24b65180fddbc3eae4bc10fb/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/f08787c7965c5594d9560db0aa2adb7b07a65a45/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/80dd3131cacecd629a72c38c1487d7b4ccb47a60/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/df7da91985a7bf2b05093bae7379ef22362a44fc/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/df9a68c43eaf26a60865bf07c5913d65f051288c/
         arm |                 nodejs-0.10.33 | NOK | http://autobuild.buildroot.net/results/e1fb34818ff1167aa008b4011befb9fd14c81293/
        i686 |                 pulseaudio-5.0 | TIM | http://autobuild.buildroot.net/results/74e233383535f4459216c05fc705ee6b67707ac0/
     powerpc |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/69d23eefe2a23ee130f723c9dfa9a1a875698dc7/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9efc2b14a28fd21ed2ce492f41de538673d13dce/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/0f640d6b701bb854ada2023861a234dfe489f038/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/c58f7e10a416e0eaf7e49f0bb5ce9e6f85bc1559/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5979559734620358a92186a6e67aea46b6034b44/
        i686 |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/af8f3d3cc018006cee58d57cd9e8c6d8b3de3247/
     powerpc |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/839b9044e936d992f12dd802b1d7578030e95f2d/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/caf9899e529495b349df1c4a926749b98b4941cc/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/50d5c1f7d234c12b00792c0a3a88885c1e3f1525/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4e6fea56a1ae075ce0a286e20ff891c75762f10d/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/84d3ec783b6d66e30e6fae9bc5d2a14fe9f2997a/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6d6ea6ef929ad1d47d9773eb1a62d85a16e54fa5/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/737c523cf856205a6cfa06da1156a350e8998624/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a713bc6de2c2cdca01a9d8852395cda7c9368e50/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/811a7bad83b825e621ee86de216024d67f04a46e/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6988e8d23db8e575b409cbddad0a6e2fdf29ba36/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9daaf33512d6b7573acb0c0f62c4a0b26396cf64/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/59d80e3d7487dd68b9273af70517adabec65c593/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/db8b78cf6f3e7b940510ee94b58b96ece396a6cf/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6ff11e1a03106025883e86739bf73f99e976f817/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9c2396573db3cf1f40f5445c214d4e611989c4ad/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/90312a2bacc94dd79d8f5540aca7546061b0eb03/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2dc638f751ad635690225404878d13fd1748b81a/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b6e63b198b3b3a181a509d57a21282e77b2b196c/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1d57af90b482b7bf300483ffb3dbfb1d449aa014/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/8d406922b5986ba297aed9cca90adf9a1b995f6d/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/75d45ae59b30ca394c1f409e53af931c27f8120b/
         arm |                  tn5250-0.17.4 | TIM | http://autobuild.buildroot.net/results/0988b54f84baa927f4ea789148f8d5ead0547d9b/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6b1123ea69c79bdd73bb85d2c8c3aac153a6f99a/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/e63e422c77d9bcec8b58405dbf6a236be0d2a31b/


-- 
http://autobuild.buildroot.net
