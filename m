From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 09:11:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-19
Message-ID: <20200220091148.69154204A1@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-19
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  9  |  1  |  0  | 10  |
  2019.11.x  | 19  |  4  |  0  | 23  |
    master   | 62  | 53  |  0  | 115 |
     next    | 21  | 10  |  0  | 31  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 12
                    brltty-6.0 | 6 
              host-grpc-1.25.0 | 6 
                   erlang-22.2 | 5 
                 mesa3d-19.3.4 | 5 
                       unknown | 3 
                    mpv-0.29.1 | 2 
gr-osmosdr-46698a67e7e06419... | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.13.8 | 1 
               libglib2-2.62.4 | 1 
                   libnss-3.50 | 1 
               linknx-0.0.1.37 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
                  pango-1.44.6 | 1 
piglit-ef761094be04d14e258a... | 1 
                  polkit-0.116 | 1 
                qt5base-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1d0b38c32248ba223d70463a49522f0e2f591ff0 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/eb53e8b85f7c0a5eb036f9064acac192bf9f53e9 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/af0e03666b343aee3b28c9209e05491a0b283ee3 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fb8cd3f4d5def4cf6470630597460c16f7f99dfd |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/67284271ddfa8e8899b218fdbbd46ae5b1dc6544 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3f72e8e2da79b8d996a28763b846fcae9444ad0d |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a46536a93e6c44dbeb0c351d154da12850a54089 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a0e965a58d38df71b9830224603ad70219831d84 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/07fb500b7bdab9ebf600303010bb96257790a6b3 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6611008b8d9f636d5149943d345accbaa713f7e9 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6bb61ba7bc4cfd857de72584634c0d5b9eb9b289 |     
   mipsel    | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/890a7974869f56346ed99ec875fcfa8695c1265f |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/78ed93784a139b329d8f816a37c35695dbc68052 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/fdc14e54d078f2fa23376f3e5c32f3da42536848 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/58aa95b0e7623aacbe491860c5184e6b45db6538 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b7de7bb62498e6718561806200a94efd32797979 |     
    or1k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f640c45a2269ac37edddfa70f9040217f30af24d |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a1d2d926b326a1f7cd7af9b19b36f6b89c8784c4 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/2e5904a92afb4b9606da8d1565759f048544e956 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ba1925d51ba3b41291ffa4089278b6857fa4cf27 |     
  riscv64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7af91cf7544656ffe80f846738eb241bcc611c7f |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/b692e22df5f847f4c78682cd7e01f336ae6aabff |     
   sparc     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/1958172ea9b13ec7064c9d98dc0866212ff0cbf6 |     
powerpc64le  | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/cd9c90033350a567a7d76bb83f3da031d49d10e0 |     
    mips     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/0fda73b730fe2e447371e5c2b1e4ce582f5aff9b |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/032ef8d780b85e0155e4368b5f077a4852401394 |     
  riscv32    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/84c0d314cf3c5b658f1de7f79501f7c82c3530db |     
 aarch64_be  | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/261db0aa72097cafea87baa731dbbc986e93bf59 |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/84e1cd12c6a2f6c830e280debd376351e9a7103f |     
 powerpc64   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/ff670d1445b8ddfd53d9345bb0779eaac0a51592 |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/dc907421a343b8523b14fc9a846e0caf7abe630c |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/d8cf656a20ad382d8303296bf87a33f5f21280bc |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/35ce460192581a3ce2866ef5d3cb5391afd68cc5 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/d9904d693c4f479419ad49cd3d4bdd9baddaf709 |     
    i586     |        linknx-0.0.1.37         | NOK | http://autobuild.buildroot.net/results/25a20cfe2aa6bb9067c833221dc5b30a90bcc8b7 | ORPH
powerpc64le  |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/34d58f9c0587a18d2610ad0752ab728d4828afd4 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/d3d2db97d959e4ac5abcd7147b767cbdc12d2880 |     
  mips64el   |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/e3c781696bf5867840f30ecb5b45c41f0791c228 |     
   xtensa    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/5cafeafdba05bd8edc826c3ab1ad766d080af0ec |     
   mipsel    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/2e7ab531ee4b7c9e2d8cf1d5301e16591fe2dcdd |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/00d3fd36801e5ed0492b60a858c293d74a85ba31 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/78b13cc29b416182e7ebb0c09195df52712ed13a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/630ec008012f402915c04886a842cd34a5855fb9 | ORPH
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/1bf16d7ea4f722c4c16e8343579a7cb9812bc65f |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/5431e3bb0c99b429572956b18529c9c26199e329 | ORPH
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/70fcc28587f2e7c0f62f3870d4acb9e8f21bbc8c |     
    arm      |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/5f60fe626987b91814fef13a8cff442f9af8d0b5 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1d80c28155c86fcd87e1b46e634df7dad76b552a |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/cc777cc4609133090e27d331a7abce3c455fd0d7 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/38d3dff6b2bc5c07a5b06b6a6e934a5d74396e31 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f5ae533cdd1177abeb3617b0d0b19325447c5c9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a24b7c8d1986d970efe16d9a31d3650fde7179a2 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2618966c663e67a2213d94dac46911c401463eee |     




Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

host-sdbusplus-4212292bcf13... | 5 
                   erlang-22.2 | 3 
                    brltty-6.0 | 1 
glmark2-9e01aef1a786b28aca7... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5a64dfb845389882c366b6c91aaf5868c090a802 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4a26f4a94a8275d7ef7ff89f03864c7fe32ec590 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2125418744cf3150161c5c79c4582192ac430fe4 |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/97606fcd11eaf0822b58a9532c5325601d43eaac |     
    arm      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/346cf82f2ae1241c17790330c424fa8ed1cc33d4 |     
   sparc     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/a0e96374163f7f8a6e11573e9d76737cb0d25163 |     
powerpc64le  | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7309d48ce06428ebf4c871c669d525cfb23fb17c |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/9c4e973857017d0c13353934fbb989719daea506 |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7a729af1d9f74894fc7c4d4430bc0b3ad4b0f000 |     
  powerpc    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/3f4d007181d35c553ea659f440d277c4e9de214c |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/5bb6c61836c0681902664165d5322ea5425e519b |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  ramsmp-3.5.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/a79b5234478369aaa5dd4006b254ad229e74f731 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/986b13e66e692e47ec5a3abfc57f0231ad4db831 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/adc2be9de2d288c2ccbbf5299d762f5cf534aa41 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/1054cbea7a75a2b3e05645b2c85bf2377399f9b5 |     



-- 
http://autobuild.buildroot.net
