From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Oct 2017 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-05
Message-ID: <20171006063059.5AB9A209B0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-05
================================

      successes : 175
       failures : 63 
       timeouts : 0  
          TOTAL : 238

Classification of failures by reason
====================================

                 mesa3d-17.2.2 | 9 
                host-mtd-2.0.1 | 7 
host-squashfs-3de1687d7432e... | 7 
                    flex-2.6.4 | 6 
      host-uboot-tools-2017.07 | 5 
        wireguard-0.0.20171001 | 4 
                   cmake-3.8.2 | 3 
                   mp4v2-2.0.0 | 3 
             dbus-python-1.2.4 | 2 
                   evemu-2.7.0 | 2 
              lbase64-20120820 | 2 
                   pcre2-10.30 | 2 
                  cc-tool-0.26 | 1 
gmrender-resurrect-33600ab6... | 1 
             host-thrift-0.9.2 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                openjpeg-2.2.0 | 1 
                openobex-1.7.2 | 1 
          qt5declarative-5.9.1 | 1 
              qt5enginio-1.6.2 | 1 
                    sdl2-2.0.6 | 1 
                   tor-0.3.1.7 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/ba934c160cca744137b83c1a2851e2e50b922106 |     
    mips64el |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/5ef6c9c269ee9730ef102db616d6d27c20bc6e86 |     
        mips |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/b3676e04da85098570bbb65c7ba079c49250bf5d |     
      xtensa |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/194ab165abb7d38856b229177737b17d75c05694 |     
   powerpc64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/dfdac93d25d5730f08aa747e615a1a1c3ac7f1c0 | ORPH
      mipsel |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/1a6b27de690f086a1ec8dbbe5bfe39dd68f0de8e | ORPH
        i586 |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ab5fda9cb85718a2b894def1410835e7904c8de5 |     
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/66958c8c52d41048db0d1f543b4d466c9f2bc2f1 |     
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3b3327dcc3d45f041dd964f063090ddae14745fc | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/160e7f56e30b3993403700cc4062d6597cd678c3 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/246f60c7294338a0b2207c71dc061da6bba6cd8d | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/381d3fd34dcaf52bcbb0a99a380c6bfce4572dd5 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/4ad7614ac07e20d501b6ed0b01c6d9aeeae47336 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3cca136c478e205f961d86a406c8a89095c39c3a | ORPH
     sparc64 | gmrender-resurrect-33600ab6... | NOK | http://autobuild.buildroot.net/results/40130b28687ca2dbc895d0358e6b40c80d6db073 |     
      x86_64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/6d22e6979e80dd037c24c21f73ab28c1083966e6 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/9bc643b7fdcb0250d4dfca7ecf057878eeae8b1c | ORPH
        bfin |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/95a2c7c35b65fa556b9ad3cc8907dc4f79ff0bb6 | ORPH
        i686 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/0fb11fbaad8ad9bcbb485028f743ef9f0b459aad | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/2a145ef90b579447a8bb5a07e2817d9dfa65a9c2 | ORPH
        m68k |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/b0ef4880092e04551c192fa5e260518b6bb74f72 | ORPH
    mips64el |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/85c213f66748055f925f3734c8fe24a20d95c0a4 | ORPH
 powerpc64le | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/a5d551465e47a328ce1d1ebaeaef396f6a82f780 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/ceb294417766aa851acf4e541596748841c9f469 |     
    mips64el | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/0bdf835f6570719be51ab24ffb47823763d58028 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/71a4b468525d7897e2e8cd80171a16eca70fb4b5 |     
     powerpc | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/3b47f64c140fb86cd2f729255606c66a533f117f |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/bd5cd887c91900081cfab10d2d57ef7176c06b2a |     
        i686 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/7c939c06e973bbfc96e75a6eaede57af6a883ffe |     
     powerpc |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/57d0a9640abf3a7c062f54bdc787e6afb7f88e1f |     
        mips |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/26f9d97454937dd902ac8412d7c3d46244bb7624 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/5c52557c3ed1634dce13414fa565bdd41b13b1d0 | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/6cc6433143461f358a936a742b52ee41c9f9e46c | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/22bd574dbeb5ef735c8f4ea45fa81b59e35333d6 | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8f5ef1e7d762a4afe4ee1796ff6860246f0960cd | ORPH
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/67bf8afe934c0a2023b673b12d1389a8f6058cc4 |     
        or1k |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/d7d2608c22acd68a39997ec159f721cf1f716b51 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/ad922f143d825a8ca259367f4ac099925d17441f |     
         arc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/1032a23914f8a9b0846c41b8d1de5361adaf44c0 |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/7f44d5be7ef5ea82bea15a557a53db4b258a6697 |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/e54b831713d66ce6b0262394d78b23f8d44aaaee |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/46a02fcd8b100c8c76824b1ff6f45f6a8f0ac75a |     
        i686 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/d6da8e76d8f02131b5746a02110aa0e31438a059 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/abf9b288b800334a6f1f44e0e94efe85087e0a33 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/47d263cbb73ccb48165d10ab25e4c7099564302d |     
    mips64el |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/085193810a13172effbaf814d5ca43f0755132f2 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/91c664ca0f3a8dae7774df7c0d1c16bad8d6e877 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e6643f4a501d234ba3dd287307f5b061125e784a |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/4a8f23e079deac14af773077181cdfefaf96c6f9 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/ad21d53e0bbbd5dfdfd79a74eab92b06f16a127c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3735ead6416d0e3e53214abf2cc55cc5d5a57bc8 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/608deff7cf3e86cbd9ea40f327893abbb1dc785a |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/6d35c8f42154af8c431f318d2a8b8073fda95a63 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/6407c726685bb9cc1fa755eb889126b2bc1ab9b1 | ORPH
      mipsel |           qt5declarative-5.9.1 | NOK | http://autobuild.buildroot.net/results/690fcfcdd777dbbf6f37e6118570ed2bf6ffb2e0 |     
    mips64el |               qt5enginio-1.6.2 | NOK | http://autobuild.buildroot.net/results/b2b59dd4febe4f4016971887e157abdff0ff3f2d |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/f0d3ba1d550f2bbc6e30d94c1399bbc4a75743c8 |     
         arm |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/c880659d9f4c6e8f26f95e9d3406d9b50a3ba79f |     
    mips64el |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/3b391fa308d39ee5a1d00572002a5d526bfcf5ac | ORPH
 powerpc64le |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/12138b23ddd35b81b0e28b62c1d555ba1b15a2f8 | ORPH
       nios2 |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/35f15ba2c7447a09d656c472585cc879ba408fcd | ORPH
      xtensa |         wireguard-0.0.20171001 | NOK | http://autobuild.buildroot.net/results/a873f20e7ea8e33c07d5e1b0bdf261246d2988cd | ORPH
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/ee7b8e4aa1f7724edf7a20bebf5bde3d7eea7369 |     

-- 
http://autobuild.buildroot.net
