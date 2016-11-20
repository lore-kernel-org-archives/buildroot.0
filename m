From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 08:30:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-19
Message-ID: <20161120073006.9254420BD9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-19
================================

      successes : 127
       failures : 32 
       timeouts : 3  
          TOTAL : 162

Classification of failures by reason
====================================

kvm-unit-tests-5731572b2ac2... | 3 
                bind-9.11.0-P1 | 2 
                  guile-2.0.13 | 2 
                 jack2-v1.9.10 | 2 
                    mpfr-3.1.5 | 2 
                 mplayer-1.3.0 | 2 
                    qemu-2.7.0 | 2 
                benejson-0.9.7 | 1 
                     exim-4.87 | 1 
            gst-ffmpeg-0.10.13 | 1 
                      icu-57.1 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
              libarchive-3.2.1 | 1 
libasplib-f7219142e790a329b... | 1 
                libcurl-7.51.0 | 1 
                  libffi-3.2.1 | 1 
 make[3]: *** [all] Terminated | 1 
                 mesa3d-13.0.0 | 1 
                    mpv-0.20.0 | 1 
net-tools-3f170bff115303e92... | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 openssh-7.3p1 | 1 
               polarssl-1.2.19 | 1 
               tcpreplay-4.1.1 | 1 
                     vlc-2.2.4 | 1 
                  xl2tp-v1.3.6 | 1 
            xlib_libXaw-1.0.13 | 1 


Detail of failures
===================

         arc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/f8e20b0f036f41f51ab7c5b9281e3747b4d75a38
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/bda47e2d317b1d800779721463cc9e88278f5a5a
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/6afa5e9da55e3197ab52ec9b93117e85151ef9f7
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/fc4335a00c62ec9a1e7a3eecad5ba4f4c965d1aa
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e2ff9e1d1d96bf14328a558f13f7375deca17bc1
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/58209c053c5d4b8f959ccf3645b03d7c959c737c
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/7389ca07916c343b8e381ecd40e68520a78d65a9
        bfin |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/1f1765ce620007ed79297113c395ded16c1e48ea
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/7fec5a7a644eb9c03cdb49c30da9649200378455
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f2a001031af381388cff71b4de1103fc11e08239
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/be3131fe5edc6b1462e49ec33ea0e6f74d4c3cd6
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/dc91fec4ae4eac5544365d8a0fec06663f3416d3
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/53d109fd9055fd20387bb857aced5f89cf3086fd
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/070ce21befbf3f0cd015ba0017b0a113ce985768
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/4fb4353bce614b64b30b05d06831e0d0f38a48dd
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/a21de4747f40a5ce93108c8979fbc0277d040e79
      x86_64 |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/05236d725710a9564489432c71021eecf150e0de
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a40682602d5bbeab38d2563f9dfdb04394a5fb01
    mips64el |  make[3]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/351c79912c93c17be8c68fc3c217c134c728c4b9
     powerpc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/3e7c4cfb20bf33e262f290f63845147c14ecb97d
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/1a506eee41dd9e3a14244f4add90d89d7b818352
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/18f3f90556ce1b04c03ea0ed9a2d99b5b7fcd201
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8fd38a53735b01a851306c14c90aa14bc48f0fbf
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/58cf28a3acd518633a1d8ea719bc70aefbdfb311
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8c20f719f784af1312294600e39004c1d382368a
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/9e019c9878f91fcee985250d77e23da17aa8306e
 powerpc64le | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/423b5e79cd4342d6c160ed478054b294b0826c6a
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/27d7bf46343b96004d07b36953ad83c935bdf9c1
    mips64el |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/0ad82cc30cebe0ce9ea08b354c1dd939c356cbd9
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/6998c88094794ae2b709e7bd424b11925c13050a
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/a82dae5abc2713f5320ea3a80b6a95d4c8507359
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/9b53443bbb0ee88f7bddb72b3c4423f928c810d1
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8c5d39e90fedac98cf9a9d5ac35c683efc3892b9
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/50018be18ca547b5e1a5c2d90aaf44d8dcdea2f2
        i686 |             xlib_libXaw-1.0.13 | TIM | http://autobuild.buildroot.net/results/d0fd894ae333e013bde56fb0892ed53090cc34f8

-- 
http://autobuild.buildroot.net
