From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Dec 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-01
Message-ID: <20151202073014.CE23B1015E9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-01
===============================

        success : 279
       failures : 62 
       timeouts : 1  
          TOTAL : 342

Classification of failures by reason
====================================

                  ffmpeg-2.8.1 | 5 
               arptables-0.0.4 | 4 
            libsemanage-2.1.10 | 3 
canfestival-7740ac6fdedc23e... | 3 
               libcap-ng-0.7.4 | 3 
                busybox-1.24.1 | 2 
       openpgm-release-5-2-122 | 2 
          sane-backends-1.0.25 | 2 
freerdp-17834af7bb378f85a3b... | 2 
                directfb-1.7.7 | 2 
                    faifa-v0.1 | 2 
                   bdwgc-7.4.2 | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                      qt-4.8.7 | 2 
                socat-2.0.0-b8 | 1 
                 libdrm-2.4.65 | 1 
                    vpnc-0.5.3 | 1 
            shairport-sync-2.6 | 1 
                rtorrent-0.9.6 | 1 
                     vlc-2.2.1 | 1 
                   glog-v0.3.4 | 1 
      gst-plugins-ugly-0.10.19 | 1 
                  ltris-1.0.19 | 1 
                 lvm2-2.02.132 | 1 
 make[1]: *** [all] Terminated | 1 
              gst1-libav-1.6.1 | 1 
                 igmpproxy-0.1 | 1 
                 fio-fio-2.1.4 | 1 
              squeezelite-v1.8 | 1 
           bcache-tools-v1.0.7 | 1 
                   mplayer-1.2 | 1 
             core-dependencies | 1 
                   erlang-17.5 | 1 
               ipmitool-1.8.14 | 1 
flann-04b4a56533faf8c8228d0... | 1 
               libbluray-0.8.1 | 1 
                 setools-3.3.8 | 1 
             irda-utils-0.9.18 | 1 
               iptraf-ng-1.1.4 | 1 
                  mono-4.0.2.5 | 1 
             ipsec-tools-0.8.2 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/7181004339875482261f5b387d66fa211399ab2d/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0c5ed908c8955004eea2aebbd791f542bcfca8c3/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0c618c254156180f5ed46fa75c6b51621ef97ee5/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/5c2459f68e31af290f1d69eaf0a4ee546cce5160/
      mipsel |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/410954d33206475d70b8e5ba55a2c955a229af9b/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/83cc815205d335645c99c2f43f630db5697d814e/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/75b1daba418dd884780179724ed7af4cbdca0e07/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/fc375ccd5c37c1917d38a9c7fa262c9f52e296a1/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/02d5e40a9734547541a99b32653d7b2339285157/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/27fa9e80429c5e0f486316c53a7ca2effdfec4a0/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/83084872cb4583e516aa4c6b670ece00581e5922/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/135bcbbbc27a4cbf045a3f397a88ac5f5f65bdfb/
      mipsel |              core-dependencies | NOK | http://autobuild.buildroot.net/results/3abf6250fbfd1659e487e13bb66f9bdd15291ab3/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7e86d39d6b29041ae948c1fa2ff26204b9be5132/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7516526807edf5872efe0ec2d3ab76951cea5e28/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/13aba03018691dd07fa281fd6aa55c776e065443/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/32890e73e2bf7818d722feb31612ef7d5351549f/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/21ff55879532c8ee8ae1801a56ed494bfad39bf9/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2782818457493df8ff495ddcf7aee603a3e736c3/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/abff6ae0a9a591f4d565de24065a8924450d85e8/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bb485a83b72e7e6a6344943a633069bbc2b7f308/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2738a8838037611c853645da98c04df02db749aa/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/476b8eae7ead4bfe41fc1a996f8c74f0f4b6a757/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/ced074cc96838e07b65ef514f59d13dbbcc73fe8/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/cd9c8c37b426c458b66ea6df868a1deaf66c5e04/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/03b7e5a38cb7693753474a277dad79b754b9c03d/
      x86_64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/ac46e387516087f95c3ddd06b68aa91f92317c07/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a3918ffdab3d69a59711923e26cf47e0c54f2280/
     powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/f9e50652467468cd6d871d645aa68d10372be380/
    mips64el |               gst1-libav-1.6.1 | NOK | http://autobuild.buildroot.net/results/4a06472e1196cabd7226cefff2a45a5eb77d02ad/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/5db387cab1b66842177a48835ddd729fe3809a78/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/2292f8dcbe9e87b1f260928bb7a8c266e475aff7/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/1a5ed0ef9936f977db3d5d31cd0d73d0432e5c94/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/6db263409f2d7f0be6418b88ffb56d5b202ab004/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/94d372d0c687378ba30f15a7a006343068c5e85e/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/751541469375743db2fc509d59b2f16c5029bd40/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4467db1228f07e42a4e15ac2dab9f53387f920cd/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/89eae94f8e77c76911c5a625aaa09f4219072d0c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d0f9cccfff85136a45ec3cee8aec0b48f7fc7871/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/636650911d938c9b0b51afaeb489bced46aa193c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7b5c16520519a8bca3abc6d084b644d207d7ff29/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/bd97e9371b58e8afe5042c2249137b229d34ae5a/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/b6325c0ee3bd96b155c82956b2b3ebea023f55c4/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/a7584748ba250dc00a08959052774edb2741747f/
      mipsel |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/b14fbd6280c7ccf0034110ca02a6628d589178f2/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/f564fbd674f6baba79e8a65c0e6292ce3ecc19da/
         arm |                  lvm2-2.02.132 | NOK | http://autobuild.buildroot.net/results/81de884b75583561ebbe31b79cf72820bd6e05dc/
      x86_64 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/4c04b272c89c0036fab6f924efc6ca438cbc882f/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/4a828dc17beea739f0c805b067129001e697e3d3/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8298584c7c2634e9d7b35646a9fa9decccc72a4b/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/e0d0e51877a5428a84cc1dd98d36c983a4b378a5/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/f60ad2451c146be9cad235fcb0ad12f1cc99cabb/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d92e66cc10e6e664a9024ac97c9bb771539e93aa/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aeff5d80b6753df8a8b01198c9a17e59c54b234f/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/38fb4361a079b150122454a572adfd75d7edd1e0/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/f5cd96c084cfc016417c807dbac4b1c9c5d8a0a0/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/5f35b053eb57fe1e955e4533e2414ada7a4a559b/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a1120e65cfb31199bfe7df49966dbf29c3417e15/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/cce5fcb3ae02e2160c6d23ed99c1f6f84d1dd71d/
         arm |                 socat-2.0.0-b8 | NOK | http://autobuild.buildroot.net/results/d6e6f42450c8ad2c54b61d0950b6823f18628bc6/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/b5c2bd00becb9cea1b6dd842061d194b69d0620e/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/63083ab36be2e49e48012580ff8384db0cbc82d9/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/29fcb0a6716319f96d3b7e12359078f2dcda21e3/


-- 
http://autobuild.buildroot.net
