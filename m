From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 May 2021 05:44:27 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-25
Message-ID: <20210526054433.3E829605F9@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 21  |  5  |  0  | 26  |
    master   | 118 | 43  |  2  | 163 |
     next    |  8  | 21  |  0  | 29  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 8 
                    ffmpeg-4.4 | 3 
                  lvm2-2.03.12 | 3 
pifmrds-0bf57f9ce0d954365a3... | 3 
                       unknown | 3 
                  zeromq-4.3.4 | 3 
  gobject-introspection-1.64.1 | 2 
                 pixman-0.40.0 | 2 
                 dc3dd-7.2.641 | 1 
                directfb-1.7.7 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   gvfs-1.44.1 | 1 
           host-libcutl-1.10.0 | 1 
             host-lvm2-2.03.12 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                 mesa3d-21.0.3 | 1 
             netsniff-ng-0.6.8 | 1 
               pipewire-0.3.26 | 1 
                 python-uvloop | 1 
                          qpdf | 1 
                qt5base-5.15.2 | 1 
            qt5location-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
           spidermonkey-60.5.2 | 1 
                      tar-1.34 | 1 
                    unscd-0.54 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7535c7a7a46c47940ef58a77ddb6ebba2e677a04 | ORPH
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/c0f4168575fa85af933539441eea95a3b10dac91 | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5df01afee0785e7389055fb555dc14379930e9fd |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4f16fabc932fe8b58994bf3a057f3d61881a2a49 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6b9e5ed293d6f7715295d49a38bcf3633d1e98ad |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/7a14bdf9097e78e58d61b007fd97886443b901c3 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8dc9b3b8a0639fe3b40520793e1bbf87231ef8be | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/67bdff6bab529dc691c75a116df3f13c22c5fe6c | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/4e7b70edf983e8c884f58a9776f6e8fe2e52bd2c | ORPH
    arm      |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/c4bd5fb6afab304b718cfb3397a05e975bca732c | ORPH
  powerpc    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/efe5803c45954ed631572123ca4a4e60f0d2e0b2 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/302a3a275f5319e84258e5d3b2495061565340bd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68d3a58f1cbaefb06d59e2b76318f6b2f32f7f5e |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1310b1d859240fdc15902b1894081a1345cc5063 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3201d649efe6483880ab762d7e5f58f8ead271d9 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/180bc2776c9d3947e416110a09df9a9159ea9b0e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/814c18280e64c590940892c4ef36f28a0aff3aa0 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82d907b35197748e8ef0f69358fedaa9f3c03199 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2db2260bfe61612a351b4aca6754126c16321a21 |     
   sparc     | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a |     
   mipsel    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/651e7726a19ba14efb8f73f36f75d198de7884fc | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/550cce6359a4bbfb443a6291d3eef19fb0d71018 | ORPH
   nios2     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/2daa1cbb88fd2494f59d61e54c98e548a09db7ec | ORPH
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/dabc1bc290e80772f993edd06cda56d73b4e31a5 |     
  riscv64    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/d2a0a8aff9572daa1f6b978990f41208cfa1fcfa |     
    arm      | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/9289bb444b33be4ee2476b95dfe067d154d5960f |     
    arm      | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/b2a6e6fd77bf9071ce9f75fed1811be9ffe5366d |     
    arm      | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/aff5df34d24f5030c9ea1fd3747ed3bcaa1357b6 |     
    m68k     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/7d19a07e01ea45ed2b145519a4e4ef4709783615 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e62e485049b4a2f29f2669fe03fb4083b0c75bbb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6f1f279770cecd9d47bb36d5a3d9a2ac1974dfd1 |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/9a25ade25c4882d63ac31f6b83bddcf3517ea5f4 |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/f515182b4f90d656684f751115e21e5521150460 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b15b1b2bf3feeb9478ec1481c6624cd06e36d2e9 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/dc398c8b9e33d6c80cbb62dbb101ff40a0a01186 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/7fc5329f6c2f50fac0a647b6744dc8c151932244 |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/22101440c7a500ea8a3225b3188848ee79961a86 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/8ad80da881bf2d12b5262b18469256a8dd2ee4e1 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b2a91275595a4a4ea8b5c44d30a69674f489cc33 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/ca8d53051f108714e32a324bfa0e7f64d75f8a23 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/165bf15b197f2ecb51c970e7b52cf453778bf1ac |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/eb77b18f268d8e59c407f757662117a33d3f9ee3 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/70901eae075c097bdd3c6434283c7c79f5e86cf4 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3ecf02b714bc55818804ffb8c0d33d6cc4dae2b3 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/df9f9f3206fd07eaf274c4953983791668edb8b2 |     


