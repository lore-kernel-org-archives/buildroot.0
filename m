From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-16
Message-ID: <20151117073018.05834102423@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-16
===============================

        success : 151
       failures : 73 
       timeouts : 2  
          TOTAL : 226

Classification of failures by reason
====================================

                  gauche-0.9.4 | 10
  toolchain-external-undefined | 7 
                  ffmpeg-2.8.1 | 5 
                   mplayer-1.2 | 3 
                  mono-4.0.2.5 | 3 
                directfb-1.7.7 | 3 
             util-linux-2.27.1 | 2 
                  qemu-2.4.0.1 | 2 
 make[1]: *** [all] Terminated | 2 
              gstreamer1-1.6.1 | 2 
                   erlang-17.5 | 2 
rpi-userland-b864a841e5a459... | 1 
                harfbuzz-1.0.6 | 1 
               libbluray-0.8.1 | 1 
          sane-backends-1.0.25 | 1 
               libnspr-4.10.10 | 1 
               linknx-0.0.1.32 | 1 
                   bdwgc-7.4.2 | 1 
                     fastd-v17 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                moarvm-2015.10 | 1 
                rt-tests-v0.89 | 1 
                  apitrace-7.0 | 1 
                    ustr-1.0.4 | 1 
                pulseaudio-7.1 | 1 
                minidlna-1.1.5 | 1 
                   glog-v0.3.4 | 1 
                    faifa-v0.1 | 1 
                libvips-7.42.2 | 1 
                busybox-1.24.1 | 1 
             host-nodejs-4.1.2 | 1 
              gst1-libav-1.6.1 | 1 
                grantlee-0.5.1 | 1 
canfestival-7740ac6fdedc23e... | 1 
         lua-periphery-1.0.6-1 | 1 
freerdp-17834af7bb378f85a3b... | 1 
       openpgm-release-5-2-122 | 1 
                 mesa3d-11.0.4 | 1 
                    neard-0.14 | 1 
               libupnpp-0.12.1 | 1 
                   jimtcl-0.75 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
            mesa3d-demos-8.2.0 | 1 
           host-openssl-1.0.2d | 1 
