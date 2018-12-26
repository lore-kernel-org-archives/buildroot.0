From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 08:00:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-25
Message-ID: <20181226070016.77CDB20A60@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   0 |   0 |  10 |
   2018.11.x |  14 |   0 |   0 |  14 |
      master | 110 |  49 |   0 | 159 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 26
                  linuxptp-2.0 | 6 
                    php-7.2.13 | 5 
                   netsurf-3.8 | 4 
                  libssh-0.8.5 | 2 
             stress-ng-0.09.47 | 2 
                 dmalloc-5.5.2 | 1 
                  ffmpeg-3.4.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
          libcdaudio-0.99.12p2 | 1 


Detail of failures
------------------

    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/784bc57d732781826b65c459a7ff7f6e5c40fe7f | ORPH
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f99520debe238a10ebb4f825c59ab98d0b386334 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f6557bd9d7207a02b43fbbab31372d7d3c023bfb |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/20d0ae5f1281716c12d533eb716b5256196ef70a |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/76a159549b79070c8aed353392c2ee51368de9cc |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d440cf0719c55557cc0dc197f8a062b1dba928b8 |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/71246acd98b276758c74aa694b9765d092f61bec |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/82b16fa7890e8985f640061f722ae786a4164f84 |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6d9b19e31cf442c82fbb6821d754e9a7dfa3b34c |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5cddb016b25faaa5720eece6f37f57b494a18403 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/519bdbdf7b83499b160da5c71ce2c3ff4cc70e9f |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ed501b468b46428c54c15c9c0fc82bdb8061570d |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d29b84da880c4741ff85545bc670c8d90790129d |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/8c3e2f6f4afc6981c87da7a3a08b33bf7296f325 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d44e044bc9024b06bdb431fc3b607b68af9dac5d |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/21f58feda64a0329d5b88f34cf9d1b98537ff3d6 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/46067e490fbb6d0318e66bf1499ccf03d4e59174 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/88985dfb23b8e3aca1c06c08bcdbeea16330a288 |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/31239424a305678cf3b232afa8164cad06a9f99f |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/c844d57b0c5a329a5fd5ef1c6c5fc16eef868e97 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/1c0feee9eb0bf68ddfcfbc1e4804226adfb6f5e2 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/aa97b792ba00d006bfbccce3a26ac4d654ab33a0 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/983c29dda7a46859251e0668a057c9e98f99ac1b |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/db6de3eb866f171bef96f4407079bdbe5600589a |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bc5a99bf3008ffc48da6ea8c0c21052f71fc9374 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/bfcfd49b84604243a6fcdf01f9022aa59b5439c6 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/941f176bb57cfa027383a3052dab61edc0243da1 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/a94910a01657cacb69c8bcf60e67a951b66db126 |     
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/2af4919ce076798cf05dd4dd372b56d6d27bafb3 | ORPH
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/5d417c45f11cf2d28b22affd36637fce60977a02 | ORPH
     aarch64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/2adf3ec8e94fcf97a6d600cc63e8744269a20631 |     
      mipsel |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/465a8af89372333cd76d6e0a4931c1dae6778389 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7363c99be24aef9932d9172d2c78fede0a418deb |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/6fe3f190d2d2a26f9f409b688fb9c8b122ad3dfb |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/92c1fa5934c41cefee5c2a366a192d7db4507d31 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3616b4b5d0c061a18ac78f4d7cf8baaba96778d8 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/92f35221c66b2b9d1a67a2019a8ba5437df80cec |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/081de386d75ab6c7d86ad2297ef0a649a86226e4 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8bc2c20ede400a215dde39120244196abcdbe291 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2c2967cc41d98e10b6d697ece5ed776d08ca966a |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/480e3849b8e8c57340dec216006d1bd3b0ad130c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4bc924de51aee4f7ac7b0c5ff80538b26576eaa6 |     
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/51543da1cca8a9ff66be9eeed7412e9f47966ed5 | ORPH
         arc |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/bc1c1439d37ec0a0c28032813010f44969030682 | ORPH
         arm |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/aade2bee055682c860031323671e5b1056438006 | ORPH
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/9e1e4ff2259f8eed3ff3d5e624776c8d5f2aa026 | ORPH
    mips64el |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/078e301a8d9816fc14efe6c27df6002139759140 | ORPH
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/eb1b9e6848db9fc5c97998e8e60a55857afab600 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/c7e08e9856ace89fe0d497d3fcbbace5965a6c05 |     


-- 
http://autobuild.buildroot.net
