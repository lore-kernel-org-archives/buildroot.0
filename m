From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-13
Message-ID: <20141214073018.09EE8101651@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-13
===============================

        success : 258
       failures : 450
       timeouts : 2  
          TOTAL : 710

Classification of failures by reason
====================================

             berkeleydb-5.3.28 | 161
                  nettle-2.7.1 | 90
                     nmap-6.47 | 25
                   opkg-v0.2.2 | 25
                   mono-3.10.0 | 17
               xfsprogs-3.1.11 | 13
                  guile-2.0.11 | 10
                libtirpc-0.2.4 | 9 
                    liblo-0.26 | 8 
                     faad2-2.7 | 8 
             ebtables-2.0.10-4 | 6 
                pinentry-0.9.0 | 6 
                     gpsd-3.11 | 6 
                libexif-0.6.21 | 5 
               boa-0.94.14rc21 | 5 
                     gdb-7.7.1 | 5 
             libxmlrpc-1.25.26 | 5 
                blktrace-1.1.0 | 5 
             bluez5_utils-5.25 | 4 
              host-swig-2.0.12 | 4 
                   ncurses-5.9 | 3 
                  perl-gd-2.53 | 2 
              host-mono-3.10.0 | 2 
           libmemcached-1.0.18 | 2 
                 haserl-0.9.33 | 2 
           heirloom-mailx-12.5 | 2 
            modplugtools-0.5.3 | 2 
                   erlang-17.4 | 2 
                collectd-5.4.1 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               madplay-0.15.2b | 1 
                    strace-4.9 | 1 
                  thrift-0.9.2 | 1 
                gptfdisk-0.8.6 | 1 
                jasper-1.900.1 | 1 
              jpeg-turbo-1.3.1 | 1 
                  prboom-2.5.0 | 1 
        gst1-plugins-bad-1.4.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
               w_scan-20141122 | 1 
                   lame-3.99.5 | 1 
                 bind-9.9.6-P1 | 1 
               sdl_sound-1.0.3 | 1 
              libarchive-3.1.2 | 1 
                  sispmctl-3.1 | 1 
                    mpfr-3.1.2 | 1 

