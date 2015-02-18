From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Feb 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-17
Message-ID: <20150218073015.D72C71011D7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-17
===============================

        success : 312
       failures : 22 
       timeouts : 3  
          TOTAL : 337

Classification of failures by reason
====================================

                 webkit-1.11.5 | 2 
                  python-2.7.9 | 2 
                    strace-4.9 | 1 
                 qt5base-5.4.0 | 1 
           heirloom-mailx-12.5 | 1 
            live555-2014.11.01 | 1 
       directfb-examples-1.6.0 | 1 
                  zeromq-4.0.5 | 1 
           libmemcached-1.0.18 | 1 
libwebsock-3c1615eeadb0b582... | 1 
               host-qemu-2.1.2 | 1 
                  thrift-0.9.2 | 1 
            btrfs-progs-3.18.2 | 1 
                      qt-4.8.6 | 1 
        gst1-plugins-bad-1.4.5 | 1 
             armadillo-4.000.4 | 1 
                 gnutls-3.3.12 | 1 
               sdl_sound-1.0.3 | 1 
              lbreakout2-2.6.4 | 1 
             host-squashfs-4.3 | 1 
                xapp_xfs-1.1.4 | 1 
                  fbterm-1.7.0 | 1 
checking size of unsigned s... | 1 

Detail of failures
===================

         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/e722d8aea284538ae7fc218eacc21ad984cab57d/
         arm |             btrfs-progs-3.18.2 | NOK | http://autobuild.buildroot.net/results/a53f31355e955c734010922b47084605e13708ef/
         arm | checking size of unsigned s... | TIM | http://autobuild.buildroot.net/results/5ca8fc3e7e28069279c4da6d4b55f0f83fa4c96e/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/084cf5bee35d1436194b1e144e1168692517e5bd/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2ca32733ae2f1ea9998c6333020672d6f7426e3a/
      x86_64 |                  gnutls-3.3.12 | NOK | http://autobuild.buildroot.net/results/4f0888323934fa75f57058f1e9c4bcc0e9b0546d/
      x86_64 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/191a624e86c0f442ec158bebdaabd8d98fce5b91/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/28f5cbbc1e139ca4508dd2a4c8679cab6c500154/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a3acf08b3f7215dbc463f51e4c7d766684b2e747/
        mips |              host-squashfs-4.3 | TIM | http://autobuild.buildroot.net/results/81ef2f1dd981651f65495ef9d4c09c48695d3857/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/45a09353cda4fbea92eec0ff84bcbb34ee04ab78/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/73b112e877fc3e0dbebe24658f7e121f9173c00c/
         arm | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/bd4778517fd024a505b1e02100a3e057d85613dc/
     powerpc |             live555-2014.11.01 | NOK | http://autobuild.buildroot.net/results/498126be19a99966478c18e00be39a63a25542c7/
      x86_64 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/cc6c654f37b4f5f2963a6c2408db1555061129e1/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8016ae438d23f830909a1bd6b22e7e7f9af3a012/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/da1942ba1ef524cc39b45622a233d32e3a8db71c/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/756c8199298aaf32bb5c2951806ccaad10498968/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/96c10335489fb27e15c493c6b148e4988bc89e63/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/086c8305e1535a79ef5718f5db6aa9f8c54aff47/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/2f5482182b242cf599878cd948adef20b8ae65e5/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6bc22311bf1e1a799b661ef15ef27cd3d06141ba/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/941a352533738a643701afe7299de56e71b21207/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/aa132ce9783b5d50bddfdde266b331e3cd8018b6/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e43854e943ca0f5f15e037afd800b2f11f38fb41/


-- 
http://autobuild.buildroot.net
