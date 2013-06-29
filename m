From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-28
Message-ID: <20130629063004.385E652C0F6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-28
===============================

        success : 65 
       failures : 70 
       timeouts : 1  
          TOTAL : 136

Classification of failures by reason
====================================

                polarssl-1.2.8 | 22
        host-dosfstools-3.0.20 | 10
               libglib2-2.36.1 | 8 
                 libffi-3.0.13 | 6 
               libgtk2-2.24.18 | 2 
              matchbox-lib-1.9 | 1 
                  python-2.7.3 | 1 
                    acl-2.2.52 | 1 
                  zeromq-3.2.3 | 1 
                 libnspr-4.9.6 | 1 
             gdk-pixbuf-2.28.1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                     pcre-8.33 | 1 
                      pv-1.4.6 | 1 
                 qt5base-5.0.2 | 1 
                  poco-1.4.6p1 | 1 
                  libv4l-0.8.9 | 1 
                   cups-1.3.11 | 1 
               czmq-cb9839cf90 | 1 
           imagemagick-6.7.8-8 | 1 
               alsa-lib-1.0.26 | 1 
                    systemd-44 | 1 
               qt5webkit-5.0.2 | 1 
                 cairo-1.12.10 | 1 
              compiling ossl_x | 1 
     xlib_libpthread-stubs-0.3 | 1 
              fontconfig-2.6.0 | 1 
          host-protobuf-c-0.15 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/6f8a6c7fc1a0825b70b815ef5993598dfdd82c55/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3a499bfb1f24f796dc03b5c3495963f1116a34c3/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/5fb05ad0747484206422f82bbedff1f6a4ae409c/
       arm |               compiling ossl_x | TIM | http://autobuild.buildroot.net/results/24443e26c1cdfff719b01515601ffcf7162a140c/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/e5277e0c862ac0abf48e3f81276961ae144eb85f/
       arc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/7ec9bda642d21fd98f691c2962fcf45a720af631/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/3ec49ae8ad5a76024b91d4cf27d0be1c270af089/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/3429507f4fcf64b3dbe183560e6d1f867eee5680/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ac7b83018ddc9c09d1561f48c1768f0e342a16a5/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/d32926e059f8765602ede8c267c90e7ea7202e0e/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/614d91504d651412a3f04b2900b4c6afdb472da0/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e8b729594f22cc5438ee91ecb13178a09b71d329/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/b8649193ea759f2778cf888503d55aa8c73a2ea9/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e33845e6914d498b95475ef33566d285c04bea0a/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/006c244983d94f19fd91e28ef274435df310ed29/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/210184f1169b9608986a80075c045feb81aea17f/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/5ab916918f20dbf7bf98b8d8407700f781848646/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/fd5e9880a54e24bc434072af0beb60764b7aa585/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/5c17f6bb000f92429187e44c5a7f3dc17b406e0a/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/462c8a75c8c5690764b715e62d58fe656aed2049/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f190931b5ab9532b2d20cb1a3bbcb4edf1154e0e/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a4da77b0efe5c30b9621a2f4d179757ecd58c217/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/dd0b1173eb18cd07330551cfa8ab43a11c6eadd5/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/91536078a13c99d45ae4a178f174b59f376473bb/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2692d025257a12c29773f8af3b04553ffbf0ca33/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b888ee50c0b26d718128ed2e6779046b3bf2ebec/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/33a5205e3e470630c6c9572127baa456c7b0bce4/
  mips64el |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/28a5dea78fbc641edf0d087792f029c792da4afd/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4f8a4101af630331805a5fcd836a121a4a2c8448/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/c27511f8797fe351938d1bcf3838bf3ad7ca8d9c/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/6d018fa1e318aa35fac3a8caf471fb1bd2d760f9/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/76036187f94cb2c0be67353e1ce427eab853dbce/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/61ce105e2bd5b3845f10cb58fb2746dcd7a6b346/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/dcab579f531703dce0f6fda007ec586ea2761c74/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/918469e942e11992c2e538443d30b6635c25f8b9/
      i686 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/2e5e59078a517601fead690d833795e5c4639a24/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/665a1e5f972785d8d3faddf2b4add5abee8331d5/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/dd5e8af3bb2c2d387b69e44164ca67e146e39a2e/
      sh4a |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/a90bc2c5a57fa5cbf46b22be0b6288a3d6e37ed5/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/9ea601773baa34b0987a77112fc55aeb6d31ed63/
  mips64el |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/b9259e991145805d9b08905124ce407bb2a5c370/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/eda2d94c6d180bd09f84ff12009bb70624e6e4e1/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/f0533f1008aba8ddc6a2003ccb299466bda3ef8f/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/2f7bb39e6fd7029e07ad41e0d46784a94af461c8/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/3e70153e0186d128bab8a2094b83862eb1fb1ba7/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/67c68a6a1c35d47180c8a3c0aabe6e8a4d21f269/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/f6d6994746a3653b41645e6cb016550651aa1796/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/0bb000709a3df86b91a755ee90174ec6ab1bfbf9/
    xtensa |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/c4b563447f4e9754dae98a194d523da9d7aaba47/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/67d8c8323107b141ba76cc7ae4b5f54b576ea6e0/
   powerpc |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/100a8165c183d6f88b934b520bd5ff132d55f6d1/
       sh4 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/ace5f100a0d1691997ebdc03c9aff05c6d25058b/
      sh4a |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/7e5be571b20c6b18e788369723d1dc540fdb85c8/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/e4dde177528ba34f2c59635ec4c0ca092091f042/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/d27230990683ccfa4d7fc6a9da78d2e19fa80420/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/f36abab4c1f5ba1dbbda6a2c1b1acdfffb91287c/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/1368bfbad0a59712a9532352ddf5be3a04fe055a/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/7cccf5ae2f7a989aaf77aa60c65d1b96d5ea8cc2/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/eb885e998f2361d5e1c3300a2362a0eebfc99d51/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/91653d8374fe0eb8ab4303b68b2ea38096fbe379/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/20cc5c54116f25bf795b278d7502d90ee4ebb046/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/6601bbc794e3974f69de2d6e1bde180619d1b53c/
      i586 |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/9ec701f8c1dcc279ae8682a21067062de9b406bf/
       arm |                 polarssl-1.2.8 | NOK | http://autobuild.buildroot.net/results/36c5def590e19b8b834cd374091dfe1fccc100a6/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/3e86f2f96896471537ea8d0fe8a1e9ec9bea23d8/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/33bfd46de465719f0793baff022ced1788c9f99d/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b1d57bdd6bc9e1c9f07ff5cb85515494f746c4b3/
      sh4a |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/8f6e0e7a9337a9a46d71e79bd331f3690d28f474/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/daafd849bc049eeb41e19c4423696014570110ec/
       arc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/e868b76daa9bf79aaa527feaadd8518c37c0dc5e/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/33e2817ab27716ea3ae3efd0d5713f1bc088429e/


-- 
http://autobuild.buildroot.net
