From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-18
Message-ID: <20141019063014.E1BDF100F06@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-18
===============================

        success : 195
       failures : 217
       timeouts : 0  
          TOTAL : 412

Classification of failures by reason
====================================

                 libxml2-2.9.2 | 38
    host-shared-mime-info-0.90 | 23
            ecryptfs-utils-104 | 18
              host-perl-5.20.1 | 18
        glib-networking-2.36.2 | 18
                  avahi-0.6.31 | 16
   sound-theme-freedesktop-0.7 | 9 
                  polkit-0.103 | 8 
                pulseaudio-5.0 | 7 
                libsecret-0.15 | 7 
       xkeyboard-config-2.10.1 | 5 
                 libplist-1.11 | 4 
                libsoup-2.43.1 | 3 
                    fltk-1.3.2 | 2 
                 pixman-0.32.6 | 2 
             armadillo-4.000.4 | 2 
               uclibc-0.9.33.2 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                    qemu-2.1.2 | 2 
                  botan-1.10.8 | 2 
freerdp-440916eae2e07463912... | 2 
                     tcl-8.6.2 | 1 
                   ushare-1.1a | 1 
                 cdrkit-1.1.11 | 1 
                elfutils-0.155 | 1 
           gtk2-engines-2.20.2 | 1 
                  zeromq-4.0.4 | 1 
                 omniorb-4.1.6 | 1 
                   duma-2.5.15 | 1 
        gst1-plugins-bad-1.4.3 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
            host-heimdal-1.5.3 | 1 
                    orc-0.4.22 | 1 
                      gd-2.1.0 | 1 
           libmemcached-1.0.18 | 1 
                     radvd-2.8 | 1 
               libcap-ng-0.7.4 | 1 
              host-erlang-17.3 | 1 
                libuv-v0.11.26 | 1 
              uemacs-4.0.15-lt | 1 
                  thrift-0.9.1 | 1 
           heirloom-mailx-12.5 | 1 
               netsnmp-5.7.2.1 | 1 
                    php-5.5.18 | 1 
                    ruby-2.1.3 | 1 
               libsigsegv-2.10 | 1 
             bluez_utils-4.101 | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

      xtensa |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/df35879e5f198b3c25b1d59475b6fdac9c839031/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/1aee4e57d00ac23ada3243cb2c479c12107da2fe/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ad5742b67c94453b41263e98c8d7b9a7183e2576/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/2f445375d83f8e9cfb8788985b9d3b3eef97a565/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c19f32f18527e7d10f823e058086d5453551e516/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/dd8fe7539930dc2339fa715c26930636776aaece/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/548f0370098766c06e0031d314e1902b7295e3da/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/0eb75c4230639c1d8e7ea08e0532f72f2a7181da/
        mips |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/09f8e1df8eee58bf9ea4f7b0645588fdcb0fd8c5/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/fd68060fee77c6498dee5ba1a855104177d82593/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b06e79b1a1edffcf759c4853c6eab9de56cdfa5a/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/38f79bcf187a95be3af83a36c97b37899a09326d/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/30e5ad1032bdf922e6d6d4a28c452f309913b34c/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/aaa6c046870d41f0338ce8ddaa19cada8617cd58/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/140fdaa0f562d2c0e06be3eb161e7bbd6e90efb5/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/06fab4f4b685a324e15a824663e32ba563e14b79/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d7520f4f999865d3d0d9b86677d3770a938ec2fb/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/72a8fefea6c7cc47fb674f579ea7aeaf7ac1b994/
      mipsel |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/eb48acec37a7fd1714b267b105816bf0053d40e9/
      mipsel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/96d8297be0b731da138b1e2aafb851061aee3c40/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/19e72a71777f03d66d1971321791c9392ddcb6a4/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/a7ad32e725ef07bbadab1ac1907f57321400d8d7/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0bb000c7cabaee1bb4eb360888e3d43094776375/
        i686 |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/ffd2e7ab7a6045f5eeaa25cd25088ad0a5b6509a/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3f85aea9ef19545fd75565ecd1aafc03e37fba8d/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3ef3f745716af0cb27481f2398a104a927b7e538/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/8b07b8875de70d0f467d6ec65741ff04c576928e/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/500fb1addc2fe84ac474270f6b2ea6f7e86f7825/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/614938741d4f4d16118b1c60bde8c2a22f07c4fe/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/9ad054143644ce422bcb1d4b206a3f40492d5065/
       nios2 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3c58c69be474847119baf542745ae6f965c49592/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/ab41b2f1e1d22b7d3f79f5a7df1525c061846beb/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/761fdb66f506d1250eacb549f82e2c53e2adbad4/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/257782a2e1cf300c503022294aa0027b550869d5/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/4703ff0952be3262b9a670e93db93e7fd97e1af4/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/1c26fad2ae74bf628968e2c40b52493ac252fb8b/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/eb38a9b5ce1f7b538f110504b04d0d0dcb89d976/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/af2e249ec851e1ab689138b984bf24f43fbec445/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/199142fe7e52859d30d4e49eeecdf6e3b38d69f2/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/d7fc6c9bc34be95d48f355f84452b88aa44d56e2/
     aarch64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/c256f422e12cdd53aa5b78a873a71115c01c63b7/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/2b871f3b9b8e5ddbb022f7938b6c6cb3fe4fcaa8/
      mipsel |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/08c8ff46dccc69bdb31a1a41bde24193b2f51c3b/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/e312e554d68c1a97367a358493c2e0c640af3a9f/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/50ab34778c53a1f85152bb922d564595d992c790/
      xtensa | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/08d7da3669607c8a86126728e77c9d349be6bbdd/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/9d833840d2dbbda0257ba1c931c1f4189457796c/
        bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/fc6848ce2dc224b8d3c1ae8088f9963cfecf97b0/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/67ca1180053c5f156b4315923a178f8bd6ac6c37/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0494f90455fea21829d8c5f512b1dda23c4f50cc/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/d88507c7403a099d1091047bc1e4fb7440ef32dd/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/f03588546375ed1ab0ef49a74c5bc12f0beacf8e/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/167399bd02e8f82aa984083b6e14d61ffbc20e57/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/62032c657430caeb2b5986426a23c10d82e2cbc9/
         sh4 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/730279e52e3b0621865d76c69671ba96ebfeacb4/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/dce7485ab5667b8963b0913bfbac271389bc94d2/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/7b8186a993419500950f6908fbdd1d4089fcbee3/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/9ec1df44a969dbc894845762e520879e97bd7211/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0e7a813b37f3c0e9b7a02febf5f35f885398c77d/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/9386cb5c00d316733065b08cd52e55c4741367f0/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/3499abe9039be6aa7543ff4f7cdb9f74a11b4a82/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/0083ba1d7d0b188227df711c79213e1e4f07b429/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/6b6097b8e0f8385978cea46a75912f02ab1d92c2/
    mips64el |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/e694f8da7dab3489370e45a71496d86d51e66784/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/a1705db466a46bae0714f590c4b142c7739d475b/
        mips |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/80eae46645414ee372cf0e69d7ecbe0d94b8a96a/
      x86_64 |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/5d8204a56d33aac1dffa9bb9f05159197232b045/
     powerpc |            gtk2-engines-2.20.2 | NOK | http://autobuild.buildroot.net/results/8f0bb6a1a3416c71574fcfc8ddf2cef09561f7c1/
         arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/26d9eca8f3b89aff8c6b5c18a097df99598b4251/
      x86_64 |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/05acaf0a4896baeb5a98a6b7b8b66e98cd0ec249/
        sh4a |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/84665afd96e06a8beaac2014fdab07f3d45fbb3a/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/f570774e4661698c2333e8c87894d610f623443c/
        i686 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/2098f4038ab6f98b136bbb56ae711a051c8f8cc8/
        i486 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/df88c81b0cd7e33f5e71c608b1b144a20df43c08/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/293fbb540ec1872664d6abd66a10e0f6d5c4afa3/
         sh4 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/7ec2372f44c964cbd04dbf9866908c7fd601e1d7/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/58d2cd9aa421738dc73f53f5e836f4196ff973ef/
        i486 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/05846093eb5bb06f5821071bfc359f87c1ed4d0a/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/58ea8c4e225984f909787a3da09c8c87f80c2734/
        mips |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/04acfccebeee16a67cac8323a0a7d190441bae0f/
    mips64el |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/fd0b9840eb034431e73696133002d0f29b9c5454/
    mips64el |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/df29182029b052c333b9bc498bc069a7bbf40d73/
    mips64el |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/4055b62735f47ed43bb2d9b993939224a9a8a12b/
      x86_64 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/eedb3b97dba5165dab0f375d09eac1f09aefc0b4/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/d33d92fbc5122b029797dcbd32049bf7bc683f10/
    mips64el |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/bd128b2ab96c866ec2f2d342ab89fe8d45fff5d7/
         arm |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/3b67ad465f0fbc0b45a4ec6f29d6ef04e9ca30d5/
     aarch64 |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/717487985a75ae90f4497d5756b063f789a442c4/
     powerpc |               host-perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/c9591cc471bb66e89755318b331a46b0c4965fb5/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/78443da457d11493d5e3e65a978de0346cb7e567/
