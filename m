From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Nov 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-09
Message-ID: <20151110073019.6203C1027CE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-09
===============================

        success : 92 
       failures : 48 
       timeouts : 0  
          TOTAL : 140

Classification of failures by reason
====================================

                  gauche-0.9.4 | 7 
                   mplayer-1.2 | 5 
  toolchain-external-undefined | 5 
                  ffmpeg-2.8.1 | 4 
       kompexsqlite-v1.10.12-1 | 3 
        python-protobuf-v2.6.1 | 3 
                    libuecc-v6 | 2 
            libserial-0.6.0rc2 | 2 
             util-linux-2.27.1 | 2 
             host-nodejs-4.1.2 | 2 
                oprofile-1.0.0 | 2 
                    sdl-1.2.15 | 1 
                  ltris-1.0.19 | 1 
                pulseaudio-7.1 | 1 
                 setools-3.3.8 | 1 
                minidlna-1.1.5 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                      pv-1.5.7 | 1 
                 mesa3d-11.0.4 | 1 
                   glog-v0.3.4 | 1 
        gst1-plugins-bad-1.6.1 | 1 
                   slang-2.3.0 | 1 

Detail of failures
===================

        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d7f212c790b9c82c3dc0f4036c96c7973b2eed87/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/485806535ff56c2fadae7f037bdcf6ce2670cbaf/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ed5a584956bee4cccbb8f8cf0163f18de591d2e4/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/439e4c313e599109b36c08bcf0f41f80bba0415b/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/70450cfd3efaa855eb3ba80686e5c18b76eb42b2/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/dc86360068e89b91417cc02287556d29f66bba3e/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/121e698e6252ea5131cea3db924ee4377e4c939f/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/761648d4912f86c408a3f1d4cc0940fb36a04bd4/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/cbc08e2676a8b48fcb11e3cc0206c0d83b8641c6/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/cfcd9b04f9ca53bf72e365b3f0aeedb71a955db6/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/376f427ee02140e7400ea89dbe2684d63a64bff3/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/04a494284d608771c027afb8abfeeea6e8742e04/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/f51d37ea535d6bcc45160a7824d7b91fa9b1f314/
        sh4a |         gst1-plugins-bad-1.6.1 | NOK | http://autobuild.buildroot.net/results/efe8757e3c7af46a8bcf72e9c8dd899d9e354b42/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/8620025790abf145e5c878db61b6f02d0302af55/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/7962671f038d791b29be370ab3e2fb76db28b5d5/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/07cf09bf5c7a2fa252b989e59e0bb19e7ddb39ac/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/ecced22ecaf4c46074360e741f77532e0e7d4ee4/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/335d02b370ffd46fc77bca75b4cfbdc843eff774/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/7d0180477bf8c742e740139d3957e63026c47ad4/
     sparc64 |             libserial-0.6.0rc2 | NOK | http://autobuild.buildroot.net/results/f74b7066d103c0792de9467ee462477d277ff8fc/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/af86aba4e96b5d2c1e51faadcbb29a86292df14c/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/6828817f91852b239d407815f0b0f838baced143/
     aarch64 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/e7306093e0ae1a1dcb69f015b10d56e4c95e689e/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/545460012c9d7031f043ad06640d83c928779faf/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/d42c0ac81932af8a72d9b9daecc13d3b473b40c1/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b883b8b58308e4102cda893c1713df74936bb797/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7f408b044e0f868264d50bbf91f30e3fa7291247/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1e74e7aece5782f5ca7ba5804c3e16f3a6a6f3a2/
        mips |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/bcd3d7dacec3b398170b9668dc23d2f0c08580d0/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a8837e1bb0838e50956ab1bef4b6fdde00b080d9/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/f83efd340f08395d7cd5e6cdc0259b89d1d278df/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/1ce4e397d0e2bd352e1fa205ba06e9c0a0de68f5/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/f33e11c7fe911f805bd19536cc1a6d5b8c157668/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/203b663b2016a6a37150d0f90271b9b073af6267/
     sparc64 |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/3ab21d5155813483d01a3a7da6656e3239f0eb33/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/e44694f30e39266491a1040e284e504d6d37ef9e/
    mips64el |         python-protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/c7ac5344f5a9248750ca5dae05abf6a029f22519/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/1e8535845ff37b95222809e37315a748e8086176/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/351ab5a78e8648f801903ff5f951513c6b1d56da/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/244154d654307786cdf3a888da15dc82fd84766f/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/929354a37a5a8dc0fa37f6d2a474b208f3dcd429/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9cdf10ec5b31144b2e03ea09cf128702339895b3/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/611fe5dd6385fe14cd48b25be8295007def9da4a/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8889aa7d9fb48370e4760a6edbc6d3ae945f02f2/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8e9e8b72eeb8841d69f33bf9f23fe778ff90efc9/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/70087fced79d1e43e7613b8c4b6dfe6c7f13d31c/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/54cc641a84893ebdea0e3b498110a6678ac0cc76/


-- 
http://autobuild.buildroot.net
