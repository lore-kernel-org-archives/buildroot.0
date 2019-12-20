From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Dec 2019 07:17:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-19
Message-ID: <20191220071752.96C138862C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 17  |  1  |  0  | 18  |
  2019.11.x  | 16  |  4  |  0  | 20  |
    master   | 144 | 80  |  0  | 224 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 16
                  apitrace-9.0 | 10
                   dante-1.4.1 | 5 
                       unknown | 5 
              alsa-utils-1.2.1 | 3 
         host-ti-cgt-pru-2.2.1 | 3 
                   libnss-3.48 | 3 
                 samba4-4.11.2 | 3 
                 xvisor-0.2.11 | 3 
       alsamixergui-0.9.0rc2-1 | 2 
                apr-util-1.6.1 | 2 
              host-grpc-1.25.0 | 2 
                  flashrom-1.1 | 1 
       gst1-plugins-bad-1.16.2 | 1 
host-google-breakpad-7515ab... | 1 
            host-mfgtools-0.02 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.4 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.2.7 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                moarvm-2019.11 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.10.1 | 1 
           python-bcrypt-3.1.7 | 1 
                 ripgrep-0.8.1 | 1 
                snort-2.9.14.1 | 1 
           spidermonkey-60.5.2 | 1 
                tpm2-tss-2.3.2 | 1 
           uboot-tools-2019.10 | 1 
                    wampcc-1.6 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/fbc8ef83611928462676679e8cece343edca0bc0 |     
    sh4      |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/9675c1e111d123973f6cc96e9087b29ba935cd1f |     
   x86_64    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/3ed262215041924c4b367a4a0d82008b569b6363 |     
    arm      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/f11ac4db425a53a1c108b1d500d734f4f48c71de | ORPH
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/2000b3e0642bb5ac41626a1c11fc5ca2d86e4b65 | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/1a1798e92e8ef7351fb5fce472b81a9c99e2c32b |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/e1194d7cd15037cecca9922a88c89273cbcc3e46 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/34ba6fc30b34313844e20ba5149418e270564538 |     
   x86_64    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/9af9576c21d63fe858abb9f352221fc3673000d6 |     
    sh4      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/6c51e772c47eac3c18d71099caf8f7594541e982 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4cabf3f848733b14a59e8b466340451439891a28 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/23119328671ba60e7fc0fd89cd0e9024f1252f8c |     
    sh4      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/800e280fe629052b5d79d0c065cb41476cb29fa2 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/33afcc9645fd7fb6df3b31f5a926f0bf9abb2a95 |     
  mips64el   |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/084a1ca3294da03cc723196b854b2f2604b6df53 |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c0e2f42ea9c35343cdd61427d756ad81159024c2 |     
  sparc64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/72976575f9cf44c307d7ef0525ea107e7b621664 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/a6a6d62b2105cf0b42a778d785fd1a6b548a1def |     
    sh4      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/d952752e3bae0450e8ef5ec0ee02b34496d57ed6 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/41288e1778e399fb8de9c8e054c076ba29f43b38 |     
  aarch64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/8e828b4ff5ec3380234459e6d0a2bd5d834c83ae |     
  aarch64    |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/769a73f28b0ad26de3f01d7e30985fd36448e415 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/820e57533b2e0b72a60213e2ab5eb3be0911296a |     
   sparc     |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/7ef83845b4f0f0ffb2258ad955612ee54bc64e4e |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/05147401d75857afc98fc98ac8574507fbd8f0fa |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ca768debb46fce1b22fc6ce4b9b9f1f6eee8ed03 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/877bbb6ab129a20ee35c0fd8c311e41f533e0339 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/3eb80a9040c8f9d52194025494d85127b6c246a4 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/f380dcb4d54b79087781df8b5b3df51178b290ff |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/3b42abe3f00a9a675f7f0d2a7eecbd218ea6f4cc |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/580e4a6cd651983e6eb5272d599e5a7885596f49 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/33820fd65e3dc4f33adc3e171a5d2a7b581fdc25 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/80f51ef40cbcf3de485f30b5e20c534507f9b913 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cb6f9e15d343fa01931622e59392587edba9c0de |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1c9772eec7c0aee81a2e56d63af3e77a27a739b6 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f1985113df0e6bd20063a7e98f3a1225a612bff6 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9515fd6c5b20a49d9c3004ea17109879a9440e63 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/fe667f603ff3d93a4c0cc242e5d17356de1e204e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/26e6a55250b5b2d8beb9a83a8fb1126f52581eb4 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ac0acbfbe76189f5c0fe09ddbcc5a0c1a2972e7a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/987fcc53623c55eac39bf528a52b4ff305fcdfc8 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d1e69f55002961e7427edb82b20bf6aef4007d92 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e3fc8b0670d00e8a478d526f5b084fd73b23b435 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e5b03bd33b6d9f77f61b53bcb33abbd296b1a19f |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d0b47b7a02ecebdf5501513efdab4a5f607e70a9 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/25cfb28fad8828e80c849144762ec2f708ef066a |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9cb24b8046982f7a28944718d472e265b4e6f200 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/d7aa797ef4b2b19f65921751fea84d50cd0556e8 |     
  riscv64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/24e2f15c3b08d1be825cc173189b7cf873755607 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/c754c07f4db698c7274fe947f73937a7fcf69c3a |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/defacd949b4b8f8c82df7344aa8eb3a2fa7f4fd3 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/c6c2fed0a0836ec595e6ae38767eb68d4726e902 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/64a8d438d57430d0f11040b4d97c32b6c40b26ae |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/cbf325db0b4edfd921a3b457a343a2f24e992f70 |     
    arc      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/3546bb7febe20c59a88ddb567290e207a2672220 |     
    arc      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/4d4a2058bf900531d65bae0357628d85fdac5491 |     
    arm      |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/61648103631e25b1ec36a7ea5d76daf1ae716329 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/fd60dec7a1f01b86b5eda3e8cb0d1acc3756c21f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e2cde8f87bd5b51259adf0b4f6f516cf669b2de8 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a0c6073e6515b9b2dea9fe241b57c49f303b9dc6 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/efa3467ba7324e372dab5fcd5d7331e291579db5 |     
    sh4      |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/27712c4ba5abc079ca41d5e7d9215cec5ab30c13 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/783614e7c77fe2e8e65d28a00fee127aa2096702 |     
    sh4      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/dfdd855bf0ab737f470a6a0aa293cf89ec3fbde9 |     
   mipsel    |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/e47ce115c5a5e41720cc2e8e91f9ad93c86c5217 |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/c0aea0f1b1b595af7f84e586a4ef211aa782a114 |     
    mips     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1389ddfc691bae196d42ee9ab8268f73ce022bc5 |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/2158ddc2bc4435af9432396a8fdebed4010375a6 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/ae5f8df0fefc55d1c76897e616aa939a967c31c1 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/3078583b8ba414579958b9cf3f87ee8b833cd618 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/06c8fd9fe7b6f6801d8c51bd3715e5b0045bfda1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/be6599f3d1d16d7b642b42b585c3f0dadd819290 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0f4737f2ed187cd7ed400b1012b42bc94f25346b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1334d23c77214156b35201d57d27990071c2fd0f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/c147fce3529220c05024907bd8ae7f3bb3439228 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/2cd406422fe4201f03683a0d34ad9f0115ba44d1 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/504a24deda11350dad18615c419c162d31a7a913 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3bcce4f536b748959765e3b04e83bd5879d0ad2f |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/bf86273b0bb3053e36a331b6171c1c4aa0d841e0 |     
  mips64el   | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/1302c86c8c6f49e799548b09ecf048cc8bf24e97 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                python-mad-0.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         python-mad-0.6         | NOK | http://autobuild.buildroot.net/results/45e5a6546446715dd5440751c0aa987f0c96f2c0 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                haproxy-2.0.10 | 1 
              host-grpc-1.23.0 | 1 
                snort-2.9.14.1 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/f9b7aaa57b63aa21af6512db8f7ca52c8c089c72 |     
 aarch64_be  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/2548a5d0946981938171d80cf08fcc5e427cce31 |     
powerpc64le  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/466cbe4d247896cadbf6ba21518eb0456380e059 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6bbf7c925cca6eec0e37a6cb1ee4079309319e7a | ORPH



-- 
http://autobuild.buildroot.net
