From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-12
Message-ID: <20151013063016.36024101F5E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-12
===============================

        success : 150
       failures : 60 
       timeouts : 0  
          TOTAL : 210

Classification of failures by reason
====================================

         liquid-dsp-legal-info | 6 
liquid-dsp-df5a459fa05dba41... | 5 
                pulseaudio-7.0 | 4 
              squeezelite-v1.8 | 4 
                busybox-1.23.2 | 3 
                 mesa3d-11.0.3 | 3 
             bluez5_utils-5.27 | 2 
                directfb-1.7.7 | 2 
                  aespipe-2.4c | 2 
              swupdate-2015.07 | 2 
       kompexsqlite-v1.10.12-1 | 1 
                   kexec-2.0.9 | 1 
                 gnuplot-4.6.6 | 1 
            libserial-0.6.0rc2 | 1 
               linknx-0.0.1.32 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 qt5base-5.5.0 | 1 
                rt-tests-v0.89 | 1 
                    ffmpeg-2.8 | 1 
               alsa-lib-1.0.29 | 1 
                openntpd-5.7p4 | 1 
                    ustr-1.0.4 | 1 
                oprofile-1.0.0 | 1 
                iproute2-4.2.0 | 1 
                   mplayer-1.2 | 1 
                      qt-4.8.7 | 1 
              strongswan-5.3.3 | 1 
            xapp_sessreg-1.1.0 | 1 
     adwaita-icon-theme-3.14.0 | 1 
                 dropwatch-1.4 | 1 
                    ruby-2.2.3 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
              libethumb-1.7.10 | 1 
                  c-icap-0.3.5 | 1 
                 lvm2-2.02.132 | 1 
                libnspr-4.10.9 | 1 
                 mpg123-1.22.4 | 1 

Detail of failures
===================

      xtensa |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/623b51c041cb7308d54df3a9d9358d25b2d4e8dd/
      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/a26043539754d69cf1518709694c8eb88c40dab7/
      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/148b1e38337d4698b1f018f84de62d55af2fd42e/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/21f216edeeaed3b9697c557a685e33ca9501899b/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/5ed0fe50b253b8c3cce3e94410fa63c73ee12c8c/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/349d77cf2c83beb7c2e8b625ea2fcfe30f62b2c0/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c9c3a29c70207064cfe8baf0fece2049a8124db7/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/2a72ebc06afd658781d3a3c26b92d332c8df983c/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7c222dc419dec69800fb69bca56c58f7032b09ae/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/c7af98bdcf4aeaa9a267a1fd812519af3344ca5b/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7a1e2f22dbbfb727523866d0cae552004e69ece8/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/cfa1c723c0acaeec21848189fef4bc56aa35f3a9/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e549dd004318990609532e3bf264054b0586de24/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/4285dc53d2df2303eeb518929d7eae0b4b1b48c5/
       nios2 |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/1452705badcb9ecf7c9c159ca99feb7abfe3ea8c/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/33ae2feb2487ef997d641497ddc9e06e1b958253/
         arm |                 iproute2-4.2.0 | NOK | http://autobuild.buildroot.net/results/f36c6c2f4047154e3891e02891f330851c1f6283/
      x86_64 |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/abb7b3760509fc658eae5b4a61f3f5d5eff27520/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/b8105245913c1b002f048f2a664ef792634b432d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ada06cd9311281e9a0374bce952515d1975d4e90/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/22bb90d8affb1abdcdba6340e97125d4e7f50b9a/
         arm |                 libnspr-4.10.9 | NOK | http://autobuild.buildroot.net/results/21e2f7f00fa6fb904557cc347cc07bd9fe017d47/
       sparc |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/44777825e7196f7ac44a9ed6feec525120a7c63b/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/e4337a8f94ae3b8c5f05ceaf1349ad81c540dbdf/
        i686 | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/3ece91bb6b4d5ff8131055cd18d4ab5959931747/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/ec12bce19fa01b97dbd96f70eab55e3884545ee4/
        i686 | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/1d5bd7353907b9d17d19f7d00c4e09b82b898384/
        sh4a | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/5e6f2b907c213389d3e8b4151c590bdd939eece3/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/26a804fac04a9f96e8ed9d7c8a0a54522947375d/
    mips64el |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/fdc6ba236c316b7883f76ddc5abb7e84234bbbd1/
         arm |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/4dd6b3fa95a84cc29ddcaa13ada8eb0ac18f50ad/
    mips64el |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/6ee1c59c241f68ac1af1ec1d3c9adb6e61969ef9/
         arm |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/a6a5217cf6b78d61149755e23e124b51c8152dfe/
        mips |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/f8124bb2287f0947beda42d21e25a1708928afdf/
     aarch64 |          liquid-dsp-legal-info | NOK | http://autobuild.buildroot.net/results/3cfbb82d673e7d7a8e1581c1dcb2afb99016aea3/
       nios2 |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/ad79090b1ec294937265d6fdef275f31108e0b33/
        i686 |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/f9142fe3ee716f7f71ec5e5796c6d7abc0bab3a9/
        i686 |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/20fa6efac81b7c81be1397e096fb90440201692c/
         arm |                  mesa3d-11.0.3 | NOK | http://autobuild.buildroot.net/results/450f1adacfffc2b0a0f309976ecf9c068152f53c/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/37b0134b6c1bd10de31654e84827f7e03ba848de/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/e088e8ef16b56e9c90ca95ede5bd2c921a845e51/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/5a7e33ea1f037a839d7f3dd7e54e64e5c60c13a7/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/f28f355681d0b658a1c8e7d89aa03dc4641d5aa6/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/e1097d927af8054b14dfe15bcc2772c1e8482128/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/a1fc5b54d323c2c4054f738dd3f8c71ee318970e/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/2aa1049ff989dd01ee2bd88f33954e8a128cc96e/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/f043e47d192a45b28e098fdfe4c71eca6d69a8f2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a474789bd9d958bd3b85fe809bb078e385756cdd/
      x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/3636ddcc0efa974c674f36d3c65eea5beb32af52/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/947a21da0e5f3759970197c457d49a62fea54e4b/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/8aef80464aee645f078ef931746bd5580ed072dc/
     powerpc |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/abca76715ad2c916e6d49b03a59f37cc9f37dff9/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/17c54d89d8ed28e869dad8537f9c2efbc23ce67f/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/b53760577699625a009a8daf955cac5b2b47acdf/
         arc |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/6d3b9b21962525b949d86d50c4d67a709268a3be/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/f2c3af80c5592360f477c3166836deb2df04c471/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/03ab28eff788efd4b27e313248c9706559611a06/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/6ab33646caf63f63879958b2dee41aa218d45ff1/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/7684b5c0ce9d73f8202ee96bc8356e85a91f3438/
         arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/b434c3b9507e711dd373278f3697e7b3e796c552/


-- 
http://autobuild.buildroot.net
