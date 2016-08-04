From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-03
Message-ID: <20160804063031.C8E0A101CF8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-03
===============================

        success : 151
       failures : 74 
       timeouts : 2  
          TOTAL : 227

Classification of failures by reason
====================================

      host-uboot-tools-2016.07 | 7 
openblas-f04af36ad0e85b64f1... | 4 
                libcurl-7.50.1 | 4 
               host-gdb-7.10.1 | 3 
                    owfs-3.1p1 | 3 
             transmission-2.92 | 3 
                   fwup-v0.8.0 | 2 
                  trinity-v1.6 | 2 
           linux-zigbee-v0.3.1 | 2 
               tinycbor-v0.3.1 | 2 
               libdvdnav-5.0.3 | 2 
                  babeld-1.7.1 | 2 
                  rt-tests-1.0 | 2 
qextserialport-ada321a9ee46... | 1 
                 jack2-v1.9.10 | 1 
sconeserver-bbb384404575f8a... | 1 
                   bdwgc-7.4.2 | 1 
                collectd-5.5.2 | 1 
                  cairo-1.14.6 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
               libcap-ng-0.7.7 | 1 
                 libraw-0.17.1 | 1 
                socat-2.0.0-b9 | 1 
              lirc-tools-0.9.4 | 1 
                     vlc-2.2.4 | 1 
                   dante-1.4.1 | 1 
                alsa-lib-1.1.1 | 1 
              libarchive-3.2.1 | 1 
             shellinabox-v2.19 | 1 
               domoticz-3.4834 | 1 
