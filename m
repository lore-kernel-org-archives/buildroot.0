From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-27
Message-ID: <20130528063005.612CA52C0FE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-27
===============================

        success : 97 
       failures : 58 
       timeouts : 0  
          TOTAL : 155

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 8 
               sconeserver-211 | 4 
          host-protobuf-c-0.15 | 3 
                 pixman-0.28.2 | 3 
                libtirpc-0.2.2 | 3 
         host-gutenprint-5.2.9 | 3 
               qt5webkit-5.0.2 | 3 
             bluez_utils-4.101 | 3 
media-ctl-ac40b79f002a2315f... | 3 
                      udev-182 | 2 
                     m4-1.4.16 | 2 
               aircrack-ng-1.1 | 1 
                 rt-tests-0.83 | 1 
                  iozone-3_414 | 1 
               xenomai-2.6.2.1 | 1 
                libcurl-7.28.1 | 1 
                log4cxx-0.10.0 | 1 
              libgeotiff-1.3.0 | 1 
       network-manager-0.9.2.0 | 1 
                libsigsegv-2.6 | 1 
                    acl-2.2.51 | 1 
               libglib2-2.30.3 | 1 
                openssl-1.0.1e | 1 
                   icu-4.8.1.1 | 1 
                  zeromq-3.2.3 | 1 
                 binutils-2.21 | 1 
              libsvgtiny-12121 | 1 
                 qt5base-5.0.2 | 1 
                    systemd-44 | 1 
                  ne10-88c18f0 | 1 
                    crda-1.1.3 | 1 
                   squid-3.3.4 | 1 

Detail of failures
===================

       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/ac935abad54c200f4edf02c5c4949407c509c95e/
    xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/87a33d3b66fdacc58cd1bf6ab02200ce31e12f38/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/24cd49c0e2a629cd195b397d20c0f91b972d6646/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/171cfb4e5fd7439d0b3dc3a20776ed722c7c7562/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f92551f73dc0f49f30d79f16f9f10b63812f9012/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5f62da857b002c70e691720f461e53f0d71f503e/
       arc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/937827ad311b03c95e4aed4e996e71138f593edb/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/15ad1128679e8493bb3e9a9d2842b22b8b42fdfb/
      i686 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/69c47fc9b9021b83ac732b12f3a585e74ef1d072/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/d2d2cd2e82cc9d71384dc90ca519964886c99af5/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/270aa2005ed1ecb0439085f33808174d677d9299/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/5cae702600a4ed2f92e65c4333d8bf99bee70269/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9ea64ac5cac6f20321230d3d7abbbd358da6d4fe/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/4b857f0d460b04dd392f147a8afe7ea58ee06797/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/e697b61cfb0d2b5f1c44b9e1079cb9e06d6a00db/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9c0f81196d733269c384d012825ba5f9b37fd533/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/5620ef071facdff5bf7609af61577cb45933ce58/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/0a721ef3f1593422753e5d19952d88a1832b41f7/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/2ef68189f7d67fb32f377f6bfa417699edc5ab42/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a479c3e9afb28faf9884ab22a0f3493c8924d1d1/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d26be1e03e3b054ee911601f85ffed62560aca97/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/b0526372a1cec6cbc25af9e43482da10f09bba8c/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/be8f000f0701dec602aa3fa2a715ae8ef770422e/
       arc |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/a2912e58494f1a8efe1b9cdae0f0514d8406ca32/
       arc |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/689c56b6df2bd495366b5a5b0ba9da679436ec47/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/c238699b07d9f09ccb7ebb5d686a4dda0278ed95/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/15d2dcaa5532b2f341912a9b2a60266015c29510/
       arm |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/b3afd235c7f32bb5be97ac3f6dc0c06ee8a81402/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/c60f8e230211e4629996439836193fa0fa2b41fd/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8ae2d05b335e2cc0bf85326c0d3afaa1e951103c/
      bfin |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/47b3d259edc8e7c04c6c4092de6117b5cdfd26c3/
    xtensa |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/d7febe02e1b23f52022e875ef245b5d2728d3c66/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/6333d33f3080ae36b995c148cd0324b67b7a83e4/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/b75320479d782849e48705df9438c5182f8c1e31/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/70154aff29fa12d56dffe85a67f6e417cf56117d/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/2380baa778124fb9003260f57f020bb6876bc61b/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/c0a37a63e9e3186504cdd4cf70a20ddd5ee5f86a/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/ee18410632d08ae8d272cd6b973777ecb912abf7/
       arm |        network-manager-0.9.2.0 | NOK | http://autobuild.buildroot.net/results/7a5a030ae299ed1a2c8cd110acdd90c3f3e7b7f9/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4ea554fa117cf61b1737f8126c3c71af7ecd7fae/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/535b1721b12fa0bc470d1560d336ba733d8d0b52/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/4a45f012c0a973ba41dba00a737586ca4912973c/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/a8271cb6f62e304f4a320f70015ed4824f56e416/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/7d5bd5dc1ab78bdb2da541446b7b21dc46823c62/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/879eb6c3ec7f41ad5dc48b237367aa3342a82b76/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/33ce3743b689d7b669788c9a778ffe3fc0220baf/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/a8bec842be87c296f3a96ad14e96d886c10210e5/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/29940422c81dd8ff1abbc26b7516db68e16407d4/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/f993b541c538ff17ae2554ac14504d0a439413df/
      sh4a |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/1a032cfc63c8693811b6122f1a3542461466be0e/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/4ee9a8883af48273e226641c49dbb090f11ceac8/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/7fcab4e0512ea7f3cd7e2fc0fba80cb81f3c636f/
    mipsel |                    squid-3.3.4 | NOK | http://autobuild.buildroot.net/results/87009569342725d9008e089b0feac3374fc2c163/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e29b7033d62ff6ca1129e017e7a12c1dfb97a5d5/
      mips |                       udev-182 | NOK | http://autobuild.buildroot.net/results/8bca5af5675d9695a4bde823d3de3d7c2f2ec8c3/
      mips |                       udev-182 | NOK | http://autobuild.buildroot.net/results/16f4f45cc9b2eba39f314db9780d5f912324a94f/
       arm |                xenomai-2.6.2.1 | NOK | http://autobuild.buildroot.net/results/966b17831ffbab2b19fc9b715ec80e11798bcf1d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/2a7dc797f75b7c2db1c34b7a579404535f92cb55/


-- 
http://autobuild.buildroot.net
