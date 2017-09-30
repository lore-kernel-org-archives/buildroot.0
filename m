From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Sep 2017 08:31:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-29
Message-ID: <20170930063106.399BC209C1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-29
================================

      successes : 207
       failures : 68 
       timeouts : 0  
          TOTAL : 275

Classification of failures by reason
====================================

                host-mtd-2.0.1 | 13
       opencore-amr-legal-info | 12
                    flex-2.6.4 | 6 
             dbus-python-1.2.4 | 4 
                   evemu-2.7.0 | 4 
host-vboot-utils-bbdd62f9b0... | 4 
                openjpeg-2.2.0 | 4 
host-squashfs-3de1687d7432e... | 3 
                  boost-1.64.0 | 2 
      host-uboot-tools-2017.07 | 2 
                     nmap-7.60 | 2 
         python-gobject-2.28.6 | 2 
                   cmake-3.8.2 | 1 
     docker-engine-v17.05.0-ce | 1 
                    gdb-7.11.1 | 1 
                 mplayer-1.3.0 | 1 
                openntpd-6.2p2 | 1 
                   pcre2-10.30 | 1 
                   perl-5.26.1 | 1 
           python-numpy-1.13.1 | 1 
                   tor-0.3.1.7 | 1 
                       unknown | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/9462900ae06dc1caff47ea1b40752aaa8424f4fe |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/ad97edab6a9b6d45f013d247529ae512c2b406b2 |     
         arm |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/76b12e0aef44cabd7b84c363f1482750b574fa1c |     
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/762251176efa2a4bb5b1e8a9d6d1a6341600a36b | ORPH
     sparc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/05ca30b84bb034e173697679cc00608b98e12683 | ORPH
        mips |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/920ba25ba20a2855bf7ee922461b638896a95481 | ORPH
      xtensa |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/46bc2ac8510c268df5f2a5502d04a87648575faf | ORPH
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/0d8b957c1e64ea8399c01d4b9776a126921d042c |     
        i586 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b10a8d1e671eac80ef9c7fae6064239c1be3c3f5 |     
        i586 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/12465df0f43b5984b7e296ae59748641b512ac48 |     
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/dd24c2deafd70bef3fe1598d471e9b9fb518c286 |     
      x86_64 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/f3837d104d7367c8e1507ab1b5226c3f9ff1d253 |     
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/2441c421c248ebe15cf2f5199c7b16d13bba8613 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3bf43b787814214d81030cd5b08e7c5f1aa3a102 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/b78edf7af124a2371ddcb4a1a4a76d46ab8ccb77 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/5f95ed47180e4fd19ec0ff784da8514110d14318 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/acf79645d8f598c81afeed68827da1a3fe57d951 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/7fddaa2b9f3a9a5fe64149ecaf6dc160c837929e | ORPH
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/21dec4103a933f7b1e4fe4847b85b20c9914d461 | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/39a361911bec42379cd3ae671c23f18dcc5c5fe4 | ORPH
       nios2 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/dffeb1826cd31024a97f0bad7674a305a2d7dfb4 | ORPH
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/50782b8e5020d82ee7399dfe6c7badebc365d832 | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/a4aca718506b93c77450f0e616e0873b0b0513d8 | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1986fc80672099e96f61602eac29e91c1d016009 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/9f4e2fc8e8d8fc38ce6985da65593a38d6c11510 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b5ef9e13f2a51729f473884e448da534c7d0e9e4 | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/82de1d9bcbff66b947daa6648b804cf7bf97824e | ORPH
        i686 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/e56ff6bdc4365538c23155cabb13f1ddc568e38a | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b3d6be863c2e1fcada7d79d66764d0e76a24ed84 | ORPH
   powerpc64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/89a21c7aa760f5516febd8472c5750b72fdd7b40 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/72a32243925bd1ea2cb0b5a1242225d38934b8ae | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/87f3baf4f0a983e6fe7358cf38e2975f6d1077a1 | ORPH
     sparc64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/7ddc63f1c65e9b4030adeb6dd64076f197e69928 |     
      xtensa | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/4c6e5fef2a80743e5669179383969636d6e0159d |     
        i586 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/c8093bffbc83e7d5759569eda5addbac1f4fd58a |     
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/a8072578c214d63993c3828fe803a7ce0c1f0d71 | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/1405934ea540d864299bc62fc884af842676045a | ORPH
 powerpc64le | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9321951db50676ba50ecbd62de74899786baa937 |     
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f11d40f2ce62d53fc54936dafc9f8132123f88ec |     
 powerpc64le | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/af9731c722f3873c590a6b48f1a19f9c96b2efb8 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1a659d6fad66ab9239d2ff5b726b1027c4638f1b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0ba5aea91dd1124191555c0e1950f614a3e835d5 |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f4147c6f09e94ee9d435f0d2d22740f397372e8a |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/486ef17c959acda9cdd2cf560091ff1f58a7cc7b |     
        m68k |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/7950679b71886d8bfc5dda8076300e39b30f0026 |     
microblazeel |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/acfff335ab231acc74a456b1a73700c590a31870 |     
      mipsel |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/3faac41ad697fb856000fec7f2ccd184fe284f6a |     
 powerpc64le |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/cfdf8be3b7a4e8df4d883a3a13dc1f191a8475be |     
    mips64el |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/2aabeb88ca2d050d8b91bd553f6422d1fcb22328 |     
    mips64el |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/a403c0efd81ec5884be410744490fab789a22c9f |     
    mips64el |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/4a42d00fa3dd78a11c9702226fa9e604ca1f92d9 |     
         sh4 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/c1b445d87b59299cb29a89973eaffcecfd0978eb |     
     powerpc |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/e6d2da2fd7bc4f7d38a39d90f8e87a2f50352d53 |     
         arm |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/fe99e063e6ba06348151909f3061770ad8f651db |     
       nios2 |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/2c0a3eeae8c348a344dae9ca79801810f8ef09bb |     
        or1k |        opencore-amr-legal-info | NOK | http://autobuild.buildroot.net/results/411e727107f1aa5dcb532aa221bc7dae89aa1010 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f393c2299b8f0d3fece55d29e78bcd71658515e2 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5802b0690e56a32db83fdd6600a3a500aab7784e |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/31d9d5e09f9cbc07376a9a1a6b7aa86d523dd424 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8d3a7782f038bb65142e9c6d35a941e72a682d35 |     
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/6235ddc095bc1984439e7339d590b11581a3e257 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/b862dbe9ce8c17368f648ee854f3694441d411a5 | ORPH
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/8fc88c1306c2237a87f71e8096976f4efd056eb8 |     
        or1k |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/bfd0a32e889ac5c8c865ed72b90a13ab37651559 |     
       nios2 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/b9fa6f2c8c52c8b1a6696624aa672cf8eb8d179b |     
     aarch64 |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/360fefb1dba2a89a4492652751a6f38b17b4e071 |     
         arm |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/ec973b60856d29bccff79625baea47408b3b9085 |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/9a2535d67729a366fcfe5b4b1ab30a3126577b0a |     

-- 
http://autobuild.buildroot.net
