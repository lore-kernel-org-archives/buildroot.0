From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jun 2018 08:00:40 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-18
Message-ID: <20180619060040.F375D207C2@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   1 |   0 |  18 |
   2018.05.x |  18 |   0 |   0 |  18 |
      master | 151 |  16 |   0 | 167 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-waylandpp-0.2.2 | 1 


Detail of failures
------------------

         arm |           host-waylandpp-0.2.2 | NOK | http://autobuild.buildroot.net/results/d14781d7569b5d725b66a08bb7afeae58f1279ef |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    host-rustc | 3 
                      x265-2.8 | 3 
host-imx-usb-loader-e539461... | 2 
                  mender-1.4.0 | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
                 mosquitto-1.5 | 1 
package/qt5/qt5base/qt5base... | 1 
            qt5base-legal-info | 1 
             qt5wayland-5.11.0 | 1 
                  samba4-4.8.2 | 1 


Detail of failures
------------------

         arm | host-imx-usb-loader-e539461... | NOK | http://autobuild.buildroot.net/results/48c95cfc65f99fa02be81a11303ba8999f57091a |     
         arm | host-imx-usb-loader-e539461... | NOK | http://autobuild.buildroot.net/results/a63b593b7ef3b6d32e755afe42b77d47dbf0276e |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/71db5c52017a08438018531a7e160947b889d9b5 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/a909bca32b5d1b53dc3fe19ce00c45e6cf9da03c |     
        m68k |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c12d9286cd9f34742337b33ceac8d0f76819788c |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/870cf69146625d534b1d5da02ae1918a38eb3368 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/8944244d1ad0b18d5f4d99a2195e432a4af886dd |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/16776ec16f2a1047bf0a11e091bc73b34b0cae47 |     
         arm |                  mosquitto-1.5 | NOK | http://autobuild.buildroot.net/results/7dcfb6ca9d14a5cd6872590065549356f1ab42a0 |     
    mips64el | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/be28107809632b9069b4b9ce36d1f707b769cc98 |     
      x86_64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/b8add9b9a2defe5e64330714e9768ffa6393adc0 |     
         arm |              qt5wayland-5.11.0 | NOK | http://autobuild.buildroot.net/results/e3eae7f5d0bdf48914b5a8ca46cd3faa85957ea6 |     
         arc |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/a87686d0574a653d152f394381c894208f95ffda |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/a666534de252c24648d27460fa5e58dd43d0db32 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/f3b862d871b5edc3d6d811973ff3822287caf45c |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/9d50c07489ee2f4d6a012975fe2ea6adcc53cacc |     


-- 
http://autobuild.buildroot.net