make[1]: *** wait: No child... | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
     docker-engine-v1.12.0-rc4 | 1 
                 libunwind-1.1 | 1 
                     php-7.0.9 | 1 
                  fbterm-1.7.0 | 1 
 make[1]: *** [all] Terminated | 1 
                libaio-0.3.110 | 1 
                  lshw-B.02.18 | 1 
                  libsepol-2.5 | 1 
           argp-standalone-1.3 | 1 
                 opencv3-3.1.0 | 1 
                  libvpx-1.4.0 | 1 
                    lftp-4.7.3 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 lvm2-2.02.162 | 1 
                 openssh-7.3p1 | 1 
                  multicat-2.1 | 1 
          sane-backends-1.0.25 | 1 
                pinentry-0.9.4 | 1 
              squeezelite-v1.8 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.1 | NOK | http://autobuild.buildroot.net/results/eb46c3c16eceb66eac9b5227ab40859dc25534a5/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/db2503bb4b30cc709eeadcee37a3586244119adb/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c1f48fadea55a1dc80e5f9a96bf5b5187c338b9f/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/9fe0acdb09ac1cbc3e4a9000be7785ae369c2348/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/d3c2f2a68409c1136ede1f9d50dd6587f56a82a5/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/83c8df5d8cdf0b12450cfbecca746905d80b1684/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/4c559f0f4966604ab7ca6d6f184689d3d376176e/
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/f42db666f5783e09f72eca86030c53fcd73f516a/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b90ba840ef01fe8f5b81f2830d20fab5e825777e/
        bfin | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/dc963f1cff9fb1a302b505b1d991276af2a8f87a/
      x86_64 |      docker-engine-v1.12.0-rc4 | NOK | http://autobuild.buildroot.net/results/87f16b363ecf652a83eb5adf3fe204a186186a93/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/ae2b77a98090a1e00e5c07fee68441f33cadb50f/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/01bd191e3823a5e328149365a6fc6f23bc389096/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/32c97fc6d0f9bbc9e1b687ca2b4e82b05934ca70/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c7ad842e1089de860d45babbcbdfe1bfd7d50ec1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1493d6d67f4414591ef53949eadd8a7aff9896e8/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f9d9c968d9f1418ecc89dd6143194029ee614c24/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3eccb8c0e7668427e1959c506b3cf609f1931c43/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0a5196989dcfec0c026ba2c7cafb33bc130a3bd2/
        i686 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/b2eda5f826b0d955e8e2900072ea56cbb2e81a28/
         sh4 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/7d0a8c19364a30d89c1da1e0db167361a441e728/
      xtensa |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/5db26c4e56e8117602564ffc002fe0e2cc9214e9/
        mips |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/78bca3060571503111c19e628221c1e5b2b4aeab/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/87625868d735b5c164330fcdf4c8e7471da4c203/
      x86_64 |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/d521a285e6e50a7266a395c5ad67cbcfd558d272/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/7d9f8c15bbb0167960a99f6be6672f5687341df8/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a5deb25bd416a69973da04c5bf477347c25c9350/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/5110912255fc4ccf666f74c63e6d40a3d7119374/
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/e2e91e18ab9b31eba9f570141c37e72134b768ef/
       sparc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/487188ad3e8b15cb705fb4e74436ae21b5e3cb9b/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/87a5f42c0af387fb8b3692f27e641708073e6484/
        i686 |                 libcurl-7.50.1 | NOK | http://autobuild.buildroot.net/results/656069278ca3d4a68f68eecaebbf3832b25c2da2/
      mipsel |                 libcurl-7.50.1 | NOK | http://autobuild.buildroot.net/results/b3049099595bcb867c258de41b7232596249c713/
    mips64el |                 libcurl-7.50.1 | NOK | http://autobuild.buildroot.net/results/3b24df50b6253518dfc7bda1da5a03bceb801cca/
        m68k |                 libcurl-7.50.1 | NOK | http://autobuild.buildroot.net/results/d9f921f1732b3768716f6092c9bb2625a0b71378/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/f4907f56101166076859809c7bb38e621e41e752/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/d1371ad6619777555b3ca4dc100da8952d886ddb/
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/15da5a9315bf3ca310d2a01c8353a0c88674651f/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/920e1ddac6bf93707a187e64a4ef7d95aff09e6c/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/1078c7c3a8ec7a52db567514b06ef1a05d07194d/
        m68k |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/0ae4a0611112a416c1f299b63d5b32ec2dfe0788/
        i586 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/3ee046a59aab32ba4e23127b32e150567bf0bcb5/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/6e756a242afe192a428841d050e0dc9186c27998/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/735ab1423796e99964ac5468242fab730bd63125/
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/a897d94c3037668e429f2cceb7efa04d0052b24c/
        i586 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/51a12e5b6b3a20c371e3a55b2915c068b3693017/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/07fea0fd3456ab6738f9b69846ee6b3c82669333/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/4ca3f18c275eb6d9d3c1297d3bff25f9a9f18523/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/5fd0bb756034fd0218f8ea971242dfc21800c574/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f498c85a5f71875aefbcab6355e0a944643cbe6b/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/84e68beef950132f64a612fdc144a93a1f2597b7/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0a7b4aaec59827a92dd51a7a5198065be04bfd1c/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f078489b87cc2a4c018bb1f0622261bdc5b82d1b/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/03411765bb2a8f09d5caad2dc2c99e7cac9338b2/
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/1652bbd48945eb2939526a8e97ac33144bf54f6c/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/64ea35995d7fe7b65d9cb840b8c20c727e8587e0/
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/8eb2e58de60649330f90b2792a2d5d6d3ff2d4aa/
        m68k |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/5974008224ba1e91872029e346f77a47fbd0428b/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/50200a1af4a82321b53749bb2ed39a05aebfd7fd/
      x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/85b4d79fab18679b30e241fc484d36ad483271c9/
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/82154ce2050b99fda050476a89a2c0d18c87b4fb/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/177f0ee9ce2da12f122e7d9e8cb1544dea8e3143/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/98688507ed3b4011b3702bc280f54e4bd2753d71/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f084cbabca360493386964c9995f580ecf48b8c9/
    mips64el | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/953e757598c2c07d513164e5c3f5f5f93a7fdb03/
         arm |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/ae801f7fa2801d6f54bddf0e23911e1b55b3abff/
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/f5a91d73498f585d022e6add34cc9443997b5aa6/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/756443619bd3182d3d1064821560575306b8a1cf/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/684571562dc98781d8c815389c42a1e74ac28edf/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/b206545a2fd563b32967e2240e4fa367d43ea87a/
        mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/859e4140db3fb423c70446638986792100208881/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5fcd0ef0fa6c457cebacea1038bd2d3a23eecdad/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0b9580f100d93ac4f40461471c68bf3e40b66984/
       sparc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/c8b06ba16f0687b1228be7ea3896fa2ed738187d/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/409d50e74c22b493582ac6e7dfeada8a05999740/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/0e06242cf4d7c176cf11a01377d1661012bf048d/


-- 
http://autobuild.buildroot.net
