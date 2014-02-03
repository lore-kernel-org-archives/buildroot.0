From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  3 Feb 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-02
Message-ID: <20140203073009.D97F010191C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-02
===============================

        success : 77 
       failures : 75 
       timeouts : 1  
          TOTAL : 153

Classification of failures by reason
====================================

                      axel-2.4 | 18
                  ltrace-0.7.3 | 14
                 libhid-0.2.16 | 7 
          sane-backends-1.0.22 | 5 
                    mpd-0.18.7 | 4 
                   open2300-12 | 3 
                   minicom-2.7 | 3 
              pcsc-lite-1.8.10 | 2 
                  gnupg-1.4.16 | 2 
               alsa-lib-1.0.26 | 2 
                     vlc-2.1.2 | 2 
           imagemagick-6.8.8-4 | 1 
         qt5connectivity-5.2.0 | 1 
                host-gdb-7.5.1 | 1 
                    gpm-1.20.7 | 1 
                      icu-51.2 | 1 
                      bash-4.2 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
  toolchain-external-undefined | 1 
                host-m4-1.4.17 | 1 
                     php-5.5.8 | 1 
                  libeet-1.7.7 | 1 
                       unknown | 1 
       gst1-plugins-base-1.2.2 | 1 
                    mpfr-3.1.2 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c400e00713b30c8617c7f6dc34edc4daf1a3d3d8/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a7e5e5a7a8f09851086695a5a0796c313cd3dafa/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4c12b7f993d80451b9e01b59ef2a441fed070aa1/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/effe76a39a2d45a825f181cad71206a3ddb68f37/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/874b9374d302f4d68714d2f78a39b3af4b56f485/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/de2f735db411f9e0802a0ea3f93932ee9efb5718/
   aarch64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/bb1b01325353de9baa0280a7698828c981a5b5f1/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/6e1e49e5629981b27153d8de1447ecf997cbde1e/
   aarch64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/22ee49d2316671922eb196df713bef5589407a21/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/99fd899e0cd60933430e5ae44343dac38c0c7d40/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/1b5c78ac73ec33b1b6791d17a17fd71ec7874b16/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/77e466409c9677ef4ba59906cbb850c1c0583fbd/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/aa2a787b53dfdaba3726b28c254bd6fcf6ec7150/
    mipsel |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4445c5f028adf31e1424bba6ea4a339d736410ce/
      sh4a |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/6df10cfc81032cd32c13fd7cc7214cf9deda32c3/
      i686 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/365545767323ca635c9e34cfe567bfe5c10379b6/
      i686 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/4e91dd40666933c78bb67f3e06ab235a4cc80c55/
     nios2 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/ed82932e6ce624df3e30e81d8b2c99272d5dbad1/
   powerpc |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/f8d164fd7211aebabac7713aead764200c6a2c5a/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/18ab0c89ed6da268012e15dee86064b5bf46b36c/
    x86_64 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/004a28d4fa59c1201f73a3dc67883a17c204fcb2/
       arm |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/b8d68d82cc62815d86d81991b59c8a4cadf4fcfd/
   powerpc |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/cb264b98b9c247b8c4f2349ad42a9521b1e893d6/
      i686 |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/fbf42eac7cf09b2f3fc93fa2134ddefcb1beea2f/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/74075a46f0029ab79c990607d04bf54503501281/
   aarch64 |        gst1-plugins-base-1.2.2 | NOK | http://autobuild.buildroot.net/results/29c69905ffb048433723660250329fc8c5ea18ec/
     nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/603744407d730a52476098dbd57f31380e6721f5/
   powerpc |                 host-m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/48841dc20776928819310fdfe4c2f6197314ec70/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f21e39b8f59b7880f29d7bb2701237253b63ab8e/
   powerpc |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/d7a53d55fafd85d1b4e3583005e55f6eaad29c2d/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/15afbe1833b08a68ab8a75f0a11c26cc4c5147dd/
      i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/7ca3ae51ae96823b7f790637fdbe0577bb148a70/
    mipsel |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/e87c1219a55d7e8f4d88ff60f66e8e26f5d5ae7f/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/81f7f26acb6c039b3ee65625f15ccf4324ae0f0b/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/35b095bc0331c972ca6c43036d4f7a358bdd0053/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/55ddbb5230c98dc96f425ef169a93c6fac5f4245/
      i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/8e7d858011f38acab08895171dfc32c63054994d/
     nios2 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/44a65be7ef07d7a3ef250db92e4e37a5ac00e9c7/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/cb456b3243cea76e80d8409c5256e9112fa4ff28/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/ddc573932994c26fc5209101e35a419405e25b68/
      mips |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/5794c3626766716bedafca5acb2ab32a088b3df9/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/779ef0ce6563957958f0ea1c444280821ad7441a/
    mipsel |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/651666b7cd389caae20ee1d15feb334435be22cb/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/f3c2b7bbe2e93cfe4a18cc1aefcdc6058f48d252/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/c24dd6955880ab298956dd3bbeb4f9749c906f26/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/f97bdda3b2920260c7ce56f7a026d96377411231/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/c94e15c575c5906c2b86637225db5e2c1c7089d0/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/89ea0c33dc3318b894f10075b96a052c7c276486/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/fa755bdc5b0ad6a1d470ffa851fc1d8a351bf2f8/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/eb93fc78d8e87c3af4f72d9f22f0254d741599d7/
    x86_64 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/107278ac19d4f0810fcb50f205e7e03d7c8aa057/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/3a366f31c6f2a665efe734671c1a9c037fcae353/
       arm |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/c53c504fcfbd6b9e19d87acf564a402baa70b81f/
   powerpc |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/8b3499f4dd5ddae3ad37f7be8ae419b6ade245d0/
      mips |                    minicom-2.7 | NOK | http://autobuild.buildroot.net/results/7573e35db0f7923b64fa65274fbec1295ce0f1c4/
  mips64el |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/85356eb831441699565b52148e8447862b464b01/
  mips64el |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a884590d2e4c06f9005720f003c54e5d3bdaf0f2/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/95ed766e0135591a796640b849a615c357a16a60/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/803f6d5ffc99a31f39772e25921b9ccf0adfd48a/
   powerpc |                     mpfr-3.1.2 | NOK | http://autobuild.buildroot.net/results/713e0c4101ee2ea4760b83f31a2913326f3e27e5/
      i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/fa573902d2a1fe323e2adfe600a76f894177268b/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/de7468abd89cae0a0f2b034e048762a09139dbe7/
    x86_64 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/56b785dd9b2c88a0e16737b41c42b204777c8f65/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/3b842f9b635bbaa2a26c879d40eb6357c7377e0e/
      sh4a |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/3b549a35aefbf45e3be68fab740537a0d08d8eda/
       arm |                      php-5.5.8 | NOK | http://autobuild.buildroot.net/results/9843940958408fb4fac0f480be42df7c11e82e30/
    x86_64 |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/652231accdc02c241ebbad0df7810a6bed057d45/
      sh4a |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/9e35c96fcacb54812d6a59277894cddefd373ade/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/d79e5e85ee135f39e409630e96c40eb1f015513a/
  mips64el |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/72a30dd7ee11c5679aa13c2cedf1372945552f93/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/d0e904ed38a1985c894f77ad8ad4f2d9d350b1aa/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b9b7dee76570634b6753ca0b05196a9633383526/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4598bc2cda22d00c75f965f01382b07a5ec750e7/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/926ba705a560dc43f511b8619c80f570ded82f8c/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/bcfd2b3f41bd9b7a7539f540159516c847eb3f0d/
     nios2 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/91954663bf0a68223302de9057b9b72ad2f340c3/


-- 
http://autobuild.buildroot.net
