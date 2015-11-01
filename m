From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Nov 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-31
Message-ID: <20151101073020.201DF101322@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-31
===============================

        success : 148
       failures : 57 
       timeouts : 0  
          TOTAL : 205

Classification of failures by reason
====================================

                   mplayer-1.2 | 8 
                  ffmpeg-2.8.1 | 8 
              swupdate-2015.07 | 3 
                 libpcap-1.7.4 | 3 
              host-perl-5.22.0 | 2 
             bluez5_utils-5.27 | 2 
               lighttpd-1.4.37 | 2 
     openvmtools-stable-9.10.2 | 2 
                    ruby-2.2.3 | 2 
                      x265-1.8 | 2 
                  vsftpd-3.0.3 | 2 
               util-linux-2.27 | 2 
                   bdwgc-7.4.2 | 1 
                busybox-1.24.1 | 1 
         qt5imageformats-5.5.0 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                pulseaudio-7.0 | 1 
                  boost-1.58.0 | 1 
                    libiio-0.5 | 1 
          usb_modeswitch-2.2.5 | 1 
                openssl-1.0.2d | 1 
             lttng-tools-2.6.0 | 1 
             host-nodejs-4.1.2 | 1 
              gst1-libav-1.6.0 | 1 
                  connman-1.30 | 1 
                     lsof-4.89 | 1 
                   systemd-227 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  libv4l-1.8.1 | 1 
                   dvblast-3.0 | 1 
                      qt-4.8.7 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/93647ed90bde7bd41b55605e6836462d211afa03/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/e3075025df49be3030e5881af70120d55bfed333/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/bcc0b5ff4110dacd113841b309f3ec49d81933f0/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2e71e6f18089e91af4bd1fb7a574929c45d6fb80/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/e2f6c0a5f746690e2d56485138f238cb66f9fa9a/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/531d6cae331807ec8de48085eb82c5d7ec0146be/
         arm |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/81c7fe2578e0692309ec385f5bd457fcde64236e/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8b98cd9a24f01a6b1912eae57054b3e022ad33fd/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/c76cee063e9d2ca9e0ec5f3153570f54aa425177/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/e0168d86053946b607459f84b245216bf4627a3d/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/34108033f2cb18ef78f07664ff6ccf4f03a1d804/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/69e17f7c30e054c9fbe8f22c0cc695956c4abea5/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/68aa10a02443750972848bc1f921e059d34e17d4/
         arc |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/0daf90dcd9e20b5b2a4348187a2a9c9d3d2a9dd5/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/6af48fd7bcd0fe1bbba7d951d2fda27450eebb25/
    mips64el |               gst1-libav-1.6.0 | NOK | http://autobuild.buildroot.net/results/a04acd695f88504f01a1c78c9762230209ffde94/
         arm |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/406291bf7c61a80ed4a8d14d9a3887f51a1b2254/
      xtensa |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/a0b0c7aec75a61c1440a36fc284e916729c268af/
     aarch64 |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/9cfa1a2aa41faf6d1f9988e3963e25ea22e26a3e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/beace68a19382b43370c798dcf7d2ef412f9d75e/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/7d409d40968a49722d0474e03fae868d6e4561cd/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/68ca89d83fb39b459987c3a89c065792a282325e/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/e69c82c59ccbc91d6ac0a0db6cf932f4f77e427b/
     sparc64 |                  libpcap-1.7.4 | NOK | http://autobuild.buildroot.net/results/5e86aa684ae050da7d867a24b1ac50c9d7610202/
        i686 |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/13155d9a467bb5f04c2489858bdffd2fd5cc36a9/
         arc |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/36d6acfc4a08e320f20b60b134803778e7029c80/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/364077dfbd8323af32eb4f29e444bc3b0f0edc34/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/9d233a4580f6a329f1c9ecc4947ca064d485e648/
         arm |                      lsof-4.89 | NOK | http://autobuild.buildroot.net/results/e16ac770af20bd8b4c6362b056236edf62e0a491/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/7edcd7d20aaa37a47f72716027b7ccb38cc90455/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/05e3ec1234eb25ec1049c2ee56a597e85626300b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c7a5f6d0783d87ed9b80cae6fdfd41d762474efb/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d577526889c6f4d33781c4336d7f4497650f7356/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/388af35f9c6c1f026d3b5091786d6db1a10aac6d/
      xtensa |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/596053b4ec3fd67161f691fa4f65765c4ba1a992/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6d42ea0c38ed3fe8328ead0721d00095bf46dcb6/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d95f2569f5b40b25a3dfbfb66a9516bb3815f178/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/68596a3b55334e8ed7ffed9c0c0b273129ce7746/
     powerpc |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/e1f917026f061db9b09831b60c9c3aa0983dc871/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/8609823e35115f07b0f16f0a1831201aa1cf9e3c/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/779bed269982f0b2e04baecae2e720d602319552/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/8ec855dbd1c0cb8bfc456c9d42e1b3e5cfeb877a/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/23eb751b57c27d01960fa8a224f9b9a4305201f7/
     aarch64 |          qt5imageformats-5.5.0 | NOK | http://autobuild.buildroot.net/results/ff5c70d18432e79720ea9a31428b4fe581b787a8/
      x86_64 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/c76051811ed417cdb541c496f7e5ffb772315ceb/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/6978945fa1ef702ba4ed756d29289f21b29a7ce0/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/9d41f878acbfb9c55b1cbefa9cbd522905abf946/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/d75cd8933880deb9028d873b9d9dec0dfbce392f/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/f30a2d4114a84a3985653707949b04d322a1614a/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/bab40f4d19b92a21381c9808bf31d5261c806362/
    mips64el |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/ecd7c8e8423efd5ffc175c915a2d6187b95e874d/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/05a55c5f049fe5c372a00b1ae716da8ebfe0f1b1/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/35c25bae51926e5e15bf713a0a0f1883e7643a51/
         arm |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/65f5e9417776ae085a02e9719d904d875a4e5135/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/38fa276f00fe88904b7c8ef4d0fd8b09fc4c5381/
         arm |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/677d39111ffba7533ecf69ed682f58bff86309a9/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/291b8aafb7db03d11e1c1831cbb7e73c051f4a12/


-- 
http://autobuild.buildroot.net
