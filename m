From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Sep 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-26
Message-ID: <20170927063058.D8F91208CD@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-26
================================

      successes : 204
       failures : 70 
       timeouts : 0  
          TOTAL : 274

Classification of failures by reason
====================================

                host-mtd-2.0.1 | 13
                 wsapi-1.6.1-1 | 12
                openjpeg-2.2.0 | 7 
               asterisk-14.5.0 | 5 
host-squashfs-3de1687d7432e... | 4 
                openobex-1.7.2 | 4 
               librsync-v2.0.0 | 3 
                     nmap-7.60 | 3 
                  cc-tool-0.26 | 2 
             host-guile-2.0.14 | 2 
host-vboot-utils-bbdd62f9b0... | 2 
             lttng-tools-2.9.5 | 2 
                 mplayer-1.3.0 | 2 
                  boost-1.64.0 | 1 
                  cppcms-1.0.5 | 1 
      host-uboot-tools-2017.07 | 1 
               iproute2-4.13.0 | 1 
                   mp4v2-2.0.0 | 1 
                  ntp-4.2.8p10 | 1 
                openntpd-6.2p2 | 1 
       poco-poco-1.7.9-release | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/5934e0a342726848eb91d0a13776db19d14c00ef | ORPH
         arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/5d625268a98c233cfd2c04a2ba1ce5b67d7a08d2 | ORPH
     aarch64 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/3df5e1f7d0d0bd0bd304b438c469c7d90700c1ca | ORPH
    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/c56fa512a4d7ebd174ba00829ae9a2b8379ff9dc | ORPH
    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/aee70cd54d0399391bd180f44aa6b6b6e9338952 | ORPH
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/a46a3197d4ca70016daaa2840a66169eaa94e5f3 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/3697d8e7f3290513fdc6f059fdb367fe02eabf12 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/cdd1ab8dd9b68dcba37741de8e5518dd14a12c7c |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/8ff3cf0b1388d763de41288858868976188a857d | ORPH
     aarch64 |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/8ba9608274cbe00ae3a6045e472a1a765e84f41e | ORPH
     powerpc |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/166517510eae40ac85ab7b1f9c0c14827b86cfac | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/376d790194dd05ebb1b199f295fd941b98406c07 | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/2119855a9068edbb4e542aafb307e82bb4c197b5 | ORPH
         arc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/59502a23c84ab7ff8a387a2f5a3259445967d2c1 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1e75110d2b60452d1ffd18e9f6b05779f51116d3 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1b2ad6950c9b8a124c9057c723cdd8448abda3f5 | ORPH
         arc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/8666182b8b1a57b193ac85593ecc6a44d6ce7f27 | ORPH
   powerpc64 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/607f501e72bb3de356b17af32fe4b24c269ee7fc | ORPH
        i586 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/736990091bad1a5fe3007231659baec148c6d020 | ORPH
        mips |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/efcd370c08325ef4d2b9a8cc760642aa9efa5e28 | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/d600558ef8190a23d79841bcacdc3fb5f51f3756 | ORPH
        mips |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/d5b002d55e658c9764fb30731cbea1d5383a3240 | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/a4f27f6959dbaff1dada895916f285bc55706cd5 | ORPH
         sh4 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/666e7d037532dc4836fc5aa63b78163a1ac9af3a | ORPH
      mipsel | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/85bc38c13cc3f1d3d4dda0751c3c9fd864c3f98f |     
        m68k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/6df9df3fc006bfe72a9c72ce91f70b7d245b1f06 |     
      mipsel | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/08e00184ba0dc848affe7b40770e20009a930ae8 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/d17e469550afc324f41dd2b743a52f1b0f3d87e3 |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/83a5e557da685019517bed4baaf113908965177f | ORPH
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4bc388618ff02dde26ae09db021434a936c8cc1b |     
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2648f1d916ef32ea877f625ce9d39bd123aaec85 |     
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/f34684dcdb47938a3da8b00c8b29000cc23b4e3d | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/3cacb87e39a0ebb9d227fff4be71bea8132bf0ed | ORPH
microblazeel |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/24fa4e375c6a5a8a48e2b26fe9228491ca41356d | ORPH
microblazeel |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/b5019d1f430c8ec48a895070656d8af56e4dab7e | ORPH
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/9cc921ccbc16a975b6bc93989258fef5adc7088e |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/0080aedfbe75a00bed7123991d164fca17c62c93 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/72d2000b874a05a6e6f7491e8bee2cae59c4dfd5 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/315c97d9f5733839266a6d109c4b62fde0e3276b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bc78436908bba59a824031c9fe2c09041dadc64e |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/bb42c6ac8d3783bb8203d7771640492cdd063148 |     
        m68k |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8e1f398a8ebd2f4ab403bc64e64624398cfe241a |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/678cbb13c6644328ff0f9032f4900ae8bf9ab2db |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/537d1a018c0724b8b90a3e4ef8386815496f48de | ORPH
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/182862429c9074728d9b7565f11ad569e75a238d |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b75050fe13955c4911ce540348dba18a29a67c7f |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fca27ec12aad3eba185554d802cc687ee16dd8bf |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e4eceb250493abf1d46310adf01ea25c066f9383 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/515b21b08cbecea826a618dc7ee3bb68aa16eaf9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/080264f788fc1dd9f96b1ccdbbac482ef27384ab |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/db56cf6624f189c5c26805c1022aa35495612cc0 |     
      x86_64 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/2b14b7012b93f0f2bfaf9e61435dd8826217d481 | ORPH
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/ee740b9758fc52eef31365655b8b9fd5cbc84b66 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/71c7bf2da2bce824cef8f218ea04d89fc3abd9aa |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/fb6e675583bd211f243309bab4dd5df259f771d5 |     
         arm |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/668ffb15f8c4faf0f4c462488dbb70b61386d465 |     
        m68k |        poco-poco-1.7.9-release | NOK | http://autobuild.buildroot.net/results/14cba2dd4edb4899d4a3a096b9a5ad2af152064a | ORPH
      x86_64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/24c262ba8b2f5ab3d301c27bb1f3252dbba70424 |     
         arc |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/2b1e807b1c600fdb7a0be7b8f65f2a42feddc1cb | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/f03c9a33289ab3104f30c3da98673ad6321db46b | ORPH
      xtensa |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/59ce81f36320a0a24c25032a82098ec51b4a0144 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/1fa62079410eda14864711d51c66dae4bdbf3f51 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/b5cff4e7def853d4d32123a880d4afcee833ae03 | ORPH
     sparc64 |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/6cd77433e490426d4faed7dee36583bc74a424db | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/d8ac252f5a0db5735dde659eee30f3b98044ece5 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/5d4a58bb8efd2c7a264d8f2d4e114b73137dfae8 | ORPH
         arm |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/1c6105aad0f27b47cdf4b79d2a2595ad19ae7dfe | ORPH
        mips |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/b063303ab6c18a2c6443d5c442734731e5ad4742 | ORPH
    mips64el |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/ae2e4b2c6a6916de9c8471625af4ebaa9ac0a5f4 | ORPH
    mips64el |                  wsapi-1.6.1-1 | NOK | http://autobuild.buildroot.net/results/b2fa16e3602b8e013bd4b348d441ad9ae65e468d | ORPH

-- 
http://autobuild.buildroot.net
