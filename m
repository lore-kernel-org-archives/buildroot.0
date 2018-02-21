From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-20
Message-ID: <20180221070012.2374B207C3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-20
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 173 |  30 |   0 | 203 |
   2017.11.x |  21 |   0 |   0 |  21 |
        next |  34 |  21 |   0 |  55 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 8 
                  boost-1.66.0 | 4 
              host-erlang-20.0 | 3 
               domoticz-3.8153 | 2 
                 mplayer-1.3.0 | 2 
                      qt-4.8.7 | 2 
uclibc-ng-test-c6d62cbc6050... | 2 
                 host-icu-60.1 | 1 
           host-mono-5.4.0.201 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 rings-1.3.0-1 | 1 
                    sdl2-2.0.7 | 1 
tvheadend-e06ffd87beff16103... | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6154bf2f61f42d09f69be8af0ea6272eaae992db |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f07f98de1e026a41640e48f82fc4dc00fd78fe45 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/15842f658089505884a87da426958906f5bc752d |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e514306cae37503c155dea7cba5e698d217ea5f1 |     
        m68k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/5ce175b56d89ff493a70eac55708b2a28b40dcd7 |     
        or1k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/37ba6799b6b1893ba9c9d5c9d631b0f19954b9b2 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/26095ac65daf0fa1713eb0a981e8d56747a6e21d |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/72ff3024af2a537dc61d64d3cf91bb20af3a66bd |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/b8296b1e02cecc1c58389413780398677e857647 |     
      mipsel |                  host-icu-60.1 | NOK | http://autobuild.buildroot.net/results/561d095a4cccf7bdd84dff3e56c3207f4f37f86a | ORPH
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/980f710e74433a4d6baf3ba3572e4e24efa2d639 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/d36313f5289ae44fd7ffaa64d340745f8c2d4d4f |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3b0c5001117b68ccfffa264fa3b0e7b9b35b99fc |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3ab0a70a21457155142f17284a98fd0b23943f11 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e470e21f9efbb3d57e7716e100b7b78cb93c9f0e | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3774f58fc8785cb1cbb01d910fb1bc3b44d4c9ba | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b835b41a76943467adb827a7f8cf3cc6b9f79435 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4592fcfb0004139cf5d29624b383779ad64ad2fd | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/a89f88163ab66d22653fc614c6eb77ed6143181b | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bea5cb5450ed6a6189b52cbb9e7aa5a54f0d4991 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4908ff92d8bbc7fa152db9f2183201ba157e18d0 | ORPH
         sh4 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/be8485111a76d3273e926331e7de4d6604aab60a | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/da2dc46072ef5f11e51313a23e506e44e694baf2 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/db336f4c87e863344f2b5e02d42a7b08b4e101fa | ORPH
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/bc118065de4cf23f5bdfd5d2de17abd14c8ce66d | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/6abfd2dfa2418c94d8b4a8c98ce210441dc053ca |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/3509930b8d8d1d5a37254ac0d429a841297fd524 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/8d967dd135c79f069687d8cb7971c5c36858f81d |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/12b3593a36be5f18d5e40466d1df4f2e0dd4307c |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/528313f3cff9119b028b8f6e4d0aca7b49751663 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             libite-legal-info | 6 
                    htop-2.1.0 | 3 
              keepalived-1.4.1 | 3 
                     php-7.2.2 | 2 
             bluez5_utils-5.48 | 1 
                  dash-0.5.9.1 | 1 
                  host-go-1.10 | 1 
                    liblo-0.29 | 1 
                nftables-0.8.1 | 1 
tvheadend-e06ffd87beff16103... | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/83b826eb0ffdf176ed2f9af081ee9436a52289a7 |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/0813c13c2a978316e6fa9a3cdbd5512612f5c374 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d815c31e854071186119927405b2c76532be4823 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8edb78b054a265447fd0e83f67cba5f978be4ed6 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f144683ac4ddf7e035d1b0769afe13f79d963080 | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b62a4134cf689a855cfc7cfe3ac64d6895caf8d4 | ORPH
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/ba48c302d5794d9a90116251187b5ba1cae1f709 |     
     powerpc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/963a6d9d217979fd46cbcd9ecf8c9b97c279d6c4 |     
         arm |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7555b063ab7e2518f8fea43b51fa6de4dacbc60e |     
    mips64el |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/8fd71513f021652a9a4ff2354dd5fe4fedf3d557 |     
         sh4 |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/6a1ab663f1093351662ca7b86c9224a630798f35 |     
        i586 |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/066373da2da2cc8c0c22cc4a3048d1b187c9c389 |     
      xtensa |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/edad6ac5d3f61257e99b90c6f54d4d6786aa7ad7 |     
      x86_64 |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/c2b72c2a32de949a5b1ab46d6d7c540353cfaf5e |     
        i686 |              libite-legal-info | NOK | http://autobuild.buildroot.net/results/8635ca4bbec464d196846a4018d1228d6651b211 |     
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/61bc1a6d5ffa178295c0d1e672a16cd043d317fe | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/eaa2007707ef35ca6481aaf81e284adc7824262a | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/ec04c1792f1fdd3fd6372dd5e059faf2bab8a907 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8c3890a58fef80f805e475e56f78e17f7b027851 | ORPH
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/167638f722fe780ce9d004c6ca65733a71de8913 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/3c805d1618cc5a3a3de209679effefe0bd975fc1 |     


-- 
http://autobuild.buildroot.net
