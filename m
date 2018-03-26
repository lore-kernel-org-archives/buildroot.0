From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 08:00:46 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-25
Message-ID: <20180326060046.44A1F20858@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  59 |   4 |   0 |  63 |
      master | 204 |  37 |   1 | 242 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 2 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/81ad06a530480c4d858374d383cc200d476d1cad |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8aa7ee12701fb78bedb541eed3b45a74230258ff |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9fdac81892277784905695a41ae941a0b4986382 |     
         arc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/99227598eeb84e7c07f7924fbd68c93502e721b8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    liblo-0.29 | 7 
                  host-go-1.10 | 4 
                  brotli-1.0.3 | 3 
                 mplayer-1.3.0 | 3 
             bluez5_utils-5.49 | 2 
             libmpdclient-2.14 | 2 
             qt5location-5.9.4 | 2 
                   systemd-237 | 2 
                tpm2-tss-1.4.0 | 2 
                  udftools-2.0 | 2 
               asterisk-14.7.6 | 1 
                  cc-tool-0.26 | 1 
                    gst-ffmpeg | 1 
              keepalived-1.4.1 | 1 
                 mesa3d-17.3.7 | 1 
                     php-7.2.3 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.6.3 | 1 
              tpm2-tools-3.0.3 | 1 


Detail of failures
------------------

         arc |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/3ca5b43e3bf7fa54fee3d0ef5e480a0312344ffc |     
         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/12e0efe1d26b8e0968b01db7c8fb5c9c1ca57a3c |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/01768f8b6b522f6c8381d14d478047c241e172dd |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/74d20ff38766466623cc4a9eb18afcda831bc20b |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/4e661d663b487bbbcc08a63e136d991931a28639 |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/f1c4b5aeb12af7b7a3e8ae01c219004ecd9befd6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a69f221c753dbf88037b385af456ab850dcebdd5 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/4d73adc544f83b2721452cebe665ff6f566e4795 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d65c1845ab52dfc2614c240bb07b676199b8c91d | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d96262c0a8edeedd29b7a43d6437f100107018b7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/77da8df0079b20ea8b662462da9207eb27b51600 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7f84ad63e6426d67639658399639833bfbcd19ab | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/63985cd5a6fe299555486ddb4ffa1b5bac2eb108 |     
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/83b5793c987d414a5e8622fda09cb9c181b69da0 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/e458d97c092db7d141909cb257b22ff92fca6711 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/0c050776abb67edf603faf9b9774656b89429923 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/af4c44fedc3c1d3cb117c8695784c7d4d38177ad | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6518a47a16be6d6f4296a204f8fb6054dd42d779 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/a4b9a6181893b00dea4edda458f9e1544a7a250b | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/71a366eee9095dde0af257b42cd951836ac1dd70 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/03c843872b8fc93e3a263518a0892019420de6e9 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/4f0d4483fd2dcc5a77d3f42efd00504b57ab8951 |     
     powerpc |                  mesa3d-17.3.7 | NOK | http://autobuild.buildroot.net/results/cdda8e6cfe76f01f2c3a9ea612246a17c8caefae |     
         sh4 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/677fbaa89a4cac67b7dee8c73332840ef787312e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ca2a1547b00c55572d15776653e08df5f104a0eb |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/70f0598acdf051b02b3e92c1f320b19825ae258b |     
      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/ba9f442e75fa646bbed0f25f9f455c8de106f591 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8805e41775804eb33d7fcdfa56d482a0ba0f81e1 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/624cbc03360c1f8303c3742799d530545fef97f6 |     
    mips64el |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/265935e0f6ad66d16e1efcac2a1c2af56ec98549 |     
     sparc64 |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/66304ff49dc8504cf542bf3f6156ad3a31bff5cc |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/4c439ee000354f90b4e59ee4006530f77263db47 |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/4e79c0551b3b9b43d2ac37aa0b2bffbf41fcb11f |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/54ac0b13208a66bf94bb3668ac79e9c3a286ecaa |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/086420b6447ae9d94ff09093104b66527120c0bd |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/01bdd6870bb6126b1d40b5fb71b68ad4f8fc33d9 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/48ea5699acca29db44fd245391ff06df0755256a |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/23e280aec97d2dedac11726eb5ea801b54352664 |     


-- 
http://autobuild.buildroot.net
