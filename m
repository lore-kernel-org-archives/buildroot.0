From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-28
Message-ID: <20160229073021.197B91013E1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-28
===============================

        success : 201
       failures : 62 
       timeouts : 3  
          TOTAL : 266

Classification of failures by reason
====================================

                  boost-1.60.0 | 5 
                   erlang-17.5 | 4 
        ltp-testsuite-20150903 | 3 
              gst1-libav-1.6.3 | 3 
                       zsh-5.2 | 3 
                    ruby-2.3.0 | 3 
                  cairo-1.14.4 | 3 
          chocolate-doom-2.2.1 | 2 
                 rtptools-1.20 | 2 
                 libdrm-2.4.66 | 2 
                  prboom-2.5.0 | 2 
       openpgm-release-5-2-122 | 2 
             stress-ng-0.04.16 | 2 
               pax-utils-1.1.4 | 1 
                  trinity-v1.6 | 1 
                    sox-14.4.2 | 1 
make[1]: *** [/homewait: No... | 1 
                  connman-1.31 | 1 
                       unknown | 1 
         qt5imageformats-5.5.1 | 1 
                    mosh-1.2.5 | 1 
     openvmtools-stable-9.10.2 | 1 
                   mplayer-1.2 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
          libpam-tacplus-1.3.9 | 1 
xdriver_xf86-video-r128-6.1... | 1 
                 igmpproxy-0.1 | 1 
 make[1]: *** [all] Terminated | 1 
                      qt-4.8.7 | 1 
               libcap-ng-0.7.4 | 1 
                  kexec-2.0.11 | 1 
                   tinc-1.0.24 | 1 
                 qt5base-5.5.1 | 1 
                  psmisc-22.21 | 1 
              quagga-0.99.24.1 | 1 
             webkitgtk24-2.4.9 | 1 
                sqlite-3100200 | 1 
                  squid-3.5.14 | 1 
                     gdb-7.9.1 | 1 
                 lvm2-2.02.138 | 1 
                  ffmpeg-2.8.6 | 1 
              strongswan-5.3.5 | 1 

Detail of failures
===================

     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9ab1194cf9bbc060cbaf351be6ec4a281dc85b7f/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c389edf3ea171ab66934c37ccbc63e4e53cf386e/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3bcb7ed9ccdaf8309ec5365f546ee2c398fd545e/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/9deb60d3a693903ffca64bffd9be678ce24dab08/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b3ffa4ecb990f87b95572c88e0636bfcbffe720/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/a9e8e9c7104b15188d4e2dfb551a698e82c421d4/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/d2cfb20ef6762b54d4f5e94c9de7e8acffe1a1d7/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/10aa3f932e42dea76cb9aa86cc625a2689814570/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/d981499ad82121d58fb7584b55d09c484cb6aa49/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/e419f29e14edd28cbf48278bef725b696ae8ef70/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a0d7b78283c97bec37d1ff7cb0ead6698b0bce1e/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/44dfe280c2f862dc539927146fd941c6b2e28346/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/59eafcecfc7151c311e120adf474da343625f9e9/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6993b843f880f3d8b5c2fe2236062418e09eb82b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/b21f0050a10d90a4dc65ec9d2d79b6b88ca01f67/
      x86_64 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6ee0dd0c7560e6bbe652e9cdebe4b778cac78c6f/
    mips64el |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/dd5d2a26e044655b2517de2aac5cfef5c4be0046/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/e1c8c2d84de875734a52213cc17cae05e79c2a8d/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/46219abfdeffbab272fbc16767860b63797b5724/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/66ada5f457d3835aa7713d3a338b1b4be084cd28/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/0d4fb88578f0217d64d4cbc461846cca3b8455b7/
         arm |                   kexec-2.0.11 | NOK | http://autobuild.buildroot.net/results/d6e0afe4ba6210def4f975c90956f832216bdfab/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/76f24782aaf23fe718ad3f92c422b2bdad018f25/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/7e1bf6b78ed0ee645a70eb3054636c1402680c86/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/79a64b4226e3178a6f0b69095f77927b7003feda/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/2884452e213bb1b6ab93fc13d8c491a84b24e58b/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/ede0ce959b463396145610f5c72424f489d43d29/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/810c68e8f3a3291cb66fcbe2cdb68caf1123639d/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/6eef287ecc7bf4304477908b5adbd0c8afe38bcb/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/21067bf71f60d2ee2d64fc0314563196d72cd28d/
microblazeel | make[1]: *** [/homewait: No... | TIM | http://autobuild.buildroot.net/results/32632f457e7d1eef8c1a715b0a334de996191dc1/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/0de7fc1dc01443412b6ca5520949f0c8a4dfdb2b/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e2ba7bda64321b44f20c7e79868ceb32aff45343/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/edb58094922c85260acbd16884377eb205f2769e/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e082b3cc696bcdc6820a606a3e3754329739b654/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/924c8121fb157f4dc5033b7106bf11b14156f79e/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2f09bc5fa0ff885ba59e6a41a3cf9a3c1ae09e50/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/9b6706c398960056d7606cf1f1b41620b21d44e0/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/4f5d95d5b0d3177427ccaaf7a1b814342c888c0b/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/65c5a37cc2005f31467b5ee27fafb82d9155c202/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/a6a4f5064f6f34ca44c2391aea0b83d1df58c800/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b897d20ccf192c966ca7bbf817a96151e3781c12/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/c6b2cedaa5a6266556af459a988a33af7b7197c5/
microblazeel |          qt5imageformats-5.5.1 | TIM | http://autobuild.buildroot.net/results/620480531020763f39d7b8bf86f8303e07ce32c4/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/93264e0c49b0a047346e74bc7f5497d635471db4/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/8de680906591d16bd3873a37f2ef596dadf9ac62/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/32f68b8400015f5d7a3b8fa6c73e2f5af72ab2ae/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/ae86c3eca2ecbb53da312a793ada5628d5016730/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/823b64074f24fb1e9bce50cd5c8b2e4fa36b8cd5/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/40a1d10f099fe0f6527cf7e1eb257906334ac206/
      xtensa | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/87cfd355c53b9f17d0a3fb7fd992656df26b52ae/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/cde67179ad4f314765f369dd3804f8a0b4e73459/
        bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/c8a1e162af5354e5462c3b32e260c005dbb7a30e/
     powerpc |                   squid-3.5.14 | NOK | http://autobuild.buildroot.net/results/9c6913d5334e57f6722ac0179b2c68795115cbe0/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/c05e2ad86339ddf3cd4ba7dc22c9e4ed70bfe9e0/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/8cd6f5bf6e255d2939d72615f2109d7c494f4617/
       sparc |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/6aeee9af14f81fa9918b4ad1fb18194e20adaff3/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/c80f333bf6fbe00049497056012ec0e878ac8348/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/ac4c6261f438515f478469791f8c5500c78ef277/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/f2bdfac17e18733c9670f282cdaa02a2b05a2bcd/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/5eeac9ef6ca2ce287595bd84abf8c81cddae7502/
     aarch64 | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/2bfe7775a9e011b8ad8e196b635492240ca4c494/
      x86_64 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/82e7c60febcff9a3ac1c4234dee2f19772f3511b/
         arc |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/9cbf1a7fd2ff827c00b80cdc17c0d391adb94b82/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/473197ec8e323ea7ae0e29e6363525dc42f9da2c/


-- 
http://autobuild.buildroot.net
