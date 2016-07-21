From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-20
Message-ID: <20160721063029.EC132101F23@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-20
===============================

        success : 174
       failures : 101
       timeouts : 0  
          TOTAL : 275

Classification of failures by reason
====================================

                   dante-1.4.1 | 5 
                  connman-1.32 | 4 
             transmission-2.92 | 4 
                  nginx-1.10.1 | 4 
docker-containerd-1b3a81545... | 3 
openblas-f04af36ad0e85b64f1... | 3 
               libcap-ng-0.7.7 | 3 
               lighttpd-1.4.40 | 3 
              lirc-tools-0.9.4 | 3 
                   assimp-v3.2 | 2 
                    lftp-4.7.2 | 2 
                  mono-4.4.1.0 | 2 
             shellinabox-v2.19 | 2 
                     php-7.0.8 | 2 
                    owfs-3.1p1 | 2 
              libarchive-3.2.1 | 2 
                  babeld-1.7.1 | 2 
                 jack2-v1.9.10 | 2 
      host-uboot-tools-2016.07 | 2 
                   erlang-18.3 | 2 
                  snmppp-3.3.5 | 2 
               netplug-1.2.9.2 | 1 
                     mtd-1.5.2 | 1 
             bluez_utils-4.101 | 1 
                  libsepol-2.5 | 1 
                    quota-4.01 | 1 
                 libraw-0.17.1 | 1 
                openmpi-1.10.2 | 1 
                  rt-tests-1.0 | 1 
                   bdwgc-7.4.2 | 1 
                acpitool-0.5.1 | 1 
             libsidplay2-2.1.1 | 1 
                       unknown | 1 
                  fbterm-1.7.0 | 1 
                    mpv-0.18.0 | 1 
                     eudev-3.2 | 1 
                 weston-1.11.0 | 1 
           argp-standalone-1.3 | 1 
                   fwup-v0.8.0 | 1 
                 clapack-3.2.1 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                libmpeg2-0.5.1 | 1 
               sdl2_ttf-2.0.14 | 1 
                  squid-3.5.20 | 1 
libamcodec-6f9b99182f94be14... | 1 
                  cairo-1.14.6 | 1 
                 mplayer-1.3.0 | 1 
                    nettle-3.2 | 1 
                 omniorb-4.2.1 | 1 
               openipmi-2.0.21 | 1 
                     xen-4.6.0 | 1 
                  ltris-1.0.19 | 1 
                  gnupg-1.4.20 | 1 
                    gdb-7.10.1 | 1 
                  ffmpeg-2.8.7 | 1 
       poco-poco-1.7.2-release | 1 
               linux-pam-1.2.1 | 1 
                     dtc-1.4.1 | 1 
                  gamin-0.1.10 | 1 
                    libiio-0.7 | 1 
filemq-e59951489045825d6fc5... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 opencv3-3.1.0 | 1 
               libdvdnav-5.0.3 | 1 
           uboot-tools-2016.07 | 1 
               audiofile-0.3.6 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/c0e6fb2c0218454d127a558b47f31e6b436da21d/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2746939522a48c159cc920449b9f2db3a2e08f8a/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/7061750418fc86310898b7f8a74e67cb1862b370/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/220d037ed9e36d006d18e723cca3cb031ece79bb/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/a8d13420729281e33c8c8e3895f4e3a6f87e4aeb/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/76ebce3aeb472c58ce634b87f2eefa6bf31b1c21/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/fc483fa620bf5127d96dfb32397badc679a617da/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/57df04ea9e9726208c4e7f06101872ff17490328/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/216bee3beb5fe0dfb5a55ef9fd47a2b54540932b/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/19b57e3931f2c819df92e5a3745178fd928c663b/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/bad5f79190e6149349a83b96dc51703d3c33aeff/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/9783de29fdcea7d73e70ed8bca482782e71bb0e6/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/9516456f0c83fe9ef9d49b1fd557f6cafcf37467/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/9b40068c554fcda0c90663f105e53c37e0f938bc/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5246f061a3f8749565395ff92a9a9ea6fa7e94f4/
     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fad93f103b5a37e263dc2a244cca8d1dbd781215/
      x86_64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/44131c2d96fd6877b7cd9a09774768c4aec950fb/
         sh4 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a1d2da0bd762b8a1b75c0cab0cd66efa0db8a80/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e1a4f81e915ecda98f0e947cfa19f62ffcc19498/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/50f5a37e4a54941e5e8bb233d0be6b089d87381f/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/959481d04516fe8ab48a37f8c8abe27897e97987/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/85bfe49eba264a1d6b87f61d1bd168ba48906d1e/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/32eda2a12d132c0e218da30e544d29d62dc1d041/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/ae6ee73cc6f00ff49550e4bb0c17b784fc0b3f67/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/cc3fee432e7434fb83f4239324528e3d274e2282/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/0088c9bb466b2f17a4755cbcdaca8fd9f9895a20/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/bbd7596c404416ddacd11968534bfa5d7597843d/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2fb8f13025eda516fa1efdda0b1be5dfe3f4cb37/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/5f4eb80bdc37669301709433da92dce13fb90eec/
