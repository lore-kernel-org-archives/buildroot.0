From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-29
Message-ID: <20151130073013.0C47A102DDB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-29
===============================

        success : 121
       failures : 36 
       timeouts : 0  
          TOTAL : 157

Classification of failures by reason
====================================

            libsemanage-2.1.10 | 2 
                 mesa3d-11.0.4 | 2 
                  ffmpeg-2.8.1 | 2 
canfestival-7740ac6fdedc23e... | 2 
                   libndp-v1.4 | 1 
                   bdwgc-7.4.2 | 1 
           bcache-tools-v1.0.7 | 1 
          sane-backends-1.0.25 | 1 
                libvips-7.42.2 | 1 
             util-linux-2.27.1 | 1 
                harfbuzz-1.0.6 | 1 
            mesa3d-demos-8.2.0 | 1 
               expedite-1.7.10 | 1 
                oprofile-1.0.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              strongswan-5.3.5 | 1 
                   erlang-17.5 | 1 
                    php-5.6.15 | 1 
         conntrack-tools-1.4.3 | 1 
                busybox-1.24.1 | 1 
                directfb-1.7.7 | 1 
                      qt-4.8.7 | 1 
               libecore-1.7.10 | 1 
        portaudio-v19_20111121 | 1 
               libbluray-0.8.1 | 1 
               libcap-ng-0.7.4 | 1 
             bluez5_utils-5.27 | 1 
                   mplayer-1.2 | 1 
              libraw1394-2.0.7 | 1 
                  mono-4.0.2.5 | 1 
                    yad-0.31.2 | 1 
                  connman-1.30 | 1 

Detail of failures
===================

     aarch64 |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/cdee3f7ba790b286cc80808b87f926cfdd51b43f/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/fb588b42bcc66a074f4709731a5941e5e3fbd50d/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/b66a9716159aa5df67ebb337025ea2f961a4a2e3/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/f27922ff7bd0061647d8f6283842af408e82fb37/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/7e974d3beb64b83d6bd8fb9b38fca282a789b066/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/21b2c17117199e9880689552c4752fe92c6cd3b2/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/f386fe081b7185ae4beb7c3cadd3f9f22718f290/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/66ec247fa0fc385bef8d2084c65bf5cad3a8e8ca/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7ab4889be4e572fb5fe60c94a3003f87d6a581f7/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/70e847402a7997fbc2f390aa5a3101c5d61be5d9/
         arm |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/28fb69fd1faae0c3e9acafda2dd6e3b15c63cfe7/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/f200a758493c7317e6be533c8aa584edd7ce3fdd/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/9e98f8b50fdb0fe9b1316606c148e9a1c7696007/
        i686 |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/61fac4d11d2330098d2739467287cab5a54c476e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/22ae6acb835ae49c41c248b9383e9afe7e7f0a4a/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/9ad373536caa817d5c71fc634cb34c80d1b77cf4/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/443c01eb72c1b7d8b42fb405f0330417ce316d3d/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/b18187056c43f94808f6b145f3472e744e494f27/
         arm |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/e5ffac09f83703cc3b7bef9c46393dc45f9945aa/
         arm |               libraw1394-2.0.7 | NOK | http://autobuild.buildroot.net/results/7b4b754b60e9f1921c8e3a377311fd6c6333b4dd/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/69b78fb13dbc06412e2c84a15bd3b947a942ba0a/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/7226636c0673c4ec535e55e8e5697b46f72287f1/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/c2a8a9a78ae66f83bee0823b89d7f1b512343abd/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/374b7cbd17c11dfb6b14169a17842c96dbdf0c80/
microblazeel |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/b442c1838187f5574372ffbdb1dbf5d40d5c2ae4/
        sh4a |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/ee1423a9d7861257e3e7ba7267dca87d89c1eb0b/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7fbbc64e2a3158616e7241dc61b215bac9c16eb9/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2e3101de9255ac7c8765df3b6a168d901265890a/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/6e7106867c5b1dede0ec97a959323b2585094479/
         arm |                     php-5.6.15 | NOK | http://autobuild.buildroot.net/results/c9fb2b4a25817d6455472767819018a62281d5f9/
       nios2 |         portaudio-v19_20111121 | NOK | http://autobuild.buildroot.net/results/2db9766855ff868400c5f7ec1b8b118f06f5cc85/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3bc0a992ee3179c5cf0902d985f63b4283362fd5/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/dae8bc3cf6c7ddf5f5ad09fccd87cb2f8f70a73b/
    mips64el |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/077658f83725e471f683daac5e3aadddce949e12/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2b2694a4257bdc362e134039311f674986e75e6e/
    mips64el |                     yad-0.31.2 | NOK | http://autobuild.buildroot.net/results/91dc6ab749f967ae046f856f3f592d5a548499c6/


-- 
http://autobuild.buildroot.net