flann-04b4a56533faf8c8228d0... | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/8ca562c9fb0abf5c49aff4536c300ae3d95c5ccd/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/e90977a23ccef030df6d4a76f92a0566b44177cd/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/62763a8fb8eaeab6ea0dcb68858d4250875ed0a1/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2acfec908a5a1a1ef883a56d197b27cfab1314cf/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/fd0b5dce6f4ec977bc7c1497f1fb914ae14d6f29/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/553f127d7e086fe9d7ddf87099b42faff05d1a31/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/1d0d1909b93fee40cb580e666719f2fc09d372a2/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/39dd95adedf16359b278dc455aa0005865662ecd/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/17dcd4b444b503a19ab89546b3f9046114474567/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/de179f9b8e9a253387514a3c732ae9ce110c1218/
         arm |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/ad226962413dece4fee07143a2bcfe07c44d55b6/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ef55a815176b5097028909f9c0d60788067092c5/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/540fd4848a69390fcb22e07ea4601665343b7743/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/57e47163c4cd9b9ba20ef2765e37b08c52661212/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8ab012ce043a4141c4a3ddbb9b14b0bc267b4815/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/c4ee200378b2764b39267471adcbd0c99445ffef/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/283a5b3139c4c213c20f6d5a27975076119c49e8/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/a2fe18f2b2fdccd423f1b815657c8b264c4bacb3/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/da5b9605552d4914c5e6f0d890367b92536419c1/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/6657f9867b2562ae16b7023fa1da8a520dd8b9ea/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/f0377d2558d2e03d3c9117533a109bd7e92478f6/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e542ca8890c6cc03f20c5ce81f0e0460e7feb7f5/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/d316ea5da95cb480da60dcdd280f454963e5515b/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/784e201628d2156ce0e13df4ce9e20b580d85ccf/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/174086e2afc68fbc416cd95c1013b7b696ef8050/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/98e51d6fa110c95e291e3c011897399e1cac4e84/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/d64b5f003c92ead59368788502da9e0a01de0a79/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/482b50b6db6e8c4f45bfb3f859ac85b467e111cb/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/4eadc348c3581b316e0fd5241a2c9238d85c9923/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/d22f36042c238bf1721dea1759478125f2349db1/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/3cdc81beb37ebc858671c74122d422808f1c2580/
       nios2 |               gstreamer1-1.6.1 | NOK | http://autobuild.buildroot.net/results/2a350ac8be87a25d7f87f240943c816932f80a14/
       nios2 |               gstreamer1-1.6.1 | NOK | http://autobuild.buildroot.net/results/cc6a6cab4f8c405941a71c6665a7dc2e34c39cb9/
       sparc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/370fde953786dcf7a1747b8dc8a909f023660661/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/4b738221e8f1dd3cd123380b23e8ab9208e6ee94/
         arm |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/53dc83cf2576ac5c042eaf358c95233d5217d504/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/98f391ad13f22828c022f185c0166daabdb4c1ad/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/94f15a1d822bc8d3979c89758c920f81f9e782b1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/fd8e2fe29dad424b79e3561f932e3be89ccb519c/
         arm |                libnspr-4.10.10 | NOK | http://autobuild.buildroot.net/results/2bff42f57edb36b9d8ed35c11be211fa430d53b0/
         arm |                libupnpp-0.12.1 | NOK | http://autobuild.buildroot.net/results/05b1dbe9c1be7178c9d5a90daf4ae4acea726ed1/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/846e29ae6e8e63a83122f265b6a4ec0ed93b38ef/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/cc3263c9bbe49311686a3b34f12a9eb6604fab60/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/c770456af06dfb9c7fa7fa8c703e1f7fd81121ff/
     sparc64 |          lua-periphery-1.0.6-1 | NOK | http://autobuild.buildroot.net/results/1f00cff6bd5d1a2322be1d801b01b1602471a422/
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/9cb886f38f97bd5eb1fa468c1105c298e4707e01/
         arm |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e38cd7847510eab723f2c2df60cc93df62060137/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/df751d1b98e5bfbda2264c633d3c75ae72e319f6/
    mips64el |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/595de66c3b903bb0b0e2b16dc3aef4b7e1ad8b4d/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/28e012ae5bf4ff10d074af139561a2353942178e/
       sparc |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/ee6c8a1cd468b97330e301b4d5c681c0b95a5e89/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/00b5c3f5fe7876070ca0c6565b90648a2bf369a9/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/481616287bb43a36a15127205907a50190048ef2/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a87bbb5329b2e077b42174b751d50cf195ee0358/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/038b4817312371a0ab8270c1c42bc4e1392f3b10/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/329c0b8ef1d01e266856b9c3a481c3ddc7577f6d/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/29a90dc319735f368a238fb5ca2689cc44202085/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/0927db26ecba99d0b3a1ff07459b5682a806f0f5/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/2225e630e00bfde8ecfb7d6e39b0c6358061cd48/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/7df49de933fa4e3cdffaf6e0c42b8734cfc95994/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/327eb67e56dc3d94f1b84b22f357cc787aa93096/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/b750178c997a4c1745cdbe5465d63fd99ece7e05/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/db84eb53f20f74fd603663ad9ed8554145c71146/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/e4075305434d251a8eb338b22fe83a2518541f92/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/00092c341ed7001a05bb3dc9c1eff5859c2fdd7c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/1fa3ef572454c6a322221cd84a41d7b9dcd25955/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/79f6628a360442924f356305219d6409d820eee0/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d6fe4bf07f0c549e6340672606ced099f3ef7963/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/48bf48f38d9169bece1d0b21e546a3cefef0fc78/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ed332462c2d06b13e3a88cf9fa8109f5a4f06e0f/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/946750e072d70a0a3a41f56790a62540f6f19f2c/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b2610b4b4fbd2cca2982551d46bd359796b00221/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/b7d67701fd74c728aaf57d21f888d7e24de6af73/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/be70e84f8b35ebe1b3e7b6d2bf5fa321cf2c6132/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/baec67c9dd56a8c59e889be2797f2fb7b8b61ee1/


-- 
http://autobuild.buildroot.net
