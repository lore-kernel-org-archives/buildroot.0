From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jul 2017 08:31:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-25
Message-ID: <20170726063109.440C420927@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-25
================================

      successes : 179
       failures : 25 
       timeouts : 0  
          TOTAL : 204

Classification of failures by reason
====================================

               qt5webkit-5.6.2 | 4 
                  nginx-1.12.1 | 3 
             gstreamer1-1.12.2 | 2 
                   mp4v2-2.0.0 | 2 
     python-cryptography-1.7.2 | 2 
                busybox-1.26.2 | 1 
                  cc-tool-0.26 | 1 
                    cups-2.2.3 | 1 
              dieharder-3.31.1 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
                libressl-2.5.5 | 1 
                 libssh2-1.8.0 | 1 
        ltp-testsuite-20170516 | 1 
                    norm-1.5r6 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.9.1 | 1 
squashfs-3de1687d7432ea9b30... | 1 


Detail of failures
===================

     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6532213641212c146cfb3489ab16f45bc4dee7db | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7b7ffa5b514d1009993420ef6dc20895a9ec32f9 |     
         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/79c14453ef3b94c7f6593c1cc8be9184a6af4937 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/05ad50d39e64dc03ae78b38caa63c80d4ff6f775 |     
     powerpc |              gstreamer1-1.12.2 | NOK | http://autobuild.buildroot.net/results/d8f27b6b3a810ce768063ecde80ea12798cb66fc |     
    mips64el |              gstreamer1-1.12.2 | NOK | http://autobuild.buildroot.net/results/ae4cd6be20787d76684ca8dbbbf06036a024eef3 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/b5437eb2623e49d9f430d11aa20de5d781a23f09 |     
      x86_64 |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/f6f1b2b2f3565ac6a69859ffeff98336e912384a |     
         arm |                  libssh2-1.8.0 | NOK | http://autobuild.buildroot.net/results/04a7f6613dabbdf65f58d1b342c2497977b67963 | ORPH
         sh4 |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/3c438907ab5c9e41387a3fe6b9f16e1814086202 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/c7b01689f261697e7128b0fcdcd5f1cb096439dd |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/7c38342f253e45263442fc51687104911898706f |     
      mipsel |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/c4b21db818cf4aac0921a84d1e51ee6b9d501847 |     
       nios2 |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/ca53674647dc3510e6cbe990009cf5b3bf480ffc |     
        i686 |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/7a99952eb374a9100f6f1972a7f37e10c05bde5b |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/c631190bdd863ed807453e760a0921d639f26fbe |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/956eee6f76b18ad8baf7e697539a431d403192cb |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/dbe9ec7d4669818bbee41cf22a00db67aecac292 |     
        i686 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0255f38aa57de1da5fd828b718dbcbedadf301ba |     
     powerpc |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/5ddf708218e2b0876394fb01aa98fdc841bd64bf |     
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d48de7c1273e71f14a89d2e78d3bfe2b1250f311 |     
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d864c615c4fe23f849aff28316a478c2a8925016 |     
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/655a6bfb45db738c773b1ff3d50e7dad2bdb1a11 |     
        i686 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/2f381967c82775ad911a246a9607034ef489c1ce |     
         arm | squashfs-3de1687d7432ea9b30... | NOK | http://autobuild.buildroot.net/results/3c5b1d799dce3ba361d618330c242bf4eba76019 |     

-- 
http://autobuild.buildroot.net
