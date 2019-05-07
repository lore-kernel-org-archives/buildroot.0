From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 07 May 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-06
Message-ID: <20190507060043.7F49287A3A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  26 |   1 |   0 |  27 |
      master | 239 |  39 |   2 | 280 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 10
                cracklib-2.9.7 | 6 
                   netsurf-3.8 | 4 
                   bullet-2.88 | 2 
                suricata-4.1.3 | 2 
               tpm2-totp-0.1.1 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
android-tools-4.2.2+git2013... | 1 
                   dvblast-3.4 | 1 
                        glibmm | 1 
                  libssh-0.8.7 | 1 
                   mpd-0.20.23 | 1 
                       netsurf | 1 
              python-pyqt5-5.7 | 1 
                 python3-3.7.3 | 1 
             qt5wayland-5.12.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
                  samba4-4.9.7 | 1 
               wireshark-3.0.1 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

     nds32le | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/63994f51a2b224b66acfafe5b236249d867a507d |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/0ef56a160500cbf05bc79463990f467b7012712e |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/3c249acce9ce87af6f5bdf46923c0a2bf68523d2 |     
        i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ca8abfa88fffcd5c9604a1f7e8435fe09504c7b1 |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/8e159dd6f29174b0d1b0183f035403f26abfa1de |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/eac376aad5746dae3f84f27615c1c794e3925f1f |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ed300956990942b9b30b1f55675202e3df3be747 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/4e8c5fc5da8f4229c60ef0f4f9f64228e8bd1d7f |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/4717dd2ed073dcefbf13e10300e27cc90df3d4a9 |     
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/da78fafdbbbbb4079ada0aee2f783181d11339cb | ORPH
 powerpc64le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/16585190c83d9f03c82afa551a3b4a5e307cb36e | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1602ef9bb1c53211709f3f3a48566f9044e734e2 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/aa6e6f1d876beb653d232f9df5e0c7966454b156 | ORPH
         sh4 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ccdd783e7c6e5f55e86ba22c65837267fdfc5866 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/5fa228147ff6e1ed9dd655ef4b6927f0b56d6043 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8ece9c1c4248edf22ff9ee2baa9fa1e68005b9c5 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4c68d39d4e1c3d8715194aa9b16fb3436fe99959 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/653579ae36822a7bb164a9c223c0298a8dc2d9b3 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b021457eb0dd51467de29cae6002538a56c0ca98 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/ecffaa83e608020ac3642995a5b7ff056d350918 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/32abc04f6a6751dceea184ea504110b4ff0191c9 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/2e05ada8e7313efd2b2ea1ee456e50bce9ab7c20 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/a0396e120be51350df3ef248ff35acae58a64ad9 |     
        i586 |                        netsurf | TIM | http://autobuild.buildroot.net/results/afd3b449750dcdd95362bb6ed4a2c96873334b07 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/19e04486f8deb2ccc2a91982221a41a2338b8e36 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e5073938bbbd27b8e07a75f8e3d76489bb212ed2 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/84ca9162e963e25293a8b363629b5a7bef79ab59 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/b911c6d1011957ff7462c84a971a22f65becf04c |     
        i586 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/501e2971dc5b8a87deaebae4180bfa155efb13c6 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/0f05f2a00d05cdc0fea9389f1594de1bda5a8761 |     
     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/5a793143b19437e5702e6d9624b026abfd530354 |     
        i686 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/68dd6f1ffed49f8e2570f7364e5e635573807d3e |     
    mips64el |                   samba4-4.9.7 | NOK | http://autobuild.buildroot.net/results/af5d7887d546c51d737a2de2eb91c799913272a1 |     
        i686 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/540274de01b18dd84e09e31eaf2609fd244baff8 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/4c4eee2cd63ee7a42ed4d66f182f4c62842820c1 |     
      x86_64 |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/c3972f0eb6a01a8032e4a37a127e6dbc6d6f73a5 |     
        mips |                tpm2-totp-0.1.1 | NOK | http://autobuild.buildroot.net/results/42683d2409fd6e26728f721780c70b62feb534a6 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c2b1637d81b90c51c3acbddd9e9a96ee0679b947 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/eb7404f05c447d402d9a90c087310c9ccbcfd964 |     
      x86_64 |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/2ccb7448f9a156a337394d28d02b51fee18c09dc | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/6d83c0d8b3dab95c054bee257893dea96e82587b |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                 python3-3.7.3 | 1 


Detail of failures
------------------

      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/bacba5173e5b01edb3da39e9c44d7789a64616d9 |     


-- 
http://autobuild.buildroot.net
