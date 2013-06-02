From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-01
Message-ID: <20130602063005.1ED1652C109@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-01
===============================

        success : 106
       failures : 44 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

               sconeserver-211 | 4 
                 pixman-0.28.2 | 3 
         host-gutenprint-5.2.9 | 3 
                 libpfm4-4.3.0 | 3 
                libtirpc-0.2.2 | 3 
               libglib2-2.30.3 | 2 
media-ctl-ac40b79f002a2315f... | 2 
               qt5webkit-5.0.2 | 2 
                  iozone-3_414 | 2 
             gstreamer-0.10.36 | 1 
          host-protobuf-c-0.15 | 1 
                 zmqpp-31220ca | 1 
                  fbterm-1.7.0 | 1 
      gst-plugins-good-0.10.31 | 1 
             bluez_utils-4.101 | 1 
                      qt-4.8.4 | 1 
              gettext-0.18.2.1 | 1 
                 libnspr-4.9.2 | 1 
               czmq-cb9839cf90 | 1 
                 libiconv-1.14 | 1 
                    acl-2.2.51 | 1 
                libsigsegv-2.6 | 1 
          qt5declarative-5.0.2 | 1 
               wvstreams-4.6.1 | 1 
                  boost-1.53.0 | 1 
                 openocd-0.5.0 | 1 
                  gamin-0.1.10 | 1 
                  ne10-88c18f0 | 1 
                      pv-1.2.0 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/1d58b7742d576928703dde201fcef59fe3604ccc/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/87aaf49b88728d91329d22df139b19cfa87106a5/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/ec629cdd21dffd35b7f96975b1a650addf7f56f5/
   powerpc |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/076d9be5afe1934600b91ffeeb5ab5eeea4cd2a4/
    x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/3e98201162a38e7e1a6f84ef0ef8a559a8d8e679/
microblaze |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/3c32f74fecc93e890651154689cf5e07fa6212c7/
       arc |               gettext-0.18.2.1 | NOK | http://autobuild.buildroot.net/results/c67af8e9bb50053df2adfd5f8ea75e2ffa22f033/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/0c46c3590540a162587d5472670e6473a7d5b0bd/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/d9d96014c26ebd119c4d15a442cd44cda5ce7654/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/623407da5da894b2bc1999d93c4276f91e4ff2fc/
      i686 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/9740afd83de29af076f4f1b9576bb9d734fb9efd/
       arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/72a6eaa60b5163e5eadd8566dc637bef5fa02935/
    xtensa |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/6bed30fceda08f0d6b845fa6b5de2ea2dc10d63d/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/bd75612e20c9ee5dea1348ece4a97f185693227b/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/5477a147d4f159793c56645a1d344f27a8a1c352/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/f0df7fa9a78d9ecdbee2b38048dab5b50ccb24aa/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/16856d7925c25acd28e1a813d4af589812071e37/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/a904ffec91d78047eca59efcabafb4dc851b32fa/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/0ab06023b495c1ecfbef5bf9c1f177913f38bf34/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/54468560e4a9662c7c261227db97a04ca50b5198/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/ed369b738e735d6ffc57cff6d60a16a6d1138176/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/e3a9da6d233b8f1b4fe58cc36ec3cd397919ff15/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/f6c6b2a11a5827c212223d30aee083f511a43703/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/924ccf7cd2f748cd3d29cec7bab876252786e5fb/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/eef57c1b3cc14a282e533651f9470ac8f37ecc2e/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/ebf54c6aa27762dfd04dc36c553c52a216d048ab/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ab6f406719d8ba2c9cd5fc54d12aa9b332169c40/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/3e55a1c2c965aee268e7ae3ef405b9578a5c0d8b/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/23df96d593dde120469d35a5517585cb2432cce5/
       arc |                  openocd-0.5.0 | NOK | http://autobuild.buildroot.net/results/0a7209770dc3c506f3e538b293057316b175d3ca/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/188b4385782973391d379ee31eef7ccba9e2cc5c/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/54b8acdab3346eb898e244e1330b604572ddbdf8/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/71e85f509ab39f2e716bf7a0fef2cbd06114c7d5/
  mips64el |                       pv-1.2.0 | NOK | http://autobuild.buildroot.net/results/5df7f155eca43c66a4880739826ca146aa19be4f/
       arm |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/4ba41ef171c627c541a758e35fa4d3ac0ea2bce3/
       arm |           qt5declarative-5.0.2 | NOK | http://autobuild.buildroot.net/results/d56448941118cf63b959d0045d1915dd9f092d7b/
      mips |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/c273985557ad4012a91f8f04b9c677df24570e36/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/8d2b99fa58737a1d60988ee8f3fbc30bc6787018/
  mips64el |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/2d0756b617ba3b3790c451525baa5a52ecf6769f/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/270cfc6d5effd85ec12194ae3e9e5a7018d87174/
      sh4a |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/e37177a7034d14ceca031389879ef7ae0d2f95ed/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/d0d7c1ba8bce066450b2cd276e3c09624a1cf545/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5624fd078f34db49ec9b5a259eea334e82a91ad1/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/5aa26f062301357571691e8b473787eac82212dd/


-- 
http://autobuild.buildroot.net
