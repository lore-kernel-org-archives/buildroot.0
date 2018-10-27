From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Oct 2018 08:00:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-26
Message-ID: <20181027060023.5E5D720A06@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   3 |   0 |  24 |
   2018.08.x |  24 |   5 |   0 |  29 |
      master | 239 |  46 |   0 | 285 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
         libcpprestsdk-v2.10.1 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/5629ee8b2709e5654ba64ace7539624c1e9f4946 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/095ee556035f37b05bb279f5ab82fd36d6a11915 |     
         sh4 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/5ccbda3a3e43ef99696c316866ac834c85f038d0 | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                p11-kit-0.23.2 | 2 
                  giflib-5.1.4 | 1 
                 lcdproc-0.5.9 | 1 
               openswan-2.6.50 | 1 


Detail of failures
------------------

      x86_64 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/cbd84ad5df0b0cf9f70719f77a800336964e6f41 |     
      xtensa |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/efaf2833d674c7e366c59f367f0b83c7f88546bb |     
     powerpc |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/d62a05605f914f43f191fa6699904c800ae90cd6 | ORPH
      xtensa |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/44879d55528136a30a911a767e051628d376b937 | ORPH
 powerpc64le |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/047c8763b73662c3d2037285e422201aeed8c397 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 12
                  libffi-3.2.1 | 7 
                     gpsd-3.18 | 5 
                p11-kit-0.23.2 | 5 
                 dc3dd-7.2.641 | 2 
                libkcapi-1.1.3 | 2 
                beecrypt-4.2.1 | 1 
                flannel-v0.5.5 | 1 
          host-libsemanage-2.8 | 1 
          libmicrohttpd-0.9.59 | 1 
                   luvi-v2.7.6 | 1 
                  mender-1.4.0 | 1 
            mesa3d-demos-8.4.0 | 1 
                 minizip-2.5.3 | 1 
               openswan-2.6.50 | 1 
               postgresql-11.0 | 1 
             qt5wayland-5.11.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b6cbd0b233adfdac5984d3cb58fdd621fc1a520a | ORPH
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/00d2bf5a4c97bea2ace0427c0bed57e11f9a5f9a | ORPH
     aarch64 |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/552b8e44fe6585f978e2fb7a920057a868cf6689 | ORPH
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8d9d9a2a8301c67671e8188e31be55069ebae0df |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/1f30806c767a059ae9bda1d6074b1e83b827813f |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/03541f738e90ffbca5850844b50d892fabc561c3 |     
      x86_64 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/732839a01918c8d6a7813ea34f08f61cc4a79d93 |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/576420c6a642e8af9315ce5ffa4daabd6a542f6f |     
         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/b4d470a08039b532f6271f339740829efc43513c |     
         sh4 |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/85b46713054896807cee67e727e10dd18bd8322d |     
    mips64el |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/87c7fa4a8e393acaccc84bd2774f9eee32ef7d90 |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/408cf60a130cd141063cb8000e2db134d70e05cb |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/e5410e77eb36197da6cf03ac1c443b454ca8a6eb |     
microblazeel |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/d0657647f53fe0c41f2b822b9e75b4fdbd9c11d2 |     
         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/d3255a93703a3392daa8fd2406793f3860b8f524 |     
      xtensa |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/eb935e64da3b4d8a96c000ec2367b89dd8351a74 |     
         arc |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/4836c40c0233c580bc062fda59ead89233e146f1 | ORPH
         arm |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/211fa7e56e9c19ce870c470d96a35977a9cd9223 | ORPH
         arc |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/1523c726a2a13f252559cae4bc9cc4bf748a7c6e | ORPH
         arm |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/8d680f81b80885345d65e7a758900b3e3beeeaa3 | ORPH
         arm |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/cc30eaca391229b6343be8c6af30df7999d154e9 | ORPH
         arm |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/01e864d612b1dd1c59a70fa25494b9d36d2924e4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0b7c170f6cbf24436a3609725cadfc7d239b0a89 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/16ad68dbb5103b872304de28460f693f33609db3 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fc640382ca654f1f84e2a24e001acfe12685b3c4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/0398b3fbfae73d21cd39d0bfcc86b5f5b9e30e0c |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5fa7ed6716bd6ae9a59af96c4e641f76d6cf8594 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/62a21716e970202cf0156c05a759066f6fb348b4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d6d68b6c73f459e90abd3056cb016cb9e965e1ce |     
         arm |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/3f417dc7cac50ccf29bdba64d67b240094156575 |     
         sh4 |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/585cffd074a67b333ed14187648047f4ba2d96b7 |     
     riscv64 |           libmicrohttpd-0.9.59 | NOK | http://autobuild.buildroot.net/results/85db5162f897a1f30c30ed6dd489fbe934c2c15a |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/de533af78b6db6315a7e6b3198c82a53e536ccc4 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/0835a0c1e6b41e4db37de76d151c2a356086ca6b |     
         arm |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/40e086750d78c3d806bd907179d822f6c7251f42 |     
        m68k |                  minizip-2.5.3 | NOK | http://autobuild.buildroot.net/results/20ce859555918a9bd2fdd7d4376e209b87e3e209 |     
    mips64el |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/1953450fb9a3db7b81da2ae8431facd0bf169fc6 | ORPH
         sh4 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/2387fae8f4845d4c299e5683111c2dc4ae35876c | ORPH
         arm |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/f14721b03fb1a0534f0ef6c3ecc1814a5d74a2e0 | ORPH
    mips64el |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/ef71f3d67afba547b5167253fb02476e59152803 | ORPH
        i686 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/0fb454ca0df74a8585cffe8f5d1f5d23cdfdbec6 | ORPH
        mips |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/295614d4aa3db9bb35bebbe56e38110f5a2de178 | ORPH
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/c1c6473c64d24c037d1e388cc34b13d9aa7df0e4 |     
    mips64el |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/77a27caa9315b10d630e089ff1a948576ecffcb4 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/02d98e1f644f79570334e1bdaedb4e8770ccecd1 |     
      x86_64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/4b5ddfd380b934b1447ea0b9c79838a6ec02504b | ORPH


-- 
http://autobuild.buildroot.net
