From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Nov 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-08
Message-ID: <20151109073020.0C56B102462@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-08
===============================

        success : 85 
       failures : 50 
       timeouts : 2  
          TOTAL : 137

Classification of failures by reason
====================================

  toolchain-external-undefined | 5 
                  gauche-0.9.4 | 5 
                  qemu-2.4.0.1 | 3 
                   mplayer-1.2 | 3 
       kompexsqlite-v1.10.12-1 | 2 
                directfb-1.7.7 | 2 
                    ruby-2.2.3 | 2 
        python-protobuf-v2.6.1 | 2 
                    libuecc-v6 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
flann-04b4a56533faf8c8228d0... | 2 
                   argus-3.0.8 | 1 
             ipsec-tools-0.8.2 | 1 
           libfreeimage-3.17.0 | 1 
                  boost-1.58.0 | 1 
                  ffmpeg-2.8.1 | 1 
                    vpnc-0.5.3 | 1 
sconeserver-3b886c3dda6eda3... | 1 
           libpciaccess-0.13.4 | 1 
 make[1]: *** [all] Terminated | 1 
              lbreakout2-2.6.4 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
             fxload-2008_10_13 | 1 
          powerpc-utils-1.2.24 | 1 
                   glog-v0.3.4 | 1 
              gst1-libav-1.6.1 | 1 
src/BulletSoftBody/CMakeFil... | 1 
                 dropwatch-1.4 | 1 
                    yad-0.31.2 | 1 
       poco-poco-1.6.1-release | 1 
                  guile-2.0.11 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                espeak-1.48.04 | 1 

Detail of failures
===================

       sparc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/897febe4323b89a48835f01434fa69e7b5a417d3/
     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/656dae4342f89ccc8a406daca2613e18b619774b/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/548bf7b800a946e97135c0ba66363f388e517d6f/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ff04247cf7d651d235d607bde8f3b8675c940fb1/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f49e64ab1a04dfb6fe56d31bcd39401f449e241e/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/d37aba70b8d69bdd93d96eed739c8d594a696d33/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2541399d8518ab0e2139886fa3d27a30ca3f9c47/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/da5c7e7f47ada3ad10053339de3f84f7d80bd2c4/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/051dfbcc0893edfd9dfb91d172ab31ab51bf254b/
         arm | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/a237193a4c4d58d56d0ac1acba8d4a33b00e021f/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/6c7515ab1aa9303603da15e85c9118c53aaf246d/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/741202885e95b6bd457a99ad16b46b6561ca664c/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/0f1f9649aec2520f3bc52a1cb5143e63323751ce/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/854ff8de5cf15e2515e3b5d2f55eb7cea2abe1c1/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/f36ce33f54618c0f647b30d9022cfa47ab5080ba/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ceb3cb96edb03e0d3404a5e23d19e8f0482f8b04/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a334cf952727ec98f40a21222af8b728a508bfe0/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/57af31faf6acb26b6268c634164cbaeecb0c7a1a/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cd3377585e4fa5c7457c50e827d96adeceaac04b/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/cafd4c28c2ddef115bf968060f0cfcfb19143295/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/fd881e9d7ab21162cfdb971f581239032146ce12/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/3c17d6ffc7645d0ff0bdccaa5222915307aad092/
         arm |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/fdd807a72cbdd6bbf5f504ad6196408ba4464442/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6907e5ecd585313e0a51780ff678c4caf530e77b/
         arm |            libpciaccess-0.13.4 | NOK | http://autobuild.buildroot.net/results/e869e08779626ac578017e6b34a82adf156d12f8/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/7f0ac5ce3e94fa27969c6690830976284ffa91da/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/b31dd5b135a18d3af3f87a2a23ffea2a060464b8/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/e38cacedf5444cf3a4e14b5104d4b4d0188bd01c/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/54fbf106243b901d5b4ada9e4ba794331e6b1b72/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/cb2794213e843e21c26c8f41052789f594dc30d0/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8324339c85629e8a40c1a2ce76cc7d28662d4222/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d0caf60c1ddf4e05086c93f646e32b5ddc75b6ce/
      x86_64 |        poco-poco-1.6.1-release | NOK | http://autobuild.buildroot.net/results/7c02072a885a874e8b640905ef21929e6e143aae/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/0153520dfc45b1b3833115a059b8f17f026ac7a9/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/ac16f066c33eef775615ed60cbd2d1d160534593/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/6a75050752f310b4b8c4eb8841663dd48d2b4324/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/efbb4e940543894b8745bb405478a096c90a5ae2/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/32d6d984febad2dee1f0d31c5fa0aea823297096/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/aa6e71c957fb6f07e7bded35a8e47be4dadd042c/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/536de0e31821bfdb1ef9cd6cdf7dee1ae26d4334/
        i686 |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/00154b0142f51c197d5d53ae36f7adc4f8250d9d/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/bcb551d3e50da5d681a4937d166d9ff9a10639f9/
microblazeel | src/BulletSoftBody/CMakeFil... | TIM | http://autobuild.buildroot.net/results/a0e39a98c48c56479a268ca93462907fc6b52e6c/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d53a25f95656ef42361da5d234082a8f06e9f401/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3733f89ed9297dfc6ece4da8b791d2d172d283bd/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/4786f0dd0ebc705df10a1653f68140865dc270b7/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/93220095d311111f382a5f91a1eb1e40ac4fb5a8/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a51569699ed33d98476ce25aaf05b7827c415b22/
     powerpc |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/c5c1a42126e91348eb132c3e16e4396af8884986/
         arm |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/cad981e919ffd1c92b6a1108b47ea440b7c0beac/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/5874bed12d05e80df309d62849a4732d72907d78/


-- 
http://autobuild.buildroot.net