Detail of failures
===================

         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c6bdfa6f1c938602ddebb49072974e13359cc2f/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/513a9f914e16e5478757d1b9644763894f14c59e/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ced549de1c38d5baf3a0cd0ed7aec67922941bd0/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d006160e23368fc378bb0f27901ba44bdc4db39a/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fc8963f398507c0aebe68082e84beb70a4b49d73/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f39aa28ffe9052ad6e593d73e245c2fca04d9f65/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e2cc23522d2a4252727291e529a5c4e2cbb55ee1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d723a2119dffb97f0ec3f0a1af63835f0851ca62/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2c04a20524cd2615c0648ce06950deb919b91e5f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1c4297cf664fd1ef4b2335d6d7849249de4a74c8/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0f072bbbe19041dd92a39c98b2b30d2f4fb3d542/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/42661c6a48de968a31accf18db220e0086581a35/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a9a4ac3ed8441968d32f7dcb672af9d53a90d71a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c0cef11d5586699e2711cb3e11e117bde73a950/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6a9c133f340a2c60fd9a6afcb846e59c3fb06bf7/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7af1079f232a84cbd81866627db7f57d97364f3f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d57e531f361251151c2c30689c32d04a6708614d/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2af4c3201779857814ab79a23534cd6e182160c9/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/41decaa5bbd6685c64787f6ede15e9a2102a871e/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/416eaf8266b49adc53cdc4e99129e50bb3d0294c/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d0cada5944691fd363f033017ef02bbdf74f50e9/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/13c47b579027a32f639399ca176402f07104628a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/609c1ff025d5b7704b3d2ea976d989cac764cd98/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/07e5a0841bf20000c3f788758ed1f328b7aad60e/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ae84b76b778b6bc7474ac1f4b7b920d1af336534/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3673d7b174a39e421bbd6aeaf9e22c6dcd0152f2/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ad6f4e552562e78e52a5def784a36ac9c05c9253/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/38fb8401685cb1f1b07a2dbe99a5e37ceadb5ad8/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0ebde5b6c782823f81feef3c8dd145d23243b9f1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d13ab3368f4b2c1eea3a0fd8a79f1f7adb95d749/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4c268264917bcccfa3fa0e5e906046c36b40e95a/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a5c8fc7ea78c1519cdbd069fb28cfca002d1855b/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d4e8995d3362cd7c66af2a921c79ea28f8cec170/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5c337286de14b3736b1d81e647df1fc218d8e08f/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/885329cf007cb7ee36996a90261741f05770c7a6/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/200e9e6f3814a5ec5b981bdf4901803f06f8d1cb/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c99d969ef2ab278b392d746ca767934e86d2eaa9/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0ac543d865d7b051d23e7dc696d953ed31b4330e/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5d8ddb084e84455bed6dbf4239f61e24c3e9ffda/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/062c959c5fd26bc0bb3a302f8fa8210ff6435d12/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4a8d33d8182ee81fe4501974f20609b835091b87/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4091285268c7db23da50676c165476ee57d9d61e/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5d372d4cc0e671379e2b6f9c551e7422403c96c7/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/283b8ad1738ae2b088b318e48cbf3d53770cf763/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3a08c57b7466a8238d2f5581e130e1dfd3f7ab66/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fb6766e15b0340ce46037727fd4577ccfc52abbf/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4b4b35f08920861eec6224250bbd70c088be571f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0e9a834eb4494b1f9d91717ade7469af272eca61/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7d6711ce47acc8aff84e4675b5999fdb3dc0830a/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/bedb11ecddd5a84753adf57ed3249a073c11ebbc/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/21e8715837a639639068e672018e201daa66d995/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6b650a63ddbc7ffba5e52c6fa872728d9c472c05/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/16bc5fcda89999c87a685c8a7a6fda53466dee5f/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9e2857e9d368b05eeef2617cde2030cbcfc83f09/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8f34075df2a9a1cf102f2a611125325959c566a3/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a018b3600d5a57e180dd2b0edd722aa5caba544d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/aebd62d9d3e21120d192604cf51c5f578834b997/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/757ada0ff6454ebc3af4a2685810cb7543808704/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3e58bca7cbede7a599796b48d669784748059f52/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2dab74d7126b9c0df15f86608d0c51d1f7e3c584/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/49ab0fabde6193c31c25d843a6320d4cb93fcfcf/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/06cee1c1fad9dd9779f72f8d70a75300a2ffe5be/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/81d3db496de66746960e690e69afcbd190b9224b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3fa641dccb45c999c86d65e030dc9eeb24f53d08/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e81c67adf5c552d455f08e4dee2870de9d360fb4/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/78df25793110dc81a31a79015158a0a4771db9ce/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/17b0fc78f256543e001585aca67ecc041f0f8e8d/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8eeba894ed6629d7067597b486913823abb73416/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7c4951b42fa3311bc83ed54962936ba57df54883/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1cbaad50195e1c1c8db619752d380ab71ab3f78d/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f51beee4c5f7061ec202f355f8a09dd517466d28/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2d5e043fe719e8cfbea00bb6c2fa0023a28910b9/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/febe16fe353c500d2e9b1e2b26bd1fc3fab28908/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/12ada2ed4862ba77847e8b0d8651744ff1d4b059/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/23bab306a8825ee4a07690237481babe76c69f77/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9fa756e65851cece2340e9197a8e1c84e8379550/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a0c0b03ba1e6d3966213ee61726dd123f7955aed/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4dae6a05f1f06ff765d89c7e301eb96df4d5b68a/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5dab36a320dccc00a0a9690999a5c338f31f9684/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f88362a65e666de70bb6562dd3d4dddee9a23a5d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/056597add070878da8f0a6693528f0e35e4e3030/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/97f79465a8be35f505314e7fbc005440d7f49d21/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/61410e269c504a9ff79d34ebad616d58513eaf5b/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/cda6fdae3377ba7799423edba67b64fc39f33d8b/
        bfin |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3be8a3e4558985b59daefb0b6e09d34ec68cd44d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2782b305a58053c43f5f34b50913f24e0ca27314/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2271b4083906d4d17483d5868471a5894e957068/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5581134d3d6b5231edaf780343ab9ca34b2f967a/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e019dadb41ead9d646af5ef407b1c95dc2beef04/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e4ccbb43ef3b62e735a76564da3c9ea55da232d9/
