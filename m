From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Nov 2019 07:16:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-27
Message-ID: <20191128071644.7EF0C203A8@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  2  |  0  | 10  |
  2019.08.x  | 13  |  4  |  0  | 17  |
    master   | 116 | 39  |  0  | 155 |
     next    | 10  |  6  |  0  | 16  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 7 
                libselinux-2.9 | 4 
          gstreamer1-mm-1.10.0 | 3 
                 acsccid-1.1.7 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                    czmq-4.2.0 | 1 
                   dvblast-3.4 | 1 
                  flashrom-1.1 | 1 
google-breakpad-7515ab13768... | 1 
                   grpc-1.23.0 | 1 
                host-go-1.13.3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.4 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
           oracle-mysql-5.1.73 | 1 
piglit-ef761094be04d14e258a... | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
              wpewebkit-2.26.2 | 1 
                    xen-4.12.1 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/bb4cbd8bf42a55fbb9f1d2432fb9154927b49678 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/2478059087b08cb7eba19d0d884771c514257010 | ORPH
   sparc     |           czmq-4.2.0           | NOK | http://autobuild.buildroot.net/results/6971084528a82e47c1a9f63092af753bba0f3449 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/96b7d4d9c3b0d0706a4d5749103ee5636f796b47 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/8709816600b2501cb301da3bbebd356d9ad9d798 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/cd479f67655f92e09f6ed9a70450f7aba583be6a |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/a259400fa9507099ed0a36bf9583891c249125c3 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/dd6cb3f29c67e2cb4c621d874da762afd4834ea9 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/984630458d0add3f2087a5684278df274c88d9c4 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b7e4740dcbda71826c9d2aee9a628d0c672c2320 |     
    or1k     |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/8200599832ed0d29227c5d3c8d5e9b45365f64b4 |     
  aarch64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/abf79c923b150f1832c19c3bc2f611f01354f66d |     
  sparc64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/25a3dd4867ce79f4a751d1cecc0f0915be0fd6d5 |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/574a657e7c4434d063d83c59e28f620736443db8 |     
 powerpc64   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/cf4b24a073af7a9fd398fe5cd04c95b77303f7aa |     
 aarch64_be  |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/f29c21c202d9f7527587f254e41a4d6b9cc91c45 |     
  riscv64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/3ef6f00f33184a9c6716dfd97ef6574e2fac74d4 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e8b468bd83281cda4f96aafc4fa2f4c794e8732a |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ad689b08173548af21dd1fb0e827fd561de6dfef |     
   sparc     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/1040d352f229edf738133d8aee2a4b719e060a82 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8601f224211ae289f058c8b55b7ae5bf87d0b64e |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2ddbf8204b2c749b303cea22c96717ac9c27fe8f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6b96ae2edada97190bfc0bbb40196f39286cfb9a |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d3d4521151f8f13320de9236c35850dc7497a52f |     
microblazeel | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/6829b55d471741cf53625ee8e2d39c5420504f40 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/5707ae10b6bdc9958f889a8eafb8f4f52cdbe501 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/1654deb3a108d37679f8394a2b1a80d30dae4a58 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/056615227d8c673c12edc5b4d0420bcd75dce769 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/f8fbb2fbbb500b33c071596a2747a28e0e96010e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3f8741a9f54c0f096faa9a19b6a134f27dfa974b | ORPH
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/d4a6b5b21c03c48bfb13c40d4273e4a6cee52f11 | ORPH
    arm      | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/88440201782dba8ad6109cb4dd49dc6912bf5de5 |     
  powerpc    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ffab1d3e6b7050ab51fbf77af7eef384ea8c5593 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/3ba44c1bcc072f8da31ba5f93fe02d4c047156ec |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/07a5a98e6f04baf6cbb6a1cdc499273d2c1a705f | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e59bed7b990949c3c9fdc09aee57a46cf14c51b3 |     
   mipsel    |        wpewebkit-2.26.2        | NOK | http://autobuild.buildroot.net/results/3d21d3c3460cd85a4c828dd197929cdf17aaf4e0 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/abe59447f9f8288de594f4bc502f2ab8dbe53f51 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/874d4d4d98eda0adf68f389360151c43e93f309c |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/53ad0aecf3115db6a79a2f19cd34d3b4ac05e40a | ORPH
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/dcf3a624000c30a3d1114acae2760de457f1376d | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 2 
      intel-mediadriver-18.4.0 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    intel-mediadriver-18.4.0    | NOK | http://autobuild.buildroot.net/results/106ef90a9515a25858aeda19773eb768f863c4a8 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/22cd44f299508acb60b204d45d367443144167e0 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/aefb64a9d0ef85f057405472c567200194a1eb39 |     
  sparc64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/1f28402cd433698002c06c4f503b3625d618f01b |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 2 
                  gmpc-11.8.16 | 1 
              host-grpc-1.23.0 | 1 
          modem-manager-1.12.0 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/c2ffa75240db7b0bcf00313fb2d95cdc7358edd2 | ORPH
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/f19d206bc95c44a0e2757a63bd2271a84e93f980 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/aea8718401b6cfb7f01b0231ade11bace1cbe534 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/fa9d9fb1523045f753fccdc9deadc2c3aedab8f6 |     
   mipsel    |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/42cce62b82412d8df05c951f438be8acac58473a |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c0ca200e6903c83765dd3c4b080fcd145f34ed1c |     



-- 
http://autobuild.buildroot.net
