From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jul 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-21
Message-ID: <20130722063008.2B7D752C5E5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-21
===============================

        success : 107
       failures : 45 
       timeouts : 0  
          TOTAL : 152

Classification of failures by reason
====================================

                 libffi-3.0.13 | 7 
make: *** [/home/test/test/... | 3 
               libglib2-2.36.3 | 2 
make: *** [/home/test/test/... | 2 
                 libnspr-4.9.6 | 2 
                sdl_ttf-2.0.11 | 2 
                   neon-0.29.6 | 1 
                   bzip2-1.0.6 | 1 
                pulseaudio-4.0 | 1 
                       kmod-14 | 1 
                  zeromq-3.2.3 | 1 
               alsa-lib-1.0.26 | 1 
               libgtk2-2.24.18 | 1 
                 libpfm4-4.3.0 | 1 
               w_scan-20130331 | 1 
               libsigsegv-2.10 | 1 
               ruby-1.9.3-p429 | 1 
                    acl-2.2.52 | 1 
             util-linux-2.22.2 | 1 
                   mdadm-3.2.6 | 1 
                libtirpc-0.2.2 | 1 
                  connman-1.12 | 1 
                    php-5.3.27 | 1 
                  libnl-3.2.21 | 1 
           imagemagick-6.8.6-2 | 1 
                     m4-1.4.16 | 1 
          host-protobuf-c-0.15 | 1 
                  ne10-88c18f0 | 1 
                linphone-3.5.2 | 1 
           binutils-2.23.2-arc | 1 
                 binutils-2.21 | 1 
               qt5webkit-5.0.2 | 1 
               binutils-2.21.1 | 1 

Detail of failures
===================

      i686 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/fe3088ffdf2af158a00d0a7c00a5620ec5267ac3/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8f1b2602ebf39cf071da25f8baff5cb0599839f5/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/9ef92d7f6f69ad7c93a5a5395d712dddcb3b4f2c/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/f8727fbdee613974c1f45a193bdd77066dc875d6/
       arc |            binutils-2.23.2-arc | NOK | http://autobuild.buildroot.net/results/e2aaa55227d727dd8b09222db45c3fd064c1c853/
       arm |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/a50b7dc3e6b0aea43bc0c815443f12377c4eee36/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/85d73a412a6bc560dc7ca714522e59d194d9b107/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/17690307b6f3c1ea75534324a62d7d72f186fc20/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/194e7b769b61db537f8a4483bafb7e42cd756a7c/
    xtensa |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/b29c5a8237f1e29e9d178fb363844bcd217d0991/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c3f638e21cecb8617ddb4592f650f4ddb3b696ba/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/204088b948ec836b446489f6a3424ad3b0494e70/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/18a57023bea97a968ebb1e8abe1be3abc88c3751/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3e8817c3a3fde472c05104a124b7fd07c80a64ef/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6e900dbda4e0b8339fcb2c35facc4c6c8b6e163a/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d5c4823e79b1c0f4fd45584d86ef75342eed0b87/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/acf0f8d0d146b6dc4a6849e6406f2540a987334d/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2a8ddc15e29e894997888013742fdad4509cbb0a/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/7b4cfaf7aadfedf9b173a3501c758a92d5ab4d4b/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/0ecae78abc022d7bc2c7750aec1fc65495246a76/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/b4e26acdeb109cd51e067ebffe4a64e791c80797/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/95328ee2e0bbd17a65cc60243ba58bcb77eb80f7/
       arc |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b2649eb37dddbbab63a43b6a81ef9671b2c78e73/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/1c2948e50b6a7062f6361229acea4a3c97ce1058/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/eab192a857c9a8a62b130767fa7c6abd2c112374/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0bd302ae022ab199a8997fab537776482a619033/
       arc |                 linphone-3.5.2 | NOK | http://autobuild.buildroot.net/results/7f03a0a0baefff87a138e8e0b20a46587a476156/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/6ae7c07abd80db938328953753a3df4dfb0a4433/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/36b2d3ead6d9709f445ba2d6c804a9ffcc12838c/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/cc1ea7df68a1a1f1a8549be4bb96f51bd8cebd59/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/54a8aee338efc5adcc335446ae702947dfb98cfd/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/45fc8ee49d49796ca2c32a014fd06a0af80559f6/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/f81bfd81c71c84b18ce2ea00c0cfad743abd9f62/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/e4b78af4e501a7794cc10c4e23cc866588633744/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/98b7cdff2d84aa40e8fa987fc1af36be623d1b86/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/e604e394b84c3941d667140449472ae9bce71172/
   aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/03982ac53851caa734207f30277e2b83843695f1/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/aa625954471a1b23547964a2f534ceb6e11f1e1d/
      i686 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/ce206bcf3c8b1d34d28b2011645c3ff207995888/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/113d054ac56fab6537af65aee27f74bb47f8b4e4/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/2fa08902ab8d6ab7fb1b2eb0af3199df446f9147/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/86ceb7c1672285fd854d25949e6fc7a1868b9dae/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/01da50b57c796412af0290eb0cd68c4621198735/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/c245ac3174c916b070db0ba7ea15c9ba36d29587/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f9aac20a74ececeb06a0797bebbbe12bcf55f6d5/


-- 
http://autobuild.buildroot.net