microblazeel | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/51708b8c9056db37263ee69d48a9863007201bc0/
      x86_64 |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8dace67d69046fe24d2180b0bcc80949f36949a2/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/7fe2bd9c85ed5de019a296fd8d7adec621b38d74/
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/80dc7c598f30105b67ad9be30b648df4477fe2d0/
        m68k |                   gnupg-1.4.20 | NOK | http://autobuild.buildroot.net/results/5f2008f82167ba4edb29e1bc3f54b913ce6e401b/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/2e77655f6d8fa75ee595034b90a21c5410c211d6/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/078beac9102ba54bef7b53d8c86c0680c545aa34/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/95e31c90d5929c8b2de4236ea267d1548eb3206b/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3013958e5a3d251dcc238bb6a0e92d07a05919ce/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/6025c886927b6514182874796f5e8cef1b11c8ec/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/c98e4e80a9655cc7c0b3b2b828eb1dc0a04ce2d4/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/33210288445c1861c6c48ea65d78d148bb5f94a0/
      xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/942ffa7b55d3934ab4304cf8a87ee5ba3d059b97/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/a9aa229b77d84cb36534aa10fa416e7b0032607b/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/2cb7f8a056982d0b894d0e2531ef357e74c8b796/
     powerpc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9d74d0d380c618dce637b9ecdc89b62f0e06ea6e/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/ec6d288788e49aa3d09149a1f70d98b8e26bc0d2/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/73d04b5c4d1dea25c844146c3a1ad8534bf10357/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/be8e1ff5b820a80f89e034f1b198265c32f64101/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/9bd4e6bbc45162ba794ce815361c5d4d241af7e3/
        sh4a |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/4b92639a757d3038b584236c933e8b5832226e1c/
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/aabda9afe051d2397ab252a1912ea7244d7be8ad/
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/dcd1d94a121d7c974fd0defa87a4e24c6a4b1b69/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5044719acf8e77a19de03b4a9ab284b59b6d6e3e/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/d710758c5c9d7b7f775cb5d37f39bbdc4798e1c6/
        sh4a |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/944ae89af5decf2ab7a7811f2a561d9717372376/
     powerpc |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/c3337090dd9ecbaf6e13ecc2b9edb129d2117abe/
        i686 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/f332bd6a7015f3adb5dd9300d304a684f6709321/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7dbb7d3f527531f73831eaa39277699f2fe24d15/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc35a89822efe11fb4849cde2d0737194babb6ad/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/058dd12aa64fd51d0c95d4f1ab3faa22db44b710/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/f5407397788d7aa9c5520f9db7fd8a7e57663457/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/6dc5f5a857d38d63d76224b9193de190c5740991/
      x86_64 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/72b0ebeb4b566bd03982af698472819f9e8afedd/
         arm |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/260ee7194dbe9a96b5d12fb1cf18d3f062898b4c/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9f9a661839ebf263fd082a2ba926425dd08c9649/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/3001a85f624e5e427a32c0bde44968d20cb51441/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/aa6517f885bb0d549eb3b76df936d35fad2a30ce/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/767ef4b33079f45afd2366eeeaf149ba5216ad4e/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/39af9668d5cc172d1a28701aa53a3744a40f3654/
        i686 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/01a5f456db3a1a9db6984d0dcd342d4ab3d3cf3f/
      xtensa |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/6edf8cd14d2d8f41514b05df60bd9e879a9d903e/
     powerpc |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/6c7327e31087729928fd976b53ac452ecd0502d3/
       sparc |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/b66096e30291fd1f71b51c247a206251d5562418/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/0e2025cbc1c54f0c177ce3f27020d454aa03645a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/50342f5f13bf0c6448422fd5702cb1667aae49df/
      x86_64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bf1cc1e55ad0bda7bbcd25b75f17a4434d4eb500/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/20ecf364e67d51aa97518df8135b9367f24a560c/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/07011973ace964b897272122f842f755d5147358/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/cc3d6d3b58b50a6ca552107ed311ffe15bc7648c/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/b0509e73903dcde8ac58700f14125ef32e6bef9b/
         sh4 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/3cec514039feaa2b20d0e6f162cb7d61226b6370/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/92ebc02e690bd486b4b03f5f1d8e3f7c79ae4986/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/a5cf166f645dcfd7b82b37f188452b65c620b815/
         arm |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/319c8308a68f076b91d8a73d44b8c24d8293e3f3/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/bc50ccacd6ddeee6722d6cd0ccd71b950e4272e7/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6666f7c07339830fb45a5decb8825560ee432ce5/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/942f0fba815929c5373b6a2c497abd7738567545/
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/92f617fe7a7bd0fd42efb07aeb61c984c0e958f7/
         arm |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/dd8c5179103eebbcbdf57961d9df31b256b34155/
     powerpc |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/e2ffba8c804ddef90aa50948bb164128aeb4d4f8/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/6d4287e4274dcea8e4813acba642d28b9ab12dcc/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/262f47e6a0fb52ea3fca10b9a2175d22b7146f38/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/9979ff81119fae884658a50db305856206924dce/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/1b98e5467f8d6dcae8dc70476826f2e1782807ff/
        i686 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/56dc3c598836c82cd60a4b81fe7dd3008f362538/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/c42a8d55ccfccf42309331c6a7954cf6abec6c43/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8eaa1bab32e05f7f75496f56a56405aa4775b86d/
      x86_64 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/ff9bfab6dcdac0a190c4c854913fe749e2a9e784/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/fd7cf7b6e9d4615a2eeac85a85717aa0c0bd19a7/
        i686 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/885335bf3d9416ae658182dab94d27b2014e50d7/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/a0121c7e26cc91c451e09c9a02444331c0735c45/


-- 
http://autobuild.buildroot.net
