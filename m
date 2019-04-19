From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 19 Apr 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-18
Message-ID: <20190419060119.DA983228BD@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   1 |   0 |  14 |
      master |  84 |  67 |   1 | 152 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

   libtorrent-rasterbar-1.1.11 | 16
                   i2pd-2.22.0 | 13
             gnuradio-3.7.13.3 | 9 
                   botan-2.8.0 | 3 
            host-thrift-0.12.0 | 3 
                 lrzsz-0.12.20 | 3 
                    ncmpc-0.33 | 3 
                  davfs2-1.5.4 | 2 
              ghostscript-9.27 | 2 
                    git-2.16.5 | 2 
                  brotli-1.0.7 | 1 
                cracklib-2.9.7 | 1 
             freerdp-2.0.0-rc4 | 1 
                      gzip-1.9 | 1 
        libcpprestsdk-v2.10.10 | 1 
                libkrb5-1.16.2 | 1 
                  libnspr-4.20 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
               pulseview-0.4.1 | 1 
              spandsp-20180108 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

     powerpc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/30393c07e5bcaedaaed89c6774aeaf3d4e759f10 |     
      x86_64 |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/82bfec2a7a4ed41c56330b2cf8ee60bff9b2040b |     
    mips64el |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/33eee27cdc148d4706e76c39ddbb4ce41afdd54d |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/8ebca9af798f6813b296e1f272712210810a1287 |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/dda029effe2ce1dbcd1b9bf4648b899b5b4978fd |     
      x86_64 |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/5e3c406ceefc3f8fda54528302868c610b850387 |     
       sparc |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/deddd347ec45a88be9255d2f3af1aca1192f4bc4 |     
         arm |              freerdp-2.0.0-rc4 | NOK | http://autobuild.buildroot.net/results/69245e574787bada718c52c805ec137041dc233d |     
         arc |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/c7112212b522674f6097e0446d2d7378a67cd51b |     
         sh4 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/eb33b41d1b267d0207a6e3a9f5ca7f79b2f51887 |     
        or1k |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/aa4aa7ede12094b9aff9bbc8a0364a0e8639b5a6 |     
         arm |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/bf80805da7b1cf6ec9f44970039e7ce1f3b77f4a |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/458d22e4a7a2d4b4eb4db388e6e1b7e750c4993c |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3f90c9fba219bee7e1f852f52cb3380eab7fb93c |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/403a6ff58745cd62f8629d00daeb394dd1063d6e |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4109881eab99fd720e97f1070c374e67dd881b85 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0af39a7d0f3fe19390bc8855769c458e1053b2da |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/25136bdf865be3154fd0d1460fddfb5ace382b0a |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/83eed70ec579953b1e80975c4c62cee6fbe9ed41 |     
     riscv64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6880c9484bd59b7dc70a3f2e6240d0986d2ba082 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/78ef9c83c43207c1286b94f577d97191a44d4964 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/cdc23fdbd9935bcd9598f26a0a02e3f463ef3a0b | ORPH
         arm |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/62ecb0c84580deeac0bfc6bd206fdceead1dcd16 | ORPH
  aarch64_be |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/4ada26bab5c1e6504c7d8c92672326ced1d336df | ORPH
     sparc64 |             host-thrift-0.12.0 | NOK | http://autobuild.buildroot.net/results/7ffbc0de63018b034e39bb5f1d7b1a46107742e6 | ORPH
       nios2 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/621699759596dcd5d6e961aba5bc813ebead109c |     
         arm |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/d5ad3f70077a71985204d11996a88e9ff3393b60 |     
     powerpc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/da575258eb24991893f004e5855f2cda6928032a |     
microblazeel |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/ef4d1107edece43fcb34826a5d3d7cc3bcbf8264 |     
      x86_64 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/cf58251df22ff7b383f24c419057d69ffe80a983 |     
 powerpc64le |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/9cadf2e83abe52b9bdaf73a2cd573801593bb190 |     
     aarch64 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/4a4dea4eca1d10dd68a1012d335a603a4d20f744 |     
     powerpc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/2c7897fca74f05b1045bc7131dcc3c0790e4ac26 |     
     riscv32 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/b35466da7308e60024cec743728aef045dc24405 |     
         sh4 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/8ee49747164f8ab925408f50fd21e490796783be |     
     riscv32 |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/6a24784badc1a3e8937298bfc100e083e022a230 |     
         arc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/609dfbed073d997c8e365639ef2aa1be8f90c906 |     
         arm |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/196c06bd820154960b237fc7c5080d5f754eb0d4 |     
     powerpc |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/65abc39e159828a26bbeed3d90af3b05c7b753b6 |     
        m68k |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/daf80b07501e3e381a7b2fb86916bb8be8a8d376 |     
       nds32 |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/9380435440c977eeaf98a1ffa80f411f07f62482 | ORPH
   powerpc64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/99fe91547c6518c69d28c8f2e1e6998cd68f7cad |     
        i586 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/84f0023ac50e3b3f166d5832b98b34653da48390 |     
      x86_64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c89004ea9deb149b408c33a516705cf10475aa8c |     
        i586 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/4b38016cddbddc53855f77e13d04ac42b935a042 |     
      mipsel |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e924cbd6c3bbe7ca82ceb096c27819493851f328 |     
     aarch64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/5d38722f7d7b030d9608210a7499693ec9fd7407 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/223f9a85ba242a2b1aa588ddbc8d1e92ace34444 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/62bc38044f5934b9fc6d9497774c41f3e71b9d01 |     
     aarch64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8c2378951c1909b1a2ef9fcd9537ebe4fa795a8c |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6e28339727b611e67ea620f233929c1b3241e9ef |     
    mips64el |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/578a8a152e17647241f6ba9e02613aca8fd64f21 |     
        mips |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9db4e9f1223f37ad7531cfd258baa9c4bc2de232 |     
      mipsel |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/dc21322e101cbd242a22018f4d506b9f2c26dd33 |     
        m68k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/55395ec41a4b88ae02217320f86bcca284868f54 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d31d16edd7c97b242dc4636f563b4ca109e27449 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f60bfe347b17f49e0ccb5e86fd0f765a78ee4ad5 |     
         sh4 |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/39b24ddd576eece899b41dd27c3e39ff20f008fd | ORPH
         arc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/27e477006b00e266de0a93221855fdc86f229f0f | ORPH
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/77e3ea00ca2c20d9fe284d31bbdf2b72956eae9f | ORPH
     riscv64 |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/eb2a8fc46ca24352ca5e513ed1d05344d884c85b |     
     powerpc |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/648fdbec941ac443a24e5f3bdf0b9f661c045d94 |     
         arm |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/4b8de2b26a77d4011466dede49293052fe2e15a0 |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/95e1e44c9de88718ca5a5e7cdb7f883a24798ee4 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d1c95725055d165ef8484dc75e82cd58a17f32b7 |     
 powerpc64le |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/0619070fabbe3316fa4f758d4b1daeeb44c9704c |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/18c21738452fda78cc00defd3ead5f292effaf96 |     
         arc |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c7cf8b199262b5aebb84e4b2519b0e54ae2a318a |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/c1da0b8c6f21982462101c76f0b9305820e4a4f2 |     


-- 
http://autobuild.buildroot.net
