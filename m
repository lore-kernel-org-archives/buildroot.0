From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 08:30:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-10
Message-ID: <20161011063039.C0DFF102720@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-10
================================

      successes : 170
       failures : 245
       timeouts : 8  
          TOTAL : 423

Classification of failures by reason
====================================

                 glibmm-2.50.0 | 128
                   gvfs-1.30.0 | 24
                    gdb-7.10.1 | 18
               linux-pam-1.2.1 | 7 
                alsa-lib-1.1.2 | 6 
               libbluray-0.9.3 | 4 
                  cc-tool-0.26 | 3 
             ctorrent-dnh3.3.2 | 3 
czmq-5205ec201e97c3a652c17e... | 3 
make[1]: *** [libavfilter/s... | 3 
 make[2]: *** [all] Terminated | 3 
                    php-7.0.11 | 3 
                     vlc-2.2.4 | 3 
                   glog-v0.3.4 | 2 
                    lftp-4.7.3 | 2 
                libgtk3-3.22.1 | 2 
                    mpfr-3.1.5 | 2 
                    mpv-0.20.0 | 2 
                    pppd-2.4.7 | 2 
                privoxy-3.0.26 | 2 
                  squid-3.5.21 | 2 
                   assimp-v3.2 | 1 
               audiofile-0.3.6 | 1 
                  cppcms-1.0.5 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                   gperf-3.0.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 ibrdtnd-1.0.1 | 1 
              libarchive-3.2.1 | 1 
           libmemcached-1.0.18 | 1 
                libmpeg2-0.5.1 | 1 
                libsigc-2.10.0 | 1 
                 lvm2-2.02.166 | 1 
                     lzip-1.15 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** wait: No child... | 1 
                 opencv3-3.1.0 | 1 
                 openssh-7.3p1 | 1 
                   perl-5.22.2 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                rsyslog-8.19.0 | 1 
          sane-backends-1.0.25 | 1 
               tinycbor-v0.3.2 | 1 
             transmission-2.92 | 1 
                 uclibc-1.0.18 | 1 
                    urg-0.8.18 | 1 
                 weston-1.12.0 | 1 
               wvstreams-4.6.1 | 1 
                     xen-4.7.0 | 1 
        xlib_libXxf86dga-1.1.4 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/594a7f494d0d878687e3572a976158c75bee5b5d
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/b546118af301edf678588281c1d59a77858d5719
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/a5cf8d20f7fb00497547c3d5ff900f75f2669940
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/0586b8d9610ed1a227cee665033e9301965c6855
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/3585bfbe9a46ea0d3b3bb89e227689c9c7506921
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/df1cacff57a7303ea4d30f6ab4cc4750f9ea3aa1
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e292de1a72decc95bafadac17b97cdb8e2c88937
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/17f20a739fd2e41b618d709b5a0e1fd408bb62af
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b1665f3f7f3c901040b3b37ed3e895a5fd828f85
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/6a5083b7cc56147a500fcb5e118170ef3ba01c84
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/caa95fb6275ab9b4c17b66be495db9cdbaaa1049
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/985858bed53cacb9c53a38b573c13f3540f5f253
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/c2ad8186bf75ca5f4fd09055ea0ce3c80f15d071
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/67da155a220caecfc4abd63ee58b500f74af3129
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/cdf4ba0c238d14b0c59c1e8016206f25fc6453be
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/146b656bcee7e25625d6306e9d354daf1a94bd99
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/04505aad86518dd52ca0add4a98bace1a81def13
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b6a07a59d54aeb2537b0ecbb11cb0f47b27f378b
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/35d386e2690e56a3e94a9430c9ae01dfd47f989d
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/43ee05a91b8a3b179cfc02b0e505430b7c041cb9
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/47db91929db1152652b86fde55dff3718ab8ead3
      mipsel |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3fbd073b457b8e62ade598ef2dfe8c4b782d31bb
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/04421526b66303ab8d6afb034721a6f22451e069
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/097b0b79c415450e5b9208fed0dda56c482dcfa5
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/cfdd7e2f9463dee03cb332fd13b20a3133e6ae2b
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/994dfde75cc16b218b41a2cfb170cf8eae6c1dd2
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/86fd8c6b8323393a066ce51ebfa55babc6a38920
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d9eb33294827e4f028d7e21c5ae79f6d1d330f93
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/41f5ceb74092a9162a15884098ce52abd8f3679d
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f972f75beb4cd066bec700a6e1e22c7659c45746
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/fe2e470252c7eb194317adb5c8f558852f71d504
        i586 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f3efcba3b2ec7f35192172acd375af72a9bba9c7
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/97c91dc23d181dc9d9b91c42b37dd9f2bf18dd86
     powerpc |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/9152f5e5711bd3c9aebc14043528bf89f714c98f
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3242e84086b914322f7e29c4187c4b93415a7359
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/7fe4652bffe9db2b13a3d4c2df0eb5c4e3668334
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a9eb23fe7ce9d2a344d8d8ddaef73ba19dd13380
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6b12ddd3cc9ea04d8d5349d1e846d9b7b8ebe886
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/41d601d770d7e9b6d6e393d08ec5fc03429faa54
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/922b15334f9e982633057f02cda63e7b0304a80f
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7ac27aec587c30f7fdbae30cf5617452be3dd9df
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4597fb41d5d6ded86bcfef57a20916f3937f5cd9
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/79cfd73a5f8d8cb15c6096cb4bc0a260a5bf88dd
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e0c41ed0109ca1baf4ec245eef319a6b910454a
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d987306ff04c06d580bb665561de4456732cd4fe
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3a4e0170c62c27365ece2ea3d7380fa3b76dfa0b
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/28803c7b5c059445b7511cc992e8e106193cc0a7
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a1c5bc601977e4ef675a2459b96505a9035aeed3
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/36907c811892c717de70f771d7307e2508704e5e
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c4df651dc74014168d83df073cb4ebdcf6c5d8ec
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9dbf13e2702a0e916ec48a7ea87b6f02bf65e450
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cea7540a807594ae3f5b34c8fda95106d2d28161
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/08fc5b65b15f511f151147ba6196889e58f2f093
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a1bf813085d602963b20a394a1858b9e1581e221
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e90999733a3d5a5da0a7027b1cb72320c2f4d08
     sparc64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e8e346935d36ea39d9a72db45e31cdc2426b11cb
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/91ba31f7e14c250e4b9a7d309e46e7977448f7c1
     sparc64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/31eaf3a19c55cec355fa435a40c2b8af4f3d06e1
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/97e64bea0bdf50ea919a1231ef01df7ee01d2e24
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/bf156738adb6fcacd2937fcaf2952bf3ffbbbe56
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/fbc9819f8bea5c57d7bbb6232c2401ce7232261b
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f8afac91c0abfb1699eb56bdcdf66817d2d764de
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/8390f14b1ae903e093938e8d9c220ef9040d65f6
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4815b38a4103003f952c9d19ce3446d49940c99c
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/50675528fc55163f1e08c55f9fc9d988a181b4f6
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cccb57952a4cfa137a2102c7e6ff684f65a46482
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/69f21f5beab35359bd269eccf5cc35508bf327ba
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/009edcb10bbfd4e6632eccaa86bb18e7840bfbc2
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/40ed3f16d9b15ac30e607e33525277ebcffbaa9c
microblazeel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a3ce4ca0ae1537edd4fbe5feaca0f40ef705121b
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/632df8f52f9b6fab31a0f4915c72b7723938b4c1
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ba5451267c691ae56aa9f976347fe7b10efd2880
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a058c71876fb9fa5f5e966a6bcc67a0b19e38f04
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0de316bdb834fb39b80a9e9029ba62c4a340260c
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/78220369aa100213c18e9e46c726a9fb5af08372
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c18dc91230b5c2c3cb50ce6423ec87bfd52dcf09
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/27acf5a6237de85c025af74322b06eb63f973bf1
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0c17ebbb3682f82e3c0cfeb5e9f02cd07c57aaed
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/8c008ff0a3fd87b1c0ea941264ce7e05348c7b9b
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/75e3c6a2e09d78e5217610220e86a901b299d7de
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/aeba39db1e738c682d40c2fdc2c98b5eff6c3436
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6868f67984ebcd3d73ffa9386b32106d7e16086f
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/76f5d78f49996fc935518f621385f94f2017482d
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0b2e76dceed58c933fa57b8454e97bd357331ac1
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/aaeaea4ca100b7ed22ecb18285a0c7c44935085b
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9c266329d163fe10dd0b642077cbe25400cb4cf6
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/b8582f4218812be9b62b47066e874ee6bf0b90ff
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/23b87e1b34990ef8952ae23df08d6c0dea093035
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/88202b11a240ac8108741ecf7f7dc6f6f0671473
     sparc64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/86057f4bf3da9dcb91fb2a84742790917199bfa6
        i586 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e4eaa40e41bd4e419372b583a35425e7abcb7914
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/63cc65848c4e9bee05259fe6fa361e35692468bc
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9c056873922aaeb69ede7916ee230507e4e5c1d9
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/23a789384bc9f9e4bfb979c85b40aa55a6e720a9
microblazeel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1689342b8b6ffa415dc089075e6da9a4912503d4
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2db4362925f0d1d3d70d89d20c84b73a3e91341a
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/53a8c9bbb1204a7c01dbe4152944e6d63a3fa589
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c34a5d80ccdeec81c3cd4d3f8aed550e8f33ccc1
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6ca3262b42aec9dfd2d89155a897ca1265ae4ce7
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6cd2994a4780b5c4db498c61fa3638f0df1e4b6f
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/33046a84c0a714700e8a12bed026209a2e77efdb
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a811dbb7849628eb03f9f59f4971a00c0c5c550b
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ea7f79371c997a283441538a1e7c559777b3a7ec
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7a24224d1b8d4363609310f8c8a0c9a1e2c1b36b
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/25ba17a0a2c19eb14ed753db68549c9e6979cab6
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d634792cc9dea737e689047c52479d7b4a2a9fb0
       sparc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9431f441219cef65c454fda9593a3a508126520b
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/35b7762a5fee1dd45f7b31833e53a05fb714ceb0
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2d3edaf2a3761d28b6f1b3bae8dedff947b71c46
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0ea9aecf9258bbd441e261408e9f5b6eb3d961b5
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7d5120c9d3e86b9d0d2e7c02a9d24279d996fcdf
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/61b732a5554a290f4d38226532eca96b96feccf7
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c8305c2adae9e794921fc687b1487ccfb1a94a30
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/14f1b8cd98554b2d44e405416a97f16a1ad82423
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7cd665653060b27e5aade1636c0e066ad361efa1
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/98dc5b46e6967e68f6329f7798512abffbcd29e2
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1e36783dacceffb571d754543dac6db07786e6e3
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d84da2dd030c96d7b45e4aac2cb4f18ecda7d41e
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/aa1874496be39b4bea854f9bc58c9bf63a9eae86
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d29a6485be9185f993871481630f67810b2835fc
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/81b81dcacf3af0aaf7913629194cb76e86a70b02
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/aed63534e0d41576e305a4672c17b55e0434b26e
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ed21b9f0c8026a809abc752044ddd56a031e41e1
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a3e082b7b2751fc56557f8092f73fa803bb0990d
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/08cb5e9272339fb2dc173abc966aa4bc5900ca8a
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f5908950656be1be6c2c47538ed86ee95f5d8681
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/88926ac96bae2ffdf92d470ba495dc687ec7b7e6
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/78e2dea35f1445bdf83e34b827a8f53eb95a7846
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0d993c37ffd43be802eafc0bd169827da85a806a
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e03e1493a69d502b4b60f573840c23dae242e7c6
     sparc64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/efe16f500d4ffdd11bea0922337f0659db05fbed
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3433f34fc7e05edd1ea4b84567c836b63e8e03f1
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1b2362b5d2ea03165a21cd9e8c1db28d5f8cd8e1
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/91e3a85492ba9a18f804abdb0062ceb8dbca485d
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/fd19ac5bb7960bf8f39f6db9a98de9aec28e7283
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a881621623a3e515c03dbbb1504ee0e0af66039e
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/84201e2f919f79c1540f94e92829128afb412a46
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/410e75f9b3557881db085db1888c1dce405216d0
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/afdf52bc29054093fffee572517f58d790236dd1
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/845c0fc2d027adcce8d08de506065103f1f21728
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f3b816308e510c01739d9bd566f3665ce1f2c45f
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ceb1da52b24ff50a7154b460906683315af586c8
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e9550ec5932890225fc82938a14b613a00463fe4
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0bb8b8f0e29026ad2f5c329cdd40c85698f9b1ee
microblazeel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2c88d79abea0595459211b3f5a796fcd5dae4337
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ae22ed54fa94df6e6fde1acccc7673d1235b6314
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/de42da25e44b65fd58e7d5e5524b430b0517b8f0
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9b2b075c31206ac9bc3aaa035660e1a633ffd191
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2e5b0a9fec8db5d0e40e34affad09e55b4f8d282
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1eb96a3d9589fba2bc66ce0794eda0f557952f77
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1f357730b1c60827d0462ea83b71d3605c0abf04
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6cb256f9943bcaff871ac998d0aafc7b8acd89ed
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/72e60674bccf31f3e9e449feaf4315a8226ffbb0
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/94f6202520eef0cbbaa27dd198a71771e7eee4a8
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ab6a553f2d82503c0700636794ba7bf05bbbe743
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d463a4e5a3577f0da23bd7ea6b6972958a50818d
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cde2b29ca9087354e6d4d988595ac9c86e163414
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0786517c7d777cadb846d05751297ac6a3995147
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3358c14e338527ea8619b605d922568dfbbf62d2
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/0e04eed254ddadea647bbf827144c0fa2f84e90b
     aarch64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/87ffc7134878c6a7e6cf741f189309ac8da5c7d3
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/627653fdc5aad7b1cc1fc2af57ba817380312412
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ef7b0c10f7d8a9d759fc58a99827c497c5eba4b9
     sparc64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3b14df730cd14171f4330638262b19b5d168ec15
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/52107407b933c485ae4029d3059134bec5831ab3
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a527595c3567cbc47b789b31da5eedccc99d1dce
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/49f3f9f217c89f555afdbb2dda79aab2f0bd172d
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/c92ea0f3e602a25c45b9d8a652fd0295949f1e35
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/a4169654b44d07a45c12bba49a50d4338d744114
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ba60fbf83483cbdca41844e32f78c8b9f8c2ce9d
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/fdc0c99b28def2a8b426582e36d6db5e270eb7df
      mipsel |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/df2aa266d58ef40c11745acca6537ea76baebc97
     aarch64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/b04f2dfc9d2a388113254a7986727e67deb2037d
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/b12f3d6e13b446ef438fe916ad76d37a928548f2
      xtensa |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/1e50ad7437702a7be1f908c0feed60d76d2dc490
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ac1b99045eaaf12c11c2d540a8de12a7fdcf98ac
      x86_64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ecec918e0c2b2c3a6853a129cbba0e681f60d8a8
     sparc64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/f9d149abb42d5857f51866c78afb24894e8585db
microblazeel |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/a936445a2f3d1f58068b2331a3e85b2135a022da
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/872a279c558df386147b6e8df048c9cc9a77ea78
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/74340d30ec189b5df23c3cfbd8e3ea71ef3a78d6
     powerpc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/577eaa14ecc4343718f89cbba1c418e0030402ba
         arc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/c232b3d4007484603e0679fe0e4f6669e2d2eb83
     aarch64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ce489eefe2f9377ccea0844d4719566c80dfd451
       sparc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ada2f88b92ae8c515b36984c998cbb6cb9618eae
     powerpc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/13bae296b38e7de5bfaaa1cd51e30298f9f0d627
      xtensa |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/9d4e48adaa27e54db822fb0db150e335122b0706
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/3ab7dadb4c210b7ca9b234cd417b03a1a4a45883
      x86_64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/fd7f3b155a957e618f8ac219f0184da180887d56
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/c3ccfeb4ea6b0cf0dc6480b33c90ba58a31227fd
       sparc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/232bbbb79c14f4108cb92a1bbc9c71ce759e3e61
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/ffa47e8f66aeea18435a02bbe463e0ff63a66b7e
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/82c3ca435e243e46cc613dafc24a5999bcd73d17
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/93a782c8c4a2b7c955b33a680ddf81eaa4018a91
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/4e361f9c92b04966368ba5114cd001d77f40f82b
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/04796060ee0ff0fe71c11f39dcf13eed03b0495e
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/0e9050bf4107adbd842adb4015ca3ef305bef45f
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/a8d24818bf9c5475ce870e3558af889579bc6be8
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/98f5492453e0a1c8f8b8bc62f940cfa5e02d9348
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/37296617ca655f35310df9543c13ac81eb1c51ac
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/9ebcddc4683efaf3899a4024d8f7fd5955381e6e
        mips |                 libgtk3-3.22.1 | NOK | http://autobuild.buildroot.net/results/b70734fcddd4abdc9b3a34ac1809d78a5a8b2cc7
     aarch64 |                 libgtk3-3.22.1 | NOK | http://autobuild.buildroot.net/results/117329380bf42b8862a4de45021b21d71b5ec38a
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2f17253bee36e81e45a3f9a11abbfc066899b712
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1ee512f77ab7dc001f5e2b0394ec688749bb33a5
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/40563404e2612590a6ad19cbb39df14074fe160e
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/ee738cf8358e856f1a18c134d1105a1bafc346e1
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/02bf198254edd4534a7a9a735180081640a9392d
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d50f69a0e6ae1bd056b56cc58b1289cb134a31a5
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a6f254a4ca3d3198d579725d16ba70cf936f4ab4
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f5849c2f88db60e884a407ead05e2d61f9b1d3f2
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b51424a97f5f0e787517197ff405a16ccdb3a0c4
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/87f15db4cc269ca97e9a11b50427d03526e5520b
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/b9546970bff0c7ce6788162742b6ef812283b538
         arm |                      lzip-1.15 | NOK | http://autobuild.buildroot.net/results/f5fc3ad28a54b66b440c19545c849f0d2c333855
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/3117d6bb3292a921063064d222e34699ac934a4d
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/10856542ed758053fb5690dec8222d16dd176c0e
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/f730fb3ea46856f988b554a286bddc2fbefdde9d
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/85d563d9a283f831f6331459e4adc37b97e2034c
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/7b513368c37fecaaf6aa42d06b308d8dbf06ca2b
        i586 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/88d2ee8368c962ec95fab76e58036cb4e87db268
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/78512fe2ca23263445b1232e667ae59ff57939a4
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3b45980096308c7690f2d071bddcc17f87fd8487
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/e2378a2fbaf44a6af943dfbea7e0f01edbb7940d
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/2d92244f2e80aff96c1a15739bf20dac50d46c45
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/043417df560d37f0d7a8841d300cf8e1dd01859d
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/a4dfd913f1809171722798f2ab445ecad3cf9bea
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/1643a90c03eab9df73db264915b50fea3703abe7
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/9e1cda20b0f84b1e40b5e2eadb78d20ca7cca37f
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/d9515a2f019853bd4bd677e565de9c03da20b00e
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/5a15cdeddc24b052471045eb5c470df907688a8a
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/a53e1a3e0976893a3510b3755d5dcd0dbe5388e6
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/409164aa7fe7dd089b47e97a128607379f7e4237
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7880abe39cb64b58afa37b4fb71f75111b40faa1
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/aeda988cf634ba873b96a5a7fe00df7bf689556a
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/673ac8eeb014d84a07eb1de1282302763b27dd14
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/84d72310ea219d84c6a56284a4e780adebb30d60
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/dafc21eb56008593c347091d24429695a1dc7830
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/979fd89f3974bdc26b23f8abef15ffd64f9a2d5b
    mips64el |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/95d9cdcad98a40cc04f248922396f314d0fd1c4f
      mipsel |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/223395267e8b3ac85d479960252dbae2374695cc
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/89514429e630f8f25c3acb23911af029dd157edb
         arm |                tinycbor-v0.3.2 | NOK | http://autobuild.buildroot.net/results/8fc7365e0dc777edc57e950a84df7fddc13c6776
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/bf4f4fa08757eb60244f23f7045ea4df5766e51a
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/e3f0c6c647e2fa8bea2a12083f45ab5abdbf4d2c
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/0681d32a2b6102f970578d9590f425c9e66549be
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/bedcb7d9d0118390b04e2f12e8c47a5cbbfc59b2
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a28ec120ba0761445127325933580b3b58e1eb86
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/670e30eff514a538b7b3466592ea21a22ff9bbc0
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/2c7a5ceeb4fd4828ebd32dda9ae36a646e66d5f9
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/583432418a8b6a76876d6720fe02e40f2d724e09
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/148433d6494491b40adc4c5ba3c565693349bf35
        bfin |         xlib_libXxf86dga-1.1.4 | NOK | http://autobuild.buildroot.net/results/388970419d228594f9243c4c4e85c80a4be9a0d9

-- 
http://autobuild.buildroot.net
