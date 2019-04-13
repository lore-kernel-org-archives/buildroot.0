From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 06:00:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-12
Message-ID: <20190413060033.C8C2C87DF9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  26 |   0 |   1 |  27 |
      master | 175 |  30 |   2 | 207 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-go-1.12.1 | 4 
               host-llvm-8.0.0 | 4 
                   netsnmp-5.8 | 3 
                   netsurf-3.8 | 3 
              ghostscript-9.27 | 2 
                   lldpd-1.0.3 | 2 
                       netsurf | 2 
               wireshark-2.6.7 | 2 
libcamera-d5ca33f6c7b0cd1ca... | 1 
                  linuxptp-2.0 | 1 
                    llvm-8.0.0 | 1 
             openjdk-jdk-12+33 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
              spandsp-20180108 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
              webkitgtk-2.22.7 | 1 


Detail of failures
------------------

        i586 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/5cae4fd20b7b9ee7ca52ef3bf3bacc93ef4995d1 |     
     aarch64 |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/c6a3c03b182973e3287ffbd3604fa7c1a92d6ee7 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/d8f7d68435272a0bc1a9b4a1234e993a9564366d |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/f900fc1c38f2731b7cbb046d1280900c59288228 |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/fa09ef61f05e8f39a0933655e7c4e382767a176c |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/efbc9cd039bfe9ca3fc94dfd953b5cd25cf1ea98 |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/2714a8d1b7ebc53bfb88ec81890a1c73ea3462f4 |     
      x86_64 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/a600bede745b1328fa6fd9cff38efa596ef62768 |     
        i686 |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/e1970971399f05084574ab52074edc4e161505bb |     
         arm |                host-llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/25061292e7fcbc051d595bed7ec459f724c100e5 |     
      xtensa | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/8888d8f981d1cbfa5de967e10bbce7e69a68e6d6 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/bac39ec73131ca87865c08ca350303bb2f281150 |     
      mipsel |                    lldpd-1.0.3 | NOK | http://autobuild.buildroot.net/results/c6740bcaa4b9ba6b94338aa50e7d543cd021a115 |     
microblazeel |                    lldpd-1.0.3 | NOK | http://autobuild.buildroot.net/results/e46055b86bcb03614f3fba076af2278e46a39714 |     
         arm |                     llvm-8.0.0 | NOK | http://autobuild.buildroot.net/results/ac0ffdd4f64daa62f19da525fd725836b3f19844 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b66a702e50977a989e033a0cbad30147574fe202 | ORPH
    mips64el |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/60514814b48c09e5cba01eec7ce465838635a602 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/f5d75d1c633de7dac9ef5540885464ba187d7d10 | ORPH
     riscv32 |                        netsurf | TIM | http://autobuild.buildroot.net/results/6bf2e2d43738afc12b48de766e1fdc6b3aeb1929 |     
 powerpc64le |                        netsurf | TIM | http://autobuild.buildroot.net/results/d3fdf14e8b7c7c646b4625c1b49103764f370c16 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cfa1f3f3aa8ff0a46f540a2134549815878c8c99 |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/be486e47426c614c02887d500f852bcc9012c75f |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4a00af52b980807035057b8edb3ba57ba8d6ff47 |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/a45cfa9b3602fd05f6adbf070a1bad6510975c36 |     
         arm |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5ce2eaaf17e3238178275d730af0ae1dacdc0987 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/03354e78a8cab5aa9ae4f82cfec86f612448dd23 |     
      x86_64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/6eb097d426f07b4c17c6995f5236987a111361b1 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/4d560d49c0056e00add138ed9b2fa86c2b3d9f60 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/92a43f5dfe4a6df7ab5de7defe078fac58c99d75 |     
    mips64el |               webkitgtk-2.22.7 | NOK | http://autobuild.buildroot.net/results/b0b55eebb53ee1b0470b55571df21dc3211015d1 |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/2899fd92f80468295cef485e3f22aee6274855b4 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/91525b44315ba35bb72fafb32cbe01a406e924dc | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                          opus | 1 


Detail of failures
------------------

microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/5024ba4e6acc7b47554ecb3cfa0baf9be32d9e16 |     


-- 
http://autobuild.buildroot.net
