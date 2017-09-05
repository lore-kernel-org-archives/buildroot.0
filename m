From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Sep 2017 08:31:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-04
Message-ID: <20170905063132.B9242208EE@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-04
================================

      successes : 180
       failures : 69 
       timeouts : 0  
          TOTAL : 249

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 16
               ifupdown-0.8.16 | 13
              libtomcrypt-1.17 | 7 
                    gawk-4.1.4 | 5 
                  stella-5.0.2 | 4 
                   luvi-v2.7.6 | 3 
                  boost-1.64.0 | 2 
                    efl-1.20.2 | 2 
       gst1-plugins-bad-1.12.2 | 2 
                     mdadm-4.0 | 2 
                 mesa3d-17.1.8 | 2 
                       unknown | 2 
      host-monolite-1050001000 | 1 
               linux-pam-1.3.0 | 1 
        ltp-testsuite-20170516 | 1 
                moarvm-2017.05 | 1 
           modem-manager-1.6.8 | 1 
                    qemu-2.8.0 | 1 
          shairport-sync-3.0.2 | 1 
                 vim-v8.0.0329 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/acbd9e07089e1268b90acc10313eeb3c4ad22062 |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/de3c22dbba71d928cd6bbf91d71b023db680bb8c |     
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/fffa8d5d4b884a4cd521eb841ce538062d7aa7d0 |     
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/1064e3e8b9df97c67241ce43368ee674818f7d18 |     
         arc |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/615374e1a0513c477c6e2743318a50534b5aedde | ORPH
       nios2 |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/c5184df9dd947f3f87a008250a0b7de55b5e30bf | ORPH
      mipsel |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/e1255fe772a7b9c7d4ddf62c760c023b332ab4ed | ORPH
 powerpc64le |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/0237b1ee4272d2ea425bdb7f221645f6e3fc0aa7 | ORPH
       nios2 |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/e29cc25d00c6f5ef348043bc1b7b35dfc033a4d1 | ORPH
     aarch64 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/67cc56c3ce036d4988d37d3d31566ed42fc7bd5f |     
       nios2 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/698049a250f276e4a551ed8542733986cdd6982b |     
         arm |       host-monolite-1050001000 | NOK | http://autobuild.buildroot.net/results/e544485505ede4392c33ee4de0ff223a37b14700 |     
        mips |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/b0ccd645b1325cd92433f80c0a52432dac83afd4 |     
        m68k |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/e20a11bbaed217343750c18d8861e0ca169aa200 |     
         arm |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/c7c2d50844bb72d2efd21a547152ea42c555ffa4 |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/9d3a1daeb534b7e52d9a502f833ad15d09321204 |     
       sparc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/a95bbd87bd9a2b692d1941473cbf3f91271fb746 |     
   powerpc64 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/bf8b658d50646bc267336cb61f44d9afb38953d5 |     
      xtensa |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/c9883c91eb96b819637f4f51c65bcb78f25470be |     
        mips |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/ddfbaa0090fe59f7c82d6619e2709b8e7d29e192 |     
        mips |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/18523a68ae6879066a2e7cb15c42d8579342d04a |     
         arc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/869e4a28d075653289f4aaa75c3e27e770c9ca1d |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/aab29b6f15438f08daa6a5915622dc2129a82de3 |     
       nios2 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/e63e30cc79fa9f908e05ca4780d4aa84c350c08b |     
         arm |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/e497f3dd11b8e00d58f35fb32dc5b8706e3ac27f |     
    mips64el |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/6f99a418bbfa86ad47530359614249cc3bf45d37 |     
         arm |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/a760063f05ae23f79920bc89ffc37e7dcf77aeab |     
         arm |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/922f1f74fa61bb66ff1dd4bced35ca5880735398 |     
        i686 |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/64531325c4799ea1342790b23a3d240be7fffb05 |     
    mips64el |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/2b5e7b803f48cd02a6cda17af0a97855812a2461 |     
        i686 |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/ae55bcb6643ff6293d2199521f5aff5fe6cee3f1 |     
    mips64el |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/2553e55fa780050e537f56230994be31efa5baf0 |     
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/88f4cecd7e2844701b0e75279c112e37283fc7f9 | ORPH
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/ebfe7e1ffc543562b58a6551854b0654e0172360 |     
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/26d04350a761d362f40e7bd1ac09b639d61de91a |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/14854cfd812a11e88da45b94422e8a4cebf5dff8 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/2b40f90f97824cc463ef4b495bc73a31074ed1e2 |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/f0a271e3f03797a85303499cc28a7001cbe7e151 | ORPH
microblazeel |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/163ad5a9f976662be8ca8664f91254f90fca8439 | ORPH
      mipsel |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/f152c67cd0cdd2d184b8692b40fa3edbf8411a1e |     
      xtensa |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/210a852749ba62439a2a12d8d94a64ba8195fa44 |     
         arm |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/78c9bc9a21cfce48615b70d80b25dd4847bd803b |     
 powerpc64le |            modem-manager-1.6.8 | NOK | http://autobuild.buildroot.net/results/2f40134531493a8f48a01e1a0902115b1050cd9f |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c6853c2d06d99c5ecb4f0b4f1252233487173c08 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e038bf743c1b298f4b1c00544505b342a4a0d506 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ab2103117e1685f93bed884a7e85ddf1b6c129aa |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/53b822945bdf61f027c98643cb8df77eaf0a215a |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/19bf0b092e5d129ed225d6513820642f008f4421 |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4f58a29eac2f4c055eccc5cde5180de0fe818bea |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a5b025e56cf8a207743356ab0c8e07cfa76d6ece |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a87ea01743c1a8e34a53f40f697bd6b603ce990b |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b6d912f9bca56e966e3991694c42c631c8111a23 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c2a096aef3b123dea2f03dfe9f4e9b8e9909c7d4 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c69488a975d683fb8173f3149c3bb493dc1415df |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/915c04310ec5f089c8a3104ff96c73a69dddf1b9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ad1cf18ea484bdc16200a03d30f84bd97ae1aa8a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9097d8cdf556d432cb6ac2ccc16793c2b8797644 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/91a4e6de625188f681dedf83e7ee68bd671e5d97 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6478d350c22dd3349c5f285a5a28a51fcba6af6b |     
      mipsel |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/7aaacf2f121c3dce52e04a66f90d1ace4f6351dc |     
     powerpc |           shairport-sync-3.0.2 | NOK | http://autobuild.buildroot.net/results/c9aa3922ef7c3d7884057e607c5fda22a39d06d8 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/01b39c5a537b757d029811a046d3238a29163318 |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/a1a99d9d29191802d2243a72b30ea681fdee68c9 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/8875895c9eba0c38564e10db01b789ecc92565c8 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/3ac4159ba89c2a80777427cd0d95f63638e8d5b4 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/82b925c327abbb71484c1bfe39359569221d8763 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/eb26ae319e1b599d10243757469b346ea18fbfb2 |     
       nios2 |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/521e6cf21ed830a576e1f8c7ae4704e7d8c0230b | ORPH
      xtensa |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/fd38b7e1b72c2f63b05116e0da211340599be2f9 |     

-- 
http://autobuild.buildroot.net
