From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Mar 2017 08:28:47 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-02
Message-ID: <20170303072847.870AB20BC7@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-02
================================

      successes : 152
       failures : 103
       timeouts : 0  
          TOTAL : 255

Classification of failures by reason
====================================

             fontconfig-2.12.1 | 43
                      fastd-18 | 28
            paho-mqtt-c-v1.1.0 | 9 
                    libiio-0.9 | 8 
                libepoxy-1.4.0 | 2 
                    nano-2.7.5 | 2 
                    gdb-7.11.1 | 1 
        host-fontconfig-2.12.1 | 1 
              keepalived-1.3.2 | 1 
                 mplayer-1.3.0 | 1 
               nfs-utils-1.3.3 | 1 
                     php-7.1.1 | 1 
             python-pytrie-0.3 | 1 
                  samba4-4.5.5 | 1 
                 sngrep-v1.4.2 | 1 
                 sudo-1.8.19p2 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

     sparc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/d1805f8f9c9cabf61ed992e2ff805b7360f2a77c
      x86_64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4da34a85c30395d4c0b8c73c7f451777652c4502
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c57a762209042f034ad35f213e8afbffa5148af2
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/1c462cbd5d25086bba6b7064c690a359ec0f7dae
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/c65fcbefec4830aa978d71daab808ba866683ec9
        i686 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e34c376cfb74af685615acdda120b8fefac98253
        i686 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f3473047932266c4ea164308a569acbdddb5e78e
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/9da4560afec973d440c8d4efdf4b4255537745c1
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/bcc523f3c6153df83b753bfd00f0df1a72a84bfa
         arc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/004f241ddee2ce19793d615debb00beaceb72c40
     sparc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0656e3e3455a259c48faf1a7a4c4c9dcb07ac747
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/0c8a606627d57b69ed3aa65de14d2f2ba38a19e2
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f4e12c027d27d8656b0f3f70bc0467a88f220f16
   powerpc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/3ec981beaaafa65603773718254ca2f2e5c583c5
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/235ae41821a033c46f51ecf64181d6ed342087dc
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/b3f75b961d88faf5f39fb140f4495fc6af6c843e
         sh4 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f6dddd5df4c7a2d71d7e4d05f787adc91be70fdc
    mips64el |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/f1dfe90068ad62e733f17a22202235415bda3974
       sparc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4839dbc4267a385d9c9413902ddacf353a733281
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/69fb2e3b549a069e2898506db918423e6742c589
     powerpc |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/43a0ff9c7141fd884328673ac502f6ad17aa292a
     sparc64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e87a465b082f53cfcdb9a8b42e0aa07c6733904b
microblazeel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/4ad3a4d03b37f978ff4648f0abc05bfd5f234a4e
      x86_64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/fa18c2084f07ecaa7e81e97a2b6dcf406a3aeb3d
      mipsel |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/1f5ae56825f4e23762848cf6023aeb30e354a1a9
         arm |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/356b4703db57379a54b324dc6949a8a62577baaa
       nios2 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/5faf4120ffa0e732575cd6c087e6fdb68a8cd8dd
      x86_64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/e945c33a799828b91d2d354c1b350657d748522c
      x86_64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/39850d6feb63ddea5a881372902866c65cd1ad4b
     powerpc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/47968fdd0754b9a1d1de10acebeb8fcbacff648f
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/ef5028e7f7c3152fa00b27ee2fc8d0a026c0671b
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/17471088b26ebc840d1922d7f2aa9e69b4b49ced
       nios2 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/1d3c81c026cc6ba007616b1640adfeddeced1af2
        or1k |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/6171c4ff759db8e11ad3d5c3de9372d2fe08f0ee
     aarch64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/efdf18604103aacc3941547e6bfb9379a8c2f985
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/ad48d5dfffb0546f50b459144d41f98a3d1ec910
         arc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/a24583b6d79a15ac8b4a6187542a6e2e719f99fc
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/1923fa856e73bca9b2d63fc59c1c6be2a511be12
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/5e247b5cd2a83401086f6c2ccca8d4c7a8cb2e3e
 powerpc64le |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/bd5f46f1a728ad1880b56d2671cb6c79e95b4313
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/ae01bc3589fde998e98cf9f5687995f020df63af
        or1k |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/7fc9f0db8d7106ce1722acab03493926c687a58a
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/c34527276f2f4af46c26f196e803e12401a0c0bf
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/df46dddd3de81ca28b28445d0109e2a51f111d22
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/793a774dc398eca114b9d642b00c0cedea7e89e1
     powerpc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/cf670db713f4ec1221844debd058679d422882b7
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/315dfcc8bde9678729c0318692d0fb4794e81fa2
     powerpc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/ed56e6a02c9bbebcea45451e0e1b6a843a45c82f
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/a793a7c1edd8602a851e5142f7a51df508933e72
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/b2440498bee94b1e324dd46df0a97e42fd3f9181
       nios2 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/8a5532f5523e45492e3fffe995e59dc9c3615215
      xtensa |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/00360ffd255e2cb78488fce009d2a94ed3504639
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/1da92d605b4a8eebe0565a8e78e212df02f886b6
      x86_64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/92e0aeef2a1131db60b29cb7a9415fd52f656d8e
        i686 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/3d7275d20a3847a9ad72fafe9ffbfca434999c48
         arc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/8e2feec8c7c58ad6b441e59ef5ac13334681ab6b
        m68k |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/c43790da054590a020dceebc2d6870f39030d051
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/5009b60d5a2f783b73d45560c942e54e76e82d00
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/903d2a411250d819ccba9de20efc3a9819d9be10
      mipsel |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/5b10fb36f190f3addfaf9bedc28a05e3318a778e
    mips64el |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/8a3b7c21e09c86fdb1f5230b503b344b511e4764
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/8c857274f48f755c4927086637f9e1c312ed95cb
        m68k |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/8032f2fe49b6a593c4a21d0110d80060430fc616
     powerpc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/33e922b9e52750dddb024bccd9373c3d832f90c1
