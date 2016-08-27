From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 08:30:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-26
Message-ID: <20160827063042.A8059101869@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-26
================================

      successes : 205
       failures : 51 
       timeouts : 0  
          TOTAL : 256

Classification of failures by reason
====================================

               domoticz-3.4834 | 4 
                  lshw-B.02.18 | 3 
                   glog-v0.3.4 | 2 
                 jack2-v1.9.10 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                libaio-0.3.110 | 2 
                    libiio-0.7 | 2 
           libvncserver-0.9.10 | 2 
                    qemu-2.6.0 | 2 
                     vlc-2.2.4 | 2 
               binutils-2.25.1 | 1 
                  cairo-1.14.6 | 1 
                collectd-5.5.2 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                ipmiutil-2.9.9 | 1 
              libarchive-3.2.1 | 1 
                libmpeg2-0.5.1 | 1 
                 mesa3d-12.0.1 | 1 
                   mpd-0.19.17 | 1 
                    mpfr-3.1.4 | 1 
                    norm-1.5r6 | 1 
                   ntp-4.2.8p8 | 1 
                     nut-2.7.2 | 1 
                 openal-1.17.2 | 1 
                     php-7.0.9 | 1 
               protobuf-v2.6.1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                      qt-4.8.7 | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
          sane-backends-1.0.25 | 1 
                 synergy-1.3.1 | 1 
                   ushare-1.1a | 1 
xfont_font-xfree86-type1-1.0.4 | 1 


Detail of failures
===================

         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/7a4b7c2f6c47d66993f3382cc1290d6c0aef697b
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/54bee2ce382fcd067965d30f758f9d15514478d9
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/d783efeb74e58d0c7a69391c5196f0a055fb82bc
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2eccc0156052b7de9b76d84507c52bc3f73beb60
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/5d63019fd37ffa25274c810c030c0aa82d64ab38
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/f8a8a7a34e65bb87609a13493bf0d0bc755768ce
    mips64el |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/e9f7a38ced87caa95783b83db8c434760b676065
         sh4 |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/90b519d7631a400d5cad3428748daf4acdc8d223
    mips64el |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/a0539b3551d482411dd4bcd5c9b8c89f77e68475
      mipsel |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/50aa42f6000a4a4298348212b13f9c211e1c6e22
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/35dd8887467500eb4f2f0dc4a32bdc183a32c85c
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/06d18d80fc873242a713ad60b44b389245001dc6
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/250951ddceb088278ce9910420418edfc0a757a1
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a07158005391130cddbf6d4eb4325d32fe2af6e5
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a00da8f45c4da7d865bf92bc87a8e269862364fd
         sh4 | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/b35c6815c2af370609c65d6e3e0b2cb316b46bfc
        i586 | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/f3c48da3a9706cd366c0e0a96c3cd0ff959f2a78
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/a743ac4852046c3de88872e4d856104f61c88897
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/95f67f3593bfd3fda7fc80002b3158491bd9c28c
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/40a66b73f8a0711627f719f7451434fec26dc79d
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/8fa72c25ca835afa5bc1995fea0140213946fd35
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/8bdcf125cf5c2bed49d0295607c7d696902eda4f
         arm |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/ce2fc81466abd9619aa104c96234d1455de3480d
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/b7552c9325ffcc7f1cb6e114b82648f3280fded6
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/596b786befc2332d9608a7fb1a3a4a6fe6a8b54f
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/463eb8f94a424fd091e8f374c4053b8ae6b6367e
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/f26e895d05e77f3a3cab19e24ea9b7ff55b208ee
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/320f0648860c79b5fc8890b85e75a05dc1d1bfeb
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/df0b93a9391a9ab5f52ad13d128c0c361df7a5f2
        i586 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ed28d932bc0e1047ffd76ab844399ed592d0fa28
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/5ccb47e2af780982d71d924ef30008f16573ad73
         arm |                    mpd-0.19.17 | NOK | http://autobuild.buildroot.net/results/70ba47e04d1fc0d2379bf1ac7aab4c52d6193001
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/073a0e467774ebaed95c81e6ca1b1afc80ce129f
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/9c7130d5b5aad218c5c576761d495a3f403fdc5b
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/bc179666f458e3a0620438c376a34c8ff02e7bb0
     powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/884746351fc47f4ad19fb3fda7c5e0ee85fcff15
         arm |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
      xtensa |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/ba8dc169219afce837ec91e471d063df78e4a784
        bfin |                protobuf-v2.6.1 | NOK | http://autobuild.buildroot.net/results/8e00800d918dc01a7eaabf81011aa0fe54a4f2de
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/aca491eb34de0f96f5277d913c35783e8fa93796
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/5068e78f04eb17f06d08c4028993c4b7f7fedf5d
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/c4597e05b396c8f933f5b6a81cdc38c054f84f2a
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d2438d6c945dc56abcf3f851a7c8bc7f3bf0e2c1
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a419c87d7955a2b5c0dc97724b6d2fa4718a247a
       sparc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/1460cef85dd7de07976e90f404a59615200fb72d
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/d6d212024cb9adee994d4f7bc608da8bd86b96ea
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/0f8a703866afed935a5de82200b283137406c823
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/d8df27236c21449afb726f09e06de2d2c3365e03
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d9426eac0e280b965ba6eb416eaa9c5f45b73509
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/14248bd827f8837bd8e668ff59eae8a12545fba9
      x86_64 | xfont_font-xfree86-type1-1.0.4 | NOK | http://autobuild.buildroot.net/results/4c3fd50ec2b080bfc905ca1eaff75deaf6cfde34

-- 
http://autobuild.buildroot.net
