From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Oct 2019 07:16:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-28
Message-ID: <20191029071635.81C9385725@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  2  |  0  | 20  |
  2019.08.x  | 18  |  1  |  0  | 19  |
    master   | 151 | 80  |  0  | 231 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   duma-2.5.15 | 5 
               libsigrok-0.5.1 | 5 
                       kmod-26 | 4 
                libdrm-2.4.100 | 4 
am33x-cm3-11107db2f1e9e58ee... | 3 
domoticz-0f411f781ae4fb4a82... | 3 
      glibc-arc-2019.09-eng002 | 3 
              host-grpc-1.23.0 | 3 
                libselinux-2.9 | 3 
                  flashrom-1.1 | 2 
                  gmpc-11.8.16 | 2 
          host-libsemanage-2.9 | 2 
                libgdiplus-5.6 | 2 
               libgtk3-3.22.30 | 2 
                   libnss-3.47 | 2 
               libupnpp-0.17.1 | 2 
                 libv4l-1.18.0 | 2 
        ltp-testsuite-20190930 | 2 
                    mpv-0.29.1 | 2 
toolchain-external-codesour... | 2 
                 acsccid-1.1.7 | 1 
                alsa-lib-1.1.9 | 1 
               asterisk-16.6.1 | 1 
                    bird-2.0.7 | 1 
                  cmocka-1.1.5 | 1 
                collectd-5.9.2 | 1 
                    glog-0.4.0 | 1 
google-breakpad-7515ab13768... | 1 
                   grpc-1.23.0 | 1 
                     gzip-1.10 | 1 
                 haproxy-2.0.5 | 1 
          host-waylandpp-0.2.7 | 1 
   jitterentropy-library-2.2.0 | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.4 | 1 
                   lrzip-0.631 | 1 
                   mimic-1.1.0 | 1 
package/mdevd/mdevd.mk:41: ... | 1 
              python-pyqt5-5.7 | 1 
             safeclib-03032018 | 1 
              sigrok-cli-0.7.0 | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/5f57740d9a187db089c1a428184d7ffff5c01d88 |     
microblazeel |         alsa-lib-1.1.9         | NOK | http://autobuild.buildroot.net/results/6c921a2ab4dd136d064b3016c0af8e8333c2064c |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/431e87a81a70e9588619a00e71fd24aad99ad00f | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/86f18ce971d36e463d4face04926192642317312 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/5705fa4d2b2d92e8268e9238d7e080f7070a2eb8 | ORPH
   x86_64    |        asterisk-16.6.1         | NOK | http://autobuild.buildroot.net/results/8f16704456243b0a0ec0aa78e68683d144577de9 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/4a641d779e66ecd748adaaa74f706d757f995dd7 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/efb0928fe7f8ddc8cdf6a22830eacb26724feae3 |     
    mips     |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/f7836c6577e411af4e866d8e2bc26aef189e90f3 |     
  riscv64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/67350bf373d0ee597e5bb1a9dd51c51610d2ed82 |     
  powerpc    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/6b440cf1beccb3100b3eaf65bfe11f56aa5b17bb |     
  aarch64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/3f151beb44e64a51bd2f9ae271e925b576bb3562 |     
  aarch64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/80d035da6b74fbe935052a09ce6c2664dc0330ff | ORPH
   mipsel    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/a779704f02a7766f399e592bb7a2ba8e2b20fb9c | ORPH
  riscv64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/689267c8e7c2e28f87982f4cc0ddfc2c7afec170 | ORPH
    mips     |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/8a8a8e36f8b00838b06bc4f77a19d74928a31cdb | ORPH
  riscv64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/c7de1a1d01edced2098a804ad87dcb67b5dc6832 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8c790bcb78c90b06ee10acd39e85359ea93e94af |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/e3711053456cf3b725ff22fef487fa41afb31fc6 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/62aaf1369711508b42e3b7a448f34ebe2a337cf2 |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/9a4b55c7e579e66296177049437920129895f75f |     
    arc      |    glibc-arc-2019.09-eng002    | NOK | http://autobuild.buildroot.net/results/111f713bad195efd874000c28380ede98e3c1370 |     
    m68k     |           glog-0.4.0           | NOK | http://autobuild.buildroot.net/results/5a659d960c24256a2905f129dfa70e3dc9e92aec |     
    i686     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/3de60bd9a9f8f2ad94a7d12e03263cdaea918251 | ORPH
  riscv32    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/e5832e6a964c9e4f2b561cfb8d94ca5aa033c017 | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/3ced0558c03737bae033e40f63dbdc9940f61f00 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/5a29a56797bf6fb71a586a7432870619eeff9f7e |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/346fa25ee2ad9972d39ddb86c054e4696542d1a7 | ORPH
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/9c0bf58536194abc75392cb59953af800789a5ae |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/272f2fccda6cfe4fc76b3513e8ea6d1c2206b423 |     
 aarch64_be  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/48174479d8762d6fa13345b57f0e8462cc9c4c0d |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d4377163083b245ebbd8c9fc3d2ae869a7f6dae4 |     
  aarch64    |      host-libsemanage-2.9      | NOK | http://autobuild.buildroot.net/results/31affb70f3d59e1d78b18c9ce14e41dc713abd07 |     
   x86_64    |      host-libsemanage-2.9      | NOK | http://autobuild.buildroot.net/results/ad1f033def500b4354dc6261c8411f83420c409d |     
  powerpc    |      host-waylandpp-0.2.7      | NOK | http://autobuild.buildroot.net/results/9c8a010a33a4862f9001873bb5c8c394f79eba9e |     
    i686     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/e7898028c4c1f6d02c90e7e35ded027d8879b865 |     
   x86_64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/73204321e42de26ab81badb2eb909879c6807910 |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/4ee64b9b0f67b0c380b146376914b3810e1fc241 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/d0042118ab6db71aad77d4b43bc3f102ed6a4d97 |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/392bd0cac15eec7aef8809c5af6bf3d5ceee39dc |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/43a7eb879967d8f676a4e1767ecbf04091732266 |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/0864a4068b77001fb8b4fea7aa1673bc5fc0e673 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/d03d0214f338493c0248bf43f6fe75f2c41dd557 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/4bc857a92506a1e175096e44b833360aec75f3ba |     
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/92b10b13efd634bae86a7e6df4631815f1726b3f |     
 powerpc64   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a2291187fde54edcbf3fa690bf912bc5a03c38e4 |     
    arm      |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/2ec32ccf686a52d9eca0cfdc6beabadd90328c8a |     
   xtensa    |        libgtk3-3.22.30         | NOK | http://autobuild.buildroot.net/results/7db0dfcf1b9f0fcfb1c04477f7fa77b8272ef97d |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/cf1334acbf53c64d2a6c2d24fb7b19ffa3281a90 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/ecab8445aa817368949a5ad7f20d1fff08e41e46 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/690318932d2f8877da264e15a2a728131cda95a5 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/855c2c1a14c7c2b3046e8db38053d0bceb2e2a38 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2e64ce03601dec98b06020b06faa2c5b8fd23be0 |     
    arc      |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/3e1653d3a4cf5d025a73eb668bbf68ee510b9f78 |     
