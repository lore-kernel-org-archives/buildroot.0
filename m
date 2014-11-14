From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-13
Message-ID: <20141114073014.7B690101B12@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-13
===============================

        success : 197
       failures : 40 
       timeouts : 3  
          TOTAL : 240

Classification of failures by reason
====================================

                 schifra-0.0.1 | 9 
               alsa-lib-1.0.28 | 2 
           libmemcached-1.0.18 | 2 
              libarchive-3.1.2 | 2 
       opentyrian-2.1.20130907 | 2 
            mesa3d-demos-8.2.0 | 2 
               mpdecimal-2.4.0 | 1 
                  nftables-0.3 | 1 
                    ruby-2.1.4 | 1 
                    qemu-2.1.2 | 1 
                     radvd-2.8 | 1 
                poppler-0.24.4 | 1 
           heirloom-mailx-12.5 | 1 
        xapp_beforelight-1.0.5 | 1 
           aircrack-ng-1.2-rc1 | 1 
            host-heimdal-1.5.3 | 1 
             host-mysql-5.1.73 | 1 
                collectd-5.4.1 | 1 
                    fltk-1.3.2 | 1 
                 clamav-0.98.4 | 1 
                   duma-2.5.15 | 1 
                    php-5.5.18 | 1 
           gst1-validate-1.4.0 | 1 
               sdl_sound-1.0.3 | 1 
                rt-tests-v0.89 | 1 
                coreutils-8.23 | 1 
                directfb-1.6.3 | 1 
                   nginx-1.6.2 | 1 
                   czmq-v3.0.0 | 1 
              sqlcipher-v3.2.0 | 1 

Detail of failures
===================

     powerpc |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/cdf0203fc99d5f7e41e508f6d9edb78a0f0ea732/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/f73b6fbd5cd59f03a6f46c33cae041e4730152be/
        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/13d3d54e92c22de1ac8617fda63c10cda02e5d29/
microblazeel |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/eb9f8d99defdb121c3e20c2aefdbdd2ca27e999d/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/a84ab4f0fdea6bbab971ba379e3066cddb25bfaa/
      x86_64 |                 coreutils-8.23 | NOK | http://autobuild.buildroot.net/results/94fcd06b320374f46b340f516c54b7ca726041af/
     powerpc |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/1f033d04231c5f058513cbca0d437b96260fbd7a/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2b19bfe68c2b75eeee3db240d22cf95b75a1a794/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/6028be8727eef6f2a0adbd9bdc7ccd3f2d055ebd/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9f8a2a283bfc4deb03dbd54a483a296d297d0209/
         arm |            gst1-validate-1.4.0 | NOK | http://autobuild.buildroot.net/results/7678fbb4dd7979c60da984037e882591676ab513/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/b49680845c5c22cf55342ea2f5ad5b925005d1e2/
        i686 |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/84d06d5365567bc4351e8a379377aac585c50423/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f1c5ee6bec9aebae6152ed129192c160cb257694/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/f3e9908a482e0608b9ff0f360086bd3def17038c/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/f4480be04adb1eff91f46d3818916ec5667b6ee6/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bcfe2ea6d187bfb776196f1ce08c0c5ce17975c1/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/4b0cbc3b19319bbf923f46a3ea46e7fdeca4f35f/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/522ade865a152210ff18d9b1a18c766ee76a570a/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/d877b18b2bc7e0b62501916c85a9a3e3a4de521f/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/0fc229c7b001a16c8f0d16f9626b3045492ff972/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/867e46d8d5056cd9437bbbffa8716e91d69dcc38/
         arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/3f1c9461d25e191a0ced3375ba1d7cb732032f4a/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/2e4fc4021b38d18d551c02590673e2eca9e73d59/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/85bba38c8e7f51df92d3a3eb32513ccc8a245609/
        bfin |                     php-5.5.18 | NOK | http://autobuild.buildroot.net/results/3ca8ebeefa79e59d8c056e89104e94637a59198e/
         arm |                 poppler-0.24.4 | TIM | http://autobuild.buildroot.net/results/b7866211c9a30f2854452d304b595315e625dad1/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/2abe26be5be5e72d6e166dd9b63b61523f63e2f5/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/e006b14b5d927d30afcf4e474695c4d2771c90ef/
        bfin |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/8595f54009d0d715f755b337ee65713994520c3e/
         arm |                     ruby-2.1.4 | TIM | http://autobuild.buildroot.net/results/b9c156e9e302fb5c83b64226619f8fd5dd1f258d/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d87c515b3873f70ba4a808d20e6f21d77e8cec8f/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/cc7291b2f8bf8bec1ba6ab537fd26ad57be65169/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6eff41ae47f84f9a95a778792e0524d0fd69f56a/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/54af8164a4655b828e8ce50d7db6735942c7d6b2/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/93b4ea5097e5c9eb71b2ea930d6a6459f7c6ef7c/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b740f826003f09bc1c25a11a50944d927a83a273/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2c7f3cb4d0e45246bbf90a976e5700779756012e/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/764b66206b4369e3446018a376fa6485369112ff/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3638a330af46459fb2ff55b5b8ea1b5a878381d8/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/53d04133a41cddf23bda246d5d0d43a9ce3c4cb4/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/aa24359a0d7d9bb4e00ba96cb80301f59466ab90/
      mipsel |         xapp_beforelight-1.0.5 | TIM | http://autobuild.buildroot.net/results/12d679d3e33567406576ac63e19796bf5b84da31/


-- 
http://autobuild.buildroot.net
