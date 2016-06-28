From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-27
Message-ID: <20160628063024.2AAE21015B4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-27
===============================

        success : 186
       failures : 64 
       timeouts : 2  
          TOTAL : 252

Classification of failures by reason
====================================

                  boost-1.61.0 | 7 
                   efivar-0.23 | 5 
          libmicrohttpd-0.9.50 | 3 
                flannel-v0.5.5 | 3 
tvheadend-8e637f9f903f6d820... | 2 
                directfb-1.7.7 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                 mesa3d-11.2.2 | 2 
                mongrel2-1.9.2 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                pinentry-0.9.4 | 1 
                    owfs-3.1p1 | 1 
               libdvdnav-5.0.3 | 1 
                     fbset-2.1 | 1 
              e2fsprogs-1.43.1 | 1 
                 lvm2-2.02.156 | 1 
                  cairo-1.14.6 | 1 
make[2]: *** [all-recursive... | 1 
             bluez_utils-4.101 | 1 
                cifs-utils-6.5 | 1 
              libdvdread-5.0.3 | 1 
               linknx-0.0.1.32 | 1 
                   fwup-v0.8.0 | 1 
              libarchive-3.2.1 | 1 
       qt5imageformats-5.6.1-1 | 1 
                beecrypt-4.2.1 | 1 
                sg3_utils-1.42 | 1 
linux-firmware-b0668886def6... | 1 
                 php-zmq-1.1.3 | 1 
                 omniorb-4.2.1 | 1 
                     php-7.0.8 | 1 
   webrtc-audio-processing-0.3 | 1 
                     dtc-1.4.1 | 1 
                  stunnel-5.31 | 1 
                   dvblast-3.0 | 1 
                 msgpack-0.5.4 | 1 
             libtorrent-0.13.6 | 1 
                pulseaudio-9.0 | 1 
                    lftp-4.7.2 | 1 
                collectd-5.5.1 | 1 
              lirc-tools-0.9.4 | 1 
                 mplayer-1.3.0 | 1 
                   perl-5.22.2 | 1 
                oprofile-1.1.0 | 1 
                  samba4-4.4.4 | 1 
                 liburcu-0.8.7 | 1 

Detail of failures
===================

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/98034ebb086987fb8fc004672164f609f5a69543/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/651f4b906f8d7201b9772f4d51ba037502e04a19/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0dad0cd63f01d0f1335a4c65acbe5e00bc96d0aa/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/111d2e193fd7c00a06306ff39cf8b353c74c4971/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/799b60eab46678d9868c38733cc65745eeb068ff/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/78bcfa726b5c4dca4e7bcce1e448dabe51f0f5aa/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/dcbd6cabf9bf9fc375a934eb30a7e8ff923adca6/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9b8775c75e933bf013c13d5169c5d5da9194cd25/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/77ac0f6abb83ab35b2147fd090dda2d91f7366b5/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/2e0e640f778607ee546de67106d5373949ba10f7/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/1e1fdf5e12403c27182c159bde3982653152aab9/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/095a1aa70067e1eed2c55c9cf59b2bce81704a14/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/3de41106a6572a52ebace8955d9f312acc357012/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/9b9f735dc37c2dc8c5d2731dc434eb7582818b13/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/d1655ac76416d672e3db39e0903ab842679c0a60/
        m68k |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/e09ca62ac8f4d7f0041c1789054e00755dee26b0/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9ba73dfae42f8a264ec1654e5439848176f84c91/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0d09f80a15f63e578c8ff58bd07c45f41b8b17fe/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6a0d57bc1eb7e4c5bc9fc27e96403f1c9ee85012/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/3e167f213c199b120d7596c237b5b7310082bcca/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6c64aeea52fc275da578a53a70da20be5e704658/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/883d40bebabaa03c296fe0464031ba67f8df458d/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/2a10badc7f8d011e2e21109d28e168a0f601512d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6d9843e1926bf8c12d07ba99499f19891bb93b91/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8b2933cd022a7c51a1a9ed9d3e5f37215f61948b/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5fb65fa5320be0074de774195b308fba95e34e22/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e6b1cfd4460c81a87e0d8f618dc6e1d3667870b0/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/58485c31f299ff2cef6d12ce98bc4f48eca5f61c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/61fc5362404993794ba781a533930670fcdb1b44/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/49afc532d5f759139b8c8170af0217f9f3423a4b/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/61cde4a2cd1ff651bfe74e7085a27e4bfb28a2ba/
       sparc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/850f95461795bae64b31f3c8c13189b7c08df80f/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/8763f5d9b59944e542e2364df112a32fa9e044bb/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/2c4b0da09ef705d6b3ae5fea1b48268d4bb75b70/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/bf66a24f161b8d4cf68c1cc1cde14bb2e848afda/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/2bb6e41c509022cc4d9de7ae242479aafd53335c/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/cb164a7362efbab6ae644ce4b2cc3fcd815221f3/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/0374e3379d00f4890d5185f841f8d378ba1e15bb/
        m68k |              libtorrent-0.13.6 | NOK | http://autobuild.buildroot.net/results/4bfcfe82ad503d90e6214df5a7f378d12a3275f5/
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/ac8f461cf623de2026ad177846b9262c381b8b88/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/665d6b9e3b743ecaffc3ae3dcb3486e94b5510b3/
         arm | linux-firmware-b0668886def6... | TIM | http://autobuild.buildroot.net/results/ef7b773805d9205f86dc23b5e8207882399fcd80/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/6550083e1ad96c90b33793bf21586c5e9d1cc98c/
      x86_64 |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/427401f380f772bad3e8ff18d768120fcd5a5f89/
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/c87ce95c56734cb850279069a4cbc795bcf8f695/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/f4bda5e1544a32de0438b6ffa34ba6bc363e60cb/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/8c65e7dda37bcf0f50d86777b0f8f0552806b216/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a81bb0a63e738f6f7b3a499732141814f042f650/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/372060b2bb3a295c1d3f0b0cea8f0068e69d0d9c/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/aeef5aaf8afb352189be962b8b297531a3d53541/
        m68k |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/335b315f97f853d5de0e25903205d5b85bdb3143/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/6d887db22ffe262619a87c7b32eb07e18043a0dd/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/13b24efb5a63e42e41b7ba6b4cde44cd957a898d/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/4fc84a3fce8e7a732f958a5112ef05e96b6d9810/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/feb493579e22d728cdcb84a9a402ed96ca53424b/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/8fedd5012c0a60e24f8e608520f75c68390f8a14/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/f7513cc82c7435bbf3dcd656e48604ec5450b9fd/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/0512307969ef9b4e4accc230113a37eca010571e/
      x86_64 |                 pulseaudio-9.0 | NOK | http://autobuild.buildroot.net/results/c6e12e401c1704f0bf9736b18b91ac789938a978/
     aarch64 |        qt5imageformats-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/0e577a70bb88e2ba685ccde28576a6857c99876c/
         arc |                   samba4-4.4.4 | NOK | http://autobuild.buildroot.net/results/9972cc4e540891a0d73dbddd89952234d2aa20a2/
        m68k |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/79a572f67bafa6a007256a5f22529c2daabd5733/
         arc |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/a72fc2d4617da8ca5d83fa624f75431eb261ef09/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/815551d04a23336ea01ec8190b746457e78bf84f/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/2dc096ca420d08fd09ac20fb8d4e6f99ea91055d/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/acb4d736cb6ff1d9f57c4991242600a38f915ea5/


-- 
http://autobuild.buildroot.net
