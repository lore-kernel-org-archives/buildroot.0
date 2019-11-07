From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 07 Nov 2019 07:16:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-06
Message-ID: <20191107071620.DA2F487590@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.08.x  | 16  |  2  |  1  | 19  |
    master   | 107 | 64  |  2  | 173 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 7 
              host-grpc-1.23.0 | 7 
am33x-cm3-11107db2f1e9e58ee... | 6 
                  cmocka-1.1.5 | 3 
domoticz-0f411f781ae4fb4a82... | 2 
                       kmod-26 | 2 
                libselinux-2.9 | 2 
                 libv4l-1.18.0 | 2 
                    php-7.3.11 | 2 
                 ripgrep-0.8.1 | 2 
                  gmpc-11.8.16 | 1 
                gnuchess-6.2.5 | 1 
google-breakpad-7515ab13768... | 1 
                   grpc-1.23.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
               host-llvm-9.0.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
          host-waylandpp-0.2.7 | 1 
              jpeg-turbo-2.0.2 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
                          llvm | 1 
        ltp-testsuite-20190930 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.2.2 | 1 
                         mimic | 1 
                   mimic-1.1.0 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
             openjdk-12.0.2+10 | 1 
                qt5base-5.12.5 | 1 
                    strace-5.3 | 1 
                   sudo-1.8.28 | 1 
toolchain-external-codesour... | 1 
                 uclibc-1.0.32 | 1 
                    wampcc-1.6 | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/e7e8a67be9b711aaeced88208df5d1516496f7a4 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/d5271d97a7a2c1f35505e8e8800353784d91859e | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3bab810db689df568ecae8e5e96e3e88943ea8cc | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/cbcfd9ccd28cb80d34e67abd64db253517c6a5d4 | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7ca4ab8d96d311dd562c845b3895b46e67aed2be | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/bf8657c1ad4d62b75106660d3816f562f2de0a9b | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/96716e23760df478daecfbb68083b47c21c73d38 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/90148375f072b8b6434973137d5f2034d15ae226 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/2731873571fb88a69683973d22310c19526e304d |     
    or1k     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/3879158efb286f0364c75f5206fc964e9955bceb |     
  riscv64    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/854ba5c8015e49f9c45b7a4e9ced6728a05ff4b2 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/859d2aa595f8162db0e0cee72fa884bbfed1f686 |     
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/4210aed77a77e0f7f313134dfb5306de19d3d36d |     
microblazeel |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/8db5506474b83395d03579acf8fdadfe9dd39312 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/c9b27910dd230fd2d34ec6a8e20779ba4dccdcf9 |     
  riscv32    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/8bf6ee3e559920aa8ee21d29dccf8bb1b63180ba |     
   x86_64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6ae871014cd10e3f025a2f9febd02c7614b2146f |     
    i586     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/22b214e6161f4db0772d91f4a922587f9cfd51f0 |     
  riscv32    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/4e3c761f685b2898428771cc125c62fbe4c4feaf | ORPH
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/c6c4dfce2535c76338ccf0006cb78327dd4d94dd | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/732e14f68ae35deeaab778c7dd0e8e13a06f6cd7 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/2269906f29b7b1874e99fb7db243190951e068d1 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/80e2cfd80b01c90b156aa3d8e19a846373d3db54 |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/abe44cb9a29aa7d7bff1fba8545c57e088b08036 |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/76dd5be06f17fdae20e9a6aa10e6900e21f2a05c |     
    arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fdb7a78e8b10aa9e218cc00654bc447d9431a869 |     
    i586     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/d8238cfd8b9a29b4e8858477153739581ea52652 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/ee27b3288caf990b7716509f2fcf9b22e4cc8adf |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/97506ab54b95b02700747ef9fa124615265e3a20 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/a1026b171f7e8d8d6a99a5978fa7419e84de007a |     
  mips64el   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/d3aa03ca7085727d0794228178c7744859900137 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/f03b3c1c5559f247c703a16f946428916a92f971 |     
  riscv64    |      host-waylandpp-0.2.7      | NOK | http://autobuild.buildroot.net/results/717ee0bd1674093904b3656f54692d0125c7116a |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/5806f2d5fb1ccc7cd7edef80361e8bf57eae7091 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/6dab76bf43b15de0ab7664234c0af682cc3b7193 |     
    mips     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/12127f4ff54dec2ed91ed6d1a398f3bf8e6f9c6c |     
    i686     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/452df675f1ba5e97bf16485823d3d437bc39b415 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/55e8172b2d61c1fb110216e6603036ae74f029a9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c3d926472d35b435e07bddca208f5218d9646cc8 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/f316fd0ac92a9e04b245ed50aba86df3c4785451 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/48e7a7f7c72634d59cca817778d31661bfe8e72f | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5f961cbeba962c27dbb26ad4d6d984f18d4c7c50 |     
    arm      |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/1e3079c82020a7dff24c0f6de270cafdf8504d12 |     
  riscv64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/d7d87927099228f786b9d3757322035f6e4d4255 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/88cf7b73e90e914195c11a467e56feab81e4b2f9 |     
   x86_64    |              llvm              | TIM | http://autobuild.buildroot.net/results/6cd65259ac74852405369d5dbad2d7e16f0926c6 |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/3ed737192504bc29bbb1c9423026ce76e00fe1f4 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/aeff5cc80e3451536a862e00019b19d0e5a27ea0 |     
    arm      |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/891acd135b9d92067da83aee4c987e872137d07c |     
    mips     |             mimic              | TIM | http://autobuild.buildroot.net/results/83260e249d4df4123dbed9d93b2fa2d67deaff85 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/0bc9560a19aa24364dca71e85f4317c9c094a302 |     
  riscv32    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/4989b24609a0e98de99c2f75a9bccb4d2a49eaee |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/59c89c1e322aedb6e5920c7252d9446d93cf98b9 |     
    i586     |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/cd4751b7c0ddf2798349676be8efa6c675a0e29d | ORPH
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/cf0a88ac433b163b0fd08c202860183907c2cead |     
  riscv64    |           php-7.3.11           | NOK | http://autobuild.buildroot.net/results/dd0b4a9d46e04cf03883b0754029aff02e0da144 |     
  aarch64    |           php-7.3.11           | NOK | http://autobuild.buildroot.net/results/fee97d1879b5ea2d9630b2ae629f12b0e202a50e |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/0e0d3275d3596ec9aabea3ca873be685f38291f8 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/674520b06be88ef95b0dcecb4a5b278ad7ddf297 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/756866026cb75af722968ffbb0eec11e36da98af |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/6332870244f062452531a7ee51c868b5eb360e13 |     
powerpc64le  |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/d71ae11e6614cdabfeaa1f36490ba1af5d5481e2 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0a3c88134b22d6a41ba8ada3e1e3545ce54e08fe | ORPH
   xtensa    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/739457b4c7d38c4d5ba898911a98beb28c66a2c9 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/04643277feeeddc88a40512196ac3b904f621f7e |     
    arm      |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/cca18ae5ef97769611a96f84430d870fe81433dd | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
                    host-clang | 1 
               log4cplus-2.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0db9705e270864be94fbda18d61b583194bab8e5 |     
    arm      |           host-clang           | TIM | http://autobuild.buildroot.net/results/b08d2a636c5e4ee41788d9ca6518458e0ca63b28 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/e6be5c7c7a9c18079ebd5e436b4c7f639c533e8e |     





-- 
http://autobuild.buildroot.net
