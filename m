From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-26
Message-ID: <20161127073007.32B5020A4C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-26
================================

      successes : 187
       failures : 19 
       timeouts : 0  
          TOTAL : 206

Classification of failures by reason
====================================

                  guile-2.0.13 | 2 
                  lcdapi-v0.10 | 2 
python-libconfig-b271c3d9da... | 2 
kmsxx-bd5f6471e619a6ba2987b... | 1 
               libdvbcsa-1.1.0 | 1 
                libmad-0.15.1b | 1 
                 libraw-0.17.1 | 1 
net-tools-3f170bff115303e92... | 1 
                    php-7.0.12 | 1 
qextserialport-ada321a9ee46... | 1 
qt5webkit-b35917bcb44d7f200... | 1 
          sane-backends-1.0.25 | 1 
                  stunnel-5.36 | 1 
         systemd-bootchart-230 | 1 
               trousers-0.3.13 | 1 
          usb_modeswitch-2.3.0 | 1 


Detail of failures
===================

         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/3113d64f7fa4110fe0dc99a9bc2d6f5e495b80e9
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/d8e3a291c7eb1674ef146d59e3baf8d25e5befc5
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/443a003d8ef003f764b18c82ad79cbc2ea21bf59
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e6b3885d1f213e197543d0d75702a5458a4a6b6a
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e52f66c3720a8c6ab9dfaa08c082bc32bb9697de
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/e6d22f5e0258c7ebb8a3ed39c11e014c721cd219
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/3d38a2c9907f95db5698d10ddba7c29dbddc41da
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b5b3c6ea730ebdfdcfcc737f3b026e60f318c064
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/f2e548df7e1b23edb4e599427589d4d20ba6c414
        m68k |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/4abb92b11a338a41d0450d0e56e827f18e79b497
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/1f596480543bda542f88be9a7566d56e29f6a76b
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e67ddb828e44e17b05b49ee0d42d555ddf967ee3
         arc | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/187ba9b93df244d014d232b3b7162c69deb267b4
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/b91949154b7cc535963f68b1dbd49e5cac779a29
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/366979d0bd21dc2bf7f0336b9653ef3fd4e11123
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/099fdd761daa01ddd040c199832309075f406dde
      mipsel |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/e5df8d11bfce4ba7a4c5c760b4784c31c506d8d4
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9560d8ef1b3e219ea45e7d10d1eef89a8cc510bf
        i586 |           usb_modeswitch-2.3.0 | NOK | http://autobuild.buildroot.net/results/06e6f510415933b55eb8814284f63109dace3402

-- 
http://autobuild.buildroot.net
