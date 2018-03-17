From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Mar 2018 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-16
Message-ID: <20180317070009.C8D1E207E5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   0 |   0 |  17 |
      master | 170 |  49 |   0 | 219 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 13
                  udftools-2.0 | 6 
                    htop-2.1.0 | 5 
                  host-go-1.10 | 3 
             libmpdclient-2.14 | 3 
                tpm2-tss-1.3.0 | 3 
                   exim-4.89.1 | 2 
                    liblo-0.29 | 2 
                     php-7.2.3 | 2 
               asterisk-14.7.6 | 1 
                  cc-tool-0.26 | 1 
                  flashrom-1.0 | 1 
              keepalived-1.4.1 | 1 
              lynx-2.8.9dev.16 | 1 
                    make-4.2.1 | 1 
                 mesa3d-17.3.6 | 1 
                 mplayer-1.3.0 | 1 
                  stella-5.0.2 | 1 
                      wine-3.0 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/00254644bc9a923bf89b45db188c5067cb0932c9 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d0da153124cf901846f6bf9317bcb2f1dc6901ed |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/cbbb893a03dd1f6dfd67d1144ead0473938e3283 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/8bd6f9216e1c6fe169f8e7d16d09a73edd0e5e2e |     
      x86_64 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/40d882c6fb4405c2f6d3a2548b951ecdf433aa0f |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2982b24c9c2a01eeb13cd68ea8f661e1cd5ac8e7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/9bb61c877bfd9646169446dcdc92bcceb0e6c806 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5e601eaee8f0a05ca76acb633af0dc4875961bac | ORPH
       sparc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/68437bf39cad87190c258b7ed3694f7130a173d0 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/ce41b7d5a8e69936bc24ecd97a2e1cf77d5bf4fa | ORPH
        i686 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/4c831ffcff42f7d02d66d483648bde895d1a2a3a | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/85a587903445931873057cb49584069a65baf664 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5356119a71fc85fd0e9df821c10e5a3d5de4be2c | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/3e750ac997553e043f942063386c225e2ed28692 |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b2a1d0359d966ed3f23e3e2160bc7054689197a8 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/c5e543a97f98948d13c737e47b2baeefee0bcc72 | ORPH
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/294c8b469786745cf418d4d7460adff986e6dec8 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/8d0037ae09f932961dccf22f7bb8de8ee1198c94 |     
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c9808842f52cc8fb20a37ce03eb90cd817d7dda0 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/0809ebb714bfa5c38f38fa8916dc178d39f11ec4 |     
         arm |                     make-4.2.1 | NOK | http://autobuild.buildroot.net/results/8ff06ad8438cfcac85577b24675dd1d66f7d3d03 | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/00591365db17ed48561a94a23d86f176a0644bd7 |     
     sparc64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/efa75ddf7801ed69441bb5b1498e36bbe3ffa111 |     
         arc |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/48f307f2e846e4f22b2a543f88d9971addd960bb | ORPH
     powerpc |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/2f28c18ed09219025067bcbee6a9567c32ea0022 | ORPH
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/c4535e43b89ad130692fd794a18754626a96a592 |     
        i686 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/90df5e3415939a0e803630deff58d36777395487 | ORPH
      x86_64 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/08c3302a61187ef5f7f7e7529ea001596332d6f5 | ORPH
      x86_64 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/1fd3ac9337848aedbcd5226f6b8721508f8e4f4e | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/78eede524ae864f273d89f1e68d1492cdba455a1 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9a61461dd0904b9250120882e3c16b798867195c |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/882c13fce83ac7ae92fa65f3f33134fdbf38edbb |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/612378483a7958879a818a4098aaa5d9abdcb416 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/6544a70f2c2e13066b20a473f1403e50694a995a |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/38ee5092376c1bc6b373f1b7c3909c3d03e9214e |     
        i686 |                       wine-3.0 | NOK | http://autobuild.buildroot.net/results/e6d1b59ad7f80747d5784e5edab0acbed261be6e |     
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c957eb99d7c7281e35430aa22bb4d04b15bb0b22 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/36a4e16ce84e2b07cc320d6b332dbffd90982a21 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/1683695e38ac32f31b2663cbe63ed1773781d0ae | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7a1021423a6d07aafe135b00e1676df1514b5702 | ORPH
     aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/3356162211636b00b08805d9665aa23a2826a8fe | ORPH
   powerpc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/efaf840c20d826af06e8f073aafd014444cc6179 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/5f6b06cfa17a547cdc6ccd69bdfb6ae90ceb1810 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c7ad181eef0ba519d262055e5556231d811d42b0 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/0957ab66685ba41523f90ab73bed0f516666011b | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/68b0f06d1f49f6a3cebc80d2fe659915cde6081f | ORPH
        mips |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/be3ab513e6c2cea1cc26786ba2d7d3f489d94255 | ORPH
        mips |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/49374e20464dc1e3349ca76d56bbe42f289cb346 | ORPH
microblazeel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/0a1d7ef11745eb72f59f39b62fa5f608ee66b02d | ORPH


-- 
http://autobuild.buildroot.net
