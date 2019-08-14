From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Aug 2019 06:17:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-13
Message-ID: <20190814061711.B2F8A8559B@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.05.x  | 19  |  0  |  0  | 19  |
    master   | 164 | 45  |  0  | 209 |
     next    | 10  |  6  |  0  | 16  |

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/d75a655e6e596fe920fbdf5f662606b0d646c5cd | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 6 
                    ffmpeg-4.2 | 4 
                 libdrm-2.4.99 | 4 
                  flashrom-1.1 | 3 
          qt5multimedia-5.12.4 | 3 
                  cmocka-1.1.5 | 2 
                      icu-64-2 | 2 
                   mimic-1.1.0 | 2 
           python-numpy-1.16.4 | 2 
                  rygel-0.36.2 | 2 
                    xen-4.11.2 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
       gst1-rtsp-server-1.16.0 | 1 
                harfbuzz-2.5.3 | 1 
           host-nodejs-10.15.3 | 1 
             libgphoto2-2.5.17 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                   mpd-0.21.11 | 1 
              qt5enginio-1.6.3 | 1 
             qt5location-5.6.3 | 1 
             qt5wayland-5.12.4 | 1 
              spandsp-20180108 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a2001777d8bc19318d2b8733bcf1e9932ba40c80 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/f6873c6d3a24abdcde9518f22ea9ff10b174fe34 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/a1cf42007e40ab3b0deaad0f72e034147ed64adb |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/34939dd81eacc9ae3e148ec5fc058b28de4baad0 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/14fd8d7c45a9bbb2de91b8f2e12edd4a7c5bca15 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0979103c295d18ef874f5e1121138fa3c1e3e6ee |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/08d42d19659bafb4e950a92ddfc4afafa45bcdc4 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f6cda6c1c5be32981d163b9e65935842e939fc18 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/1fd19c9f4169b46f05ca2a0af0a096b125910561 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/d170cbb2d2f3cf48c8e4363871554386d89769cc |     
    i686     |    gst1-rtsp-server-1.16.0     | NOK | http://autobuild.buildroot.net/results/dffa8269f73a125ef20f2eaeca4d508d05422ee6 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/e31b524d445487c8307f9ab9f248c007c77e4d4a | ORPH
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/34de6c25c9cfdd5619f33e5f4b9191c03904f8b3 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1043d44510718fb0ff0def0e174f750f685b8534 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/0ac0124e7365bf53eb4c45131b8885285def6b6c | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5b6ccedce65c398672056a774350ba18bcdb6587 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a888030fbb3a347152f52d4255fc7bf8c0e25378 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/78df82341ec1814bbbf9974dfc1233f68b1a2614 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bb3d1ae7be5d9cf36b2e7b0a1543e8f5b38e9177 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/f8b6a8b6734bec06020b3832f8aab3a844004efb |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/c74a3f714a4f16e2483b78cd0e79dc6bd0f4b2c2 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/a35a6b511a4c34727d73b0991f4c18369b4715f6 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/28aebe6f5fd78b7d41aac9e66abc015abb374c06 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/35d8041242441ff18f4ddf901827932782e54c95 |     
  riscv32    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/1f1c277884d66efeda2b474dd5df3181017a29c7 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/515e67ac7fb957ebdbf88d03290c7d155a82d8b4 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0444ce6cc7f2e189b4a46d3cf346e12a1dee0afe |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7959fd1f7c157517c1a3b17bad41f9300f2e9613 |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2ec597b5854a40f91d555dbea28087ecb5c94169 |     
  aarch64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/71382e4837f97a5f68f216a4c6edd9ecdfb28d61 |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/15177d6b24b57cbd186d756f9ef2b239d93f4664 |     
   mipsel    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/69d529aab04361a6d5638e0b244550e7bb276d9c |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/319e30b87872182768aaa3955de7e25d067153d0 |     
   xtensa    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/0d67d64599323668169f4c084611800ac7b1723f |     
microblazeel |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/1752598465264097d18080370fa9dce0c0ae3e1b |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/a40948cd0f9832800a620d419eb1d7b7f828059e |     
  riscv64    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/a10b96c48650ce2f4ac592c3f7c2e13eef169126 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/f6db3363a1204d88432a78780c3765edd537ccb2 |     
  riscv64    |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/b2132858ec75fa15935c936234a84a7ed2b8ad7c |     
   xtensa    |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/ebbf96a1be5547e416feb1e96e55986890d0a1de |     
    arm      |          rygel-0.36.2          | NOK | http://autobuild.buildroot.net/results/d965100589c391751ffc58955a3ebac600339e86 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/633ded6677dd9774f348cee50a805ea6dd377f16 |     
  mips64el   |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/f48397cb17bfdeb68ade97768486d2ec932ccb6f |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/44fe2ea7717a947f22b3e27c878d18d4afeca941 |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/3d4765cfdc3eccbe9f40fc72590019745d965651 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  cmocka-1.1.5 | 1 
                     dtc-1.5.0 | 1 
                harfbuzz-2.5.3 | 1 
                      icu-64-2 | 1 
                  luv-1.30.1-0 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/40a1f84ff53049ee29db7bc15adf6f02d77af4c1 |     
    arm      |           dtc-1.5.0            | NOK | http://autobuild.buildroot.net/results/68a1ba8d615951931567bc8a409c1d16624c902b |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/8b19e421fcbfdca7b6f2913dfa2315a884474ce5 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7e94b5fd0e777197522b5d1077d6e0046b210b93 | ORPH
  aarch64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/12854ca7d6a6c9120c1a7f27e03028ab153f36a0 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/08e16d99a6491cd7de34ea163140ea0ebc84f85e |     


-- 
http://autobuild.buildroot.net
