From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-27
Message-ID: <20130728063004.E83D352C600@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-27
===============================

        success : 100
       failures : 52 
       timeouts : 1  
          TOTAL : 153

Classification of failures by reason
====================================

                 dropwatch-1.4 | 4 
           imagemagick-6.8.6-2 | 4 
                      icu-51.2 | 3 
                     git-1.8.3 | 3 
                    acl-2.2.52 | 2 
               qt5webkit-5.0.2 | 2 
             uclibc-0.9.33-arc | 2 
                 libffi-3.0.13 | 2 
               libglib2-2.36.3 | 2 
          host-protobuf-c-0.15 | 2 
                  poco-1.4.6p1 | 1 
        host-util-linux-2.22.2 | 1 
libtool: compile:  /home/te... | 1 
                      qt-4.8.5 | 1 
                  zeromq-3.2.3 | 1 
                  libedit-2.11 | 1 
                 qt5base-5.0.2 | 1 
                     m4-1.4.16 | 1 
               audiofile-0.3.6 | 1 
                  libv4l-0.8.9 | 1 
                  connman-1.12 | 1 
               ruby-1.9.3-p429 | 1 
                cegui06-0.6.2b | 1 
                  prboom-2.5.0 | 1 
                 fdk-aac-0.1.1 | 1 
                   dbus-1.4.26 | 1 
          enlightenment-0.17.3 | 1 
                 binutils-2.21 | 1 
                  ne10-88c18f0 | 1 
                   mplayer-1.1 | 1 
                  libusb-1.0.9 | 1 
             util-linux-2.22.2 | 1 
                lua-ev-458165b | 1 
                  tstools-1_11 | 1 
                   attr-2.4.47 | 1 
               wvstreams-4.6.1 | 1 
                 cairo-1.12.10 | 1 

Detail of failures
===================

       sh4 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/32e5f7c4c59f2a0e11395fb98d07128dc5b9f603/
      sh4a |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/01bbbf22ac101131b3f13adcb72e6cc7d4d50c03/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b57c6b2458dd52b013c2c8a7559309fd951dfcd9/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/919652752469040ba5e834e23507e276191f4191/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/b5ca6a4aa24a3eb766f6cbc9b9fb8defc92916f2/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ae5cdab62647251e2c5243f70ad858991bfb5d12/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/9f3ff04caef9874fe015855759540a78cd0d9fe4/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/e4d82786d36a4ae3fd5c743dcbca7b7b43177c86/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/2a24251884863b4366bace210bab8f48dee45bfe/
    mipsel |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4e579221bb0ae8a64ebed89b2f6259480cf124f1/
    mipsel |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/507f445c90288874d58c1e133aafc14b2ebe840b/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7e3d591afa745fb463f7e1e7984ab73c30cd5fb5/
      i686 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/43e49917f88b43bfcc8daeeb82c18577c1fb2eb9/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/8abbc36a18f5bff3d3be3f49ad355b844947f8c4/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/a1ebeaeb98bed12ffaf2d3008ccbbc8f5d7b132e/
    xtensa |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/0711110473722c679bbcdec9a8e568f83fa06370/
      bfin |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/b5454e62c6ea18a9d30148c704927e820f29a7d4/
    xtensa |                      git-1.8.3 | NOK | http://autobuild.buildroot.net/results/c141d3dc02db92cc30cc320c98d53d3e14638308/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f38a2c4cc56a8564c89c5cef3d92454886237c3e/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/6234258431baba7c73ffbf846f3d74482d8b5260/
   powerpc |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/21cbeb1123b7741d1f7ceacfca70e395c27c87f7/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d1ae204b5af6f9e2a7813a91c150f6b99ff59109/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/28fd616e02c3f319fe06efbc1c0edda0f68414df/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f78dd0af3e9210fe0d0126fc6c0981ee7eb6bd7d/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/fae705009028c6d66279cc28478cae58f74fa54a/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/9b4b72ec755b89b01eff1298f479d0a2597bab61/
      bfin |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/46394b2e13def689249fee406468bb5acb9f3205/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/f54903435d4c7af16b90ea07afdd326a24dee24f/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/653eb386792cb8f6e0b17f8b9106d47e422cdf6d/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/084bafbaceb6636e629fe6fb0728bb800c663669/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/838adcd5395d4335a7d91723cb7dcdffe3210d5a/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b06abc3cf760156d60adb1b63968bd319b6d9cf8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4ccbfbe8732ddfeca56c897ad48d943797ab5702/
   powerpc | libtool: compile:  /home/te... | TIM | http://autobuild.buildroot.net/results/c7fa2328e56d7efa32995f66ba8c4c43d5d9eab5/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/821b8ece7252d28e82874d1f3fcbe3f82e87934c/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/18b5a89602d441fa0a5c3adb145fd0599ad38d28/
    x86_64 |                 lua-ev-458165b | NOK | http://autobuild.buildroot.net/results/4513dfde675f3fcd48e5f34744290fc9ea49a5ad/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/7f4f2dd3b7ceef5099b762d72f4056afeca8e8f2/
       arc |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/634e4db74a6b067bab789b5286f30932db0b379f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/57e3e17614a384298ccd719cdac5602513fede22/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/3325670747e705c4cc80b7a7d048dbe9bdff379f/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ca52e6e2e7cc1f1799ccaf47ebd16071065b4ac4/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/100cf83c12e3952499caadbd14f175f460158ecc/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3c7a57ece367066792f8736202cfb8473d730b1f/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/d44f9be8674246590e7a0152dc30bf61c7c1272f/
       sh4 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/4ffd167bd228f5d056d271454bfe411e50604759/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/bb9cacda6b77729b171036d4c8246a769b253211/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/ebc7e76dc7d595ac0324b085550cd1bab6a2f560/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/8bb90ff38cf9d73cfad71a6ec0454acafaab1262/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/558f8eed703dd09e0f6cb1939ab84a1944effb4e/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/4eed16dba5151c36c87584a0c723c9386c99a453/
    xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/cbceafea3e58d31cfddeff3626c5590f15a406db/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/94a6bcc7b4468d7f81b93e2c14c240b61afb5b95/


-- 
http://autobuild.buildroot.net
