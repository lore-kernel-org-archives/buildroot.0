From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Apr 2017 09:15:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-03
Message-ID: <20170404071540.09616207EB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-03
================================

      successes : 132
       failures : 20 
       timeouts : 0  
          TOTAL : 152

Classification of failures by reason
====================================

               host-qemu-2.8.0 | 4 
           uboot-tools-2017.03 | 3 
             rabbitmq-c-v0.8.0 | 2 
kvm-unit-tests-5731572b2ac2... | 1 
                libepoxy-1.4.1 | 1 
                    libiio-0.9 | 1 
make[1]: *** wait: No child... | 1 
                   mimic-1.1.0 | 1 
                  ntp-4.2.8p10 | 1 
                 qt5base-5.8.0 | 1 
                rtorrent-0.9.6 | 1 
uemacs-8841922689769960fa07... | 1 
               upmpdcli-1.2.12 | 1 
                 xenomai-3.0.3 | 1 


Detail of failures
===================

microblazeel |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/4e2bfb4afd810d9d42f6a794cb595854da9889c1 |     
        m68k |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/82b07165a43bcf091486449e2308d71c62eb5ec9 |     
    mips64el |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/d5ced6c9738b285e6fda8c3d41c3c66ee0cf1edc |     
         arm |                host-qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/fca01cc5ce13384df0a7f8fad75e2acd05598f99 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1246ecc9d7bc7f0b141f6499af2fac9014300eee |     
      xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/69735b557f497ecbec3d541d00a84e312fada3db |     
 powerpc64le |                     libiio-0.9 | NOK | http://autobuild.buildroot.net/results/595dfd7a17e2bba71844536c9071f7608879e319 |     
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/11fcf54ce8f59f7e6b567c34fe39b058d5f32f9a |     
      xtensa |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/158e483244908615eefcb1cf05984ee5b07d6042 |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/93a92aee30f90b8f1c056a96f64bd481eadb11e2 | ORPH
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/723e602b3215a9cac015c056cd6eb04beb017f52 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3a7fdc28963c9fc927dd62a8d476e26398dc5f9c |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/214be7d73b1330fe3bf39171ae4fa1f6240d04fc |     
         sh4 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/d0523b68772d32fe40c7132cf493bb28bfcc4b24 |     
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/8987e75ee5236d76d164fb766c2bbc2b61696d29 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/745c41c495b83bda1cfbeecbfe9168fd902df9bc | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a64d7c6e9d8390e75c8747491c48e82fd96aadbc | ORPH
      mipsel | uemacs-8841922689769960fa07... | NOK | http://autobuild.buildroot.net/results/45c5cac16b23ad4c27a48a5e9e2aeed69d7d52dc | ORPH
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/d024b275dbe0e0e0a7338b07ace5acbde470ac94 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/1a991d55ef1d4661be2aa153073e940c0a8748c1 |     

-- 
http://autobuild.buildroot.net
