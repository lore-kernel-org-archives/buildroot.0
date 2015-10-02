From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  2 Oct 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-01
Message-ID: <20151002063015.46A03101CE3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-01
===============================

        success : 223
       failures : 57 
       timeouts : 0  
          TOTAL : 280

Classification of failures by reason
====================================

             bluez_utils-4.101 | 4 
                  mono-4.0.2.5 | 3 
              strongswan-5.3.3 | 3 
      host-gdb-arc-2015.06-gdb | 3 
                busybox-1.23.2 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                  libssh-0.7.1 | 2 
                libevdev-1.4.3 | 2 
                pulseaudio-7.0 | 2 
               util-linux-2.27 | 2 
                directfb-1.7.7 | 2 
             ntfs-3g-2015.3.14 | 1 
                 igmpproxy-0.1 | 1 
                libnspr-4.10.8 | 1 
                 lvm2-2.02.132 | 1 
                mongrel2-1.9.2 | 1 
              cryptsetup-1.6.7 | 1 
             fxload-2008_10_13 | 1 
               libupnpp-0.12.1 | 1 
                openssl-1.0.2d | 1 
                    php-5.6.13 | 1 
                gptfdisk-1.0.0 | 1 
                   nginx-1.8.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                   bdwgc-7.4.2 | 1 
         conntrack-tools-1.4.3 | 1 
                    dash-0.5.8 | 1 
               dvbsnoop-1.4.50 | 1 
                  connman-1.30 | 1 
              gst1-libav-1.4.5 | 1 
kodi-pvr-stalker-5f6eb1992f... | 1 
libsigrok-fe473123ba836445d... | 1 
                 dropwatch-1.4 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    vtun-3.0.3 | 1 
               libgtk3-3.14.15 | 1 
canfestival-7740ac6fdedc23e... | 1 
          openpgm-5.1.118~dfsg | 1 
                  guile-2.0.11 | 1 
                coreutils-8.24 | 1 
           qt5multimedia-5.5.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/4921ece7cfc8327d80041fda44aeffe4e5f4bb30/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7107c3504c292a68819dfc274af26eaf871ba060/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6bd4e1f891177311d38920b8bd31d718e84e955c/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0c985326e43ad933b4fae534e56e6217ce20e619/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/0b9288b34868e4a4c25d4fb1223c73928a3e0554/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c8d86f08e00ad30a6d044b5170863d5d1e213716/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3fe91b324d45417b317000cdc6f6906518cf96c8/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/cfdffcf9294178fb89e0962e6f03ee0f9e22559c/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/beb9c0f13b512786b1211a5ce014783765fafe1f/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/d03dcd8e77bb45280ad1689428e8ba0cd2e17b94/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/fca7dd56d42ab9ba68e544412aeadc95e3d9c909/
         arm |               cryptsetup-1.6.7 | NOK | http://autobuild.buildroot.net/results/459912ff3ee9185ae58eccd61181010d56c544e8/
         arm |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/76d2ddf32f53b983291c2292206aaea8d58b091d/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/358c562c414ed5cd196b5cf3f182437b3b2eafa5/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/162821d72447ba7fcfe69b096ad992842ecc99cc/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f6b80d0f1375f98a2da8daedf66513180d9e6338/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/ced28f300c590de3823ad66b915db69eff7f2605/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/45d19e39a5e56e7aed66ec67209685b8a11cf5d6/
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/3251500d2a9993c7371105b5db2ddf02c02d3e56/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/536426dd68b57c050fdcf29616a07aeff5d21d20/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/f20fc0f0f3bddf530a0bbbfc5df1ceb8f3d3765f/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e5959ce8b2fd17d215795ee9239a25ea1244f7ca/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/b330f04617d1b680a9fc52c5dc7fecefc737710b/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/2442e697d8a300496434fd42fcb1ee3941d13e06/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/b21298ffe1747e9f3f4711fd7a46d2ea2d77d849/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/f4cbc7d3c74b7fe0d25f03e8ec20308cfca1d2e0/
         arm | kodi-pvr-stalker-5f6eb1992f... | NOK | http://autobuild.buildroot.net/results/56fb98da27495f6a461bfdc7aa8c2de4d86dfdb8/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/eac3e98fab17b78f2aed1e626354090b1953264c/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/e6d0985b57b962675ee435140f9194e268cb45b6/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a6200acf70f971574dd05c9d67f571ba6359862e/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/84a09ea9040cabcfb9ebcbb5bc6cded6828ebac0/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/c849affbda0e740f5a456746ac0d4f8c816605b5/
     powerpc |                libgtk3-3.14.15 | NOK | http://autobuild.buildroot.net/results/6140836be19cc6158dc7818e934d0f4feb826b7b/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/1b7e56accb4fc15b09489c50976f7a6affed9d0a/
         arm | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/e58add5a0295397d8594b58a7ee42c4d242527dc/
      x86_64 |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/90c34d79a36617ee43ae523c6aa29f66b3c43a2e/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/7c7da08c71b5378b68631e3844088307080f6f9e/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/b8da5e9a18ed5a2b33979f0b0a4dddeaefa5f0b8/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/d71cbd7e88aef248cb8ab5d2c8beb3b7744fa011/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/5c0260cc6e1da46ea8ac8be4b9e14997ac73ef0d/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/30bb60cb47ada8c53bf8726f9177fe13f693041e/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/3a74cf94bc7a1a5284b21d59abcc032102de7149/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/38660db08bacff59b42810d145d4a342ac7b4498/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/e8c4507d1a7ffa3829180a36c5afb3dffa9d64fd/
         arm |              ntfs-3g-2015.3.14 | NOK | http://autobuild.buildroot.net/results/17f6d11e521e2f4c00a6dad807cd674f9dad1b00/
         arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/542f93eb97e04862c5427ab672953392cda13cb4/
         sh4 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/d3b3c569baafdd496215a9fdf8bc97b6cacc4672/
         arm |                     php-5.6.13 | NOK | http://autobuild.buildroot.net/results/74ae21d78f7ea9d71407accd3e43900af6766e68/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/95e0627141e30810f58d119e0dcec4b574c7c62b/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/640f502c1d362af5c340d83fabdeca55343653c1/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/fc8deaead5745a428efafd2859c9c864d4a2128e/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/92be3b64b1e17b01dac41fba4d87ab1dab21c40b/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/3b174974d0ab687436c4ede099d33df9da40447a/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/ad78e85706b98c237bcfa40e6d495f14c2a075bc/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/cc41f422c4a282b1573eff188f6dfe44b689a777/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/5a72772bbcc166fa22a333093d3a30d7bb7ce71d/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/a7e684174b90a852318a7a8bf41c4f477d159d56/


-- 
http://autobuild.buildroot.net
