From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-22
Message-ID: <20131223073008.299981011B9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-22
===============================

        success : 80 
       failures : 56 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

             util-linux-2.23.2 | 10
                    ola-0.8.32 | 6 
make: *** [python-pycrypto-... | 5 
         dvb-apps-be76da69f250 | 2 
               alsa-lib-1.0.26 | 2 
              python-pyasn-1.2 | 2 
                      icu-51.2 | 2 
            python-crc16-0.1.1 | 2 
               audiofile-0.3.6 | 2 
                   squid-3.4.1 | 2 
                      qt-4.8.5 | 1 
                 binutils-2.21 | 1 
                  thrift-0.9.1 | 1 
                  samba-3.6.22 | 1 
               libsigsegv-2.10 | 1 
                poppler-0.24.4 | 1 
                 dropwatch-1.4 | 1 
             dmraid-1.0.0.rc15 | 1 
           python-pyzmq-13.1.0 | 1 
            qt5jsbackend-5.2.0 | 1 
   host-gcc-intermediate-4.7.3 | 1 
libwebsockets-v1.22-chrome2... | 1 
  toolchain-external-undefined | 1 
               qt5webkit-5.2.0 | 1 
                elfutils-0.155 | 1 
                   dbus-1.4.26 | 1 
             gstreamer-0.10.36 | 1 
         host-elf2flt-20130904 | 1 
                 ffmpeg-0.8.15 | 1 
         matchbox-keyboard-0.1 | 1 
          imagemagick-6.8.7-10 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/55e9aa1890074eb646126103292a1bc0157a8c6f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/80eecc53fbd4a939ee5fb2ed1ed6a43f6d2a18ae/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/b7bccddf866d89495a68f81ff0e63b577ab6b2b5/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/4eb3080966273f5c317c2bee700cd718e33b1c6a/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/40d9cbefd03727af82610412ed0bc47674c44dbb/
       arc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/f486c04861fe6351809cdaecc767751e2b6d0c14/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/d3ab39cd859cc0d2b76670811d5647210ff04b22/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/9ac59fd7ffd7611ad2f227c9363e6edc1ed43284/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/7f69d253ffcdd285ab73616c5748e46a796ebfb8/
      bfin |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/759424be34a61a0ade955e84316b536841391fba/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/fa3546f8d8289a2201570e4bcb77fee42c8e670f/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/60670d35f16c3b8fe19debf7f8e40a046a579520/
microblaze |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/45c91ded2e089aad745c52eeb6258e1c72c939fc/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/72978c91083ffdce5c8386c48e71be9d595ca9ea/
    xtensa |    host-gcc-intermediate-4.7.3 | NOK | http://autobuild.buildroot.net/results/5d6072a038acf894d832704e36c1d43f0254abf5/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/f92c31f31b9eb6d71b9057092e0f948c821aa0a4/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/947336615916611f53584c25dbbb72d606c86ed8/
   powerpc |           imagemagick-6.8.7-10 | NOK | http://autobuild.buildroot.net/results/77a5ae05d599be09de535b8a0bf33e01b8c66030/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/58421474bf76e844027e7a08d6379ac7e20f1042/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/73c3ebf70eab0f50da818871634a2176468e21be/
   powerpc | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/903225e35609c10c40ade8ae9bdf63473746bb82/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/1225850e3c3a95021403adae1db1d34f9f3e955b/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/59bbc735e1045d58560d9237294c07ce3ef38b54/
      sh4a | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/14b2f4f672352edefaeba601a0f468faf58ee1a1/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/2c9df248c0e80a7310497f4c3992d51b61412a11/
   powerpc |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/20dfcdba06861b670ee2572c79cf2710970aeb51/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/9526968ddef78e849ce7fd8883129ce09b6ad48f/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/72f3b7a94c50f6542461718ae4f1e0f468318ad1/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/fc799a9a6c73f2b9339159ddd6d888bc69db0578/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/245b35a502d2e6b076ff2b18307273a5e2e2e19d/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/09651a8b07f984c24c182d118387ed814697a282/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/e425e41e0e76130caa002173791afe1921e5efc1/
       arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/2b8e4c555ec5a96bfde171e8e106efec895453cc/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/208ac116713020d4a4ae95c6ec46da8d6aae67d3/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/519b008b8684e57d869f4b4d7e26d137107cfaec/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/59745136b36ebeb8afa021fcb405f3c6290eedd1/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/fccd7e08cd9d4713eb4208097dd48c5ab25749bc/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/0bda780bf4b759b12edec26ac20b88cde617db4d/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3891d12af455a08203417dc8c4b4be3e437772d4/
      i686 |             qt5jsbackend-5.2.0 | NOK | http://autobuild.buildroot.net/results/d399c08380c1713474cc9d9822af5f396b7d2ab6/
   powerpc |                qt5webkit-5.2.0 | NOK | http://autobuild.buildroot.net/results/ea4e581144952e8ed84f972b869d4aac6678b50a/
     avr32 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/357ac9b06d91460bb2cecbd1224beda1c508e6c9/
   powerpc |                    squid-3.4.1 | NOK | http://autobuild.buildroot.net/results/c7397ee814abf80afc6aa413b47cbbcc2cc92312/
       arm |                    squid-3.4.1 | NOK | http://autobuild.buildroot.net/results/6359137cde3b293d46df732836b8966d30f23cbc/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/47afbf3cf8c1dd389c15db023b18192b1a065465/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9fa7f475619521570860a3120327909daf162876/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ce4373377ede4c540a3c416106548b9d395303ba/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/803f15719fd238f728fab04f40419b0ddf11c799/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/755243b4526b57e4af548a802bcfa6b2913b7b49/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/71de3772584207fd20a425595945b4f16f6cc44c/
      i686 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/04586d6110e2cdb1bcaeb5370f4c364526edd362/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7fe0c79980c671149c518902fabb884e2a948699/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2534a6394a6f747a7551081e745a4988b7ccf217/
      i686 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/08abcbae26e719a83c49bf492a5f14f2dff4be57/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2facdf2e9de9747061b14f78cd47aa5f1d64a9f9/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/469a56e8a939c59b56be85a28be931eac3265863/


-- 
http://autobuild.buildroot.net
