From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-11
Message-ID: <20160212073018.E5E46101657@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-11
===============================

        success : 190
       failures : 90 
       timeouts : 0  
          TOTAL : 280

Classification of failures by reason
====================================

                     kbd-2.0.3 | 22
                  boost-1.60.0 | 7 
                pulseaudio-8.0 | 7 
                numactl-2.0.11 | 5 
              libraw1394-2.1.1 | 4 
               libcap-ng-0.7.4 | 4 
                  samba4-4.3.4 | 3 
                 libraw-0.17.1 | 3 
                   mplayer-1.2 | 3 
                  connman-1.31 | 2 
                  psmisc-22.21 | 2 
                   tor-0.2.7.6 | 2 
                sqlite-3100200 | 2 
                  trinity-v1.6 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
                   fio-fio-2.6 | 2 
                 mesa3d-11.1.1 | 1 
               nfs-utils-1.3.3 | 1 
              strongswan-5.3.5 | 1 
                minidlna-1.1.5 | 1 
          chocolate-doom-2.2.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
               valgrind-3.11.0 | 1 
                    sox-14.4.2 | 1 
                 libdrm-2.4.66 | 1 
                 lvm2-2.02.138 | 1 
               libupnpp-0.13.1 | 1 
                      qt-4.8.7 | 1 
                  ffmpeg-2.8.6 | 1 
               pax-utils-1.1.4 | 1 
             host-nodejs-5.5.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
               host-efl-1.15.3 | 1 
          libpam-tacplus-1.3.9 | 1 

Detail of failures
===================

      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2b7c82ef6c43c33ffaecb0b148c4404576c37d1d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/19aefa63291de818b99fb0b084d083f60549aa55/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/020dc8c77e44c9620bd3fd007c738c88b0d654c2/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e2a4a00d2a590a39a00106c1519dd6c81e0cf236/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b50009a1d7ba67894b42dd407042db406d4b0517/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0011b24cddc1af971dc1ee158430293dadba4cb6/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/827e571070bd340e23ee3971c0e6ddad80db20fb/
      x86_64 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/0ba92b05c03f1f67009aae456b5136f43f9052d4/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7efaee147d85c211f733cd65bd9c99088be5662b/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/c5b3ff9da989d5110402caaeab7dda89e1cb1f52/
      x86_64 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/c53f7768be220fcd0f574ac16a7b4b0e26e7b0a9/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/44dd45e0f693ea84fc072ab28f038bf04a9226ec/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/dc75b1f5ca4db5fb4658f19fde56b18cb7170fe9/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/598bc7f81fe89188308226f453339d53bf7ed262/
         arc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/7dcaeb8fbb5739c36aa0615e3d8a13e9c32993b0/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d63e346ba4d00a68602b1bcec0acb09e266a53c9/
         arm |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/9406af4b20a0b7450169f7bd63e6a2ebb85c81af/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/08f7386f75c881bc582b338824f8ccd509b2921e/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/5aeef61fbd399dd78dc72b9e7cce978e6f1f58b4/
     sparc64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0e7ff249524dab1ca434295263e9768253c1cf49/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b1234d705b4d98951c4b500c28758ccab3f86e18/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/5550868f70f37942429fcc318d7b19cfe561bdf3/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/f9b7ea22fc41f6f4c2d4f41659236e2ba7ed73cd/
       nios2 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/4997da79f0b40215e7401f29aeab34d78b4903e9/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/29c448af79d3711fafde551ab838bf75fadfb666/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9d2ee117f9537550f53d0ef18006e4890950928c/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e5a0ee705b706eabbb934ae65c2c7ce76a88dd90/
     powerpc |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/97f581feac60cc0cfe9c69d994cbd24491d8e5d9/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b440a18905f5c676c986d9a9f4ea54dfac749898/
