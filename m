From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 09 Aug 2019 06:16:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-08
Message-ID: <20190809061623.E63D220435@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 26  |  0  |  0  | 26  |
  2019.05.x  | 20  |  3  |  0  | 23  |
    master   | 247 | 61  |  1  | 309 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 1 
        network-manager-1.18.0 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/7ff82708b9dea09f1447f0ef94b9bb21fca73196 | ORPH
   nios2     |     network-manager-1.18.0     | NOK | http://autobuild.buildroot.net/results/0f8fa80d0b98eb5eabcf32fe67bc69f1efb84970 | ORPH
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/e8c6f19edf1a842cd45a7b53efef094be58a19fc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 10
                collectd-5.9.0 | 8 
                 libdrm-2.4.99 | 8 
           host-harfbuzz-2.5.3 | 3 
                   mpd-0.21.11 | 3 
                  quazip-0.8.1 | 3 
                    ffmpeg-4.2 | 2 
                  flashrom-1.1 | 2 
            host-mfgtools-0.02 | 2 
                      icu-64-2 | 2 
               libupnpp-0.17.1 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                     gzip-1.10 | 1 
                harfbuzz-2.5.3 | 1 
               libsigsegv-2.12 | 1 
                       lmbench | 1 
            mesa3d-demos-8.4.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pcmanfm-1.3.0 | 1 
                qt5base-5.12.4 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.4 | 1 
           qt5serialbus-5.12.4 | 1 
             qt5wayland-5.12.4 | 1 
              spandsp-20180108 | 1 
               wireshark-3.0.2 | 1 
                    yad-0.33.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/13d68129339ff4a06f9b6c7f140a839515eda8c3 | ORPH
   x86_64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/67c79504b68ea9370343dd292dac10f5970177f6 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/a7f0893fe522c976b99977f5625cdd531cc9c961 | ORPH
  aarch64    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/bd5dce0d4b87bddc26aef127a5eb5f2964c404cf | ORPH
    i586     |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/59e3916510c27d2f13bcca5c35f6a9e41ee13152 | ORPH
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/4d111d0d5f5f6de8e4e993442be44bf75d741b01 | ORPH
microblazeel |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/9e04ecb28dfd5218e8cec849c57d6dfcf5cb67bd | ORPH
  powerpc    |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/9c3d297c5fe78a903dd88b132786268b8853ff45 | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c865ebd59401874dc588dc234aed679acc9639fb |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/3831a47fdec9d909f57ddc253c511d4718d99a11 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/77df2bb6585bcc18e28c8e0b57d0718a344c5aab |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/867575589be0468443d7a66804ee45c1628165f7 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/42bf1dfa053a9d9137ef38de7508371d2d2d73bd | ORPH
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/9f526dab9819d359c87f5921a56945488a3e8322 | ORPH
    arm      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/abad4f12f9abd6b8149a09187e97f5c5a314a28a | ORPH
  riscv64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b323567ed79bb4bfb8287d75ea4c99228d73d244 | ORPH
microblazeel |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5334cf3b88a68927135cf684f430c20126c0b1c3 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/fe560d989d401e6bbf6e1b28b582c31229ddcb69 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/31677f213001634405f7356374f1cb515b8d0558 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/7ea8b678d11fc9eaa146331b3f018a8cf1b7f628 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d0e291cf13266d157592ce16b6f5946f9c0c9f78 | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ea678b8a66f1be31be6c1c4fc786ebd78f4756db |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/eede221a0c882b09862e27ce35da369fd3aeb5f2 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/46b436d527ad56f7a3551eeb94cdda5a3451dc8c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/8088a2da3d2ece69c1198314591d9bad5a721549 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/4ddeed11dd146d4ded1f25ede4ee5b003f7dc5d6 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a5e5f11ecd78344230afa347abe8d94c6a89723c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b7d948c9c1f3dc7e58ad995f81b2cbb85a3327d5 |     
   xtensa    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/79c97b4100161fbcd029d3294c0782e739c1f580 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/539e21c8c85adf7a781f3788918a40a8e79af04f |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/394fe843b3c1f31e77ccdaa24a561a036c0ccc7c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/49a4e47fc5bd627eed96cc2cf6337766a08097ca |     
  riscv32    |            lmbench             | TIM | http://autobuild.buildroot.net/results/2234b0c7d8b80694d53754b0db5af10531c48714 |     
  aarch64    |       mesa3d-demos-8.4.0       | NOK | http://autobuild.buildroot.net/results/7f041697a0456eae61f4ae7b2ff364aeef59e71a |     
  riscv32    |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/f111ce6e3ee9df53558e568e088e546e27392c40 |     
   nios2     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/eefe8c6816d9504e8997483abcf7b1327260409c |     
    arm      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/781e0b335da3066783bbb65ba5b9c304f50192d8 |     
    mips     |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/7f692b8676e7d19eda69dbfce2c45a21c5ea2d2c |     
    arc      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3218f7aac8d45c2b52965a9414e1c2534ebce831 |     
    sh4      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9f9ee294d99d1c9c898762b8d0163ac0235e2651 |     
  sparc64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fffea32832f6ef5533dc4c7bbec46250663164f9 |     
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5ca1b56cc2489f26f8a0a8af7f34ba7187402f23 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9db591f46a49ec148951d875b1b08e9a34757916 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/73cf26fd52610807b311f17c67a14973bf359d3b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a5ef8ce43b10121e0ebb55ff9165862b54ed818f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b71a98b593f6023e215d01bf91cdf47a00b98e16 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/71ab46efbc9f36e5ac73ebdf6f5a938ca74478db |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/bad752f8cd04d7f093f8c46f4f8515fe4cd9ef81 |     
    arm      |         pcmanfm-1.3.0          | NOK | http://autobuild.buildroot.net/results/10b29aa264ebb71a8c5cc87eb5e6367c57675988 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/8ee466bbd893fad9ff484463ff297f6629b3bd29 |     
   nios2     |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/2323ad65d140a7fd14f2e826bbf4c2256fcb81f6 |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/de7692c9f7d2bb55a483bb93ec39f43474761d7c |     
  powerpc    |      qt5serialbus-5.12.4       | NOK | http://autobuild.buildroot.net/results/34a4ed20705b581add96fb5d97828909cee9015c |     
    arm      |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/ad91becefdefbdb101b81c4882afdb0e9b99fefb |     
    sh4      |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/2bc996414efa32194f7469840b0117f71a2df55a |     
    arm      |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/488104f935b290242651c55b8686a126546dd22f |     
  mips64el   |          quazip-0.8.1          | NOK | http://autobuild.buildroot.net/results/c982ebc32e7dc255f4909a45458e2ae13ba6d078 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8f21c0ad2f93aec61ac25f90bd9f9fc79f16607e |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/c4232fb7933d6b89397f8ac966b9235956cde1cb |     
  riscv64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/672c527b37c59a17dffe6852cfc4599ecd6ffa53 |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/00084273437ffc32cb59d399d95ae5c608969cb1 | ORPH
   xtensa    |           yad-0.33.1           | NOK | http://autobuild.buildroot.net/results/40ccab40d7c82b908a622d45998d057a31d9cac6 |     


-- 
http://autobuild.buildroot.net
