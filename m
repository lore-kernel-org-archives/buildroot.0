From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Dec 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-27
Message-ID: <20161228073017.8EDEE2076D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-27
================================

      successes : 161
       failures : 71 
       timeouts : 0  
          TOTAL : 232

Classification of failures by reason
====================================

                collectd-5.7.0 | 23
               sdl2_ttf-2.0.14 | 13
               libglib2-2.50.2 | 8 
                busybox-1.26.0 | 4 
                    sdl2-2.0.5 | 4 
                 gnutls-3.4.17 | 3 
             expect-2014-05-02 | 1 
                    gdb-7.11.1 | 1 
                    git-2.11.0 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                libmad-0.15.1b | 1 
                 libnss-3.27.1 | 1 
                 mplayer-1.3.0 | 1 
                 openocd-0.9.0 | 1 
           oracle-mysql-5.1.73 | 1 
python-libconfig-b271c3d9da... | 1 
                  squid-3.5.23 | 1 
               tcpreplay-4.1.2 | 1 
               trousers-0.3.13 | 1 
               upmpdcli-1.2.10 | 1 
               util-linux-2.29 | 1 


Detail of failures
===================

    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/ecf97b0a66efde01290f3b320cd946a57e667736
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/11c385418160d148d6993f3a30f254f7d9ef9c72
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/1bfdc807755b042db1ae117a51a74fbedce70d58
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/b4c2a529876cc1836fa2a2c24524aac47d186ae7
         arc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4ee19c3acf36d6bbb3922ed6b59467fef09e2732
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a8d68e7037da3d980a9b131e81c8ee0acf409b0e
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/66588820f0672c83069ec7742c005af6afcacc64
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/43071c9af53d805e4298ad01efb2ac1b33547efe
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d3cd91555238ff100c6b7df2b4e41da9b83d5772
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/861aa3910e12aed891be53d56849a0373f5976c9
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/689aa1f7d49fcf941b345c97d5e8c7504f286246
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2b07fbd3ee5917e9dcd585e692c6ba3dee069c51
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0dce93e66e43c4cdf999d30cd0b1b1ba06d5f42e
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/73bac18392ca55b15be9d5feceac341352bce748
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4db789203dbb4bcb04999c9f0554587285e85b35
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2628937a839834691cbcac982925f9d72f6f11cd
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c4b720c705c842734ca2c456897ee70f966b164d
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e4795cbdf815ee73f8a7b5683fba977500b5d5be
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fe5b5ed6355a794e84894c4aaf62eda6529ed184
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/28c1739a2db040d4aae8a71b9bc1a89574de8f6d
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a85e067a30d581047b5d5928355185d7b2add6de
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/60c01646694f05d6c29aa24198c81ff0279a6e9c
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/dec8f9420bc7972acd730898fb2174278d3a75b9
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9669d4f4b4f0417ddb7c366f3dc9c948089738a0
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/065e632e926877cebb675575f706117269a839b7
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a63f82a330f21f01273f806947fd44ce26b9b72f
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d4440777af371b77654f363d5d8bdbd23f6e3ecd
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c37cdd2a41c1131758005b7df74e3b8dfec5bf8d
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/4abdce2ea98c57c6cd1929fa79b16283ed791725
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/f8a1a5878f0b1a2aa4a5fc478bc9da12326253d8
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/482c54bb71a003da9a73bf66328a32b993009779
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/84e5715809bf4d70ba79533e7c5c3f31f7466874
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/f842987a35b6086282e5c6ead6be264a7937a47e
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/a357ae5e96a8eca8b80f568870e08917c844ca05
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/585939f74b1aab85402011740325ee007bae78b3
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/2e51bb5d0a3e26d1f3264d7bc6d09a0978ded9da
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9b4145e298dd84cc403a2f3d87bde5745adf4d76
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/adbcc2dd90c772d5f3de898930c224c9546a79a5
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/31f1e647d85348f83e876d067c50114cc19cd3d9
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c39199a01445cf55bedda07433320346ff3b1a7e
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d9d8e03bf42b0463e4fc2b638a35d185bed6a55a
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/644c24e68ccf55729eb7817a1d5c392e27fce886
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c1d8e2fec733925c95bb250223f9b86927a5e282
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/322b548c9bd3dc693f2c45d1bff9b9df37c8b1b3
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/bb1b8f93869f000cd07c5a18c7d52f8937272128
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bcebe38e681207e4c4bcecc432b7832de33ecb10
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/5f7e6ee68fd1d668229c9f8c4facd89739a3ef2a
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/5d04163de80f7900d4aed14cff75b2e0761f101d
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/859075cb25c8ec1f27404f38de9af72580d5515e
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/50b731c0baf7c8c7f903f320b8981f42ead8dd5b
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/3400d50b3b8975ae64954482c1641ebc09c9b980
        i686 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/ceb5878d02bfbd084e345dc13fd76f3085b3430a
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/3fc7b0792c5f842a2ff242ff3605bd4b8b5d0af2
        sh4a |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/93e3ee8d99d964311f70ea6b0e03ef355b83d5e7
        sh4a |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5c601b4a5a192aa22552d6de5d1668c4c2263d81
     aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f47e2ffd7cc45e851bf85da840d9bd15b99a8e0e
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4895da3a187e599847f6cd95b1eeb95e400d0349
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/eaa7acecf7e07d89d3963a065484a54e770cdd9a
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4b350b4bb9dadca2594320d2da504ece74a87a08
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e85019b2c84b999080ce65fff68e152d1547907b
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/8bd08dbfae5a2b0223345f9ffd7c1f0375edef9d
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/29f70bab67730b3748335ee80661e10ceda941ae
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f14fb54e65a0bc1df1a1e6a9c7b9bcf7d6107c3c
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/331c1ed3c49818bc881a4fe6a437d8facdbed0a2
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1ebb5d6628a71430bcd0ff177c810172efc804cf
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4e7bb6e4ff2aa36495d18e23c14a64fd2783d865
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/a835d7b63d98fe1c7eb224cccde3a145b647c825
        i586 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/02ff031fd952a54f3c77b68e64666215ae193188
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/85a82b50bee13fcdd7ed8cc84feb1f34c7c8e39c
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/40e263420954e8dd34dcfaf7813c3e554e70c5d2
         arm |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/34a5303be4bb2518aa8c3a942158539cdac4b6ab

-- 
http://autobuild.buildroot.net
