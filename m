From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Nov 2018 08:00:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-01
Message-ID: <20181102070019.EB5432089C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   4 |   0 |  21 |
   2018.08.x |  12 |   1 |   0 |  13 |
      master | 122 |  20 |   0 | 142 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     gpsd-3.17 | 1 
                p11-kit-0.23.2 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

     sparc64 |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/11045cc8c28a59f74cb229d75e2d463e2bf80231 | ORPH
    mips64el |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/7d9773a756bfae789a6a83ec35aa1a0ba5b0646b | ORPH
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/ef07bcb4e02fd26018ee197ee595fc61ef2e5e6c |     
      x86_64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/bc3f06c686e10cad013b5ec9911b143ca566b290 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

    xserver_xorg-server-1.20.1 | 1 


Detail of failures
------------------

        or1k |     xserver_xorg-server-1.20.1 | NOK | http://autobuild.buildroot.net/results/ba2caba0b3ed6de867b66f9b0169a40898bddbd0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 3 
              lua-curl-0.3.7-1 | 3 
                   luvi-v2.7.6 | 2 
               postgresql-11.0 | 2 
               valgrind-3.14.0 | 2 
      docker-containerd-v1.1.3 | 1 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
                libmpeg2-0.5.1 | 1 
                   mpd-0.20.21 | 1 
              webkitgtk-2.22.3 | 1 
xdriver_xf86-video-geode-2.... | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/cbeeaeede724b8e93295fd3e71bc8758a1934f82 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/d6be01884607898240b51582b95a817ea3d12c5f |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2dd5e9be49f48afd20c1aa78ffe2a83dd4447993 |     
     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/427a8c0cf16576183f84eeb0e6a0a0bd5b8e97b6 | ORPH
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c9ed764b5c1a5bf6ba562c0284745384c128548d |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/8c57983eaab51d7cb7264e93a417e4c6cf503c4e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ed140bf3931b5ecd10e900677a33a54d67853ef8 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b5a8bcf1d98469707ce4208425f0ba0f45582c23 | ORPH
      xtensa |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/7b962a63630abaed21d99f719c1bd710ec4d4b28 |     
     powerpc |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/fa6e289162124b3e079c4a2d9c3f00910c8cc063 |     
     aarch64 |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/566a9084d4762b9e14bf3bdd2f6938153f9c17db |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/33c4b4c0375f4aa5f3f0af9b62b39ddf869030d9 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/61d108a13adb79493f7fa0014e32c0f8939a7c78 |     
      x86_64 |                    mpd-0.20.21 | NOK | http://autobuild.buildroot.net/results/53c87361923cc177de7889523b3d16ba6b1d3d0f |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/c5ead9304b7d78d395c6b7f4044e83320c42d057 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/67228ce6b43f24c97dc997441f8fcccd58d3280a |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/9c062826ef3ce22db8192865049d5c5bd326556d | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/b084b8d2abf1fcb7739e2c4705db149e652597e6 | ORPH
      mipsel |               webkitgtk-2.22.3 | NOK | http://autobuild.buildroot.net/results/eeaf3edbf6f5bf468b10adc3d053f703c6ceba96 |     
        i586 | xdriver_xf86-video-geode-2.... | NOK | http://autobuild.buildroot.net/results/a9baf6ecf147f336021edda20bb091b8aa071209 |     


-- 
http://autobuild.buildroot.net
