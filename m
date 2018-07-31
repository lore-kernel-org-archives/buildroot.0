From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 08:00:38 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-30
Message-ID: <20180731060038.F1FD720922@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   3 |   0 |  30 |
   2018.05.x |  15 |   0 |   0 |  15 |
      master | 130 |  65 |   0 | 195 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.54.2 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

   powerpc64 |           host-libglib2-2.54.2 | NOK | http://autobuild.buildroot.net/results/51373fd79d1e1726b5a13cc00e529c519477bd3c |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/8032e22028515c0238aa1e176edcb20126a108f3 |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/6b367aa375453c99a75c18cee3b4434a489d5234 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 10
     linux-firmware-legal-info | 8 
                       unknown | 8 
          host-libglib2-2.56.1 | 7 
               mono-5.12.0.226 | 5 
package/linux-firmware/linu... | 5 
            lttng-tools-2.10.4 | 4 
               aircrack-ng-1.3 | 3 
             gnuradio-3.7.13.3 | 2 
                 opencv3-3.3.0 | 2 
                    brltty-5.5 | 1 
                 copas-2.0.2-1 | 1 
               domoticz-4.9700 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
              mjpegtools-2.1.0 | 1 
          openpowerlink-V2.7.0 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                  zeromq-4.2.5 | 1 
                        zip-30 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/4c3df2491e459c36e361f4eae1b067f320332700 |     
        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/40f503801d39be6c02e9e3aad24ad7fe80522ddd |     
     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/31d68e339d237d54666a30b63ecd8319b5bb1fe1 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7326d59f30bb966c952216917dfc37e44dacc37e |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bdecc71faf6d5d44fde0cf4b7489217fb7a74873 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4e5915e1793f835b6b5a880c747483a9a537aa78 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0a4bbaae036f4f61c93ed50406540c13fb2c2b8b |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fe48be880e78c96211187fbac9d75de1bfc573fd |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2a89856b3bfbcd8acd01699619ee7be4d8b1ec4c |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6df4c39dffce4229e0d7f79a064c52b6284d13eb |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e43fb223098705b20db3a61382394f2a5a6a3095 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fda4b954b4f4cc9f119618dc4bc993d3520e02e3 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/814754a0c87db18148570aadd00ce1b91b7e9bb8 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e0c251ff4f1d18010ab252c18a41d85895e7af10 |     
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/2323ec9fd9b06128e4c2400516a905432c004693 | ORPH
         arm |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/0f10f996c482a60077204da9c6b01f9e38fee6bf |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/40c6521d8b6b1896ecd65fb61f8b075113e1234a |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5a58fc91ccc1d929e225e0aeff3dcfd07ed8fd0a |     
     powerpc |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/3f8282412be092047bfbc677789666297328ee8b |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/08c6e0e66948e35f7877848d625121d130b7e63a |     
        i686 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/92874084b40c3b0e40f4dec793be607a89ba8db0 |     
       nios2 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/93b777d952a0ac09f1ec0b3198644415da0da044 |     
       nios2 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/9b982fb2f61b8beff8c4175c4ed55321cff6dd3f |     
      x86_64 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e038c60e3e5910a13af0b8d269dd7d83bebd539b |     
         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/7fbe571fbc57cf6e5b13e28c05f481328c023647 |     
      mipsel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ad80b66c503f98f448206ccfabf94cc8b82911a2 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/d4fb01062f81faf8c2a27fb4cf7c105f96a116d9 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0531735401c76fbbee2abd640916c1647a401d47 |     
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/5d4722b3296c01d8c0ee015aaad0397ffa418a9b |     
      x86_64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/d9b03a075e31d674d54d649b8424ecca93648e50 |     
 powerpc64le |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/436b0db3d15680ed937a93e81f21866e7032020d |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/0c0d9fb229c55d1d9a60c2762a6cb6f82c9d2db1 |     
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/a54aedad7f53a3f3771883cdbeb7dc45d92136fe |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/17b96216deb970f099818a91025b441805548e21 |     
      x86_64 |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/21eeadc5287b5588a962f37256348d810fb359dc |     
         arm |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/2aac20510b8c23964ab6aa3ed306319d0cafbec4 |     
         arm |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/184e24b3099971d1de145643c61e1159cfccbc0b |     
         arm |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/6175e17ed70479a817528936f0636ad633f562ea |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/2c6fcf3461f1e6d57561860a13c464c8fd92ab78 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/857c32f33f4867786521a1cc802fa8ad64b7b980 |     
         arm |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/6f58af1d2db443d46d06f2280f88079f970b53a7 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/f0bfc49b484db6c2570940d65b72510161e0d5d6 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b39dcf7cda1d4b00651ebb8db6c9782a458cc35f |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/1f2a32b809a5744be49ae1ed202b6eb6aacc5518 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/027107f75ba0e5e3e626f68b13f1b8af23e04b7d |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/d38fb092cffe086f93b469d1181da77fba0994bd |     
  aarch64_be |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/a7910de1a533065d5bc2c3c644fefa9c9c334dd6 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/877a8f5b869319e53671267163349cba2aca4a6c |     
     sparc64 | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/5ffb8bd8c5daebacdec0997a799d6565295f696f |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/41533925c598a40f9f5837e0532799c9b85676e1 |     
      mipsel | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/d9a093fe7c6f0a6e31636a5b10cb3ed84087d526 |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/9dd30cce42cecbf04eaab97da5351b828c477b89 |     
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/d5908d9587a92239309f4050c8138bcf18fbabe9 |     
      mipsel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/0a32ca54b0c8c59f10c1835adbabc1a1d1820624 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/3de08d379719a782c8563ab80a85e4cfe1cc828f |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/fde9b5d468bd2eb1f42c8d574c4a2d88068ec240 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/bb618b71448805cb38e7e22e487cee3961066d67 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/f7dd2b6c4cce609029b0649551c991f6963eaf23 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/6f69c86ab096f1f2184ebf6405eba456857e72ba |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/8b8e8f821ab7fabf0b0a473826e5bf77ca80109e |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5b4529830c6ffbe0d8b9d563f36d4938ce778c9c |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/2ed5ba09ae9c19878425ab5979eea9a799fc0e2d |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/106bcba5d3b652bc093ad98db5993fcbcc5f694a |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/222191920c7635ead4f8d5df9bed185d5c880026 |     
         arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/a2568b8c4822511f8d58c2ee884f78f795443767 |     


-- 
http://autobuild.buildroot.net