microblazeel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1c2fdb24f09b4f699afddfad4baeab96bac09eef/
        i486 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6ed3ec08814cd6a465d5649902a4acedd3d236ca/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7e1f12ddfc74e6313f774c0b6f2f9ce4d08136f7/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/dc21bff3a2e497f21d65165606c7c4104d9927e9/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/78a430cc37b341f22fb1d243245a4bdf89904c34/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a9a17f2994c94d3e1d5c7816a78f0bc9909dda21/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3567f5330ae5ab4608b640ace79903b5b2422aef/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1bfad7a171a6c0aecc6fd29f6a9e43ceaf4ecefc/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b03b1daafcdf2d1af534e50045000580bb15f65c/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/956a33abb3cba066e6693bf0f1c555584ab2d427/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b99ddfd21285dc8780130d257402c1d492be8475/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/376c41950be85339fdc439176b1db15d47175c52/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f400f9a11e951378c7aa7035fb03e24069030f8b/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/54da56d01dfc9f3c6c72b3d65a0e6a0d272cb475/
        mips |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/938934b04dad00ae0c9160386b58c0f7c58fdd4d/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/916508df9a597a8c24a8bc0a4144729918718600/
       nios2 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4c07ecd965e22e20c340728f348b3fd3542578ef/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/b0e21ad69398c06c5068c2567ef0b1e56e79a8be/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1475704fd9eec6372be85ddb3f6e53ff59e27e25/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/99da770c1e9676f6c98b577beca41ee5030e55b3/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/afdd24a42923ddf2870096926fb96e0b08caa592/
        bfin |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c865c5321d5704a5f2a7d6e50aa9c55f088a6e36/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1edfc76c255c994c49e560e1e3ea08f711c58dd6/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/52de199ac47f157697aa53df3a950458fe282135/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/78b8d7fe22b5ef2c903fd1d696371a7dc2d8df62/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/088bb7d74a61117a716c2efc2b32d63efb4c2d4f/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6399a80efda7946a60704117b97a4c8ec9c43ead/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ddefd362d444898d67778fe404a519fd5bdfaf8b/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d05c9bf311a92af26d15d1d3e5cb970a27a8bd94/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/61ec214bca4f983f3550746a730a174d440a10bb/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ea1434658fd032be0b824b9cef0be384600e801c/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/009b4356efae30793d68af5097dd1cbd1144cd6f/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ede295b4bf40755a13dcc73b6411df8fde761e8c/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fb30026b8ed3e02eebd6692b7ac25dd5cc80c1be/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7f3d3085eb6700a7e6ddf045684da1bd486cc1e9/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8096dbbdffe31d50827ab727349a2178165830e3/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4c8c87479bbbbd3ac7fbcab600030ed703183b96/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/258ca912123a873bfe07ac13be47dbcd7ff69e70/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/32f60ad0b4619a9d67577d23b11ea86d5baa07a5/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d6186445cfeabe56bb92eb7c90e4184d8af56ffd/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d8fad39536188982a346bd999c40d327c94a9858/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1b286bfe5473ae4a975e0268f2e1a0b150c8fad1/
        bfin |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/57c89098b0752065702d09b01305c6c40a8baa39/
        sh4a |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/aa324d011289af454d0512ac30a1806dea92b0f0/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ff6cd9f79aef7d7d3bcc9e44c008a86761178057/
     aarch64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/774774aaf976cf60e31d7839150b6194e7297662/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fc8835835f23ed851f100516fd6e58b659f76b3d/
      x86_64 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8222cb5a909a93c7b32a043b0e7b7c3a87d457e6/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7b80cf3f04aaf81933fa31378b63915420961b26/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/50f9ec3e1914b853cd70a20be0aef6e81a25c813/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9db7b61b16d85e6d6267ac887ffade1b06b1aece/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7f3fd8fbcc38196451013b418d9d88319f683a04/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4567596faf760eecbb1322e36c09a6350991e890/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8fbb994bae602e91783ed5d1fb0f3ee25080f2a9/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3977426b242cbd612a888c466be5b7e7694b5a7c/
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/42b815ff3cf74ea244851169c0287e17356d6260/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1539284ecb51b91b9c3c494b06cf4970ed84fb2e/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/025496a296117edd2ea220dcbb836c85d9d896a7/
      xtensa |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/d1355386ba23610b6314567b208661ff4406e87d/
    mips64el |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/4d716352edf8ce8a4604f82fd588efe73321dbc1/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/edf95dcd04d8f0b77266ad20809014ec504dc163/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/bf7b79d61549fee91e165b34fbcda174d5bb86f2/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8962cc92ebb81d12e7fcd661b82f0b4e1b96d18e/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/47f332493d9df40883515f43317515b1ac1881ea/
         sh4 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/67b3aef0d312140e7609ade20e2b377770269486/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/1357e90a0b685489ce9167cb99252fe83828e3ca/
      mipsel |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/014f8b8f1444644e778c284cff55c43b762f7ebc/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0b49d3553045045ac3b3e079beac378855551c13/
        i686 |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8cf7d67bf1f3eaf03a82fd65e40a06b9cc37bc8b/
         arm |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8db05b953bcd688defbfbc50f0dfc2fd1ff7c113/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9b01d75961c9350dcfe920e72b47f667af1697f3/
         arm |                  bind-9.9.6-P1 | NOK | http://autobuild.buildroot.net/results/47164f6f1016a512cb77e2cd0b08be74cbfa3671/
        mips |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c4d7be9305dc9fbf53a2c73c7c559c1316abe76f/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/25a981045b04d546dc9e1bf206adcebfed7b8114/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/abd59def88667633e6ba0f114ab5edae2442a613/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ba7c2e6d0886648b64b812737527f44a6c050fdf/
        i686 |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f5a1627673b999be01c2c97ae076dc7f4a399427/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/cc8eaacd776d88b389664125a4dccfecc1cc2d39/
        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/a6f34f83d4853fc9629005fa5e9b6e5d9ece0d93/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/cb863fe7f79d5dd548193482f051f50f5651dfb7/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/0a87b66b36844577d0fc6a7fc40d06c9e04751a5/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/fddc395606db5b3a7da7c2f2228c87cea7989bfa/
       nios2 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/b4f6f6b8855d10e57c040381dc439f3bc2f8611a/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/75dd8792b868f0e7c81fe81f49abc25069168717/
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e448b34fddfad4e5fed37049cbef34042c9d1457/
      x86_64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2b0e93d2a7c62ee04a93200f07635f22f337d5c4/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/fa2bae7fea660d455f9d3050c3dbd2577b5b9f8e/
         arc |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/4ee41e1616184687f56c9e3095885549ac4767d2/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/1eb2241ca326b2ac210d81fbfcbf6734a2ff89b3/
        sh4a |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/9c623e3d9fde75b3dc1724909f6dc9738b12a207/
        mips |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/4976b4161c52052a4c73d1ea65bc9098ea376a3b/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/6bb63cd96a4cc3b4a7d47fa7ac50ef7216a60678/
       nios2 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/1d5dcd8ca6b265b90911bb55454d162dd410ea9a/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b4f238bcb30b0191ce1a2be669fa792c8ccd3e69/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ffdc531d8cf9adb43340d045aa88eb0b39fc9bb7/
        i486 |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/67c701048f14ea296be2d276f8b420b87c8b1766/
     powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/a27d162544a5a6a12eb866cfd40579924ffceba6/
      mipsel |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/6456a895618fd079779f5869ba97e11b64745994/
        sh4a |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/7a85d57fae0a367d1d54820f43cb76f70d705377/
     powerpc |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/d4e6187d0b350996c0b9eeb0267bb45c12c1bf9a/
         arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/df22542ec972cfcef15c83750a36dfd6425b2837/
      mipsel |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/5800f0777845b338693ad996e91be32a1fe32012/
         arm |                      faad2-2.7 | NOK | http://autobuild.buildroot.net/results/3aba853d776f2dfb2dd7c0426340e4b04ed7ed40/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/95b00ba73e824f9d4f390f51422574f394ea5e9a/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/d3ec03fc4b6ac7b73800ea6a6711568ad699a5eb/
      x86_64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/ce98724601f213683ff6d7896e645bf6158b0254/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
    mips64el |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/ac3e9ee85eb009b458658ca66cba3e2abbacd26c/
         arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/45bd9191962c1c5afae7716b715594592f252fc8/
     powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/cdda58e50095097aa5764a63c8bbb521de647d98/
        i686 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/b3352a1a4b86603c27ba0e0306e64497c9e3e67e/
        sh4a |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/3413adcef3d22511f57a065a171dfcfb2a167c13/
         arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/8bead4f86e9b6bb45645eda81f2870d23a43c312/
        i686 |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f76489adb28d7b34133a5af96e38aa66501bbfa5/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/c5d2a905ae90cf678dcaa2d7f45627f8d52e895b/
      mipsel |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/427c56580f65ae9452ad68727155097a8df48914/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e329036b0c8c9af4104422680f907f431ee6ee0a/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/bbf4175ef5a20b10c70ac8443cbcbb8644148273/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7200d7746e402b90ade376b3d1a7813e48a5ea82/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b61fd23e2e3b7c839461e6f89f9ce85e41686ae6/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d60b436c65e0b27a85ceda9a1dd7151f7eac6d7a/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/18ba2d59539ad26b9209910518bcab96c2f23cec/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/309bde9da91d039799b84ca48ab229e99bfdc230/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/661f41ca60dbc284e7009ba10105aa1bd5467fbc/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/c36c9c6cd6db6a57ea12824de44b45df11754b57/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/719bdd893248af32cfb45ccd6716e8ed446910a1/
      x86_64 |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/c69cc5f53c1b768b85c4f679152aac18230476cb/
     powerpc |                  haserl-0.9.33 | NOK | http://autobuild.buildroot.net/results/1adde4c866910af8f6d52b73af183e6d8e8423ad/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/420569a8c808f3ce1653715b5e947f265a57ebf0/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/077a5cdc833554d7f75fe4259d5c1b997e75a043/
     powerpc |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/6b6fcc9554944bd7efa6c725abc249ad0904b98f/
     powerpc |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/25a19694669fd139376460c634894479261d1776/
    mips64el |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/9162359e7ff1ff423360690ecc99c5b53759851e/
      x86_64 |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/3b7814194f43a069ffb3a536a19e7d691a448a4d/
        i686 |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/839939984a9e0cb9fe8233cfcf09b57e3d33a815/
         arm |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/22d25d114eb58e67513dcd12e3b40eb4824fbca0/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/75e7d3ada1031c7fd92bebb8ce8fa9da8f0ed853/
         arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/bbf40252866c4979c632d5a54fad17ae45b97eca/
        bfin |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/0e8cf6503c236911846845de85651784cf468fad/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/0ee5e8bc95dbaeba1d16b9198556641cd1aa1a5b/
         sh4 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/b2b88871a81d9294e87febaada9241e07d6f3b4b/
    mips64el |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/1f02a467112514e2d4fd3823101a20bc23fda5eb/
