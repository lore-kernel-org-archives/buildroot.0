From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Nov 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-01
Message-ID: <20171102070006.034E121D8E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-01
================================

      successes : 211
       failures : 73 
       timeouts : 0  
          TOTAL : 284

Classification of failures by reason
====================================

           argp-standalone-1.3 | 15
                  boost-1.65.1 | 6 
                  ffmpeg-3.3.5 | 6 
      host-uboot-tools-2017.07 | 4 
                   mp4v2-2.0.0 | 4 
                     nmap-7.60 | 4 
                      qt-4.8.7 | 4 
       host-go-bootstrap-1.4.3 | 3 
             dbus-python-1.2.4 | 2 
                    gpm-1.20.7 | 2 
                   jimtcl-0.75 | 2 
                   libidn-1.33 | 2 
                  libsepol-2.7 | 2 
                 openssh-7.6p1 | 2 
          usb_modeswitch-2.5.0 | 2 
             core-dependencies | 1 
             host-luajit-2.0.5 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                 libdrm-2.4.87 | 1 
             lttng-tools-2.9.5 | 1 
           lua-sdl2-v2.0.5-6.0 | 1 
                 mesa3d-17.2.4 | 1 
           oracle-mysql-5.1.73 | 1 
                   pcre2-10.30 | 1 
