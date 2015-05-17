From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-16
Message-ID: <20150517063017.77AD4100D35@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-16
===============================

        success : 300
       failures : 29 
       timeouts : 0  
          TOTAL : 329

Classification of failures by reason
====================================

                tinyxml2-2.2.0 | 9 
               host-mono-4.0.0 | 3 
                      qt-4.8.6 | 2 
           heirloom-mailx-12.5 | 2 
                ipmiutil-2.9.5 | 2 
         lua-periphery-1.0.4-1 | 2 
            python-pyqt-4.11.3 | 2 
                 cdrkit-1.1.11 | 2 
           uboot-tools-2015.04 | 1 
                   duma-2.5.15 | 1 
          enlightenment-0.17.6 | 1 
             libmatroska-1.4.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 

Detail of failures
===================

      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/22cdb25b20dd41075a6096b38f6ef76f781763b1/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9455dd040520ac06249314295714e0765e8485c9/
      xtensa |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/ccfc79586516a6ebb05badfad258aad0b6b9d2a2/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/c1ef3b4fae3ddf3206ee79141dc36bef50085b6a/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e0392859a1943d1db2a5ee2f7fdf93764369d979/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/33346f4555ed403bab7b739dd5d47814efa8eb4c/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/d4683dd0913340c0aec143adde141658ef36cfc0/
     powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/c3288c5d1fb94474f14a4a889e76135878d403bc/
     powerpc |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/f708e89f613ec0b42cdf49ccbef39b02f4a271fb/
         arm |                host-mono-4.0.0 | NOK | http://autobuild.buildroot.net/results/3cb99e5c5672cbaa2a86020129a05dfde47cdb8f/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/b42e16c664c70ccb430f848060e7fe26a3c9bd09/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/100098242091ca5844177e6ed1d3cecb77072f3a/
        bfin |              libmatroska-1.4.2 | NOK | http://autobuild.buildroot.net/results/80a9f0f5594ab833600ea8514dc184e50d2bf08c/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/0ad656970b3cbc84b5531b28155ba2f747715fe3/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/65bc6e4f6e0c6d2110a5de67b04f2f746a510a1b/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/7af8b620028ead3731c170b9cd16382701860267/
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/f05f5c6de0f5b0c1389cd916baaf29151f91c753/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/508cdeb67f272b61209f331ab7b990cb56f30817/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b28993215e09840cfa4d2c0c0d50466b1b6f94b3/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/b749e7af2ab3e118ec1e0cfaa037e6c030a191cf/
     powerpc |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/3a5a9c5df751f730e59e94b4c886373da3a005be/
      xtensa |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/9a0dd91cd52faebb2b76874d3909fa7993318c25/
    mips64el |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/06c6c0407d6ad9e63b14e651fa8ba08190dbd466/
     powerpc |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/4210adfcb9006e77742849e2c632729e2c124c5d/
         arm |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/4b469274cf1a29e84143795b47c533d56dc233ee/
         arm |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/469de84e49b9a8237f972f433a447e760106e7ef/
        bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/c84589011b9ad9ab7e5d5ab7b40ba5a3b2d8fff8/
    mips64el |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/408825465ea861721be91459d39f5fa9a039bf6b/
        mips |            uboot-tools-2015.04 | NOK | http://autobuild.buildroot.net/results/48345d936c7972dc27ea12bdccfe0d02bbc4112b/


-- 
http://autobuild.buildroot.net
