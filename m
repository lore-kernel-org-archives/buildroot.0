From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Apr 2017 08:28:45 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-06
Message-ID: <20170407062845.03A9D20832@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-06
================================

      successes : 217
       failures : 38 
       timeouts : 0  
          TOTAL : 255

Classification of failures by reason
====================================

                 xenomai-3.0.3 | 6 
           uboot-tools-2017.03 | 4 
                poppler-0.53.0 | 3 
             rabbitmq-c-v0.8.0 | 3 
         alljoyn-tcl-16.04.00a | 2 
                busybox-1.26.2 | 2 
                  aespipe-2.4d | 1 
                  arp-scan-1.9 | 1 
                benejson-0.9.7 | 1 
                 binutils-2.27 | 1 
                libepoxy-1.4.1 | 1 
                libmpeg2-0.5.1 | 1 
                libtirpc-1.0.1 | 1 
                 libv4l-1.12.2 | 1 
                 libxml2-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
                  ntp-4.2.8p10 | 1 
                      qt-4.8.7 | 1 
                    ruby-2.4.1 | 1 
                  samba4-4.5.7 | 1 
                    sdl2-2.0.5 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
             xlib_libXft-2.3.2 | 1 


Detail of failures
===================

    mips64el |                   aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/38634c51ca0524881bf48d1b822a816f25390e30 |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/8bffe54032aad9cc710a22411ef3bff4a2c93e55 |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/432287777806273031e586d3bbd6f9fa9339026a |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/71fb70d1b155306712a603708552bf9714563a53 |     
    mips64el |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/06d28d2958768d7ed24acc0b313153cde166b41a |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/9ff288e8c5f782093bffc5beb6eefac6eb0c9fa3 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/3255517494875db526185dcf975efe9fb57a884f | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/14d8ffdf207be32bfe9801d4bb930b5b51b8ad83 | ORPH
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/8c2fb8b7f2aa903fdda02627c4b24ff394d1da05 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1a27a3a6ac6a8f7047d6402683539883e8613514 | ORPH
    mips64el |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/e10bdb2a24c3cb7cee755d9a28b060945a9520fd |     
        i686 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/5eb4c490321aa61b7efc84c8a5f1aa0b70c6d5ef | ORPH
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/c42a4e992be8495ac015915c6316a212b78c38fe | ORPH
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/db9f4abd7e5768095cc8e053cca8a3379388ff20 |     
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/af7a2a9eb501edf8d8efcb9fc5b771c7bd23ab8a | ORPH
     powerpc |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/2ddba50a3aef16c2ab26a5f5f44cd1d4338d667f |     
    mips64el |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/33f28042893ccd0219ef82a74fc29a781dc20b68 |     
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/8bd9f1ac7227904d96416dd2c608f5eb32308a40 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/59a7005d801e7505815d741b45c69766a58db9ea | ORPH
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/59d67354fcb6aab365ddcec45474e62012f6ebe4 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2c119dbec01671003cd2a0156668bece05bf1dde |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/71b6631a63eb6c056f4549e6e0fcba39a0f1cca4 |     
        or1k |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/b9692329c292ed2d9a1419678107fc36968abd94 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/f1f69557f359c7abac6d94678651c71c2faad04d |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/31e4933f8551638018a2b00f3525f6f51d5dafd6 |     
       sparc |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/086763ab35998358248ce86b61a5142f23d5fc85 |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/6d2ce8d13d52245347bcca0df3c2ec68b9bd970a | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/12d110d1e38dac764576b371e04caf4840b59fc5 | ORPH
       nios2 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9ff24f38bab1b28f2712b464c624f58061ec4e90 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/7873366349b126082894a0fe87b7865e0844db65 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/8c943163f61680ac53f2ffa787058bf5be2f9ead |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/797abe7fcef102329fc7848b87d258c0b5a4f238 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/8e59e0bbe51c9ada0bf2c4f2cc50968ef2120d72 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/fc65464ba3ae71e43bff44644063c5a6ade0538f |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/b6220a963d0b0a5d77179509b1151d576f5551a0 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/fce9044a31a70f1fc8da10d5a91f8b3cb0e9d9b2 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/19474bc1fd6b42fa0b2d102cfd2eb6043dd74ef1 |     
      xtensa |              xlib_libXft-2.3.2 | NOK | http://autobuild.buildroot.net/results/656f1ababfcabca21c7655b6cfb6913d08001e7c |     

-- 
http://autobuild.buildroot.net