microblazeel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/54c02ee2a40264c1552d769d4413b66af44ee452/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/94afb51314d9d087072bd1a7e74c6be1bb7e6bdd/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/156ac36c781ed07c25039eb6afd5874810f18fda/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/34474f23955500c503b0cce99cd4eb754769a161/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/33e85f5416d4641744e4e40a2fec592dde9e280f/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b0dd128c9b65e05d0185bdaad7e28a3075d1d807/
    mips64el |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a8e6cf76112176c66f1bc3332fb254e0bf272505/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a201d9b6b90e49636f52d472e3aeba171366690e/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/5c4b365ba4155969f5af304317e73fe4381101a4/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/d3fb76a06ffc4983fa8cb1fddb48c288e2701ca9/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a968588f932521d4158a2b4e11042a8b13817b7a/
        mips |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b916606f15b5f8ac671904f5cf6fcc65ee45b7bf/
      x86_64 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/2b211d29076cb5de7387e3f7cae0b49af54c83ff/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/899a4e5e62ec160775045be060bbbd68a6e43211/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/3e468363890dd4179561b5ba0c73663734449c25/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/3ff072e722a4965c5f90ef2bb00b2faa0e10e54d/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/22ad8485f34e85922daac98c325f6d61f114c517/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/ddf99e46416c6aef1ba5f7a7aed1ca0d32ece534/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/fc00f60bf639c20d44e755b8ac5f01e6183db128/
        mips |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/fa3a942fe99da58c1594576a34c2ab665ced6730/
      mipsel |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/2429b77157b94bdd5e99d9ca01539a59b037d53c/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a041b50b83d687d330229ebee5339d0aa3efe6f3/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/52d3f2f0931d300787f5ed576b7db7e582a22d9f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/25ffec05a34f4919a7a98da6cc2ab6166cb7641f/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/c3091e5a0a445c49c648b44acdd8316be2c7f589/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/3aab4713c61c9da14ce7f32a1e55f3e339d7a381/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/6a02047ad5ce458651dbcd0d90947d20ccdaee37/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/e411c340576343a8a41baf292207fc92d2412a98/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/77a04827fb5493e9f24b5983ecd7c2fef8246e95/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/488d6db227cf0fbff240f2fbcd9ce98cbc72ae08/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/4e00cd272d598a745c3c1690ed6ccd963b6ae205/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/b16be889486d1458e9b80589b9e5ad436ef7ab72/
      mipsel |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/89de09e52f93af4b5a1dbcc3359b9cd45489e868/
      x86_64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/5d0515e62b0fecd21be65c867ecb592acb21b7d0/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/e64b0f3d7f8eb7ed30987ce6f167609db77581f7/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e17b7e59018ef528e34524f7623b6bb77723a510/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/c0a4887015c6ddf5b2f2d71552befda841805e08/
      xtensa |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/4df646adcc15bba4f6e411701233073e0dcd7e4c/
      x86_64 |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/747ab771bfd43ad28ddf43d38074d844d5a3418f/
         arc |                 libuv-v0.11.26 | NOK | http://autobuild.buildroot.net/results/90fbd87697503123180dc6a7f7b57dc2048213a5/
       nios2 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/4a9fac8c171cdd20b090eacdb41106f6594dcda4/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/75547e0d4c90ee4c945fceb50813b16888607fec/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/303d6d165c5423944122bf430575c018479733f8/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/e1be7b262db679ce8872b2ab08fdcf68e16da2fa/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/b9e65ee3a8c49f2acd4bb05b6ed7ac0ec2d09b31/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/ab8e0efa8ab356d2bf2b7232feee8329d948e34e/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/4cfaeaeec3808121ab645e8b9684a247095f5c34/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/27f0b670e05e966192126948b3e550fc35f8a9a3/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/706855578d4b6bb846558b47cfae98f2ef1132ad/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/8972b33ec3d872bb92a8f35a724119fc046fafe1/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/5a8ebe452f98b4840ad44bcce7333b60be18f3d3/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/13d6074cdcc4599a8065d9d9f3cd5fd13856551f/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/f4bbf49dcdf521b9b16b520b77b5b4201a3c6a56/
