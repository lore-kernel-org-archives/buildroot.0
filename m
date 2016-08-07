From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-06
Message-ID: <20160807063030.73D30102F8B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-06
===============================

        success : 236
       failures : 85 
       timeouts : 0  
          TOTAL : 321

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 6 
                acpitool-0.5.1 | 4 
      kismet-Kismet-2014-02-R1 | 3 
                alsa-lib-1.1.2 | 3 
                    mpv-0.18.1 | 3 
               bootutils-1.0.0 | 2 
           igd2-for-linux-v1.1 | 2 
                 libunwind-1.1 | 2 
                     ncdu-1.11 | 2 
                  trinity-v1.6 | 2 
                openmpi-1.10.2 | 2 
                   ncurses-5.9 | 2 
                 clapack-3.2.1 | 2 
                 lvm2-2.02.162 | 2 
                   lldpd-0.9.4 | 2 
                pinentry-0.9.4 | 1 
libcofi-7313fbe12b0593034d0... | 1 
               qt5base-5.6.1-1 | 1 
           libvncserver-0.9.10 | 1 
                  squid-3.5.20 | 1 
                 weston-1.11.0 | 1 
                    mosh-1.2.5 | 1 
                libtirpc-1.0.1 | 1 
                     tftpd-5.2 | 1 
            host-python-2.7.12 | 1 
               tinycbor-v0.3.1 | 1 
               binutils-2.25.1 | 1 
kmsxx-a706f157b86e906968080... | 1 
     alljoyn-tcl-base-16.04.00 | 1 
host-gcc-final-arc-2016.09-... | 1 
libamcodec-6f9b99182f94be14... | 1 
                     xen-4.6.0 | 1 
           host-openssl-1.0.2h | 1 
                  cairo-1.14.6 | 1 
                   assimp-v3.2 | 1 
                 mplayer-1.3.0 | 1 
android-tools-4.2.2+git2013... | 1 
            lttng-libust-2.7.1 | 1 
                  multicat-2.1 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                  stella-4.7.2 | 1 
                 opencv-2.4.13 | 1 
               util-linux-2.28 | 1 
                    efl-1.17.2 | 1 
           python-psutil-4.3.0 | 1 
hidapi-b5b2e1779b6cd2edda30... | 1 
                  c-icap-0.4.2 | 1 
                  connman-1.33 | 1 
                   bdwgc-7.4.2 | 1 
          alljoyn-tcl-16.04.00 | 1 
              libarchive-3.2.1 | 1 
               linknx-0.0.1.32 | 1 
                  rt-tests-1.0 | 1 
                  ffmpeg-2.8.7 | 1 
               audiofile-0.3.6 | 1 
                  openjpeg-2.1 | 1 
                    owfs-3.1p1 | 1 
                libaio-0.3.110 | 1 
                  libffi-3.2.1 | 1 
               libcap-ng-0.7.7 | 1 
              lirc-tools-0.9.4 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/8f99b1534f7b09bb9a58454094eb7fcbcf233323/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/dc746f136486cfcba84f4c0696e3e8ef8f101e5c/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/63bc2a2e04fd34ccaf55a510e6935988d9589fbb/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/fba4609af6b34b5da9909487f0d009fbdac120dd/
       nios2 |           alljoyn-tcl-16.04.00 | NOK | http://autobuild.buildroot.net/results/710f9ad82ec6ab02702c6e46d9eaeed7ccca9630/
       sparc |      alljoyn-tcl-base-16.04.00 | NOK | http://autobuild.buildroot.net/results/a1e6fada73fd5e6b988d45507d3e2a5f812614ea/
        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/a06fdd7e60039e6e3732a68b9957c9bd1c60806d/
         arm |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/1fb3cda346207e5a3783d36cc7f5317e52c7178e/
        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/51d0f3e7c1d03bcc133d7df34cc8fb97adc5f46d/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/527ecf2787026b16dbccc101e02471b950cbcb40/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/49b64afccd6413fcc98f15a8d186557cfc484cc0/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/c20d4a1b1296d7c3919726f3efe924928b131860/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/94fbc1e5afe183e5b071d1e869b2d780025389e2/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/4b1f991cd4009b045df77a62e1ee105ae75b3f14/
         arc |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/5d28f783faafaafb500f63f3ba4d85205bfbcfea/
         arc |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/12786aaa9bdd1f882bcbf73f37640ea2d419ff69/
         sh4 |                   c-icap-0.4.2 | NOK | http://autobuild.buildroot.net/results/6ecbd76ef0ba6b9ab1613dcd248935cb3677f594/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/1d642a209f1568e85f9faabbe3893cb4a35195b2/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/2d0d47b8feda5bd5bc63d747a2cf7676eeb6f4b2/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/9f63328fb09cfa6d0dd892cefadbd4eef43e75d8/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/59ad66b6091699d44b81dde512dadd00b4c64c96/
      mipsel |                     efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/033b523f2e7ea733278aa27461488d383bc11a34/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/7470c5cb37fdb02afe30b3a7191dfe822051aa27/
