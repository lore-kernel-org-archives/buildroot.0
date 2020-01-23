From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jan 2020 07:16:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-22
Message-ID: <20200123071704.115D387FC3@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  1  |  0  | 11  |
  2019.11.x  | 18  |  6  |  0  | 24  |
    master   | 109 | 87  |  0  | 196 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 17
                    parted-3.3 | 8 
                    brltty-6.0 | 7 
                    olsr-0.9.8 | 5 
                 opencv3-3.4.9 | 5 
                 libnss-3.49.1 | 4 
          libpam-tacplus-1.5.1 | 4 
                apr-util-1.6.1 | 3 
                      bash-5.0 | 3 
              host-grpc-1.25.0 | 3 
                       unknown | 3 
                  cairo-1.16.0 | 2 
           host-doxygen-1.8.17 | 2 
toolchain-external-codesour... | 2 
                  apitrace-9.0 | 1 
                  assimp-4.1.0 | 1 
                bitcoin-0.16.3 | 1 
               dvdauthor-0.7.2 | 1 
                 exim-4.93.0.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
           host-nodejs-12.14.1 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.2 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                oprofile-1.3.0 | 1 
            python-cffi-1.13.1 | 1 
       python-matplotlib-3.0.3 | 1 
                suricata-4.1.5 | 1 
           uboot-tools-2019.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d59850a8ff32240367f54f834b96fdc8465aaa67 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/01d4821b64b95a13d33ff3708411acae2e55cbf4 |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/37325e7ad30f8d9c1dcac33234b8622ea5947441 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7e012fb2ba5ae2a97580928fffd308518f799571 |     
    arm      |          assimp-4.1.0          | NOK | http://autobuild.buildroot.net/results/7994cfcdce858a82b2b418039c91ed122a3bc7d0 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ce10ac82d32063d6e5216541d621396d0bf599dd | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/7cefcdeee82edad49420b118f0f0f491306aecf2 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/b90d8e57375ef30b8f50ab85293ab4854f372605 | ORPH
   sparc     |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/21aa781b5593cedf9080c32a0cf5da5cbfc05552 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1032a2e27f15e79e4ac3b8481f2d6752274451f3 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b3eb90801def6018ce1a8759c88247b237aaa854 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2a22e6070ae34a79cc7d6e3474f2c707ec145672 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a95cc4001b2c0b326b5acc06430a35f5cf5e0d92 |     
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f4e0f1cc061b616d2aeb9a61d17ad7297cfc7e21 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/317cc04ad0ae1578ba63bf7571f346f6526c7def |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/84eba0ff36190182570f2194afe252991715f853 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ef4d66d8c8e3760a901f0c525d183ac85ad60182 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/ec73d06dcf04eaac5683b42736fe57e6e907163a |     
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/382e9b3133235cf6373325102560ca41c089db78 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/557043e762658d55cc059fad45cc2cc80ca5b7da |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f60a485ba4dc3430dd79db29007e99e2ae06d59e |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/d4b140068f5dfd27a50790deaa03bde0dd079d4f |     
  riscv64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/b8ddaae6682c6db6e491164d406819d569419e7b |     
    arc      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/3718d0a5084662097fe964e162da08d5000cb530 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/227d993a301a42d25f701c98c7a5be8389b9e21e |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/078ab8091ddeb370b730f57135aabf7d769554ca |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9fef964d379d14993463069c4dd8748780bbc435 |     
    arm      |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/9a987653ea161c2d5cdf8f02117b34b4dab4bc79 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/afc79bccb79edf6bfb220729440dd2b22706ca1d |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/c1583071780f18322cf0263de54056f663347e11 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/2fafdc094301bc6dff8d6a15efb22072d42abbc5 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/167b4ae998b60775d5ee8be5063bcc9b4bb634fd |     
  mips64el   |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/f81c5a20ecce92bffe2094b8d43452e0b0008d08 |     
    m68k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/5d25fe22da74cebd201dd2deb72475ec0bb0fdd8 |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/60ee102dd1adf600a1a954622e2018428571f71c |     
    or1k     |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/05c67484136f3bb433ce7fc47b2ce01167048cc2 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/a0cbb8d1ee2c42edbce3dc7dae5c2afb760c55e6 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d63fe79bbf7ff482b1e717b3644d4d6b76afb3f2 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/de91d357c65a4286ce40cad97300f3688f3d1fd2 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/6b65cfb582b930340611a9bed4faee00883299cd |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5ebc8a56f3580f38d6ac5e0fae13af09deda9edf |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/bcc6360dd7b6737ea932aaf21f30a114a8d2d8c4 |     
    sh4      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/04c4b2d8b3b1411e65c5e3801d8c9a1fd0f9d09f |     
  riscv32    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0e3fe6f6b7019bc2f525819b3025c3bb02af1b24 |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/2580f83feecc9b68047c5188eb539e78f0b7d699 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/41b9e73a1470a7987fc80de06d2cde968c92edb4 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1973ea2e9087bb624e5ae5c22c9d090a7f77fefd |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/faa7ebb099ba4ced76f6e640de175590abafcaae |     
