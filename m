From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Nov 2017 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-04
Message-ID: <20171105070008.19FC6206A4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-04
================================

      successes : 189
       failures : 54 
       timeouts : 1  
          TOTAL : 244

Classification of failures by reason
====================================

      host-uboot-tools-2017.09 | 10
          usb_modeswitch-2.5.0 | 5 
host-vboot-utils-bbdd62f9b0... | 4 
                   mp4v2-2.0.0 | 4 
                      qt-4.8.7 | 4 
                  ffmpeg-3.3.5 | 3 
       host-go-bootstrap-1.4.3 | 3 
                   jimtcl-0.75 | 3 
             dbus-python-1.2.4 | 2 
             lttng-tools-2.9.5 | 2 
                ussp-push-0.11 | 2 
                  cc-tool-0.26 | 1 
             core-dependencies | 1 
                      feh-2.21 | 1 
                  fwup-v0.15.4 | 1 
host-google-breakpad-7515ab... | 1 
                       jose-10 | 1 
                 libdrm-2.4.88 | 1 
                  libpjsip-2.7 | 1 
                     lxc-2.1.1 | 1 
                 mesa3d-17.2.4 | 1 
                 mplayer-1.3.0 | 1 
pdbg-77158819158d1d7053a737... | 1 
xfont_font-xfree86-type1-1.0.4 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/253a1a6ec12dd46e556a3c1d1ae2a84b13abd48a |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/bf5934407b7ae85270881cf143889c437564f70d |     
     aarch64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/3bd5757dfaa2d148fa70d1d23179bd305a2db7d9 | ORPH
         arc |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a6d8853 | ORPH
    mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/ed3b9fb8d09cd677af4b8825566877c552926ae5 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/6aba911342eb14868302648dafbe096619a3f9c4 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/23d753bb7d55f5c2d01f32c8e1f50598dfbb169f |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/aec300d7d4472421398a24202d6871c965bd1be5 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/9535a071d7e565fb22f5238a080c66da6af94cd4 |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/0b3e077185a99111b85e8f61cd39b9520541d956 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/e9a7e79876ef77a45148fd6444d68958b548a297 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/00e079e6e05611e55e3229d61cd658e2b7d2d325 | ORPH
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/3bf80b5031e3964fbc9ba92cb763fca26cba7b3b |     
 powerpc64le |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/fa3870a1d48a8ca7f9395a3b807a7aefc3a8a69d | ORPH
    mips64el |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/613d55cd2430d7ed0735b41659e2cb46ebf5932d | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/669b0614c496b6bac844738152c67f05e2943947 | ORPH
microblazeel |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/6c9d2a7087c314a3a378f024e877dab050f3f077 | ORPH
     aarch64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/dce9b1b611375fa0aee65b722e76a34defd0be7b | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/bfdb0a6e50893a0053c5c3cc9bdcb8d58b68adc7 | ORPH
    mips64el |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/fc9980e1f4d4378b090df2c9261f0254ff5a5e8a | ORPH
      x86_64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/aeb61b91a9ae0ba0bdc9b8c7ed8706045017dd39 | ORPH
      x86_64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/a5ecde851e568cafc5264bd4ecb19a87c0d8f357 | ORPH
     sparc64 |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/6be34b252ef972ca82bc8f06ce87adf86bd8408f | ORPH
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/55311371f188c82face88020f8b4f3b8ab11e505 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/da3a95466413094b91ac80de28d5381d51ac9dab |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2c79cd287a865ae7b9230df5fd9f67c3845b8ceb |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f5e9e76932d16e5a48a3900b12285658ac25559f |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/7fecd4b858cf1472c5159eff17654a3fc0b25fc8 |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/5db6c6c5b14f81317a246ca14d25da8673907fd0 |     
         arc |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/a2a45cfb6052265d539a95cebd91270bd21420dc |     
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/4804626763f91ba86075a5c34d2eeed15ed1933d |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/40f89c9a004d73ed31fe7a61c572424e27c24626 |     
      xtensa |                   libpjsip-2.7 | NOK | http://autobuild.buildroot.net/results/c47ccbb9b40011cf0d79c7040bed061ddefd9629 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/1ec68d36460e7f2dd98d9bcb8c89d86326302f3d |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/99bfee5ccd45c945bd607c3a8c0f972338133efc |     
        i686 |                      lxc-2.1.1 | NOK | http://autobuild.buildroot.net/results/abe668606b4e22540ece584465b3b6b818c7cb5f |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/d5073dea96a79e2c95251c304dd02c7c3b5a0616 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/fa7b5d57e195d7fe436bcc64f0c92657d4080d81 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/60fdb64b9db5fa9247ef4da3c14762b6f0174962 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/a988f92d73ac8aec28f3bacc8329d47d358e43a6 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/9088aa8b4b0adbd1748c6ace5666b52b512bfeb0 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a204f9841e06db0b0d96a1674b53e80502b5e7fa |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/5291ea8367c87b4383d85e83ee7cf18c8f34b948 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fe83c3d271f0fbd671e381ce6ebe89ba03ac1ce8 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5e12f19d90b06842638dbf1708296a8672368f5f | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dd50ed1ae43469274bee94c39409def27c0b46ec | ORPH
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d4fb78b9c80e9b3e110a206ad4c70d74c8d18034 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/0fc39c9ea18a9734c7a76c677506d716951cd6f5 | ORPH
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/9e7b05937df18eedf2eff42ae05ac0b26a8311ab | ORPH
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/06beecde39e3fc342ea948f19984fc50935bb195 | ORPH
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/0d859b9b98961e7270ac71512c182af65c452b96 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/4ab8ebdd445fe1cae114d6ab6b72c91b73e8cba7 | ORPH
         arc |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/12ff4ad90a7ef6cf366dbaaf9a0fe6487b29add1 |     
      x86_64 |                 ussp-push-0.11 | NOK | http://autobuild.buildroot.net/results/8446121b9ccd290c7e5e0ca6d9e9b1a242d2ee86 |     
      x86_64 | xfont_font-xfree86-type1-1.0.4 | TIM | http://autobuild.buildroot.net/results/6d86f09dae50ea236633dedfcc6b9290332eed84 |     

-- 
http://autobuild.buildroot.net