microblazeel |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/1d478e9412868a39343c14db8662a304c854569c/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/53a735213719d2ca6d2ee0db5f8ed64570215305/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/e5d87b7d0b563671b7497fa3da64b71793461470/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/d75a0bfba4bd4af423fd0d7cc499b18c0d2ae89b/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/a57410aae7fa0e870a7b1b9d7386e99a5a074cc6/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/7c9bedacbe2eebe0bfecfb267b81802b8cdfdb79/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/85a29fb835842be9853b71940b34991ac4c0cd29/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/095f32fab6ca3e73c61f47a4ff083ac4b199dd73/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/3e3fdd1e1f6ca0129cad283f556d80c2cbc65ac7/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/e1c1a4ba8767d1098d0c0aa9b833202872044287/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/94ed0b285ce4d566b08d9185bcd301d857776846/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/ad64ba2127562f43071fa054f5154cd58b1f340a/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/da8a679bb92a5d00bd727906bb1166e54d0a6405/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/c6ef24c050cb66ca11df8583efc26eaba2a850e3/
     powerpc |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/1a379d13ef4d7ea8a54ec17bf9ebcbb700daacd5/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/5b9118cacd630c9c5e69672fd34a78a62ee7a632/
       nios2 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/d3210ba27203615f2a3a1e6f31ecdbfc3a1da1b5/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/d8400cf2b7a98666b98fb24a4a56f75edf762edc/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/b76eaa46ae01644927d0457cdf19580d9f197f46/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/3fb5ebdb2324101ce9a1ae89e127cbca57f80709/
      xtensa |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/233101dbd5877c064cec669a81a81c1f0eb652cf/
      xtensa |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/8b28c9587784e2a3a0d39cc6d370932d9a0728a8/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/af1d9fa999a92c268112f0b8f208f78943749ed1/
         sh4 |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/9aff413f3a71806a4ce7b19118cc0ca5cb5ea79c/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/31b073497889ce6e8b7f0ecdf37a17749e0059bf/
         arc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/0ee5598df9172c5f2f1ea4f7690ac0d26ead5d3c/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/97e1ee9204181a089831056f1313aa694a865346/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/755d6a9397188bc7726bfb9264c5785e80c9c67d/
         arm |                     php-5.5.18 | NOK | http://autobuild.buildroot.net/results/f18fcb316c0aa11d3bc311d910eea471d4cd9ed1/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/541ea47ff95a916921355e3de16bbf3a28b9bc95/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/1472fb04f77f4f2ba350645695e7384243ac07e5/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/787380475ace9d2a8ac13f08585c24f4e8815792/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/1ecf79a872cbafc908e712e9bbb735d783d05bfc/
        mips |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/a56abcd308cc7452f0da55f316af33cdbc14925a/
