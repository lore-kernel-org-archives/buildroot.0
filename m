From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 07:16:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-30
Message-ID: <20191031071640.02915847CC@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  2  |  0  | 15  |
  2019.08.x  | 25  |  2  |  0  | 27  |
    master   | 114 | 55  |  1  | 170 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 5 
                libdrm-2.4.100 | 5 
                 rng-tools-6.7 | 5 
               libgtk3-3.22.30 | 3 
                libselinux-2.9 | 3 
                 libv4l-1.18.0 | 3 
        ltp-testsuite-20190930 | 3 
              sigrok-cli-0.7.0 | 3 
           libwebsockets-3.2.0 | 2 
        matchbox-desktop-0.9.1 | 2 
                 acsccid-1.1.7 | 1 
                  cmocka-1.1.5 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
      glibc-arc-2019.09-eng002 | 1 
                    glog-0.4.0 | 1 
                grantlee-5.1.0 | 1 
                 haproxy-2.0.5 | 1 
              host-grpc-1.23.0 | 1 
                     host-llvm | 1 
                       kmod-26 | 1 
                libgdiplus-5.6 | 1 
                 libidn2-2.2.0 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
          modem-manager-1.10.6 | 1 
           oracle-mysql-5.1.73 | 1 
          python-web2py-2.17.2 | 1 
             qt5wayland-5.12.5 | 1 
                snort-2.9.14.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/04eac264718a47c550bb48b3c36314751fb4de91 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/82a49a895dc5ffa2a500505695ca6a1189e8e465 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/2556a5646e74cb1ec79970aa5a630c16e673e5bc | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/347ee0d2304422868632648f46dce3abcd5c9767 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/d68bed0ec4ffa0aa250c87d42b74395a7269e1fa | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/f744b8691e854b0c8d9ec9d08eeaa42ec1db0a0d | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/b786d89f623d1cfffef5edc29c0780bb62d5f7a1 |     
    sh4      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/5c1ca3083ad672401d1e050c6c3a07b8c33b851d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/615fd505e2e9aaa6861ab16fc37f1a2533dbbee5 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/4bca850dbf966687bf85c2c23465be0da47b7997 |     
    arm      |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/2e2d085fab6348b468ea96151ab292e8c0f93c0c |     
    i686     |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/f0ec288fe47b6e8cf16179e3f281cf9caebb8fe9 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/52cc4b1fcac2a4fc84ab15ec4c692d2cd9b6d8bd |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/27144042af42174a416ccaea3a4d3a2b7030b6e6 |     
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/a727b10002908f8c1bc07754030f82f915407bff |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d1c288b945ab39f59253dc4609d7733c80ce581a |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/526e611592f3025c9acdb50105d5d845cf13cbcb |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/11ead7407908bc134250da1d3320d117f2b607b8 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/75984de99bed472ca8e32462fa90f84c922af722 |     
  powerpc    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6fa728cc4f84e412c5985b87ff05497db9e71eb5 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/ae081a65b82fa7d8b2b021ab3c1b422e73cc290c |     
    sh4      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/76f421ad257b48218fb8fd00ce7c28d42d9ce6cf |     
  mips64el   |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/f0eda37930ca3054bcc8ab3a8aef74bbc71b5997 |     
   mipsel    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/b41c681e2b7343fcf0e15ae405f3891900fb1f02 |     
    arc      |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/16b6801636bbcb07d8a082cfa82c9c730197fc6f |     
   x86_64    |         libidn2-2.2.0          | NOK | http://autobuild.buildroot.net/results/34f4dc9aceb87f18a43186aa6541a5fcd5bbbcd1 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d4c505434c34b9229cf8d4e064237edec5ef1bdc |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6abcdfd84473c2608e5171af5985d6a8f6b1fd5d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/30858cc3a6f12b0f4db8f4e4a63d07f51c70bdc7 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/25d57dd6b55c725b1c14d79bcb04181df82e88c4 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/db1e13b0f068ba547d41962ef228e9c241637124 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/eaad1d1d1e8fd0382a6b9b4cfd9c7674ddc7fb33 |     
   x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/bf88f89bdb966ef54938e4274114d4afe5668b1f |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/07777a21fb2571cb95c53363334e67a21a020b73 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/581323f770bbacc0e053ace184a11f4c0f5981ae |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/09be9dfb881167683794a9d01b599f0177962f9a |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/f7a05b7f0bb1ec446dc19b6f51c992842ebfbf12 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/e4b4de61cc6937ca89a9648c5c091b6d8e6ede55 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/acea8094e8787c41a27ce65945b9a8700a891e2b |     
 aarch64_be  |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/b5f65455be4f471c15270cd1bd864d457c6439a1 |     
  sparc64    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/382a5041b628328808083085f87016547a680478 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/54e3f8b97d8f496367fa0725d74e3c40dc839fb1 |     
    arm      |      modem-manager-1.10.6      | NOK | http://autobuild.buildroot.net/results/9c6b8ec2b9cc31f1ab460532c378731ab455210c |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/c5c686ada30b2612bbbdbaf9873a7aaae333b753 | ORPH
  riscv64    |      python-web2py-2.17.2      | NOK | http://autobuild.buildroot.net/results/fa515627ae888d08fc10074e8d9f6e9dbede91a7 |     
  aarch64    |       qt5wayland-5.12.5        | NOK | http://autobuild.buildroot.net/results/2f66747e959ef0143d72c8320beaeb47d00df4e4 |     
    m68k     |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/81c4101df6996ac735bca970c043a22be08765d8 |     
    m68k     |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/826a0feaf8cb54caca4528f652ec00c06d67acff |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/39719dabaf490f2d9f24e01c25de79b0a95c7103 |     
  riscv64    |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/7479b5193cc3d6b98bbd7db4e4682945133eb2ff |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/e1815b96997fb7def688e0aeb5d342fc64dbb64d |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/9d632be273a6cfd3b9c94ce1ad49c85b1925dffa |     
  riscv64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/03dec39322e5ee447083b2d3409df2e739078e60 |     
  aarch64    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/94c5035f75ac3cd38589dc2511a7da558dd2104b |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/2900365aa2888f43982acd1104aa0ba242556480 |     
  riscv32    | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/906cf3861a34768a324bb31a016b8e4b26b32b8c |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                 openmpi-4.0.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/bb86ad820447b32f81328c40696484d906af72e8 |     
microblazeel |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ae3af13f683e4403da59be9c935ddd6ed9af530c | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e035a6d958128aa8ed8f7ec5f7bf7b80c4c89735 |     
  aarch64    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/20b7a8abc441e573ba0781a744b716d586ee479b |     



-- 
http://autobuild.buildroot.net
