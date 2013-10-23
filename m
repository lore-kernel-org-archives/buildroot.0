From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Oct 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-22
Message-ID: <20131023063007.2CA5152C5F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-22
===============================

        success : 87 
       failures : 73 
       timeouts : 0  
          TOTAL : 160

Classification of failures by reason
====================================

               libglib2-2.36.3 | 6 
                    mpd-0.17.6 | 6 
    trace-cmd-trace-cmd-v2.2.1 | 5 
                libiscsi-1.6.0 | 4 
                      qt-4.8.5 | 3 
                    php-5.3.27 | 3 
                 libffi-3.0.13 | 3 
              cryptsetup-1.6.2 | 3 
                    nano-2.3.2 | 2 
                 dropwatch-1.4 | 2 
                 binutils-2.21 | 2 
                openssl-1.0.1e | 2 
make: *** [uboot-tools-lega... | 2 
                     pv-1.4.12 | 2 
                 binutils-2.22 | 2 
                aiccu-20070115 | 2 
                 qt5base-5.0.2 | 2 
                  nettle-2.7.1 | 2 
                  connman-1.12 | 2 
             alsa-utils-1.0.26 | 1 
                  tstools-1_11 | 1 
                 cairo-1.12.10 | 1 
                     m4-1.4.17 | 1 
          host-protobuf-c-0.15 | 1 
               w_scan-20130331 | 1 
                  avahi-0.6.31 | 1 
           argp-standalone-1.3 | 1 
                 fdk-aac-0.1.1 | 1 
                  aespipe-2.4c | 1 
                   attr-2.4.47 | 1 
                 libevas-1.7.7 | 1 
               libsigsegv-2.10 | 1 
              dropbear-2013.60 | 1 
                valgrind-3.8.1 | 1 
        gst1-plugins-bad-1.2.0 | 1 
                   git-1.8.4.1 | 1 
                   hostapd-2.0 | 1 

Detail of failures
===================

       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/bffad196765c8d8febbcc11726621dc266c407a6/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/2d19b23e849b0beaa8d5d7601bf5de8f425b8654/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/25fe9e087c7375ba5c10a0b12de47ede0e82038e/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/af36d74a38bc5ce195260251cb9a5dc16c2f2785/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8d4b30c0e62f0118e397432d18316d5fbdab652f/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2856017ec14a233e98726c461f6949e50f5712ca/
     avr32 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/da32ab00c5c0e2e150b74f365593956bde628dce/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/e3d9f68520852afdee9a86d5a9b3967508c59d78/
microblaze |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/531c4b55490a5130be80e2b17a738329381c16bf/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/c9581efea42eb4a6d14952d616ae2cf049c3ed47/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/3318ee1e074b9e9fca9e2815e220313cc9a00021/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6b531387197413bf9c0dfab4a00a2dd1cee436d6/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/717dd8a55b4167a8e890d928dd9636e5323ad408/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/17d8a38fdf356e7c85b7880fa681d180aaeb478f/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/c9562cbe31ba2b977224d7f5aebde2fad7dace95/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/312986e6cc31b11dec1c099a0e6a35d9ef980312/
   powerpc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/fe9c84cd86d0690a2b9194ff0be2f425777d8214/
      i686 |               dropbear-2013.60 | NOK | http://autobuild.buildroot.net/results/043dbdb837f8d6a8e49e5bd4569d780bed895a24/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a13669d1ba8828fb32fb72cb8b88fbb675933961/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b2442c719bda8b46f4fbf79b804ca6c07c35dd4d/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/a08a5774071e1f5f076117992448591ac37c4e82/
    xtensa |                    git-1.8.4.1 | NOK | http://autobuild.buildroot.net/results/71685b5607a5fb80fac4beb24877956811f5afab/
   powerpc |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/38bebb78ca8893907bb6aeab58fe9e054d34583b/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/fd31892a636950314b1d72aa262a1df93e74ebf9/
      i686 |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/079487ea4081311dee8317568525febd3325222e/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/5e68d1ec72a57e71edb0e8ab934d194628d72710/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2ec148f80fab9ccb95f25498185b70c6a5940bb8/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f01c0549ef0af27e8688536eb5448a69d5353146/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6651e3a9fbf99b76d226c18e3d9b7e04164d4027/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/baf9eee362a377882792a414efde27bd858e6c21/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/496c6ba08616568271efbe0c446c6837f62cc411/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e6761d00d8784644135056ae404fd05becd066c7/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b96d05306963214191806c024926ef5e32e1f15d/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1e3c05f074447c6dba9cb8e992539e7afb87cbdb/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0cc8ae931728eef57d8ba5956556b10abd744b4e/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/85319b08ee8338491f9762379df119895dc607a1/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/deb97930eabf438191f2d2db0440e2417acaba20/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/82984d7533328b179c5df590c4f26082d2378fa5/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/c99985633937aef9cee205bc09a045db31110efc/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/711346dcc72e40b702ee519351babfc3c4a96f40/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/49ceb0b09ba86b6f95a00c59a1e8a318b67323a7/
      mips | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/b9d7f8b25ca65fdb6d23070c93ddbe6291aae3d0/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/8c94c81fe74399c854de335329cf4942f8356fbe/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/3811a5470f0ed882da01184b04654199544e21e5/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/4ef0ef3e411d4bb585833b812a30302198911f31/
      sh4a |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/1db01b1dbdc91b8dfda1f61df16eee6bd8f2f378/
   powerpc |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/f243e4403a0d3bd1b737e9dfb2c00be6cccf3497/
    x86_64 |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/c50594f9fc8b3e21d626a4870c3683740b445a5e/
       arm |                     mpd-0.17.6 | NOK | http://autobuild.buildroot.net/results/ba9280065c88ad35132c3e143c936866a142f9fd/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/c556cafe1829fb1a154926eaf05120df31bc7c70/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/51336d72384293a49a9f578b1a83b42140559e84/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/c9f74b50bced16a7ecde7b7f17e9e255f12c62a8/
microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/81dd7dd2f32d560c739a2be5cacb97d9ed1e4d47/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/74043083b98fa464a3d229765a98251ed8ec148c/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/59e7cd1236fcc932ca143347745ad924eae28c15/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/f0e6b4bef50e15ce5d73d4ccbae45df2bd9d589c/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/c53749084a797d185e36d3287d3c9f746e3dfe23/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/17322d1eb2f3eebbc52cc681857073f85be3281c/
      i686 |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/8e21909b1f3b8fae4ef5e2fefdd2fc1ce03a5305/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/539941b1b6b8e9e854a10a2142d472a3ed2286fd/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ab69b5986183693124ca0c0d31fdb35654b04d1d/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8bff5ab2d821fadd511d37f21dda7de2e7a3d8e1/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/1c92dac0849a80317d2f9803096c75b28a439031/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a01cd3dfc0fbba187d17b99e1c8bb18769bfa003/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/aa1faee345be6753cae428a141315eeb4c297b0d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/aa469f359af2ee118974ba168ffd1db6c5a65134/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f66f59adbd0121a53ac8edaa69866f15b8ebd77d/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/891979e095eaf0d661f01fdf9b8886f708952875/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c8a03697d16d79f64ba4acbdec745099763ce201/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f839709b193a9683f6bbcd59dd95b04f64cd19bf/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/7a3f0ac8887250546e659d73c0f84691271d4490/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/24bc4f22c51ab28f95a7c9c12f5465144413510a/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/772fd2a75968dd82cba2c08e7d5977086e114425/


-- 
http://autobuild.buildroot.net
