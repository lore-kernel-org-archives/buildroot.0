From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 09:22:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-29
Message-ID: <20210330092242.511DB83DE5@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  2  |  0  | 16  |
  2020.11.x  | 13  |  1  |  0  | 14  |
  2021.02.x  | 27  |  6  |  0  | 33  |
    master   | 114 | 42  |  0  | 156 |

Classification of failures by reason for master
-----------------------------------------------

                 samba4-4.14.2 | 6 
        host-sentry-cli-1.57.0 | 5 
                rocksdb-6.13.3 | 3 
                  boost-1.75.0 | 2 
               capnproto-0.8.0 | 2 
libplatform-a7cd0d5780ed80a... | 2 
                  monkey-1.6.9 | 2 
                 pcmanfm-1.3.2 | 2 
                 pixman-0.40.0 | 2 
            qpid-proton-0.33.0 | 2 
                 dmalloc-5.5.2 | 1 
                     efivar-37 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libqmi-1.28.2 | 1 
               luasyslog-2.2.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
       python-rpi-ws281x-4.2.6 | 1 
                 python3-3.9.2 | 1 
                 rt-tests-1.10 | 1 
          sane-backends-1.0.32 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/4bb612819f4cbda52b805bb85459c402122cde88 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/0f9c4631efcb3800b5bb2b27c16a89079fe72825 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3071286ba8bcc54f3e85408b8806b4a587c16e7d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0dbc59e3fac42f9a59b5772fc667fef971327dc8 |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/00d03b94be7879207345ce830c9827db0d2907b4 | ORPH
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/4383d125120077e4baeb910f39dbc30e9131ea22 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dece7ce4cdf3c31b9b10fa8c773575378e89a87b |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c3bb4c169c2e9ed857615eac679a8d7ef771fe0e |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/820fef13d16a80b3c9bb5935e4d967138847ad22 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9c37aee9e1a931d290a16aede809775b928722d7 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b502c77d72729c36439d00dd9d25b174780ded4a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/83cffa7dabbaf9740cea309b808a8e188d84c7f6 |     
  mips64el   | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/335168d1cb3358090b5bb6cf3707c5995a6cc800 |     
  mips64el   | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/8f6ead6adbc65abf964a9753254d74f46f82cd80 |     
    arc      |         libqmi-1.28.2          | NOK | http://autobuild.buildroot.net/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68 |     
  powerpc    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/ae13e270944a4097a608c68045eb621617bf318a |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/5a967ae52ce26b8091318b2f79ba6826db269d27 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/554a3b3ac0043f106312e753ad67d50dd121fbc4 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d7589eb8ab430143ae622860e4cc6d1e4c34b0b2 |     
  riscv64    |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/aa80db38d948ad61216307fef9b98b6aea45f41e |     
   nios2     |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/12d281a108927d4efbb0594a31b7dceae3bd9790 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/257ac6ffaaf8185f4eef6f07e818065af0c80899 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cdead7c49b05e281f78ba52799655f8437bf863d |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/04502b527cde11a277a15a190ff8b88a219ebd01 |     
    arm      |    python-rpi-ws281x-4.2.6     | NOK | http://autobuild.buildroot.net/results/bc5eecb067955444ed989664ef7e4ac85d971e69 |     
  powerpc    |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/8a7b4303d0448490bb56f095b236a57407e8b91f |     
microblazeel |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/e54531509e2268ce3e6f1b6fd087163397e69110 |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/6b4b225bebb2dff93f4b0b822815092136446227 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7611c52871749c48e09afa3f46bf38ba6f89075e |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/4f498a90926ae37ef9395622b5e4a78ab6a7674e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/92cc5f718f4a28cb08ca7d9510924631d572e2ad |     
   mipsel    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/a7b75255d39d8249ac17974cf73ccdbf43e330bc |     
 powerpc64   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/c5f3a047d831bc9303bba9dad5a7f91c01442b5a |     
  sparc64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/5fa2673058aac81196ebfbee502f1ddd19d448b1 |     
   x86_64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/a5db81fca8ec07159b69b108b742f3d060e3316a |     
  mips64el   |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/b8896929c9aeb5d56a4988014cd8e9dbe484c42d |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/2ea9ad4a7ad16deac3561accd3d9d4abff503eb4 |     
    mips     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/4b0caf49d5cda7e7f7c8dd725b8386b51bc5fb88 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/cb8b316cbf80dd7dc81eb4696fc9fac0c2fe8ee3 |     
  riscv64    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/61c6ff0c2110294eee7791ba0e3ae7ce10d91529 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/22e8f0449389bd0cfd4e911b2323c23a25475de4 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/49883c84b2947d7b88f948a0ddde57dfebe27863 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                upmpdcli-1.4.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/3a02c53d165d855ea5e1da2717eb2323ca17d939 |     
  powerpc    |         upmpdcli-1.4.6         | NOK | http://autobuild.buildroot.net/results/144a4322ed97872e69e9a1fc1617984cdfd45f6f |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                    quazip-1.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/32e163e8bf0695339f14fa5bec9295a51842ca33 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                       unknown | 2 
                  botan-2.17.3 | 1 
                 openmpi-4.0.0 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/e1debb3713f3064c5c3314df3b07e176d4b335f8 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ca1507555c5b7ea35464aca262b7e9a0fce2165f | ORPH
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3b3b27c8673b6b5f7cc76246f475c00a64abc09b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/0733890e43529b53055efa87451068a4a856508b |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ba8c357e5b3b8b98904af5c0c6c60c0f429a520d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/efb23aa37e78f676d39f33779a729692e5ee4e3c |     



-- 
http://autobuild.buildroot.net
