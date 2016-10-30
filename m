From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 08:30:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-29
Message-ID: <20161030073036.6E04B1024D5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-29
================================

      successes : 188
       failures : 88 
       timeouts : 3  
          TOTAL : 279

Classification of failures by reason
====================================

                bellagio-0.9.3 | 19
                    owfs-3.1p1 | 8 
kvm-unit-tests-5731572b2ac2... | 5 
host-mfgtools-b219fc219a35c... | 3 
                 mesa3d-12.0.3 | 3 
                    mpv-0.20.0 | 3 
         network-manager-1.4.2 | 3 
                     vdr-2.3.1 | 3 
              bridge-utils-1.6 | 2 
                  guile-2.0.13 | 2 
                 jack2-v1.9.10 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                    lftp-4.7.3 | 2 
                    mpfr-3.1.5 | 2 
net-tools-3f170bff115303e92... | 2 
                    php-7.0.12 | 2 
              ptpd2-ptpd-2.3.1 | 2 
                 uclibc-1.0.19 | 2 
                     xen-4.7.0 | 2 
    xserver_xorg-server-1.18.4 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
                ipmiutil-2.9.9 | 1 
          janus-gateway-v0.1.0 | 1 
              libarchive-3.2.1 | 1 
                libmpeg2-0.5.1 | 1 
                 libnss-3.27.1 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** [libavfilter/a... | 1 
               memtester-4.3.0 | 1 
                 openssh-7.3p1 | 1 
               polarssl-1.2.19 | 1 
                    qemu-2.7.0 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/aea9c56b02373095e4b34a10d2d3f69d859ff88f
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/1d686c39062eb3d065db8b66b99dbfc9899f1943
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/50ec014239fca7deb50487683fcbbae7de952623
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/0f8dde39f251e8a70fc9768df11a280e94a2c349
     sparc64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/be4330074f7dfbb62ca2f05d37e3f5c7e014ffdd
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/8c92c5473a28872a5e2622c0c3670978ab3de06b
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/3d8b0efb3e93a3c5b632fd5e66947af35c5b1bd6
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/f8e76bdb028033108f04d0bb8f7b86379a625459
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/5d6573cedf989f5967b234d58da49a2431436c3b
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b0313aad996654f45c3ab8d908b8723921becf24
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b8b1182c9fd02de7e9b03066d6697a9b059b5673
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/efa7edb3037ba05a1ac031d2200025f7cf9dfce3
        sh4a |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/c026551c6b3483d98dd2507c7529a0be8ff79007
      xtensa |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/4558a5814fde339b1bac81c6a376a38f89538a48
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/7a3c76db1fd74f743c25dfb7b2a8743e6770c9cb
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/953911806702c438bbe486f33f80bdcb4b466416
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/7420a506c02dce8d2884b0672c8c703c4bb0817a
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/7c3fa4853d4dbb08a53c15a03020d48325cfbad7
     aarch64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/064869ceda7db4fe5a41b02a63ac4500ac6ef068
        mips |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/f6bb0fc0c91508f7034249b870946e6083f05fd1
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5cbea95fcd03e7fd5b729017ed732fbcdad7736c
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/cc563497395de02dd2327de3d8793ca243c6863a
         arm |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/68a292bb7dc5c4bd89a98a8f953a45f0fbbbb090
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/dad6220b9ed0af06db6f28ea5db5ea0fd67f6465
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/7f7a670a0065505fb8fd545aa2074c62ed62282e
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/33e435714a06bfd8a6a748a9608aece210c39dee
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/f7053488cdfe75dfb7f650c47e9e399f96d26d15
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/c73644d5b9d3909685682acfbd40e1e094caa9c7
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/bf8cf6d7aaa13f0c588d04b6b397e51869f9b992
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/54dd151350c3e179783c7283af090619b3b93c62
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3480d0cfdd617ef7ab99a827f97d5bab9cbf42eb
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e35d773fdce1a4febf57213fb013d8939d3664b3
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/5f83a24c0956daa9e5d922125ae0b6ba77fb4299
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/92cb174f290492d3ee45c4795132948448ea2f55
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/b3eaa5f24390fa3f8805222719da0baa5bfd0443
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fbb3f92f05f4162031abf4bfc92c7db74ba5f266
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/2eb55132e593dd56596df0b6390d77d2a41d0e80
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/faae63bc4eaf4d2f3234ac1456d39478019b959d
        i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d974a96a6b3f24ce3e498e3cfd82bee666a0c30b
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/13c026ffa0ba1d55903138a1c12445c80eea2116
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/2b75a266ad846574aa40b2aaf89083d623bae736
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/0ed572d91ca3c073735eebe49fb80a0deee6150a
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/db84187846def44ea00aa99521e5d33bc8c3820e
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/cad882561a20dff550f13c24e0b5c25dca8abdbf
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/dcda0c055e725a14d23012cdcb1dad832d09c2a5
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b7d0207057890bef8b6d7a80e5f7d5b533ca27eb
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/2c737081199d6ffcfb67a3d7ad0cc82275f28928
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/1e1ef06879cc8f20ecc54c1a29043782de7c0a68
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/d099d3ffd246f3e6f2afe7fb2f94768ddf1b6c3f
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/f8bbaff8e00f2ce4b3a9ceddda7f78485fd841f7
         arc |                memtester-4.3.0 | NOK | http://autobuild.buildroot.net/results/ddcfa640122f1c906359dc2a45a2eb7474dff903
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/c5b936120339fc5833842a71a9cf7382206e1b79
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/aae61974c9e8e5d3effcc25cb8e55c74ee1ca0ed
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/c88dc4665c0cd5d56316d7e53df40aa07f96c890
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/cbf633492149d2e330f0fa74b1b115cae238d818
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/0e4c5e11d56d61186522393fa2ebba71c8b18400
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1225c90e43cf2d7d9364c22c1f09763ec3e95aa0
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/83b627a56bed1752ca4d12163cf5a66739a0001d
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2a11859b7b8e598f65e90596243c56a9ec71c9c9
      xtensa | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/cc9c1c1cbac2f8a0df0bdf33ff0f3a48dd5eede7
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7916980c0ef7721f89740314447d5a8e4bf90d5a
        i686 |          network-manager-1.4.2 | NOK | http://autobuild.buildroot.net/results/1e49778f624f96630a0ce638bcd5384440670173
    mips64el |          network-manager-1.4.2 | NOK | http://autobuild.buildroot.net/results/938d3b939897609867dec344c3f71b01115704bd
        mips |          network-manager-1.4.2 | NOK | http://autobuild.buildroot.net/results/92683749b0b8e726bc83781ca6d8e103428362ba
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/c45c6f0acc8b6fd0f264136e5573872cef9ac519
      mipsel |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/1fd7e3ae15a039f88fe010a1298e28a2fcb6bb0e
     sparc64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/aa0f4eb67c84dc5390dd144c0266dabe0ea96b25
     sparc64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/ad858dff806ff60ea8671341f0efeac88de8f17d
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/6f0ff76bd396d760763d3e480748fa57768773f4
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/674406977b54e2d7627ad3ba36c48c04c8d40bcf
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/1824574e715421cbf7bf39e9a46f6570e289c0d9
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/4ddab4aabf31e5ed2a6cb0766fec4ad23b043d79
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f462029d543e0bac0eb65bb160810e3b3e7a3508
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/aab9e4c1f5cfa8c2690d3dfdf37b49549fe4c1ab
         arm |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/12afbad46b09c3b9d67af7aad5153d0dc15b0da9
     powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/4e8dbed869ce822dfd7bdea733a13c718f5400fa
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/dc6ab88a4ecb5daf6853f9cabe17448df61e3700
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/57ad813123c705613f00c710d2fb22f6c924a941
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b171a2290de024a5ef40dec0f50cc8dd5a37236c
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/403a0c7b2b06f7500122e86c9944610de482faea
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/0535baccde32bf5ebadbf21a2297de4971d5bd62
      xtensa |                  uclibc-1.0.19 | NOK | http://autobuild.buildroot.net/results/cb7f5bdfac615d774f3bcd1b802f8d74460bc557
      xtensa |                  uclibc-1.0.19 | NOK | http://autobuild.buildroot.net/results/cf3dc9ae4f74ff28b285f1a862b71d96384d7651
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/6d42f92131f445607beb4c26b66684d83b3a61f6
         arm |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/12d43b58a30d0181765cd0a4cdabe6d2a758a836
      x86_64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/8e66fad785d96b8eeefa2b595c945411581ed596
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/685794b20d527812de14d61524aab6126e5bcd06
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/cb208cf2bc18a4d74ffe357f5369591e608ae407
         arm |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/13d62c9ed8f0a6d6d8b2903abdfa5c4e2ad6d9ae
        i686 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/069eb898f7f270e8a8e9d6670d1218d785173ccb
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/9f4c5ac069e3fbf8ad49ec57cbd2454d674e6095

-- 
http://autobuild.buildroot.net