Classification of failures by reason for next
---------------------------------------------

                libsoup-2.72.0 | 3 
                   rhash-1.4.1 | 3 
           heirloom-mailx-12.5 | 2 
             transmission-3.00 | 2 
                 freerdp-2.3.1 | 1 
           host-libselinux-3.2 | 1 
                libkrb5-1.18.3 | 1 
                libselinux-3.2 | 1 
               libtheora-1.1.1 | 1 
                     mtd-2.1.2 | 1 
          perl-net-ssleay-1.85 | 1 
                 rpcbind-1.3.2 | 1 
                   wget-1.21.1 | 1 
            wpa_supplicant-2.9 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/9a97f8bfa0ba178876502d64015599ba0d88010e |     
   xtensa    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/abc899ac65fb09a3b5b95a9619af2026fce17b72 |     
  riscv64    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/3cf6425f0a475e59554571fd0afb9dcf4b6de79f |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/0a104e6b46f0e99e09b9adc1e1be1aba8fcb78b5 |     
  powerpc    |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/387d15708740ea1d6b1121312918180c5506b895 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/acf0b7503d9bae4b770193eccb349e3983d9d550 |     
   xtensa    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/8834fda215e23c5c86f13b3c38751f477c252d33 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/160cd3db78485c0360b5943caa107737d5f99105 |     
   x86_64    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/7d3910a1021a5d1d6872f3b67c5848c1009e0604 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/287ca3361df1caa8925155b47c35f5a884ea0c92 | ORPH
    i586     |           mtd-2.1.2            | NOK | http://autobuild.buildroot.net/results/85ae43e7067d3e09f5c636770aac0f0a25f4051f |     
  aarch64    |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/a4aca5fc23b08781b872cf522ea3dcf9b414f694 |     
  powerpc    |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e1eb30a14ee94bb318eaf76b296c23e5e03b97eb | ORPH
    i586     |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/a4f13be447e6b80a5b2d3338c1ecdc42c3b92c95 | ORPH
 powerpc64   |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/e5c720aec9e7a2962f292b3c0ca9050cf959d1fa | ORPH
  powerpc    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/b6f072ed25ad23e9d8939e419a90434fbce878f9 |     
  aarch64    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/c28e3090792e5a2ec3bcf0896076289bf2b7216c |     
    arm      |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/cc81aa20a3f7560d0d10f738f5d2da7d13b2f596 |     
   s390x     |          wget-1.21.1           | NOK | http://autobuild.buildroot.net/results/12b1f6f701b46a1dd2de5e32c86beecf590b6530 | ORPH
   mipsel    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/00d46eb765f23a1f6e168338f2cc863ae348045d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6d6a534f38075c39fd15353c4a8dda59fecbdc9b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
             util-linux-2.36.1 | 1 
                    vlc-3.0.14 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/19241b7c6319573f6a7017870e750c229fae5696 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c879168e35b1e208beb72f8f675a63457bf7b3cb |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/01da46e449615af0ce95a2b7cdf3fe95306f83f0 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/dd7634e5537507c529460548b99a857aeffcbf22 | ORPH
   xtensa    |           vlc-3.0.14           | NOK | http://autobuild.buildroot.net/results/6a546f49816720c8661b7ddd2d603938cb954f36 |     



-- 
http://autobuild.buildroot.net