powerpc64le  |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/ec1f9f57944139b24738c1be529c4fc4b128a516 |     
  powerpc    |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/a17cd58048328d77a1578ae56fc9dd82db7f955a |     
    m68k     |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/06ab2a7f048b03f824ad0a88709cc0e89574702c |     
  riscv64    |        libsigrok-0.5.1         | NOK | http://autobuild.buildroot.net/results/0a84f234daad891df97c1bdcafa5564adecc95d0 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/4a9c115acfc438a69452d43fe24e5d832ab22f31 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/da18db1204636502d6d19cb251d7d7d5c55a3ba4 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/398783a2c001473cb29d4c084e820e6157e3518f |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/3abff4e52ab77669f7ef15bf306e6bfc2bd9c8b4 |     
   sparc     |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/08952dbf89bf3c49da7697943441cee411940420 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/395897741aa498743513dd390eea90245e038dcb |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/2c2ec8a2471046b4313cabec892c852f4ced0f89 |     
  nds32le    |          lrzip-0.631           | NOK | http://autobuild.buildroot.net/results/e51f1c39048f23a9a6a6beaab45576daf98763f7 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/0051334a885e8fe2d362acb81f0d9f12c51bda21 |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/4656a2d39937c1832e20cc41b0c02ae3d78764d1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/fb6d985f2bfac2acdf758b5537c2bce3a777031b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4a3f314a3dbd34e59ca91269c6bd8dd7978ad814 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/38bde7f1f038775faa0d05b5283e743485743874 |     
 powerpc64   | package/mdevd/mdevd.mk:41: ... | NOK | http://autobuild.buildroot.net/results/cc73e95387fa65ef922cd020a95b7683b3fefd27 |     
   x86_64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/16d2d5537fe04c7bacec39bd3242ed987b5cd639 |     
  riscv64    |       safeclib-03032018        | NOK | http://autobuild.buildroot.net/results/31a4b647ec0dcd9f517f313ec6c7c8f56da1ee47 |     
   xtensa    |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/7ae2639860612fa91a4187635d5130416a9d0b56 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/852b388443c07599a3ae6f4b98c5874441cc5005 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/c5f4a556043dc6bf71fbb9e9ce269d3f1f5d121a |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/78dc6428ffaa529fdad8e9c8aaec49ded5f0209a | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/339b23d8ccd46f7550ae150ad18c3adcea73dbae | ORPH
  riscv64    |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/3c7cfc0cdca59b2d9f6fadb4ba391c579309eef2 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
             libopenssl-1.1.1d | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/6de864ec78a4a2c29a21fcf2dca7d0f5b91a6f01 |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/3de00ccc9993039e6c68bc6893230cee32840483 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           python-numpy-1.16.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/94b759ef71e7fc64137c960bc2e361eef707ae37 |     



-- 
http://autobuild.buildroot.net