microblazeel | hidapi-b5b2e1779b6cd2edda30... | NOK | http://autobuild.buildroot.net/results/f7e778562aa1a65ba46f3b2f705d13ace8870805/
         arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/17baa5a2ef7c4794d69eab75c7b584ee9bdef48b/
      mipsel |            host-openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/8efd64b67a560f7a6ffe1857cd0b920235f3c7e6/
         arm |             host-python-2.7.12 | NOK | http://autobuild.buildroot.net/results/917bf6b59c4834ff9120355c4b2c2c4960f358d8/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/9b34fe19e74fa8c6b2f2c9a683eb42b436746d28/
      xtensa |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/1fd17678e30a9deb8c73df9fdf90286c2f0bd798/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/4ea4646db486b430e4effcc8cb7459e0523c102b/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/c2f7a7ebf9705679f4cc7436b9aa27f66f06f041/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/e6700dba7e4730880b53b37703e6e0f5a1f66ef2/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/aafad4a502ff5320b9cc231c82c2fb1907efb2be/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/f5b6f3169eb43e0c309dfc055a12025f276f33cb/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/59f6434b4eb2b197af0c3f96b29f046ca007cbf3/
        i686 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/004fae61a24d5dac4efdafee7dab07019db197d3/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/0a2dcc7b21cc09d3bf24fab7cfb955e7b543b506/
         arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/5df80fad61a442d7f7bbb4a21b92142fdf647693/
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4bc96877d75af223911a9f062d462c58e839690e/
      mipsel |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/39dbebb3bc862c14464fc3ae80ff4ffd9508a613/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/40a91c3cdedc224f00a196cc309754577daa18ab/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/4607ba37d07d2f81347fb7595d87db9e0c4a4965/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/4606cfa8b532043f9140566567d2917cf51ed0a0/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/695c8bbf812a52562c5688e0dfa23b306e59318c/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/73647b85583bead5fbe3b0c78b50de9e7c21a5c9/
        sh4a |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/769074c4bb67336ae6679f2c1cd2a8220d2bec24/
         arm |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/6b70fa379e834ec71cc260ba6af771b531ca3511/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/dcb6c3aadf6f955016cf3c3f9b917cbec6d29342/
        i586 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/5cccbb72e5479bbbabc06101ce9fc3ee588c7ed7/
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ab136a5280385f97f69d5e25d82c9f250fc32784/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/f879b7e41b0e47aa6b32ca2ff184d1a32d9ad43e/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6b9b35732b7a90d7d3b0f652d21fe4f5e6aeb92f/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/e8107daadfc83ef97d3bc8d2c2cd534c406015cc/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/2613cdc07ee35a9bb9925ae4234dbd41e48b7f95/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/66446b115df7300e6f402b15eaa84ceb74cba980/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/f74d236144982aab7ec5261bbeba4496503f1d10/
        bfin |                      ncdu-1.11 | NOK | http://autobuild.buildroot.net/results/642f408d384a32033a677d56e6e3cdf572bd798b/
        bfin |                      ncdu-1.11 | NOK | http://autobuild.buildroot.net/results/026657e624928ed6bede5719f96c2eee797076cf/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/46ae38eba671b95c7223cf1fbf83b9aa7814b520/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/a7245b9c1e32847028bb5a49d66899e628f0fda1/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e66d1ed1cd7e97d3f20579eddde5cd6e0b49d56a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/de786d60d223cf4af3fb09129a7a814a4e1b5e2a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f30775154a5a5dd7ed05cc7ca239b792db297c7c/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ff535dce6ab4e7b95bc16548e78e3e57a36869f0/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0ba0bee48a83367fcefab827e8eaa72f0c8fe90b/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/991497b12b70f948169e5ad99eebd0fe7f6209a2/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/808a712732c182dcf885527ee0c428a623107ac9/
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/6ddb5fe729c980831dcb91cf3712ec4eb02a4bb8/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/180a439a357bbc3843dfa4d91bef40d7bd943747/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/11a92c35043d02c5e9a8b124688148d9da486427/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/536641dd8a28649018baae88edcc6ae6b05f384d/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/cf40f70649ce395fae66707bc413bf7c683923c8/
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/7e1bc952b7098a60120638859614fcfb02a95982/
    mips64el |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/604179e34bd850870d08ca68382c1329e5239364/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/09aff44db9ba6283f7187824c8ce3ff086849337/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/794d4cfd3a3a1eff2cec30c2a97a4ded9b97cabf/
         arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/a4c026e2ec75fdf82288074ab0cfe9e4e0c7003f/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/279764e60105c8a0e0ba9c12eff8934d2fa3c054/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/aa26cf7152a9a172fb21248b00d22cf7dcc52880/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/832f7cdabd9b1a7982f872d891d3e57ec059f194/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/8013486a6d309e57b16704d0c6bfe7b557b776b7/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/c1627122885380fe2806c929c33e83821d5a6722/
    mips64el |                util-linux-2.28 | NOK | http://autobuild.buildroot.net/results/8cbf33e8d26e7a75ef4f6acb838d9f13bc3212de/
        i686 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/a993b73341696631fcdb21a74851a975c7b23128/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/dad79feb77071c5763603499ee00951ff11b99f5/


-- 
http://autobuild.buildroot.net