microblazeel |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/3421cb6a60ec4b0f745a9dd049a5178a26d69dec/
        sh4a |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/ad3e32393e43dcaa2fda238d22cd054574664648/
      x86_64 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/1c343c90f0c7ade408ca97382b4ae22b7e21f04c/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/5b9c2a678a0950def2aeaf7e5809386c5923e974/
        i486 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/6fd69a116273e12221be300dc930884a0aeb6d94/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/0cf32312d28652f1a0dd85dc54a5e922714db32e/
      x86_64 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/e2acf1f0355df709836e92e4382019b6e8f77978/
      x86_64 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/d5b3c699a460b805158bdcf42c80c5bcb2d37593/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/e81b4642fe24d49a5a2523a7725254bc1acf7bdb/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/f2023b000b3ef8d459bba04a29f58be88246cb46/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/579df46b1fdb46fa5ec0fd28324cf28b7c06b5bb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/47602758f2e075241c3758ee3ecc1b939fc9ed1c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/50fc97e6ccb36f5e871e6a90a0b4743ca7940e7c/
        i486 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/483eced22309c9aa0a9ad2f6e620063d2ccf36ef/
      x86_64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/db9009d71040a1ce6fdddc9339e9d2adde78236b/
     powerpc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/84ffd7c729c9c6c3c512a5c92ade242f73b0512b/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/573b16d34e1b865785b79e49f0f02c5860c58c58/
        i686 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/2508c060c996068e74f03e299bf907b1b4bd7c89/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6986195a87cfda6e1fa416fb163bfb39056cb778/
         sh4 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/33ee3d8dfcf18827f5bff8bbbd4ad1d4cd918d68/
