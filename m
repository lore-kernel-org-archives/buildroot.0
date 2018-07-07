From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  7 Jul 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-06
Message-ID: <20180707060016.ED5AA208B3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   0 |   0 |  25 |
   2018.05.x |  13 |   0 |   0 |  13 |
      master | 127 |  30 |   0 | 157 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 10
                   wampcc-v1.6 | 8 
                    host-rustc | 2 
            qt5location-5.11.1 | 2 
                  zeromq-4.2.5 | 2 
                   libnss-3.38 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                 opencv3-3.3.0 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.11.1 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d4b0d55d7409832704d2e8895fc6bea1dab56b61 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6f0c27b8e25151f4201edfa351ff3a0431a010c6 |     
       nios2 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4bc3f0556f511661b2c044a17044aaf7c14cb9a5 |     
       sparc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1bcd7a2813708203ac3350970b8ab948d2407ef3 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a385972f17de8a7ea52a005b95b5c46b7c853e17 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0575ce83f389396f0f08e78118e7d84081a654ee |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/66f2ae081077807a3535dbe11f60127b872305a4 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b4a625dae22a3a59a006ae424f10cb5f8db6382e |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/e7b292de50417d55d3960d205c81a525216d779c |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/510aa5187c6c2841e4ecc6912b2d5f0ba31b3551 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/9b9d15630868a23f3392b417c1dc7d27581c67aa |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/9660f35a25556ac64b66f0e8d850bca1d36ebd28 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/4f415ec1471be221fc5e40baa3b191c5960abc10 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/8538d08dc3e1684c6df936e19e70f327369d8bd8 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/f98f9a5e5dd2659392192fae943cfbb93093f8a1 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4b79fc368f014a0fc38717075d6fc3732b85c193 | ORPH
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/16d6ed7259800801a0f2ab8fdecf47f3f49d67da |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/bf241beeb1ce10eec99d247cdd331870c08e0ac8 |     
        i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/b186ec0e297d6857a9e0a6a063e476b5049ccf93 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4100f95552ca0097c5ddb7290428f4ef41ebaf62 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/d07e69f08b3929ec23ff99e448ac7ab887a6b819 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/a79a92cffc6df29583c06f040b5aa2dc1672bec8 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/05a47ef6159d0192c1a4588da32048e52b0bd94a |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f1fea953a26c7077fcf4987fadf7019e2d317dd9 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/5d4c6141365f48d90e5d1731ffc2605d565c130c |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/9975d5ef79a974f1fc6f0e8a72b40d1f909ed078 |     
        mips |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/55107a7ee16f096bf72291c278fac055555624e6 |     
    mips64el |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/e18a6b004f2a640fc2c84d2bcd59bbc47b3c184d |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f4c26061322ca9c328a048e11544aec8f5d33019 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7fa7a0f7ad0e431e9528f4051316f01d86ee00cd |     


-- 
http://autobuild.buildroot.net
