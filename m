From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 08:30:03 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-26
Message-ID: <20130627063004.1D63352C08F@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-26
===============================

        success : 99 
       failures : 55 
       timeouts : 0  
          TOTAL : 154

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 6 
               libglib2-2.36.1 | 5 
                 libffi-3.0.13 | 3 
                  boost-1.53.0 | 2 
      gst-plugins-good-0.10.31 | 2 
                openssl-1.0.1e | 2 
               libgtk2-2.24.18 | 1 
                    ipset-6.19 | 1 
                libcurl-7.28.1 | 1 
                directfb-1.6.3 | 1 
               ruby-1.9.3-p429 | 1 
                 dmalloc-5.4.3 | 1 
                sdl_ttf-2.0.11 | 1 
                  libedit-2.11 | 1 
                      qt-4.8.4 | 1 
                libtirpc-0.2.2 | 1 
                libiscsi-1.6.0 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                    crda-1.1.3 | 1 
               openswan-2.6.39 | 1 
                  readline-6.2 | 1 
                  bcusdk-0.0.5 | 1 
                  ne10-88c18f0 | 1 
                      gpsd-3.9 | 1 
            xlib_libXpm-3.5.10 | 1 
                   ncftp-3.2.5 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  sysklogd-1.5 | 1 
                  libxcb-1.8.1 | 1 
             util-linux-2.22.2 | 1 
                  pango-1.28.4 | 1 
             gdk-pixbuf-2.28.1 | 1 
               czmq-cb9839cf90 | 1 
               libsigsegv-2.10 | 1 
            qt5jsbackend-5.0.2 | 1 
               audiofile-0.3.6 | 1 
                 libevas-1.7.4 | 1 
           imagemagick-6.7.8-8 | 1 
              fontconfig-2.6.0 | 1 
                 binutils-2.21 | 1 
             bluez_utils-4.101 | 1 

Detail of failures
===================

       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/15118ecd999f99bf27c889a762562c70b2f8d72c/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/f4e0d139cd44390f65ed4ad189bc4a89cb83f609/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/bcbef136bb2641cfbe4fdd156d690befb2b69816/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/e49bd580c58e6489bd00fb661d818f162c8a4dbf/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/1a3712b0dea75d06b89b3b6be3ae00aaeb9c850a/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/f4c29c994ee16ede56e97b8d5b17a086d24bf394/
   powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/4c13fa9621ab201f5032da244601be147905a432/
    x86_64 |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/6c2235a3f1add6de017c4fad85661543510449fa/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/6cf81fb02c7c2e3f26380a645e26eda9e4c1846d/
       arm |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/601fa258211a11ad6e4516b433edcef56c5fa2ac/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/36fe60e43b83943c98a462b614d39ee06a0ec434/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/d1f0cb6d93be03841db42ef20d43ca90a058a7e2/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/6b0d52a9f1be50e628a71944b18331de95cf616e/
    mipsel |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/dd8b285b9dc1f94c8d75ae2af27393902746f4cf/
       sh4 |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/70c03dd012a2496add6c4c3141c83ca9cd09be17/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/8a4bfd3ee679d8992fa2650ba6b957c76a27d1c2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/cc191aad5b7987734071e2b9099f29ca901f14f2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/f9f0f4fcb4947859d773a64cd71cfedbfb5bce3f/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/34d79b2a44ac3397a3da80b6c7e9fdde64f7ebdf/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/b4c5afacd82727f8b24e43a30230a58e058dd4da/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/5095c88a57bbe98978d51aa4c7e566384d08dfc8/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/c6773ada242ffa035a1fbc9765e1728a39359c9b/
  mips64el |                     ipset-6.19 | NOK | http://autobuild.buildroot.net/results/c4743464b965cb94dbfeaf2e64040bff98cbd91e/
       arc |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/5bef4ad0cd24462acf69c3ef681ae07e568be5ee/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/f57734263718dbc30fa38c3c79158a58a5d54eba/
       arm |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/5cf1ae286083cb855b094eef8b45e6cdae834fef/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8e80f6e5297fe1e1d254bf468ad035bac2fad078/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c9ad77260bc4964cb31de72bd40972a985af8835/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/186a4c8bc205b687a19439783bf1fabe0452d98f/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/478e44f2d737d6caa557067f9e1c7220af0dbbfb/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/07a8fa5269e59409c1e1a3cd6d234e25fedd958c/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/d074027e6321b15cf97c7d691a81a65952737567/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4b5c771779eb5072c5b3d48ebec1a1c62e38c9c3/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/6064724415b46c5eefc5e46dbf66349a7b75b458/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/3c227edd3e1dc851a75523b8be7c8fe83a6a25e2/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/78712b2485e0fa8f1f0fb749a817d4ca9601c13a/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/674f7427b62807fc9380a16d8bb3c9c902b89227/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/f8d8b62e9f92f85de18e5c68229e7ec073c905ab/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/fe11593c8c1b2988418533ffe106fef211590354/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/50eae7f57655fdbdd9dbf6c82f15cd5d2b952392/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/376939c4c727cc118d112197c42494d78cd1b009/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/43a389cc8a9fe2ed8cf3522411d7c84ac2ff0d1b/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/69207d581f0c135f3bf914056f172bad978b5040/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e51b1c64402831bbfb0d00bddc7c699889707f03/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/85615e898e94db564eeda27479510e414adbfbaa/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/cb55edabe586bb413e76b84199bb014eb37ac46b/
     avr32 |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/232c0f0469ed896d45142ea3df46caa3b9fe9c9d/
       arm |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/f5c6d7bbfb888c6c99614fac9a3e4f883e707822/
       arm |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/54e8656a775199ece208427174e14bba3770e13a/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/f55835270c66fd19d6154f705ff8519b6863c4be/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/ce8a844bd14209fb824f26ca8919e693854f3742/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/110c1b41be352e34884c63228eb75d59ea6e8854/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/c7f5d849d0f13c010251276d27ef0083634c5ba8/
   aarch64 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/b05414c5bc5d47b7960f68c946dc9c4aae00ef4b/
       arm |             xlib_libXpm-3.5.10 | NOK | http://autobuild.buildroot.net/results/00b5c7745df5359908f6c77f90c1598b71638081/


-- 
http://autobuild.buildroot.net