microblazeel |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0fb4030cd5b8c1a05e70175ec5cfe4434ce89e1a/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9479cf09232d844c2c42a1a3642c270ddc164dd3/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/b9aa4cf1f000421d052f9f9547cc43275c08ef59/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/57e4386e43d8bd65a571e20ebc8f69c8a424f38c/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/a50c44861cbe72fb285f07be4303c60f4f17dd98/
    mips64el |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/e1c641b18d82cd3900e47d245fb1b3bcfbe5a968/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/d04cc8e09c8b9fcb705f340ef6defd28f8b38168/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/23e42afc2e33649486d0052a9525ad3b2bd4bf4f/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9f7524f4a4883c6135e829635b587fa2c3dbd68d/
     aarch64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/0edd44eb4bea6640699a13af11ba98eac1bd6884/
      x86_64 |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/8408c6ede9aba029a1aecd7bfd617e6e058c75e3/
         arm |                      kbd-2.0.3 | NOK | http://autobuild.buildroot.net/results/f6baa37428aef3a410854c0138e71a3ae085910f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/00a5ef3a4e10700c79b83bc1ab026808ce930030/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c98add9541defd5f12415b69521a1b32ddfa270d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/527d982ab6616eb7bef9419a9e793f7a46c32830/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d4e18789c1da2d8518db873d7833af186daf9859/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/2d8379580c37b8835dcb4dc32ca0df3aa6283e0f/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/89f9ef5a3ed9743269f82eab11323840b409ce70/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/56fa1435cf5dc68f95bbba29dd557c4975f73818/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f7ddd14023ea54127cd8dd44b76171a2247d8f97/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/143c4c2a1d8527c97362ce11507e8b5a79dd0d6b/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/198149e80be3e62eaf9f4731442031a1aa93409c/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/774204390942faa43296c5abf193bcbf1260687c/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/d4e50cb00ec66498a2989ed406eaa2165ef5684f/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/2444ba3224fb08ab5677cecdf6a9eb31b9435459/
     powerpc |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/653421502099e4a9220bdb5ed13d92e78c3cf674/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/c16fb939a9f1b7d786cf2f7d7f6ffad9ac6cd841/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/d8925a4968306d67749c9fe165230cdad066d988/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/8ebea55163a36735a3d987a787efd7eeb42d1e66/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/48f96ef26f895639f3376e94eccdea9765710877/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/97c435c39345b22e1e7e2feb7d5badba9b74791b/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/009287d4dd1511ab2127328815fed0365549a5ed/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/7a102b5f3f9794be8c02db6f9bfbccec4f4acd8a/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ef89fb8982438842a45794462b37f10ed121f33a/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/077c6b213738e6914b1836bacc1e6bb8613bea50/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ac611dc851e7a5638f0c8fc0a9b246c3c79cd7d7/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/48a94050e26ad829277c46300b90439502e8a3e6/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/2b62e30bcb36c3877686b1471642273e21756c91/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/ba9d058da46fcb569120a6dc826e2c51dc676569/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/410327935adcc1cded02243c051f8e92c56237af/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/b98e244b8ae1b06047fcb05b7d34ce483c736ecc/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/d2b953bb074e7f0e0de86c11771624b399d43859/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/46d702f32b23b50c12237e04e50b2d304d944f40/
      mipsel |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/8c022016235bef7850fc933c7f1f5ab5ac7cf0fb/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/474e237f6ec11cec590f32aa55372917abcbf396/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/ac5395c8b2c1d634c341b0c7d7913c9528f6117f/
        mips |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/f2fdc25c6d3c85a24c7a13b8448a7463b4049a48/
      x86_64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/5a82b31f6065a0aad123d78d0b6b0f8025ba360b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee562524c5b12191e584ceae89006c5a5103e700/
        i686 |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/2cdfedf5407bbb6f5c383aba930ee79794d45df6/
        sh4a |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/16a9f69f0cef6e02c7249be6cae61dd36a9ef6df/
      x86_64 |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/a5b837d6d02ec96ac53c5b1c531a0c8e7eafeb9a/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/0273acd342bf1cf470c0b944c10ca23acf0e1a39/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/a25932ef64c6a0fb64bb7d053aac18527ce1ccf5/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/c9a8589782b387e99f4c840eb722bcced86cf74d/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/3153eed33aaed1e4605a927ca8f78de56d3697a1/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/fff98784c3f8c67d6db54e10459d287bc3a490e2/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/fc51b05556433368bc242b50b0b68c97eadfd2c6/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2a91b8d585c34ee97d97fe9618cf82242ae5f3d0/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b5a199d24c625e083f8238a500de113c888021a3/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/1929133f50400e148044f9a1d4984aee10b80468/


-- 
http://autobuild.buildroot.net
