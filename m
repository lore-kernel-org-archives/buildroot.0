From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Nov 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-13
Message-ID: <20151114073018.A5C47102552@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-13
===============================

        success : 142
       failures : 73 
       timeouts : 2  
          TOTAL : 217

Classification of failures by reason
====================================

                  gauche-0.9.4 | 11
                   mplayer-1.2 | 6 
                  qemu-2.4.0.1 | 5 
                  ffmpeg-2.8.1 | 5 
  toolchain-external-undefined | 3 
                    libuecc-v6 | 3 
              strongswan-5.3.3 | 3 
                    ustr-1.0.4 | 2 
           libfreeimage-3.17.0 | 2 
                  mono-4.0.2.5 | 2 
               libcap-ng-0.7.4 | 2 
             host-nodejs-4.1.2 | 2 
canfestival-7740ac6fdedc23e... | 2 
                  connman-1.30 | 2 
                pinentry-0.9.4 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
              gst1-libav-1.6.1 | 1 
                openntpd-5.7p4 | 1 
                 libpng-1.6.19 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 mesa3d-11.0.4 | 1 
                      qt-4.8.7 | 1 
                 python3-3.4.3 | 1 
                rt-tests-v0.89 | 1 
       kompexsqlite-v1.10.12-1 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                   jimtcl-0.75 | 1 
               iptraf-ng-1.1.4 | 1 
                     fastd-v17 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
            shairport-sync-2.6 | 1 
Enter file name: make[1]: *... | 1 
        gst1-plugins-bad-1.6.1 | 1 
             ebtables-2.0.10-4 | 1 
rpi-userland-b864a841e5a459... | 1 
                   mpd-0.19.11 | 1 
                harfbuzz-1.0.6 | 1 
