From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Jan 2020 07:17:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-29
Message-ID: <20200130071726.1BAA4863DC@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-29
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  1  |  0  | 17  |
  2019.11.x  | 12  |  2  |  0  | 14  |
    master   | 70  | 70  |  0  | 140 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 9 
                   mutt-1.13.3 | 6 
                    parted-3.3 | 6 
          libpam-tacplus-1.5.1 | 5 
                    olsr-0.9.8 | 5 
                 libnss-3.49.1 | 4 
                apr-util-1.6.1 | 2 
                 binutils-2.32 | 2 
              host-grpc-1.25.0 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                libgdiplus-5.6 | 2 
               libupnpp-0.17.2 | 2 
                     lxc-3.2.1 | 2 
                 mesa3d-19.3.2 | 2 
                 mono-6.8.0.96 | 2 
                 opencv3-3.4.9 | 2 
               acpica-20191018 | 1 
                 augeas-1.12.0 | 1 
                 exim-4.93.0.4 | 1 
              fluidsynth-2.1.0 | 1 
           host-doxygen-1.8.17 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-12.14.1 | 1 
      host-uboot-tools-2020.01 | 1 
                      icu-65-1 | 1 
               libsigsegv-2.12 | 1 
                  luv-1.34.1-1 | 1 
                   mimic-1.1.0 | 1 
                qt5base-5.12.5 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/9d37dcfbcbc7d6ad777cf979e721be7a7f7829d9 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a9dee43b1126cd606a48a451f19bfd1e8393beea |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d95e48d589f5acfe73a2939b3abcdaf26b54e806 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/6feef1b9e34a8371c330ac722846cd36fba36c71 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/85366e55f1f47aba966d7d965c0b1ffa2fc024a8 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/6ffde18af6cad6e63a8e16681eaa521460548079 |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9deb526635135926158978ad537cf3e749cb3b4d |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a77875ee3752dcb9017a2a7153e24f632f724a70 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a9eb460708e9b42bdc708789e9b7fecca03ea8a7 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/28647054c65fa9d282fdccac26a68d666495f7cc |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/47870d769222024ebc1a196d76bef9df4c42d7af |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/50e50ca741bc3e24df8bc986146d6568f7a353bd |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/486768626e2b27568bf2d1f3231fdbe289221f68 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/847756bfddefe56a6c5146d94ef589e8a0dd40f9 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/83ded444dbf1b10167b84234cc8acf5c335bad0a |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/7e42e0f7ff1e53ccc735118838eedb943e3ccab6 |     
   xtensa    |        fluidsynth-2.1.0        | NOK | http://autobuild.buildroot.net/results/3dac9a5a033be3338117b7ede00d047e06c76852 |     
    arc      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/8c4fc1c855a51e98acf6175d8927bf88be541e9a |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f1ad0b5d07f953b9976d68ae392feb04983ee577 |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e267240995a85f7bb4865adcee1417ab158e6f64 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c97f119a0622c3d950954254de094aebb9caaa47 |     
    arm      |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/dc78f544b089da5b7936c71db1ea91df28994757 |     
    i686     |    host-uboot-tools-2020.01    | NOK | http://autobuild.buildroot.net/results/407431377e3820d937d623473afc770e32ef38d8 |     
 powerpc64   |            icu-65-1            | NOK | http://autobuild.buildroot.net/results/40a7ba98c470d450384b78a20785d157a2feb368 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5a3f379b2cb4e02882b0f66faa8abcd04849e9b5 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/47bdf5e622c6c5ff6c9a18423a95e3015fc80d12 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/8100ca5aa80dbca5fe882efb3eb5f15057cbafc5 |     
    arm      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/c21154f24d9d1ff8fdaf343b0573edc9c00ee21d |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/281af211bd2e0610cda7b1e170ea0972b6b538b8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/7b171d4a4317a69b13794c00e8a8a9ffad74da18 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/aa7cd66e4efdd93fccaaa78f1c2e5c0b49c885d9 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/b943615e7a1d90d4e83fc43201001dad85e43316 |     
    arm      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/5885fca4e1aa7313a0fae1360230418c8a09e5b5 |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/9cf4793383dda1ae07daba19ffcb17b768964862 |     
   xtensa    |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/2c06597c41bea8192bd8045fb8299d5a5da74848 |     
    arm      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/0599d05e7e2732ffa894e0d4b2b47526dbab4d9c |     
    arm      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/84757f121c27ad295e7ae000fc4df39ebc3b0bb0 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/b5b48d40a48b43d68ee8bd4f5289e56392c75598 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/0babb762fa43659258cb8003007aba85057f5908 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/da1f8918a7ee7bcd03646cd8ea01969a6498546d |     
    arm      |          luv-1.34.1-1          | NOK | http://autobuild.buildroot.net/results/c478650b8a9935ec7e3f4a74bd4b6a1939b02128 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/0b2555b37ee6ec02530ea50cfbd5075b87f43eab |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/a90db9cfe7d1086e1830ad97dd0bbf53ae3f1656 |     
    arm      |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/53c755512ad1649f81f3e7482633b6ab2034af8c |     
  mips64el   |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/25aacda264aa572d8d9a784c481696e8d80f8891 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e458133468b9da3cf58c68b13ee1d8b0c22b8c84 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/d76f946fc8faf03eebe9c740c50554eec0e537b6 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/053a940fb46bc61d2cde8b5fe8119d581a6f9531 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/59672c7fc9eddcb8986499071bc2e925b233535d |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/388a05bb0d62f69a7b6460caa8994c14023dae20 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9e65963d1bf513920652e7dde9a5a1c2801cf697 |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/699f8d50def7f3d69f42b68352968b70b50c97e5 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/3185bf807b3fdd0b7240b9b61b4432fe14c0b41c |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/e037480ec8b9722c513151a8530c13e4a7b052ed |     
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fdbc048fc25e228c497b5434f97da3a5b551281d | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2b1ac12b924d0deadb0bbcd6fc7d86ebe4bfe3a4 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/788c0c09707f57e55eead284b324bc4df8d2443d | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0ed5e5e1adaed66ff5aa2845c5e5dee6d4ef9d17 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/93e5b359a0c2d93fdbe16078449a6f406f00e358 | ORPH
  riscv32    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4616e14fc18235bd97cb5a2f966f2abbec8c57e6 |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/12f07f029e5869c1ef4fbb905f65140f21923d24 |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/541c83f820802c8f7e1675f331090ba488c14d02 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/ee768e442ec57f131e9aacbb58d8b86838855b45 |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/46b2f30ec78e160b0c26b93352144e134cdc7fe0 |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/38af593012732a4094215315d4550dbd607a74c1 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5a323afa3031d8537d1ff415607be65c496a88e0 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c2c6a16a37a85d8322f477025fd9e4771bce30be |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/0aafc680c0ed95871b71152906081db71b9fcbff |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/f674e302e763bd0c350720b14d8b14cbab28b812 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8042482647890bfba12c0c46f8c2e16b0540fef9 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/632f0c0171267c33c99e966a2495c842359769aa |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                libcurl-7.66.0 | 1 
                oprofile-1.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/fa70c3988fcb66257d59606faf71506f671aca75 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ce549fcac5d746aeb2873e99a86da5c27b7c45b5 |     



-- 
http://autobuild.buildroot.net