microblazeel |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/053e79700a3754c3a31904930aa51b684422cccd/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e7913d1fdb3449c20651f7a9004598f8ca4dbdc1/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f415f9250c8a97398229108ae9296bd934427600/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/514995b13f6f19ff417eb8e368fb984a084855da/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/2377afcd6d84649fc1ecff6ee4856d8fa53e8de6/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/eda3555c93f8e57156d27195c371bdcded2d0d22/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/89ba936c4e148f45bdcbc9db0e9f84c7da7ee610/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/75829847411927938c5b593c1b6ee658705e60ee/
      x86_64 |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/40b1517feb7389fb0d1554f14c85ad2fd44c8425/
     powerpc |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/19cf18122e30d35319f84ae8074a5626cbaa6524/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/3cc07e11647a4eb3e963b5abd815a27064c2d883/
        i686 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/95b571655d43f2ddc4e84445795cdc96d3004d4a/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/57595e1001215569d8c480d947e5775431428d0a/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/4c9bbb73ac9f864dc4c797524d8b4ce4eec5e800/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/f668bcf819d412b303ac2b134dfc2997b236adb4/
        i686 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/d66e69b096d86fa2162dc1bc88ba33b3c138aefa/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/ccf30f736e0bf87543552ccc4f3744a2a4e97318/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/af5311374a04d03485b8921388b20bc467a60f29/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/3965f8af88eee96cc15ab91735354c7198d0ffbb/
        i686 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/4115c2f36b308da67bde1acacc1fefacb213829f/
        i686 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/7e2dfc3e6ed7adebec0a3888c613dd2939901d00/
     powerpc |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/f4de55987ad9719a442dac95e822a4de11205099/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/256596026868340a00cf6b425efcbb61d0c9bfc8/
      x86_64 |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/56718e887c05edc9c29e3331c0630027eccb3253/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/d384b41eff45a47c46e46dcdb014160e63ec857e/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/401022826ebed1d959a4a5f7558c3387dec8393d/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/d67f19da0bfda93eed243df0f0b55abce0f88cf5/
        sh4a |                     mpfr-3.1.2 | TIM | http://autobuild.buildroot.net/results/6bc8963861e620c5d1f55aeab51a96577002b3d4/
     powerpc |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ee83505074a2aadc2f706b85629cf6b884147b6a/
       nios2 |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/6f3cb64086f6a9378770d4b27b6eb910f129b462/
        i486 |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/f77149852f9021e66cde3dea6d1435b3117dcfea/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5ffbcaa5fa13a6f85c8c5a129b794d6eddb9ff6f/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/da10172729329a4d559d04cc590495ff5ec5674a/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/193a3eaf82469083aa122ffab7e13031777a16b0/
        mips |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/bfb6374862dfd483b0e7872b606860ef704bd8e0/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9c6c5d260869bea0961ab540c50aeeb346297ebc/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/05baaa11deb1bde3eb7b42f69c0aea5db0785b89/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b7dceab1632ba29f96c9efb4ce70e8dc4f903a5f/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3a4eb89ab7973814e006f6650589e7e06f8ece67/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/56dc337c7a17bc0cd7bc6677e53d792274b6cc5a/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d70d14ae1974e83c90ce58ba6cccdd4ff2a28ec3/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/44fecaf1153d669a7bb7bf427b1b74c9b35adb23/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c0a8080d7f0c1f3e87eda09287635e35bde09ca6/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/344c15e946b58b0858e9a05c055c04fca84f1ac9/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/74481c819928901c5a46404d4b7e80966c758036/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c71980f0fc36ab2cbb59a0b8ed12e6a71cee1347/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/dea7662f193b50acce543ca61613b89eb9c2d8f2/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/eeb569a6a8256a15903ed48a8b49a0aeea425672/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0e284da4a96aba0275815d9f569085d2114ad6f5/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/78a61ffd67e5337f756107e3c75900208e6802bd/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/df464942e5a526e213d281b1cbb067386ce9da36/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/944b8baf4bb81bfa435eca97e7830b33d88a2639/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/aa99890ff1b18a380195a121b2c76c5e8884782f/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/65800da76c41f96a5abc563c0b682c9767b6e8ba/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/75550619fdbbb032473c9297a638e4ab4b85ee8b/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/54cc79a61bfe10e8692530d164075ceba2fb7858/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/85704af7e26b97ab201278a6bcafb6aa103a49bb/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/63feec8fef381e6c44a05072a3dd7f0d19151dc5/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4b51758182c7754bffda9d0752a3a5037a4d7ff8/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8310cc828cf41722c791dd018c8653d0a81d4221/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/119cd49e798aed9ef6121c7294aad7059e68a248/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/77c8ecedb312db9757f0c478e4e10ad5332f8efa/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/7463cd736f170f2ac742002d1a4e613ab9579dcc/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a12be535a0ab272135e4cad03a22a506996447d6/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/396c88e2ac32080dcc868eada0a0378815bae757/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/dbd670edcded88f4d045e81f30e94f927e977b30/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a4f4bd2c970b61cfce68f62a22bc37180a146719/
        i486 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f7a13d7a6cd157b0067a1003d14d86f07ea01340/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6a81868a9eb9afebb7105c9d4ca40e4cc9ab73b7/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3ca6562c328d05165c8ad17520fcf6ca0756fad5/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/02b188c8acb5dee9159d059c45be3ba3555772ae/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/967c4a39795ae9553c06eede4a094b02392add2d/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/73c2f504b68792de24a6ee03ec0890e193df7542/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/687bc9fbd224d7e1eacf8c0fa4b90963c944e14a/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/aecc7cc46ae94da69920d5038a4885c5689f49e6/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8d07eb554b3fd76190185aa65a6a4fb96f65ec67/
         sh4 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/105d5d787186dbafaaeb69bfe604442cbf534b16/
        sh4a |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1e5d3fc880ec116e67089e1eec4e1cdb5aad76a3/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/12fa1b91b99ce8a212f172255aa4938f6630de4e/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/25f0a6473bc957ba3d984bd24a5318566639ecb0/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/1d7c2c975c2edbcd5bd71db8df4d76a56320bf4c/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b985ac0934c2397ab3d044acd667ada241912216/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2356c9a6e6480ff5f4fa25bd3dd6a4710bf3faf1/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d66bcdbf9a95c30b9063f2955791746fbe3e39ef/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/60cbbe678759ef0dc3dd7c646ac073d4d50cdadd/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b6c1ba0551013db80a0bde3aae7aaaa0907aa794/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/6cdb5754a6f95e3495bab2145fb4401b606a9d47/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/bd31761c182dbc748364fa6b7c4ea1e6bbef3175/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/4e831ababe18808b3cfa6ac9e49f5b11af5fc245/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/052490160e3a308e784c68e4ef2e75d910e167f3/
        bfin |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/27e034b7171d8ff6073a897da86a2fb7826ea5be/
