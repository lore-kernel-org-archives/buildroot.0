From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jan 2017 08:29:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-10
Message-ID: <20170111072939.68981207D2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-10
================================

      successes : 161
       failures : 74 
       timeouts : 0  
          TOTAL : 235

Classification of failures by reason
====================================

                collectd-5.7.0 | 20
               sdl2_ttf-2.0.14 | 7 
                      mpd-0.20 | 6 
               openswan-2.6.46 | 6 
                    flac-1.3.2 | 4 
             host-nodejs-6.9.4 | 3 
                  lcdapi-v0.10 | 3 
                    git-2.11.0 | 2 
             libsidplay2-2.1.1 | 2 
            lttng-libust-2.9.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
                     vlc-2.2.4 | 2 
             berkeleydb-5.3.28 | 1 
                    cups-2.1.4 | 1 
                  fbterm-1.7.0 | 1 
            host-heimdal-7.1.0 | 1 
libasplib-f7219142e790a329b... | 1 
                 libraw-0.17.1 | 1 
                    mpv-0.23.0 | 1 
       opentyrian-9c9f0ec3532b | 1 
python-libconfig-b271c3d9da... | 1 
                    qemu-2.7.0 | 1 
                    ruby-2.3.3 | 1 
                 synergy-1.3.1 | 1 
               tcpreplay-4.1.2 | 1 
 xdriver_xf86-video-sis-0.10.8 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/19c1087de09c6e24f061aceca763932038dd63bc
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/efe52c810ad65ba69407548c790128e1e07f4593
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0a73e37d07d2538ed56605bf22869bc59c3c350d
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e0c15d88b3faa60cff8d299af606df3f4acc0cef
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/63b01a7d0c51bea04ef6b45528dcfcdf80833e53
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/21610644f7dd288091a523b46e4e17729e65319c
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d1c9ee415d7011dbeff434fe077d869b2fb1bdba
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/aa4d6672ccd801bd4fffa57bb23f37b8b79f6b02
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9a96a2e98030b20b6c3493cfa66ab96856fad7d1
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fb01eb21f34018bc7f4fdc42cd303550adadaf6a
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/17ef68ad634aaf5aef01a0430addd0a6f6981fea
   powerpc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8398c2c7b74df448c8a3d55adbdd59f3d8140cc2
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2517613b22b2812529f67e4cbb1715a558fb2a80
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/591d710c4206fc201a5d49b41612fc0c9aade2fd
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/356e9eac35d144b0a1641e991fb8aab17959569a
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0a3dc7caba0303d2116432bfb4afd0359ee291f3
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e4d2c954487efa18482f0fb383d5f1501b82ff39
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f75d3bb14f8747da404eb1a2fb86dee61a579fd5
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bfc9ca327ff931bd26587389c20b2428abefd7e7
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/47a56f5d3d296d48a535df6ddc5fad389e33fab4
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a494bc905e4509528c4932f76a094b9ea8e70bd3
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/2d912c9bb68b6dbe448fd806a14a071c8f4077ba
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/30933daa4ff6b5325b6bda8077874f086a7a8177
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/a11a2db9db025ebb84349a906f9dbb8c21267c05
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/a5f0959a7ca81a7f5827ef9cf4bdadc763dd5306
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/0138e66716e25285e820166c026c5de09d78b7b2
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/08dfd527ea45ac2d103c53863d062349cdc8db4a
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/38aced3462e72550a4077781f2741e23d15be113
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/04f846bfe1fc2996a8695ad15d6d90614f48221f
         sh4 |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/f4b53d7d98339f4cafafc37a9166291387e851cb
      x86_64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/532900454bada96a14a4863b69dc5dfba5cd56b3
      x86_64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/d4567cb9822f9ec445d14f4e85219010a1ae2f91
        i686 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/6c2b952c37c7bd5a91c9ca7e63f46f0a0b56a987
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/671b9983b95c393259249db7cd1a3b80ace6cd43
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/97ee3f19d90d7d74a5e3b31596a6b9a4d393a9fe
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e9a7223fdd6bcb885c1a6814e7e9f44c048745c8
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/b38532d6119abe3e82510ed4d2636b5f855fa36b
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/91bf1c05b0be29d4c04c61b6fe54e73fa43adb3e
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/cc5c49d73e1485c0f7025c1204bd75c3c67b08cf
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/dba434ed58d909379655f6d3051dcd7df2953ffd
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/845e556d7e5aa6f6eb6ba95c44a0717319679172
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/1a4c56b6badaee248adb8d55daeb5ab49b119e94
        i686 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/9c7af87c79edae7bcc592f1d6c92fe0cafa4752b
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/dff4ed6206be11c3f06102b15f13c21cf3f3c17e
      x86_64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/28befdd89ef66c0cff3bba69287b6391c97755e1
         arc |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/cffab52e16868fa2496e2bdc7b66c1c90e17b40f
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/1e10415ef2f8bee8d0834ca96ec1a1ac3d888ce9
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4438e34a626097334f60183b11bd337e90c16811
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/1775f380c8030c0ec4076bbda5c640e259869b43
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/5c3cf5040063b7cb85995bf074a33a9a7f2bffde
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/211c73f3a2fde9c2b0e3e1c4ef1e0062c06353eb
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b1dfb423068c73849c01a18b75e145d4bb4bc911
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/ab6e26820ef6d30969d48d835b7a1d61f6b99d02
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a959e802d08cdd97d0a4a6fa90687cea8c78e649
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/2b02f9d0503ed15036382342f199902be6cc1f16
      xtensa |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/66f0f377d9d64cb0b5f9d3cf704dc51a85a6db98
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/a56d64d2721bdbf25b66fc4d0551e5831ef7d564
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/fc5ba22bfa463aee06ae5e0c454359f11668ca3f
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d5aa3e1e806aadb505367093d50d6afdb4cb9859
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/db2eb71cdd8d849e6b0c92c3748e8260b753dc82
        i586 |                     ruby-2.3.3 | NOK | http://autobuild.buildroot.net/results/8e72bb9d930578c158d53661d3886266fdd71981
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4da538774b56cad70f9a4c3ebc1abeb5658aba1f
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/df8120edc8fd3b9ca8f1a6142d9141bcf3043d27
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2541f775510b4db081c56f87f4fbf15ba6a3687d
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/078cd3b72d1576d4e8631e6473099ee814c68009
     aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2b28c5ead6d4fb01cd2fbc18235aa0bbfc483cfe
 powerpc64le |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/91aaeafa1b3ce9a1a70501710001da85f509b0c2
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f1368363276f7e84a92d741b32567a6a3121a616
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/382a879ce878b37620fc3abed1dd44cc1d67dd4f
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/236afe019abc295116fc1ba92e0d28fc04421d8a
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c5699ed854f16b56f092e96402bbe88e88867f1c
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6e8b4f7dc8d3cb78cf4bb77bd1839a7f5214478c
         arc |  xdriver_xf86-video-sis-0.10.8 | NOK | http://autobuild.buildroot.net/results/b3c28e667905a41134a316230b35307be1c6b1ae
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/a6cc76dedcb42bb66f37ae07cae50fd866955186

-- 
http://autobuild.buildroot.net
