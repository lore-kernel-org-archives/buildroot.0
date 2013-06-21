From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-20
Message-ID: <20130621063004.ED27852C0F8@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-20
===============================

        success : 90 
       failures : 60 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 8 
                 libffi-3.0.13 | 7 
               libglib2-2.36.1 | 3 
                 libnspr-4.9.6 | 3 
                      qt-4.8.4 | 3 
               qt5webkit-5.0.2 | 2 
           imagemagick-6.7.8-8 | 2 
                  connman-1.12 | 2 
          host-protobuf-c-0.15 | 2 
    enlightenment-0.17.0-omega | 2 
                      fbv-1.0b | 1 
                  gnupg-1.4.13 | 1 
                 binutils-2.21 | 1 
             tvheadend-5513b44 | 1 
                 libart-2.3.21 | 1 
                valgrind-3.8.1 | 1 
                    systemd-44 | 1 
                     m4-1.4.16 | 1 
             bluez_utils-4.101 | 1 
                    acl-2.2.52 | 1 
              vim-699f8d8f096d | 1 
                libtirpc-0.2.2 | 1 
               libsigsegv-2.10 | 1 
               ruby-1.9.3-p429 | 1 
                 dmalloc-5.4.3 | 1 
                beecrypt-4.2.1 | 1 
                  poco-1.4.6p1 | 1 
                  prboom-2.5.0 | 1 
                   dbus-1.4.24 | 1 
                libiscsi-1.6.0 | 1 
                  ne10-88c18f0 | 1 
               openswan-2.6.39 | 1 
                      bash-4.2 | 1 
                busybox-1.21.0 | 1 
                  iozone-3_414 | 1 
               alsa-lib-1.0.26 | 1 

Detail of failures
===================

  mips64el |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/efede44ea77eda6e5d0baa9f60e7183007c8442d/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/32cee1aec0713c690fa5e2a3bf55d84caa0ba095/
    mipsel |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/233dae7a7e7642e7942765baf1b5330a06ab7a42/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ff0f52838e0efb08d7a6979f987cc6c154752065/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5ae8e53e20850fd90419b5804aad3432d1e932a0/
     avr32 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ec466dcb14769d670a648b89e42311e6167a9b1b/
      i586 |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/6dd781055922f78cb88461190b29185cdcadf75d/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/c8e567edff734535014c6d5c7685cb106eb128af/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/83b1e8fa43fcecb8fbc5f4a64d0f08366451f407/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/f76e35f384967eab4cc03a11aedb4e570219e67d/
   powerpc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/59bb8c6ed1a95e9b203ece9f43826077f36f15e0/
    xtensa |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/828ed63c105cf1017a4c224959fef91c00ca4351/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/81929612d68dab0036be74758c7c9356a83e6427/
      bfin |                       fbv-1.0b | NOK | http://autobuild.buildroot.net/results/ce5fc11f654f05125633d13b5b2fb817e8de95b3/
       arm |                   gnupg-1.4.13 | NOK | http://autobuild.buildroot.net/results/66fa2a163bd0bd595265341730c6eafebf6aa95a/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/bd6e696d39ebd22cc28d22258dd438c89ca373bc/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/a912afc17be0181a1745dda9cce13fc790c802f2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/40fdf07bb4b413cb49912d2e1f9c3d94b6fb499e/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e5a38abbd4e5c30368341641e69d79e914fe4de2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/0ee4ea7c2054133ffb9da4217f0c41f1671a0bf0/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/9e7e94086c6516d337e6cf52fe1b038c5a1ddd90/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/be246d0cd38252b0fabd8731868b4d717802b7a3/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/81f0106c8873c398a20e50ad3b6c94b34d336cd9/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a1be18127920e788631f85c8db09e2692b3bceb7/
     avr32 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cd4e47c851e580c094da8a39a8f10d65d062cf28/
   aarch64 |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/87ef4ae351c0b818188c7ece44dccf33edd5054f/
   powerpc |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/c7dc03a43a5d5c6731aa095aa7b43d784464a1a6/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/11306ab982cfd38ccebd0815bd5b1453c1434ca2/
   powerpc |                  libart-2.3.21 | NOK | http://autobuild.buildroot.net/results/8197cc12800f43b92929701c829610d76d4cb755/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/042ad2bfd07f023a264c0b4b225f87e9c9f37992/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6490f5efd99f7cda15630c89d4af0ae83eb5e41f/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/bc91a60207819cf3c980b2054be86155f32c17b4/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/6bf1a22f278a9d76e8f446df55ac3eca8cc1592e/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/4850b0a27f2b5fd68de84f008d6e1cf363b9bf1b/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/e2107f67f2c7293ff29f5a2880253d2c5971c2e4/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/33daaa8dd5a7df4950c1ea51138deb4172fdd3d8/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/819a0a8a1ede603ed6c8ea6222aadca1984b5688/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4ade22d3a290544ff8608b5878ce52e864556ff9/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/644436d80fff644692e561f0a6a1a1a84ba2ddf5/
    x86_64 |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/32a5ca22e68e50f10c05f2467e2ae8ccf351ad65/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/30f688a488c2e5756f3e6a389bb67aaa36edd1bd/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/e8034012fbd4d80c58cb22c5ca773e4832369d98/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/0c75ac0a361bd8eeee8a232e6a226209b4d3aea0/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f58b1154d660dc59729568049240f4b7841d1ce6/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/f75e6ae113f805f470b04e79edd50d0a40bfabb6/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/29c7e3fab78adeb7d70415a9b66264f93f28216f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/efaccc16c799650a8199931fdde708b9e6c88662/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/4690b045c5d429bf9da4b3d191abbd5659a5a53f/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/371f9f92c763fb3c63c3ad1f7b5042bd3e1a2cfd/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/55fcf647cec2268b5f035f62a6b342e72e8b3bdc/
      sh4a |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/b97ac9d85521a743a0f0f8341a51d082e52e8692/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/7c505fe0935ce60030367ae1f065aa2ffb4316f5/
  mips64el |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/ec132ccb515fd63b65761103e7ede428f9a36667/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/5f1fd6bd488ef7b4e9b6a4a32fcb6c219d772b37/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/85707be030b0f9c045cc4f2ba959c13f41047f35/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/2da159363edaf5f0c42265116627a1a3a8c58983/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/da4668108aad6c4f9b20012f8dc0baa608651af6/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/8432547ba779fe215abbc3a9db6df80bcb1879ea/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/ab82acdbadf23620e369bc4da08619163dadcf21/
       arm |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/62b06e1043d30fbe25dbe86401a17a74ae6d7913/


-- 
http://autobuild.buildroot.net
