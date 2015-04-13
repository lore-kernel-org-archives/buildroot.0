From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-12
Message-ID: <20150413063019.11DE21013FB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-12
===============================

        success : 228
       failures : 64 
       timeouts : 2  
          TOTAL : 294

Classification of failures by reason
====================================

                     vlc-2.2.0 | 7 
                libtirpc-0.2.4 | 6 
freerdp-770c67d340d5f0a7b48... | 5 
       gst-plugins-bad-0.10.23 | 4 
         lua-periphery-1.0.4-1 | 3 
                     gdb-7.8.2 | 2 
                ipmiutil-2.9.5 | 2 
      host-gdb-arc-2014.12-gdb | 2 
               libecore-1.7.10 | 2 
                 rsyslog-8.9.0 | 2 
                  boost-1.57.0 | 2 
              postgresql-9.4.1 | 2 
                    webp-0.4.3 | 2 
             bluez_utils-4.101 | 1 
                    qpdf-5.1.2 | 1 
                elfutils-0.161 | 1 
           python-pycrypto-2.6 | 1 
           aircrack-ng-1.2-rc1 | 1 
                     at-3.1.13 | 1 
              pptp-linux-1.8.0 | 1 
                libevas-1.7.10 | 1 
                   libiio-v0.3 | 1 
               qt5webkit-5.4.1 | 1 
                libupnpp-0.8.6 | 1 
           libmemcached-1.0.18 | 1 
                 empty-0.6.19b | 1 
                 cdrkit-1.1.11 | 1 
                coreutils-8.23 | 1 
  toolchain-external-undefined | 1 
                   zmqpp-3.2.0 | 1 
make: *** [network-manager-... | 1 
                  fbterm-1.7.0 | 1 
                       unknown | 1 
                 leveldb-v1.18 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                 webkit-1.11.5 | 1 
             transmission-2.84 | 1 
               mongrel2-v1.9.1 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/134c7f782166ea4425a3935df42e46f3a799b342/
         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/8a6ce608c6f46d08ed77049f796e98e6e10a1709/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/38ec273ad800c8f8807f4b29c4cc1297ace7cba0/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/949893af02503e4fb7f1ec0f07be7f7a4a1f34f2/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/da9f8fa2e2f3b64375d41e16f8ba67ec40287548/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2abc6b67d3d18f14dc2fd385aa4e0ad9ca69570e/
         arm |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/3be9c791e692fc9917974308cb9296399aa5da5e/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/7f2f0fee6e9405b4cfcf040867170766f8e53ac8/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/96676005a0a7f9658710cc1f1a015d6fec7b5027/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/02f543d66a9f633987e01dcec34804fef79ac9e8/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0f88db3e99cfc61d064a132e269bfc54182d9cfe/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/dd467efa10dddf295deadbc2c4e9f78719979a0b/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/48dea2e4e18e65fbcc1f184e3e54d696d9b22657/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8d0ea17dc0d06362c243b01609f339a24b052963/
      x86_64 | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/f9cafc36091846a6e68832e050f939964f35fd49/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/f978548bbd4e0b7230436674af926bad42e13c2a/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/d20f2267ed709c81ed3ddc0748cf44bef07a592d/
microblazeel |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/8bbf6d938c96794a3373567f96133a265eb174c9/
microblazeel |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/0e9d99f15d4fd48a604e15cb12af285370ec9391/
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/704bd6c4dad40f18c3fa91e8e134f4fe7ea4d87a/
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/085ace5c02af810a95c2062ff8e71261f13551a5/
         sh4 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/61c1a69700195b22e7e153ce5590e79592c7b7a9/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/0c6f16c2430dbd6592619b962d356c42b39d4631/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/44921b87f921a828998a788647f45f411b082d39/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/a6c5f9d8e0e0bad27b8ca1fa217bfda4216f2cd8/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/661373306d0440aaea67e394fbbfc47fd4481589/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/7969f3beb7e95858ac9b05526e1b67d1f58758f5/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/3f632ed0bd256bed2d5bf737e4c06a0255254c0b/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/5b751a37c1c9666f74da2f763a66e0bf964453d0/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/1823446e3ba401e70a7045542405e8eb5ca63f78/
         arc |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/302dcf8114072be077ac78112f3968864a46e817/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/305bdd0c098a8ced82a816c8a502c76bcf69dca1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/b34cc50f0a0936ca00f203925b7da4c042c15653/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6b0e30d65a277dde4bfad15e9823b37ae9114a9d/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9b9e130b1efe7ee2ef9878345e373fd8c7cde211/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/ade8033cbf8c89e20d53919266fb6f40f5cfa11a/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/974c0168b2434f5b70f6902bd49ec825fb06edd8/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0448c024f28febe33043c0c33b1c60529e070898/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/2b62d77924d8d1686abe84fa909eebf30840f15b/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/50e5d389f0b5ceaeb8fdd8e987cb70273f8507d8/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/334dc5fb75da39ab13f49257e8d7ecfc318be7ee/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/7d358589853a5231a452a5ff58b39f7ddfccbdc1/
    mips64el | make: *** [network-manager-... | NOK | http://autobuild.buildroot.net/results/3e1b44c4673fa05de0c2610c3657410eee05c593/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/183f795df9e52498e1467c35ad828f99d9bc6aca/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/aee47e9330969d29fec00d8156573c30adccad43/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/dc41e4d5f3f38a644d91d8ec2f05ab0318a29fd4/
         arc |               pptp-linux-1.8.0 | NOK | http://autobuild.buildroot.net/results/9c993c840fcfa87abc12758471c1bb7bb04599e6/
         arc |            python-pycrypto-2.6 | TIM | http://autobuild.buildroot.net/results/a312565ee841ecdb835858aa88586634b244ef12/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/a925fd3e13920afcd46c9ca791cb3b29e3148292/
      x86_64 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/c2beb574190e899f2ef3c04e50d2da9fdd8255dc/
        i486 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/890cf2e248315a0f8d5b02a8e2a388b24d62ff48/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/a3191138c41f8df374ee1fbf07b71ac46320d80a/
       nios2 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/55c01c93d9cd954c1f971d3dedcde5ba7eccbfe3/
      x86_64 |              transmission-2.84 | NOK | http://autobuild.buildroot.net/results/00c87cac2f49062e5dec1e5bfa316fd5e9f012f6/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/3cfea0a5cf2b8ee6ffb59ae1f8fada325a6a162a/
      x86_64 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/6bf02bdd652d9b618209265ece91e38ea7a3e217/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/265c8d79f7769b8b41392b21ed3357f198e9eb42/
      x86_64 |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/63247783c7ccd238a34c18ef6b99d515ae553f92/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/f8d7dbc88dca2bb546864cfdbe803b5b3fe5c05b/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/fc556e026c1afee75c73ee33272517e5514029e6/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/e3d4be097d174c66b5c0a301fdec516a7fd688f2/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/8eb321c0d1eb0c9b42674da840a44a1806fdf448/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/fbf281e40f907e02d1de3f643dfb9276005997e0/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/41b01040201a6838beda0c62e847dc375abbe041/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/6bda799126f5e7ada3f13c8b223e37cbf88127b2/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/3c2099dd83ea1b37606eb8555e3f6d881f5803e5/


-- 
http://autobuild.buildroot.net