microblazeel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/4621a89d1b13c575fd1a218c573756a81cc74423/
    mips64el |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/6ab658a2fe0a51a9f77cc997ab5f8b363b1a916a/
      mipsel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/11c2cc8440345984fbd0a8653e8b9a0bcd76546b/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/d5da9e2d1e7e356a9e750d56964714a896649302/
        i686 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/8143d46d2021d5943874af6a9e551cdf1fff0ceb/
      mipsel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/d776df24eb6537432e3fe7e4ec23f4188df10512/
        sh4a |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/9e167894b7b286ee06a4833a85f386fac0d9f46a/
     aarch64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/dda4f6324ac19a07264f92513e283a61ade6ceff/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/55d2197185599fc99486f09aac1b28cb8ba702c5/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/123412bc576a218c68ec2d069b313cc3db8ecb94/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/68ef02c55cfb896936d296ffadfe084d42dd55e2/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/a1e1fc2005e89ac1d79243941412b9b7ce23e70a/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d0af0d45f2170bfeac2a0ab772c23678eec57868/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/7da7c56aebc5b363b661fd051567200791d08044/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/41c6c0f993ff7c5f451adc002063b42840232663/
        bfin |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/585a91a1468077a28c3f29de8cadbcee61f1404b/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/449247c1df8ae5599efc17a5eb97a094b773f383/
       nios2 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/eeb1448696516e9d09a2843645a29e43e523aa4b/
    mips64el |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/fde9daad2ea8b2aee10a47be091ec01b643c9e30/
        i686 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/aedff9772f58a8e5b447ca1fb9f4fd8051c30343/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/41d2473d51a11ce8bc2a368a3eef9def9f2ee638/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/e6bc58b908b94529ba1745459925f7156e5bd1d4/
     aarch64 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/353f3e74e529f2be9ba6e6237a4f09c7c8eeef24/
        i686 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/1fc2780b5721b4ee11a04233bf8981489fa5fa01/
     powerpc |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/2bced9e512a2d6092b32bbfaf36d061d3f14d776/
     aarch64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/22b7f0d016c2a0a8c4c81ecb0a1ea854292388c9/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/d4ad38a4b620a68beb85638a406c6c7f1d912123/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/10e6ea5c27dad23a7c2fac26c0968c6d26fb80ac/
     powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/4b838230ca5bc4640d213da11866cd6d678d6830/
        bfin |               uemacs-4.0.15-lt | NOK | http://autobuild.buildroot.net/results/25f8fc5e0be5e142a1ff6d1582f1ed72cf5b3a81/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/3206e95fcacb2c4d4d36d3c2efb4a0b0f1d31ebb/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/4aa54060e666b466570ba5fe3a333b3500e3ce15/
        bfin |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/6459285af7a838830eeeffe57c8fee08538b4772/
        i486 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/ea5a15ae08d83bbf18864c63d38a21976f83216c/
      mipsel |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/92b7ff8646584e6709875454586086b375b31cb3/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/8f52f7cb940947c5e729428e50668fc20897144c/
       nios2 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/55a9d57b95c52b840fa8de010131b1f832ab2aa6/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/ff47d7fb57749a53d61891bd950a7c2f1f9dd4cc/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/de451858d57079e623d9dfcd4ecc01e2ed2e9de5/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/0c0e0ae15c45ce0429ccf7f5d5f328df6822e323/


-- 
http://autobuild.buildroot.net