microblazeel |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8d818fbaa65d935afe462878214904b571f30737 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/17227600bf74c5cf4ddbb0d17f7159b5f7dbe961 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/e57be2dea7df7c8d336c8a41c4f0f1929b427c8b |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ba9e9eaeb7dc153a8bc5e367cb05a47c04c7c968 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f3c590a9d5940447e53fd2a0026d09b46f8171cb |     
  powerpc    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/82e76d293bb802604ad74dd38f4e7554c74e7532 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/5377fbe69d0db2c96a7109cafe654451c0a7202c |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/8a493bc5c5157cf52fe4ddb5d89126c3edf18588 |     
   sparc     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/25cf96841feead3a7d0fe6807aac33490a799963 |     
  riscv64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/21c57029432042d1c74bd6aaa2d818c2495a4714 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/db14b7723f29cb498b6d63f689dee9b2e8232398 |     
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5ba205432790afc38c3cf874082f66d7d649a504 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/45656c7f2b27ad0dbd470f4b38e7dc3657937e70 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c877ef3d2b19dc13ec97b23ba04a1ab4930509e6 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/682eaa5c33aa916f63378478076c08a669d7a55c | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/784e78f3c9e5392e25f5233395bfbc9156923116 | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/aef7e34c59a40f78b2dd17e1df851ca388f34018 |     
  riscv64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/b1f9ea58c1f825788bcb504666b883ab94ca4ac6 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7dde55b5a2c3bea37005ab6ce28f5d0c4920e0e9 |     
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/8c05cf9ca2a40e3cdfeb69587da08a9b995e6619 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dd9b42b433efe858614ef7cfc333f29f26081e9a |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/6612d6c358ea439560ec78288b64e74aacbb23f1 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/22c97e94c55614bd033c7a4a1230f6ccd1236ffe |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/d13da83eb4d6af940bd73432379fd430fe046940 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/6cd65107dc91d411b0c415c0fadf7e699fa7d460 |     
    sh4      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/10457a0c838a96f187b900683da23bee84c3ebe3 |     
    or1k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/f83544bd3b580b9c80652d46f0e6b3254ce7233c |     
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/56da625077ea12bae922dcca37701d117668536c |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/03b501d8c2379b1fa45a55d6074d5a84106caec5 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/173bc22d3408d68fcf7e71303d5ca7b206ca3b24 |     
    sh4      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/c2d46f26b1495a168b3600714b726487cff2f8f6 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/45bd5b9735f5819228d0915f8002d44cac9488a9 |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/5bf6183e8bb9dd48c5ee2d3852bdc1783edd66ea |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9a35e796670ef5eb457e7d23a31c7cbb985f1f66 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/16114ca7ed92cacd6a04d25c6b68cdcb72ece731 | ORPH
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/02ae51ee161a2689749b5e7f21c768c5d1ca9678 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/00d606621d18058c7fbecc76161109c401e0bc23 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4dd64805f22e3bb21c641e78b324d2a3e456c29f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c95565a5db7114a3b8c31ef7967327ef7b7baa02 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.9.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/ad5b5909a585fbc0a13fab94e8d3f9020bf8a1bc |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 2 
                   dav1d-0.5.1 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                qt5base-5.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          dav1d-0.5.1           | NOK | http://autobuild.buildroot.net/results/9bd25b15098dd7c0c3e116a1d876626b0308991b |     
    or1k     | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/875a958644b820ed969904db0b7cff551b672060 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/1d23b9e76ab2646f9f91f4490692176649a2b1c3 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/0a55fdd1b66a1da0a0d1bfefcd324296a129d718 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/501543ccd5c2e45ac1d6bda4e73baa98d3fbed9b |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/9fa31e50355ac8aba224a9d2bb7542e123fbafb8 |     



-- 
http://autobuild.buildroot.net