make[2]: *** [src/BulletSof... | 1 
                pulseaudio-7.1 | 1 

Detail of failures
===================

         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/23ab1b9e0f3e8a61f902b4bd56abd1e9927efd8b/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/08d617363e313c1c037dec3493f00366fd2c9873/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/c8fce1001c06b0c6c716a71414bd5c2d0edaf6aa/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/9d1b0b841743a9785b7b81d36072c7727fd258fb/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/ed32252f8df9da5eb5f74f576b2be1fdbf9f3502/
    mips64el | Enter file name: make[1]: *... | TIM | http://autobuild.buildroot.net/results/a0352c0c1cc3bad98bbdcca772d9684aa133ede5/
      x86_64 | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/b63602e5735546ad470e00e9bde6e8731efec6fc/
        bfin |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/87bf97966cb802fc307ec9710725a3947ec33c39/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/90e4715ffd09d2d0ff9f08d0c481a5d869b67d61/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/ab10f271021eb39da4fb86c6ce2465b7df038675/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/780f8dfcc6bb51d1021cd7db5300a6a8525037f0/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/51d16c0ac55980e19620a359e82f74fa3b822f14/
       nios2 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/8ab7be5f5d4da25b0c4f794b07b35d0376f3e10b/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e26b72aa438d8c5bb1571ab31cfee747341102aa/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/3681948013fcd39cc80b690b880924421e429c80/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/8c6ce526735a36b8c8b4c6047e3c69039c4527cb/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/1df4057501067a0444d9dae7bf9271115ab8dad1/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/0dcab75d5fe1c1eebcf80ea2f36aced3878683f6/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/5812820e28339c3bb20e4a8f0207abbe09738631/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/e37a3ee25bd621659f509b4905423632f3c0d221/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/daeff23cf435405e303d4631e605dbbd9ad1decc/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/eae9f756937c4f42339927b95b31ece27e3bcf30/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/a979f6a58f0fbb1896830461d6c384f4a65c9429/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/96e7387c891f3e3795a994f61e3da4e38335613a/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/63fb3705a4736a443ed7cae160f23ed44d9e4443/
        sh4a |         gst1-plugins-bad-1.6.1 | NOK | http://autobuild.buildroot.net/results/182bf15d7db3199097e7b6edc9600888e653480a/
         arc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/d75853859aa23bbe8db9daf16a2e80106403a4cf/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/fe647be472e28da9b94de487a11ed27faa312968/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/74375095afcfc6f47c4c08ebdfc79ad6b9d2de49/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/d4939c1e01b9d0e7d8d87346ff23f030500e6b6c/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/0f7bd0b7ab00d39ff766d2790f83516114548986/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/d8c24cc49dbf762af4c74ebd517000492db315be/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c378c4eaca4fabff32ff81e971a5e2ecb96cb9c2/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/94d5669db30490a6c3e7838bc239e943fd10ef2a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c2c79efe78237b2506a9948f742bf574c26d2123/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/78a2f665da688df2b139e22c3ac03e64fe95914d/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e6620a1fa19076e208284747ad2515c8c8a07879/
         arc |                  libpng-1.6.19 | NOK | http://autobuild.buildroot.net/results/4cd0bb4426c4b89db7fc3c93f414d03481b9fcac/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/66a0269aa9286b21b8c45597f6e0a6ed736f14af/
      mipsel |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/d01ed050212c39a33de26927b6376a8f166c2580/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/bc24daf4d635a65dc71858e049523081f33e76e2/
microblazeel | make[2]: *** [src/BulletSof... | TIM | http://autobuild.buildroot.net/results/637bae8b2be6c4c64f4f7c661cc8d4606b553538/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/29920160fdcadf19e6d0d023164512ded82b001b/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/5cef55bf91a60c55d4b3d4a56e1671a1f6b17a88/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/3763f3fd0cb8e5be3a516b3b5f512022e96fbc92/
         arm |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/f10c6ea2d29bbcef8f33fc9ba1430e99edca895d/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cc3f5dc300677bdfcef3b1f4adf8c4c59c8d525d/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fb6ffe1ee8fbb7bfae4c76467bcc72232d692be6/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/69b7a8f066dfc77b4aafb5de262c75b637d8b06c/
         arc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/038c1da63b21d24a6b45da57d1c2a0ab6dbea4ff/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6b534e47fc9d92260d638ccc708a012c48c03b1f/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1117e1b6c3ea9b29ed343f1615cf3e6adcdbb616/
      mipsel |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/212403416ece33682f2479344ab8e361e9df404b/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7f0a81a252421cee09c74afb064aed25b583d739/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/bf437d80e5bfc51d2174c82e577cbf4fd0618ed5/
     powerpc |                  python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/da1a4cac055ab4b1a301cf719233ff00d1e793a2/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/6d6702d7599072d418b95d74345ef4bb49d75f2f/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/e04f828a224b01ccb3627a54cae820d081b3b522/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/1cab59f2984a21c8626f72a922b8426b2c1353cf/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/f6dfa2d8b4c27e051eccbdea00042d69302ac604/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/509ca110082e398b968a7f8373cfe3ac0619a85d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ee435e84af6f6523c8413004bea09c4d47accd92/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/e443f63b8d812409b93379fdce33cf17ade9230e/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/5497bac9b55d0793e415eee79e306fa79cbc8fcd/
         arm | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/248f1e49028dd7a06ad1776a6521ed834121d4ee/
     powerpc |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/188a55d9e49714cc4bec7cfc5efe84e600ba8684/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/597134e2f9ab7ffedb43964e88b64dc782bda332/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/faded6e617be444c58673226e85e0df6bb980047/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/63d3f7351885bb3d2035de5a9b9a5fa7070a38eb/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e27aa29252cdf8898284869481bf44a400326fea/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/977f66ee9848c1d7b6370e36da8e5aa69799f21d/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6932c73bab964b7f310c40a01b977b3d5bde7b13/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a23925450abcc691ef5eda483f7956830a46dfc7/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/5c05f8a56630576458380dc06eadd5841946ff24/
         arm | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/982bd00de9da8cedd47209ece4fac92bbcccb04b/


-- 
http://autobuild.buildroot.net
