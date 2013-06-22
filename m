From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-21
Message-ID: <20130622063005.77AF252C105@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-21
===============================

        success : 86 
       failures : 56 
       timeouts : 0  
          TOTAL : 142

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 7 
                 libffi-3.0.13 | 6 
               libglib2-2.36.1 | 5 
             gdk-pixbuf-2.28.1 | 2 
                pulseaudio-4.0 | 2 
                    acl-2.2.52 | 2 
                valgrind-3.8.1 | 2 
                 libnspr-4.9.6 | 2 
                   icu-4.8.1.1 | 2 
                 netsnmp-5.7.2 | 1 
                  poco-1.4.6p1 | 1 
               aircrack-ng-1.1 | 1 
               libevent-2.0.14 | 1 
                 nodejs-0.8.22 | 1 
                   mplayer-1.1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                   libcap-2.22 | 1 
                     m4-1.4.16 | 1 
      gst-plugins-good-0.10.31 | 1 
          host-protobuf-c-0.15 | 1 
                 cairo-1.12.10 | 1 
                libtirpc-0.2.2 | 1 
                directfb-1.6.3 | 1 
                      bash-4.2 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
               openswan-2.6.39 | 1 
           imagemagick-6.7.8-8 | 1 
             util-linux-2.22.2 | 1 
             tvheadend-5513b44 | 1 
                    crda-1.1.3 | 1 
                libosip2-3.6.0 | 1 
                      pv-1.2.0 | 1 
                openssl-1.0.1e | 1 
                libiscsi-1.6.0 | 1 
                  libedit-2.11 | 1 

Detail of failures
===================

      mips |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/83eb95a379356e239b576ee9873a7540e51872fc/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/2dad68215819fd76bc6b03ee73d8f97bd49cd43a/
    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/87ac1a5b8ba265150e1a21bb8a2e21b2b61d33e9/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/c8cb46b407f35c5254629788dbb405e8ae5d6aee/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/cafad1cef2dcd440b78e402a8c2597bbb34c0bbb/
       arc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/828133224b1c51361c771b3069ab87961a9fc1bc/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/14b37dc56857ec9ff09d4b7fd1c7074aa7f7e470/
       arm | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/c8755eb12526e5698a097253d07a95b249ba734b/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/f9df398a6c162f4b874b59c965888f16e07b78b1/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/4727237715f1c9b1fc14dbce49c478a0ca8c054d/
      i686 |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/f3094b44c146a58ff80720f2be73057fbf865db2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/d118cf61fb262f8727fb6f433bd2cfe85aee7de0/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6451d70ee70477b28778b96b3968e51031334ae1/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/bd6e5d4cf46c72c69d7afad0e86eed620d7c75f2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/889d31909ff0ea14ebced642efe41e320b5ee681/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ca207913cecc8fc676d419b9087df2b72ccf3b87/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/bebdb04b3e55eddeb157647802013844629a7b9f/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/602c572389c6093a86982203f76592c7415d0177/
    mipsel |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0df43feed3f3dfc6e4728f186c7738823034b3e9/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/0d195d74eaabfd80785e9f5dfc496cd5df593355/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/ad69230d8e7df682c5c81f4a2e0438c2892e3be5/
   aarch64 |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/464ad15e9abbb0f5b74171ee3007c55da8c041d6/
       arm |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/676133b7f13a8758f2332fe1ea468e9c2d38e335/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/5d4278bfd8a68ba3dc59dd5b0eddca6446a0e0f2/
      bfin |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/2e0422f1042d0cb00f5bab0dc190930581ed4ef2/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/18337d180d1686df9d47179b9df1fa91aee50934/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/771c538a0375409c37add9fa39c0ee4fa6b22ad9/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/ef4ed40ac1d4caabe754b7060bfacd1df5cb9afa/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/5d800b3ab6e9878a07a998d2861c5cb4c0bd3836/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d8491314e1d696c4ec4b86e11aeb9397ca9455f6/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f478757c53edf7784a0effe38fd2813dfc214c0d/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/d4b7ce0a5394729cec0e37ba6e8c09240ba3089a/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a9af8bacecd967748ec43acb2c14c9d724ca8dfe/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/efc0145f0fddf9ab6b81c59397c0b28f9398e331/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a2477f68697caa24f3b8acba22f3c5633b68c5d5/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4c32c4c9dd474716e77f39b643e354a8221cdaa7/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/dd5b12ab0e303c11e3aafc58e7f3aa93e21d1058/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/c441267550bf6dd60a3a432772f0809589afdc0c/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/70600cc9ee74cf7e4114970ef5f4633d1eb3c787/
       arc |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/52813325da1d06ff9c4fc416c2324c7910cd9458/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/f5814c22d799afcc94962dab8f6b3358555b020d/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/05bc38fe14d9f40727f7108f39e9619290a0eaac/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/be62bb6960bd886853162658792be903426f0282/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/25c969dfac46eda132d43406de1dd9fe5c14061b/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/af5f7e6b88b655d0fc425dcc496ed9ded70ba100/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/9da832ffd4ecfe45d9419e3223db1d58f2524c1f/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/9e0055abbdb7d022c624c4584a59d2e1d3900bb9/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/17f6d190ac342a63046dbc83f75352c033dcb49b/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/22799192d2fa7057201c26b87742a1645aa191cf/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/00a613b526cab40f03e79123e2b164a9f7485ca2/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/a7c275da6be60ea8ad3e19a1169cb0fbc9c69bd7/
  mips64el |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/96fdc198603f66ca118765840696d951221a82d7/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/7641f560aeaa40848213eca71e9e3139b2293400/
     avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/68370093a856705e368f6aeab2899fd013af66e2/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/44b2a82c44b04155a1c096cb8bda718d8d497c2b/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/fe14e7e4aa0b52074810639da90545446fdc0a7c/


-- 
http://autobuild.buildroot.net
