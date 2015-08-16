From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-15
Message-ID: <20150816063014.45684102B07@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-15
===============================

        success : 118
       failures : 22 
       timeouts : 1  
          TOTAL : 141

Classification of failures by reason
====================================

               linknx-0.0.1.32 | 1 
             libselinux-2.1.13 | 1 
                  mono-4.0.2.5 | 1 
ltrace-c22d359433b333937ee3... | 1 
           qt5multimedia-5.5.0 | 1 
                   audit-2.4.3 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
xdriver_xf86-video-siliconm... | 1 
                oprofile-1.0.0 | 1 
               linux-pam-1.1.8 | 1 
    xserver_xorg-server-1.17.2 | 1 
                coreutils-8.24 | 1 
                   bdwgc-7.4.2 | 1 
make[4]: *** Waiting for un... | 1 
                 setools-3.3.8 | 1 
                beecrypt-4.2.1 | 1 
                 qt5base-5.5.0 | 1 
         qt5connectivity-5.5.0 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
                 clapack-3.2.1 | 1 
                cifs-utils-6.4 | 1 
                directfb-1.6.3 | 1 
                 mesa3d-10.6.3 | 1 

Detail of failures
===================

      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/9ce0785681b36625a466e7231d4abb09fed8aeaa/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/aaea3955de8644f6c68e83533ccf66305dfc5fda/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9cc366ae00963b609ad684cb6e98fcefc81fb4f2/
         arm |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/e48bb1d40ac8ec907c2b65f7907f5f70ecea4e35/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/88b02b8d41ffe6c2235a0e993d43bbe4dd9ea75f/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/6a3222c4ef24336e80f6062d5025d320d58454b3/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/121226756850a97dd750d69d94f5693636a99375/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/15c7fe9550482a510edf02dc68bd97793bd38b37/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d570c3c3579dd00b513471ecc359a3161f0e9355/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/116f00c9c3b76b98348a64b6eab47b7d0f31d1df/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/7ce58d14641e830a385966e8be82eebc4b1c57fa/
microblazeel | make[4]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/608ac64d134df568a143eb14502ae52045a3805b/
      x86_64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/049ca0c0ef86accc6e1d4d9a661b7b9f277ceb47/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/1eeafc61a45a4dece850d351c7bb10ba0721ab1c/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/b374874f1915ab1d7aa6262604ccc8db102bb0b0/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/64f2b6b6e60d5c2d9537ad6891211cda6baaf6d5/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/0f54e5e92c4140b988bf5823e6886114698b0e75/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/515262cec32a3b2f977a2cf057aeef50cbbd911a/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/183a3bcdd9863ca2af4ca1b3b6405df4fc7114e0/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/ff68897b7e35ba6c0cbb3f43eaef16e881db7687/
     powerpc |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/42ffff241f58913aa32c1561e04f681bbc9c44fc/
         arc | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/d83e7112c6b5ebb19c8facaaf4a793e6b6ed1d29/
      x86_64 |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/e460a4b2615f38e56bf8ebc685b16eab67d1f57b/


-- 
http://autobuild.buildroot.net
