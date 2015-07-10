From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-09
Message-ID: <20150710063014.16BB3100E34@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-09
===============================

        success : 116
       failures : 51 
       timeouts : 0  
          TOTAL : 167

Classification of failures by reason
====================================

                busybox-1.23.2 | 4 
                  zeromq-4.0.5 | 4 
               libglib2-2.42.2 | 4 
                  boost-1.58.0 | 3 
                  opencv-3.0.0 | 2 
               libsigsegv-2.10 | 2 
                iproute2-4.1.1 | 2 
                     vlc-2.2.1 | 2 
                 mesa3d-10.6.1 | 2 
filemq-482797b8aa30fcc9ea13... | 2 
              lirc-tools-0.9.2 | 2 
               bootutils-1.0.0 | 1 
            c-periphery-v1.0.3 | 1 
                libtirpc-0.3.1 | 1 
                  ffmpeg-2.6.2 | 1 
           host-heimdal-1.6rc2 | 1 
                    bwm-ng-0.6 | 1 
                  acpid-2.0.22 | 1 
           aircrack-ng-1.2-rc1 | 1 
                 libebml-1.3.1 | 1 
               upmpdcli-0.11.0 | 1 
                   attr-2.4.47 | 1 
                 lcdproc-0.5.7 | 1 
                cifs-utils-6.4 | 1 
                  cppcms-1.0.4 | 1 
             lttng-tools-2.6.0 | 1 
                   bdwgc-7.4.2 | 1 
               arptables-0.0.4 | 1 
                  libv4l-1.6.3 | 1 
                 libpfm4-4.3.0 | 1 
             util-linux-2.26.2 | 1 
           bcache-tools-v1.0.7 | 1 
                  aespipe-2.4c | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/d97241121880586d6173713110aea6b46b8ed492/
    mips64el |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/5cefa90f2a19ed55ae88d938bf134dbdbfc7b9c2/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/f72e458c8e97a65040601b882bf2a724981cd9fd/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/f509d67de35041bbf648bfcc8c2621c72c2aad4a/
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/85fa358930474c608b558176a8eac77a5844d94b/
         arm |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/aca6397bb8645df29fcd410c5564aecee41fd948/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/72de702914bb89fd5dab3fea9aaf478b24fff7d6/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/4f8c359bd702835ce349e7bf3c66420f3414928d/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ca6286bcd67f8b1a7f1537e1e2ea392ff68bb469/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/d34ec5518d3777bb3124c4801f682d1f328813de/
      x86_64 |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/721e8367c25b64058e3934bf4c2c20bd90400824/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/005c8a9e3f24a4f2e6a413199384711fb61a084e/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6d882399304ef90660f1776b7e0ff76d1b6be032/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fa4310bea91682ae42b09ba0584f0261f1cb2d08/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3d7b97bbdaed55854265762332dc87fd843a808d/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/57a907b9d21df01f617f0cf4b4f5ea40e0bd9bf5/
         arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/c64c0fa63f39fed6f12aad7c666901ef2dbca761/
      x86_64 |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/893244d77a73eac75ebce3a8b35c54a23439a40a/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/a5674c4c6b7255c31f8219f0ef6de9606b475d4b/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/65789134270bd0f06da24a45d555c4ab72407cda/
      mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/6e8a250b8ba90c70193f6f1ac784c3a8aceb75ed/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/90abdfe23e4d67750c22e60c2efe245649dfadb5/
    mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/3a42c5b294a9a8602844ed1127ec5eadb60a6bed/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/72129574f3dcacfdde256b91ff637586c5ceef54/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/bea4a336747af8352f40a70424c13365a80b5764/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/75c30ca1f5486fb61eae93bd5e3c81cd83f3a700/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/0d38371df1e905bf020422442278396ec85642cd/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/eaaa79a323225c49eaf0344f489fdcfd7e34dfec/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/22b86e136e131e961659693c82cfe1b6f324a5b7/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/db8f0f961e8d58b2333d49b20e2dc986ae09e2d9/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/27601a6326e908f557557379d7aaecce7c65f45d/
     powerpc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a131c0f38689bb2437d996ef8af14d25bebebd57/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/087066174bae69ae18cf7eee5288b0fe3b82e956/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/4d704f8813e76bea53a3e3e25583e06d50fd96de/
    mips64el |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/d345c568fbfbacf3d62a94fae995983127e0d629/
         arm |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/9087769da17e2092c3ad2eb901ff87c1d6437e6a/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/49f9fdb034f7bf23d55ee601ff0998e31a5763e3/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/e48293563f4c2d34ddc796402f60bbc021f04d6b/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/c89174fa66ae3fe6070fc03f5ec197f7c6453e11/
         arc |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/977e62c9b5be2fa0591e4544efdb6e93777468ca/
         arm |                  mesa3d-10.6.1 | NOK | http://autobuild.buildroot.net/results/fe7f0df8bccede85b9c86b1231573740d8f6fba8/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/51c09d67d761b2f8cf47e7f27a896789aead1457/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/e7066120758f4ed195c20c4a5e3a0cd11762eaef/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/2eafeb9c178aafa5c5f588ccdce43f8fcb45b9cf/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/e41532416d3ef1c6db49280abf008b72c29cdd58/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/9fbc4683d470a7e0b407d8bc8a4221b0fff632f5/
     powerpc |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/c99abcc87655465f2f605a3fbf6a948cf64060f8/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/1928f50101041599a982471350f69f19144c1269/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e876eaf1d2fb7329f897759aa237c2b5c9dfab64/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/26acc317a05887a1ff3587f2c6920470d2ae7740/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/b57229c18891f1ae6f7d7c760b6c45ece825ce1d/


-- 
http://autobuild.buildroot.net
