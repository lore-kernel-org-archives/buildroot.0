From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-16
Message-ID: <20141017063014.93147100E7E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-16
===============================

        success : 200
       failures : 54 
       timeouts : 1  
          TOTAL : 255

Classification of failures by reason
====================================

                libgtk3-3.12.2 | 10
                pulseaudio-5.0 | 4 
  getent-buildroot-2014.11-git | 4 
               alsa-lib-1.0.28 | 3 
               uclibc-0.9.33.2 | 3 
                    qemu-2.1.2 | 2 
                   nginx-1.6.2 | 2 
                 libplist-1.11 | 2 
                  zeromq-4.0.4 | 2 
                 libssh2-1.4.3 | 2 
freerdp-440916eae2e07463912... | 2 
                 pixman-0.32.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
             e2fsprogs-1.42.12 | 1 
    xserver_xorg-server-1.16.0 | 1 
                 webkit-1.11.5 | 1 
                 gnuplot-4.6.6 | 1 
                libnspr-4.10.7 | 1 
                 omniorb-4.1.6 | 1 
               nfs-utils-1.2.6 | 1 
                 libraw-0.13.4 | 1 
                   czmq-v2.2.0 | 1 
                  thrift-0.9.1 | 1 
                elfutils-0.155 | 1 
                  prboom-2.5.0 | 1 
                 civetweb-v1.3 | 1 
libshairplay-64d59e3087f829... | 1 
                   ushare-1.1a | 1 
                  libv4l-1.6.0 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/4b4417834bdc21b9717a3d91582fa3af06699e55/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/8519b1328d483edd4f0c096b8dd1a9537c62c32e/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/65a1f98c23739d51441daef6bda1c88eb45b90a5/
      mipsel |                  civetweb-v1.3 | NOK | http://autobuild.buildroot.net/results/4afd96a0f028fbcd452d28062715ec1a1bc4da99/
      x86_64 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/6f7e4b1bf3ba4fc4a4b1375271fd74fd0471ef09/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/4e0a75a938b9516a25badce833f4c89f79312a33/
         sh4 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/84a4fc4c9ab16c35f246b2a8465b47af88cb393d/
      mipsel | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/9e980bd8f77ec46411f95c838e54739f4baff73b/
      x86_64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/a66369da3d26c0e08240d755144e9495fef289d8/
    mips64el |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/17031aea8133d6c5b3b8dd8892a7135fc05290eb/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/4331767d2b2d4451a5bee418f22563cb18f2ab6e/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/8cfcb4831738479e74f92fcada756fb516fbc6a4/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/5537171ef8b2c49d36ef7f0d307a1572d244eddd/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/63a3d4e614f276a8cc9fe5fd50d5482a2f8b16e4/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/51cbd855d44268864b73624aacadf799b1492a6e/
     powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/8d30687f92178de15d7697a7b8a1b7e2d6e93deb/
     powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/03c2673b80e00944a41fc43d51895e4d751b4be5/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/5e43d57832910c8a12be9fa0e026b38b2ab22304/
     powerpc |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/75f93cea8ab59f052ddefa51c0bfc14c3df47a60/
        i686 |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/db6cd8922444490056bf5157fc0c9349e9bf383b/
      mipsel |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/e0c2623e2d400ce66963eae23f136c0158556b36/
        mips |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/9259fc11d5c7c0c60ac2fdc0c3a49d0f5cc54fcc/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/5bf66b8d16a3ddded24827bf278ad24b55ded6e7/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/4bdcd642eaa880dbbfbed8f4ed5ffac0c52edaa8/
         sh4 |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/a6fa99088bb21abc97f38ff963f13ad7f8499095/
      mipsel |                 libnspr-4.10.7 | NOK | http://autobuild.buildroot.net/results/b487e4ba897687b307c069905da069104c05d546/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/50f83570f061874a2cf602972be42fae6efee90d/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/b763a2ab5d999de76f204eda93a70ec179c29e55/
    mips64el |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/8f41c5bea210415a0cfbc2d46b707fcb30c54714/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/1443f756581c00c7f28936c90771c9187c907b83/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/10cc6078e8805cf448b59c28c6bfa46e63dd1a63/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/247c68f6a711f350239506c14631223df178d3ed/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/4bab74dfc638b1610b1e74342dab851770ecc027/
      x86_64 |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/7f7531d74bd66ff834db085e0299a9b356064d47/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/520e3eaaa5a6848b66d7ce10401fbafc8099e3f4/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/af642b69df95be8e8e8ca900f5b89f4c3864dad8/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/6928a3a2938f19e10eb95132bcaf35b799b53f99/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/343768b0c9a0e4bf9b57a7e5abb60ea6f5e01d1f/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/5f5ad00cec033e22a5d2daa709571298f6d31d1b/
      xtensa |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/116c4ae7ef976aa94655f43b11ea015ab50eb47c/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/4ad91b4a303ddb8699ea596cdfe1d3ffe1f97eb2/
    mips64el |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f0091c503be889ee6b87a6ef1692ea11b769cb6f/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5f966257708d1b3bd4b733de62c9bde9bd3c76a4/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/183c10931cac3054966a16f25f7e55124cd0b9f6/
        mips | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/23b9505c0c03838f2db18ec8174d4a5673460c4e/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/1fb19d4d784ddfe8ebda26753391a8d0055f5b7a/
     powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/efb0922240049b1ccfc4f1a01a1a8e8780ac72f8/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/3bd0ffc3c15cd2281b1711b13d25e7bf7e627b36/
     powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/19d2971b1c61167305b5821f25e8df24a7339142/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/8e1f13ee4743501bd65c906ea129f07952a31cf7/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/e25311e86e5d5c249bf68e6145ed63d2b61543d1/
        bfin |     xserver_xorg-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/0df2551482deb71e358e3fa0b06398084b8fafcb/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/cca53c74b336a1d92c0c22d249d1748892e9c7df/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/8452eb4c5c7eb9f512b68d43c07cc17e27f47767/


-- 
http://autobuild.buildroot.net