microblazeel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e390233507c427d31978f0418691ef25ac4175b9/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/cbdfc087ff69d97252533dc7c7b2fa196df4b06d/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/b1d78d195968e0cd3713c9b59c2db68e006e359a/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/227cabb5455c37da202a1ee440149cbd8b4675f4/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/378ce024a96b45367892ea750539c7a0ed937a5e/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/77f57d458015349910793b745078dd79b50c0367/
         arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/0d2321e6c41808c5274388816b65f95d43bf36f8/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ca9a2c96675484a687e450b36483c56cc162191b/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c1e0ae7cc7f2bc97c0f880382bf8e534662f5134/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/346d3fc4ae5ea3f1e0d9cd095d45b78a7dbb7448/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/cd40361b8716455b3e634ac9122e026886dd4a11/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c4bff5f79362ac5739d6f57b9a2e5db94ba56714/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ca665e653ab27e43afecde0dc2faa51656e043b0/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/a6ff1fd5caa44445b9f5f72a42573ba0f74b834f/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f8f6db26f52f5e1ccd1bafa1363ed9c5580df901/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/2f401a99d83c8a1cf0eef76f0b42ced21122266f/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/bc23ecc78b1f0ab4c3827075d6e936fb00c2c056/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/d1ea64059f9e5301cbea235687db999fe75c468c/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/dea2551f7f8338141ecd0c74f72370dcb76b67f2/
     powerpc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/5163aeedde5d8ead12a8572929ed39f2d8605026/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/e5487aa7fa408de3a51ada634a46938215b6e40b/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/f2b460d9ebc77b3891ad95751ad52ede707bbd61/
      mipsel |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/65d3ce2af0610b252fe96b63b8a715ff043e46da/
         arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/13cf11a0f0581b35782c46437c443bd0ff2ad2f1/
      x86_64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/236a6e2f996f996ce37e78a540c8afbd85304885/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ae30530bcc04bd62fd90d120698460dcefc838ce/
        i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/ebd6ed36404ad562c380ee2dea3fa4ea4290d5a9/
     aarch64 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/17c9065326e6ab880c23d9ffd71fbd655cdb009d/
      xtensa |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/fb009fd123e09f3fe0da10a11ca11d5497561f43/
    mips64el |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/52357a42bcc4a4a854b7cedaa9ea11c214ec51ae/
         sh4 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/a300c2691b4bfa32071a62812bb7d9f16b6ac0e9/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/dc0bcdb046bfd02eb6446bf439dda467d154bcda/
         sh4 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/3b5a2c3c29322dfa69eacf9d5898ce87a8ab7581/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/981f242f67d85c0fb5b97d996eaccfc792eaa4f6/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/8f4c5b529b9dbd7577b5696aa88e558fdd226fee/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/7c45f8a92a5623fa13c74069d2f2a5ae995edb5f/
         sh4 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/cab7d3a13c8c2c5d7b071afe356913d57a77b9ba/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/9b6ae9e6b10a6d458442cee953e26cd3b7f8b35e/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/5896c02f7d17a22d7054c856a619e29cbfed5dcc/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/58c246fc107f40f40d186228907023625ab3a3f5/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/a758d8a025bc151cb0e02526c3644d207a719321/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/d028471803b7b4b58cc56e24006fd8d955a0bf7c/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/d30f3b4a4874bbf86ffd65894521c728ad222144/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/5ca33c4e7fd2f0a2ef5e36224497055a1f5ba4e0/
     powerpc |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/ea5c5a517eac52cbcf1c3b591b0c84bfdafee0e5/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/e9d85e6b9e5aafe6351572a1be2af4e024df8880/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/3263db29a145e91f0600d4ce4e4a2cc2f4bb63b9/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/9857168018d52efb9f720178207ebed109325eea/
        mips |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/66922c108e761479b69fa75ff96c28e2244f668f/
    mips64el |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/ad8b66b856b8aa28405df52ff1160e443e126666/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/7cedd1cd2ad99d340148d5113ee1e0404b214f40/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/ca080356a135c7a6a9a92434133ba1cfff4fbc1b/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/323875bd314e25cb1402beca992f0cb67787b736/
      x86_64 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/5642057ad7b05d05bea5cf613ee4bb12c005c6ef/
        i686 |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/d4c78acf7720dd78ba4f5b789a067c0a26f0a037/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/ddf4b38c1df73b00b76be71db3f1eb8b1d932c55/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2757465d8d2db4718c7def5236f7e34387d8c605/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/9df8f2b7a3c489074a8a39bfcdb1c2db711b3a37/
        sh4a |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/39bee245b4abfa0a20a78492732404809d520ee5/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/826351e84469057df301fa31fdaa0d55ea913669/
        mips |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/96f64f3c574000504aaeb910a20e4031a58a3d6b/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/6321d47795abbc9484d093b5a51d712bec95a75c/
         sh4 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/6c0aa5749158d423d11e5c365b5490e271b84a7c/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/7d603ac102f0370012aa9ba06c1972ccd092b050/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/57536d48113caff5ae965f309a3a35f264fd7b4d/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/9ef21be91d2bd7a3c5b47b30741375d2c6c2c5d0/
         sh4 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/7e7c34c41c5943f14d6335253d84180a9136f56b/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2b1c0e28b875555793badd9c2ffb1aa852c28287/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/46cb58b2933d681b2d50c88280f949fef176b13b/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/490bd2929f6a4511d91864a680ff73a974fb414b/
    mips64el |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/d516514c26fd619894adcaa0c6db4cf7a7441931/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/69b47a107faeab652935ac1f17cf820dba12a77e/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/31c2d650a6c056f67f34e52b08d1778432de4400/
         arm |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/4f542c26ca1c3d868dc4d3aca80c032407a6ca03/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/c97b6da5aa8600bf3075d43003ce339d8827c754/