pdbg-77158819158d1d7053a737... | 1 
         python-gobject-2.28.6 | 1 
         qt5imageformats-5.6.3 | 1 
             stress-ng-0.06.15 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/4c60ecdcb5d7fc148bbc093f8471430ab9eddf52 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f1556491c176ff55466a08680e89f1e3a84e9a3d | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/0c616342a0a3e5212353124c3250f4cc473f5c07 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/12b97541557f651cb3473b6bb166bf170d1b89cf | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8e9e79d76f65962e9ba16b7fc24e6273aa8c0abc | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/529ed4f48878a506d917a7e709020875ff5d5947 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/4a9be065a03fdd4559cd9cbfac5d312e66a05682 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/32894b97318b04d0e0da168bd865f5061aa36255 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/99119423e5b5422707b9abdc17b9719f5b7732b4 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9c0eab45774b3673ff0c5592019434a59f1d0537 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/32b53c374d157789f3b8ea1b8830e3b2f2d4cb3b | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/4ec606597fdd1522cb5defd21f5646c6ad3a28f5 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f285faae216010eb4becac90af4c924db641ce02 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f58cfb2590a106697fa26a907894df2d80033a02 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/24e31b3c86d9046d969869b7388321319058a2de | ORPH
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/4dfe8a9034cf50c0e98c50dd9ef451d938c1c2ba |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/202cbcdc225833e9f3b2100d82105638dfa50cc3 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c8a028d4fbe3687034c19aae000899eaed4e25f9 |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/c7e002eacb7135351ce489fba1bf59325aa3b349 |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/6ad05441cc84039d4be4703092060d9e1e9c4cea |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/bb0e506a879ff2027220a0e86c2044dc893f58fb |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/e2fa0099974737c45bd2cca5d9869d364fdc6ed2 |     
     powerpc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0de510811e3f20c05ba8c6b834e6d8beaf4ca97e | ORPH
    mips64el |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0790d9c56454ab5b7354151af4c56d60bf2d9f7e | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/763e48a8422c225eb196d5d3d8c517977ac9be04 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/8327bd1aa94ca205a987a662e52aadf528cdc777 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/afcaf9103b4ba768ece8873625d7881e8663b933 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/80c307e8268d68858e0a9b4642bcd0be0ba568a2 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/c987c463e80243f7b6e8aa27146952300f04957b |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/8707681834fca77a6952345616ba06e294522614 |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/15e24f8c6a3ad2bfd198cc4fb094aeace7d1ee6a |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/7c24edc1af7dabd2b401e750add1eccaaab8961a |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/37f18f68e0986af7eb6042e5d728a2032b4d3a99 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/b2dffa282d69e1ffb33e3db98bd5da5d07e2ef6d | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/8c08f379ae1eeb1f50f5214f1407c1fcaf296a8c | ORPH
         arm |              host-luajit-2.0.5 | NOK | http://autobuild.buildroot.net/results/be1f186bc3dc2700c26bbd4bb51150dcb27b461b |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/4c9f38e58a8f758b9c22ea1799a4357b7bd55c07 | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/4be9ebd7394e800e64e7542d79a75100963b2c11 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9daa69d8c43240574806feeba16e39e72c1e97cb | ORPH
         arc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/522dc586ad27ee82c720b8fe663c20f201d6a86f | ORPH
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/10e60f000a67c161f556a474ef42742b717699c4 |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/7f42585cc2130d76ae6aad0d379d4785f78d6d5a |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/d8dc16e95f49d88e108a615134e355ec55cb972f |     
       sparc |                  libdrm-2.4.87 | NOK | http://autobuild.buildroot.net/results/b67ce6f2b9c054a0722dd26be69a254b2869998f |     
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/19a2ed9859ffe7a5dade07d446c0bbc960d3ee96 | ORPH
         arc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/a436cbe6239ed3af622d616c5ab14130e14af985 | ORPH
         arm |                   libsepol-2.7 | NOK | http://autobuild.buildroot.net/results/711f60acde7803f5f4e9ffbb2dcfae1d0ae1595d |     
         arm |                   libsepol-2.7 | NOK | http://autobuild.buildroot.net/results/5f1c6872a395d8c6d55e2b1722730871b4daf6a3 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/4c69f26640c7b0f4e9598b85c3338975716c6a8a |     
         arm |            lua-sdl2-v2.0.5-6.0 | NOK | http://autobuild.buildroot.net/results/45e39562a68c236c582861d410ee1a9924f2bfc5 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/e51d64b76a90c47f75774d64f41c1ea091d1902b |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/449bf5745b8a43806a4b7e188801a4f28b979424 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ab72440c87f069b166777e5c9e8db21846e1011a |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/9676f4e8fc6f31398dc2ffbd2b15d70986b5a99d |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/24dac8a2773eca75048be44de4f2f577e5edc04c |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/6b11cb41b089d171e5769975e214390440813b01 | ORPH
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8f1b0d672a605481426f9a234075a802f45a092c | ORPH
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/dc9cf6a7af54876c870b22fd2120cac293f579d6 | ORPH
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/dccf64346ab0f8af84d4c0c4659327ba33b0b6de | ORPH
        m68k |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/78dac219dd40fec6408e12bbbbb86bcc7c3278c0 | ORPH
     powerpc |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/d1b1e134a6e08deaed23a8a944522d21ee72cc88 | ORPH
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/38031ddec538bcdac9fbb8fdd9ddc414eebb9f9a | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/f0cff5f06c5791cc08379eaf236c486f707449a4 | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/cc26f7f800fde3a5587438499c31be730f49d987 |     
         arc |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/dbf1c82fc936b6e1e79285126611158aa0a0e9e3 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/47d11574c30d632023ea94cb4eabdc715712dabc | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/202edf92490b2d8ed8d8223f4c2b7e68a5808cd5 | ORPH
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d63fd731500373b664ecb2f8681e22503ec80626 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cadfe8f1aed25b2a39410cffff1d2a3940ea1ab9 | ORPH
         arm |          qt5imageformats-5.6.3 | NOK | http://autobuild.buildroot.net/results/9575865c38e754b940d149a092457146d2b1dabb |     
         arc |              stress-ng-0.06.15 | NOK | http://autobuild.buildroot.net/results/f8fb4dfe9c9fb5394f97679925c1ca08cf67136d |     
         arc |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/265ae079a53363836ad81a1516fb3c087d82cfc4 | ORPH
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/519f19d127ec9d218414ffd53234c5cbb3970ed4 | ORPH

-- 
http://autobuild.buildroot.net
