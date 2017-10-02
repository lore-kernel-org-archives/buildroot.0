From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Oct 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-01
Message-ID: <20171002063058.73A6D20968@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-01
================================

      successes : 214
       failures : 61 
       timeouts : 0  
          TOTAL : 275

Classification of failures by reason
====================================

host-squashfs-3de1687d7432e... | 8 
                     nmap-7.60 | 8 
                    flex-2.6.4 | 6 
                host-mtd-2.0.1 | 6 
      host-uboot-tools-2017.07 | 6 
                openjpeg-2.2.0 | 6 
                   perl-5.26.1 | 4 
host-vboot-utils-bbdd62f9b0... | 2 
              lbase64-20120820 | 2 
                openntpd-6.2p2 | 2 
           oracle-mysql-5.1.73 | 2 
                  boost-1.64.0 | 1 
                   cmake-3.8.2 | 1 
             dbus-python-1.2.4 | 1 
      host-monolite-1050200001 | 1 
                   mp4v2-2.0.0 | 1 
                pinentry-1.0.0 | 1 
         python-gobject-2.28.6 | 1 
                    qemu-2.8.0 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/64bba29b60278bba5582bd973594bb2b7390aac2 |     
         arm |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/de3a0a263a890f44fec6dfca417804d38641cb18 |     
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/d72fc6095ffda260a1fbd268ed443a2f6c7689bd | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/e6e6256f2ae917f6fa6949e3ce5426347968be46 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/1076d5f7042b80bbbb7a5a59d1ff1ab8f474928e | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3d90dfe258b7fbbbf50bccf62b2e1f7f5bfe52c2 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/1e06ed41f7d6cd08781c781b8e65e85d83503ec9 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/29206c9edb960cf2df88be61546d61c7db093eb9 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/67cc8cb9469be485b7ec7b78268a374c3556c885 | ORPH
         arm |       host-monolite-1050200001 | NOK | http://autobuild.buildroot.net/results/6dedf91fe0b7c9f973fa4ee8f1add96a76a02f1e |     
 powerpc64le |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/95258b05d9d44d1775fb780d82713fca3c4c23dd | ORPH
     powerpc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/7befbdc6206e5b9ece0e3336196a031ff7394709 | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/fd719822686a3b37084e010677cb0bae6961e9cc | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/30957ac0226e4a53b7ccb6fcbe5afa02c556410f | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/1bd2f68338e1a8ca38c0c3d946cd0ab6e3502535 | ORPH
      mipsel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/5d205467439f4f2313ccce38b98aa750415ba4a8 | ORPH
        i686 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/27703beb74be158b4a0ce1ce187b713c9cbffc3a |     
     aarch64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/eae6870c9dc626fc425e4e76bf6b2293ced8469d |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/09d2b3af3843b4c15e6d98ff9a73b5a3ac2218d2 |     
        m68k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/0158f6c25dee54c76b1831264e6286729b40ff94 |     
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/e6c0c844872c46ad315389ca09515f719554adfa |     
      x86_64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/d2d3a7fe0c4009f5c474573070730e94a702dde9 |     
        or1k | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/86901d116c8c294d1b681f2039a22537f9ff127a |     
     aarch64 | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/bf95e377682c024f9dfd9ca75ccf9f21bf551bc6 |     
        or1k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/98f659434128d30bc7b6a2344828769e79296415 | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/c8202668666f7e2054bf5540fd07e87bf16f8a71 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/96e0575b72b4f2d98fbad4baa3e5402e9044d10b | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/bfa6442bbc9b65ed7f0aab047b9f4a31ee775442 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/519e4f60156db6fcee749e6147d237f2e8bddfba | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/0eb1da61683f746d9b12593ffd092e214bdd55ea | ORPH
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/346350305e9416cd11c2fd86aeaec425531b21ff |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6f1505527b09bd7f4831495abb078dc73b8f295d |     
    mips64el |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/2b0ab184a623d1cd2c6fb051a43c520355f0fe85 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/c34d552270748179671e94fd023c929862caa02b |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/514e9055a2f85c164823be45f9dd1b69a8129ee5 |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/84b73b1dc500718690b325640d43d18649827548 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/9049867876d6bee8c61a7343cca540e52c1d704c |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/22492b405143f34221b658baca424c7f29f6ab69 |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c0db83ab7b38bbbd17ad48a832152fd7d922f153 |     
     sparc64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/fe777fedea8bdf7da3c4d4e93aea65d24f680b9e |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/9674fb73cb709939440f6f5c548306f0d137170a |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/b52fd2c09339bb248265cd04301c67c281762313 |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/a101c0d21f9e7a9dd4808ed88e9bf26e6c16d3f7 |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1fd0d22440e7c6736cc50b0436d070677b9141aa |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8e8742a265a413eafb4261b3c75b19ee7efce7ad |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/cbc8be8244c2ba624258ab9f35f688e9d22eb01d |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/31182c570c4b3a462b9755e402ecc17494182ac7 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/87a958716c9b2ea764252d03a188d3dcc7529dcf |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a05159c87b8a16fd51921298ad4db251376dee60 |     
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/e7a7ff01e0d3ce2c364853f36a1833e3acf465d5 | ORPH
        i586 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/754374ed9243cbd3adcfdec9d718d8b18143fbef | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ee63de5557d447bdc59ce976620d0a411d1b888c | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dcf2e286de2aa1efc957e847d81c5f02955ab165 | ORPH
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/146d68420ab061f43e546022d42f49aad5cdcef3 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/f044e298b87a23c35f3b2670c25b197f974a31d8 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/1ad3bbd059d18658aac77b6e6f7083cffe6c7d30 |     
      mipsel |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/680b6505f9a2e6fd37665e93c90d790ad0205d44 |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/b67c8f6c45c9df05e52c6d79728b788ff342851e |     
       nios2 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/d1b9f0711d6ce45bcec54010becd1fb15ffa881f |     
      x86_64 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/0947b79cf728c6f2203da3792f465298a5761094 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b6c0249d5aef4b142a62ee26c7f1557541f9a837 |     

-- 
http://autobuild.buildroot.net