microblazeel |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/284bf7d6f9cebf8633143ca1ce15154de941805f/
      x86_64 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/8aaf3a6ea47005f81e2d5f1b20a74365936f13f3/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/c1c9a21b6583c9ef3ddd32681bb13cf91a218e8c/
        i486 |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/2b50fb92756c3e8e6771ce110d73189e0b9c63f6/
     powerpc |                    opkg-v0.2.2 | NOK | http://autobuild.buildroot.net/results/166f7d43061e267edf7586aed25273059ecb9309/
      mipsel |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/da018caa1b79369bdff41d23b8696bc673625e1b/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/a455d4a81d8beba5ee74c57f298176a9c28965ef/
      mipsel |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/0a86cd48afcf7f47a339b8f5054be7297a9391f6/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/4199d99d07ec02d82b8723f16ada0714276e7a25/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/9640293fd16b92b752199c5d85f5ba603badf580/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/32e99d3829d0dfd1c52ed16c2ba3b9993dfcc5d6/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/dd1dc172d200e0f1d8b719ee6da5042336687325/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/00b78c2f2a00c8623bd1d87d022b6f413516788e/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/97bb50add010e44aca8fcb079d8df9270d3cae45/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/2cd96db26d6fa6ade558ec3d5baea78c2c3aee9c/
       nios2 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/16c415d72b27ec71e4d3f3ab24fa3e883f25f114/
         sh4 |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/5d1affa1988a69aad3256447528d0a86e99ad19b/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/2a68b5c60434b110bb04acf32fffbdc13368ebd9/
        sh4a |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/9c28dcaf3d3bb65977d565e4fbbc25d51d45ac41/
       nios2 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9a81eeac00d9f667f3b49e18a9dbf3ccd1bb7aea/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e9f1ed8bf04aafc43075af34f862d62b078e40e5/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/351b33ebab8e79be587d1241eaccd518022cf810/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4758b69b04dbfa3c89004071219cb0c94d07cded/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d49d6eb401dab7123bf2ecd6d1151e630b681ace/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e18b2d10e8b891c5dd16e662fd1d05a286696c46/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/77505f97ed4f6cae452aa294ae4c86fb8d809b42/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/78859ab6c911ef40b9fa04975dff81f54e495882/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/ced8093a898f78b7dc0898c61a5653a7137df69d/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9cd550e828e0b49bc3c7f20ae897ef540b757738/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/8048ffb2eaa64a060b049f9063e581f7deca69a3/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4a0c206b5d1e602719e2dfaa9a1f4f7dc67024b1/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d741aa21426cf55953ea2cc02873336f537a605d/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/917582e77b52d3f0bf8f3ca4f87cb005416035fb/


-- 
http://autobuild.buildroot.net
