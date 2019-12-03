From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Dec 2019 07:17:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-02
Message-ID: <20191203071759.99717845CB@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-02
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  1  |  0  | 10  |
  2019.08.x  | 15  |  3  |  0  | 18  |
    master   | 96  | 25  |  1  | 122 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 5 
                       unknown | 3 
                 libv4l-1.18.0 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
                      gnuradio | 1 
                     gzip-1.10 | 1 
              host-grpc-1.23.0 | 1 
               host-llvm-9.0.0 | 1 
          imagemagick-7.0.8-59 | 1 
           libwebsockets-3.2.0 | 1 
                     lxc-3.2.1 | 1 
                     ngircd-25 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.10.1 | 1 
                ramspeed-2.6.0 | 1 
                 samba4-4.11.2 | 1 
                 xvisor-0.2.11 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/4c7b856725551e4715a86b702d999536830ad8ed |     
   xtensa    |            gnuradio            | TIM | http://autobuild.buildroot.net/results/0063c5541859433cca510326a049eec50fba4564 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/f5da5691357d1f3b4d7fafa865ccf13666ca674b | ORPH
  sparc64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/c7d7d3adeb41f649f3ac8f22fd1708420c91fa28 |     
  mips64el   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/51b0859a46c37b07b33c899e04e97046a36bf283 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/5221d75d2438ab7ec4105c5a9b2dc2c45e1c0c71 | ORPH
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/de1e762ad3cedf2f737f32b0dc54fd3a2a25a169 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/828b445e05fec1bd2f4c1c2ee9b49e4555a6baa3 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/c9b8b93ad2d45767519bd4efac20d985e097e20c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/8b549ff5a4a7ae72d1262e9158b09652fab8ead7 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a874294c055f79c68b1af1227f6113507def2d92 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/5af5237273589f980db4d7328e0871a961c23e93 |     
   x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/6cbb2f883ad74b8c910301d746aad2287680f578 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/fe01f8f504704a1024333f10d2ada6b0179fb954 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/b46e5f1f502488c230954a443ae07ded7e7f2f8b |     
   sparc     |           ngircd-25            | NOK | http://autobuild.buildroot.net/results/01c78351926b5380f83fa983ba4ae03297452ea5 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c76bd20c63497c4073d5bef8a659a4d81cdf8875 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/7583eca10d8d00b3a3ff9ee29ecb7277e6b814c3 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/8d9deb816770f49c58799e42f27e4a907b014542 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/8f2726ba8ca8251a92c3dab10ffc1dae4095c92b | ORPH
  riscv32    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/d79f77797961903f1dcc1c7f6236f378e5005115 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6506844bef06734e58e8d261ab5f6691abb5762f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/967030103130da51712b06740e8f34cfd49cf8c2 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/6056840a3d2e54e5088c8a9f8ab821554f228a34 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/e3fc1b63ae02cb5e8b46082bc2c6efcd0251ecc4 |     
    mips     | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/8602114028621f9945df2b5ff82745ca439d4d13 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a629999961aecc19f456f8f36dd39b63829398e6 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                      icu-64-2 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c54b66a072f6138c83e917297402bac58c1da5f7 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3f41a56370745bb055bde8ffd25ed8ed01a927e7 | ORPH
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/2ac38961110d9a1be5ca420fbd0563758d42beb1 | ORPH



-- 
http://autobuild.buildroot.net