microblazeel |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/d53679971480a75b1b7dd4dd35d251ddfdd798ba
         arm |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/5d781c938e8dfbeb3d12214de24faf9b255e42a8
     powerpc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/d501d45e6b46cc7a858f602ca5c51e22b0deade7
       sparc |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/f2d7422df6ec4b3d357958057e091d7c69a54a6f
     aarch64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/1b2ed1f4362b6e02dc26650bb54927343fbc0d99
      x86_64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/991fcaf306bcf26a449b9fa5cb447d70b209611a
      mipsel |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/05ba2a6db80005335e8149334646a85b7771493f
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/1a3dd57a7242894a74b074a03357963260cb8d7c
microblazeel |         host-fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/7cc6a2afb3cfab55d42a2b3b1a70d231d3335ed4
        i686 |               keepalived-1.3.2 | NOK | http://autobuild.buildroot.net/results/5c91c49232fa4b8ac154419b0d7e78fc7aef1e4d
         arc |                 libepoxy-1.4.0 | NOK | http://autobuild.buildroot.net/results/c02329c9a094207d3fb2b8847a99182bd076f4a5
         arm |                 libepoxy-1.4.0 | NOK | http://autobuild.buildroot.net/results/e10352da9884a0e95d46ab2c122a25302c0b6505
         arm |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/ea84e4487f4a8ecd14cd1a513c7ab22b2aab339f
        i686 |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/c9afb4f235fac9d947a7c133bf3b8c80944c8656
      xtensa |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/0f8440893bda9e57842bda5730b4299ec7984ac7
        i686 |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/721df08b8a1700a204c63f60e9cffb9b8c5c6fcf
     powerpc |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/1df0993d13ecc63162812013033c530e5d768434
         arc |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/a4b9563ad8183dc8572a53d2acb8bd6b2d16e9e3
         arm |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/2812b008a0ab6bab5fe4d45eb9ffe4e9496a8cb4
         arm |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/69aab5c870baac979cb5f0ae61a593cace20f9db
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5a04ecf5a8f9d0171ae0feb847e4d7c73cfc6b03
         arm |                     nano-2.7.5 | NOK | http://autobuild.buildroot.net/results/db9a48e6ed828e5a4464623419d25200b31890c3
        i586 |                     nano-2.7.5 | NOK | http://autobuild.buildroot.net/results/e697350041756451e649dab34213259b4a8ff40d
microblazeel |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/dcb02bb94c80a3f2e8bbe81500fce91e08a063d9
     aarch64 |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/853bdd7641c044d332559841f35b6f0ba741fe43
         arm |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/9c866cf0254c81191294945cca470a89b4de9b6d
         arc |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/f3109aebd093ed03755e3d646ce64f07984fe638
      mipsel |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/1ddc0bd24d1b9f135951ee8b87a3f6ebf727a966
         arm |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/a4a72b23b8aa79337363db9dea31019a27483ff3
         arm |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/9b716892d372dad0f3e226b0407ad58a4ad31390
   powerpc64 |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/070a55a4307f5ba3f21835a97550b97b842db97f
       nios2 |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/858c9b439348bb5641db647e9518b6d7f2a2da16
         arm |             paho-mqtt-c-v1.1.0 | NOK | http://autobuild.buildroot.net/results/457d76279e16247bf58c838a2c5dd0a4f3962c21
         arm |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/6140b8c0a7bf5870f9faf7e4184e3cde75a475b5
         arm |              python-pytrie-0.3 | NOK | http://autobuild.buildroot.net/results/c6a87e5b434bc4789065f3237023664ca5e8e91c
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/30d5661212cc2e7859f9a9904989d10748e2d004
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f3cb20cadd548c36fcb33d063f9fa62862bce327
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/4830c69cc6a62080e1516f0d9009c2ba619c23c1
       sparc |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/5598fc89bc9607e885f83dcdda5844cf2fbff373

-- 
http://autobuild.buildroot.net
