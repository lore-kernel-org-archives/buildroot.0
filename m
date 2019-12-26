From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 07:18:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-25
Message-ID: <20191226071821.BDD812049A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  3  |  0  | 23  |
  2019.11.x  | 22  |  5  |  0  | 27  |
    master   | 145 | 79  |  0  | 224 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   dante-1.4.2 | 20
                    libffi-3.3 | 8 
          gstreamer1-mm-1.10.0 | 4 
       alsamixergui-0.9.0rc2-1 | 3 
                   mimic-1.1.0 | 3 
                    quota-4.05 | 3 
           uboot-tools-2019.10 | 3 
google-breakpad-7515ab13768... | 2 
         host-ti-cgt-pru-2.2.1 | 2 
                moarvm-2019.11 | 2 
                qt5base-5.12.5 | 2 
                  apitrace-9.0 | 1 
                apr-util-1.6.1 | 1 
                  boost-1.71.0 | 1 
                  boost-1.72.0 | 1 
                    czmq-4.2.0 | 1 
                   dav1d-0.5.1 | 1 
            ecryptfs-utils-111 | 1 
              fstrcmp-0.7.D001 | 1 
                     gzip-1.10 | 1 
                host-go-1.13.5 | 1 
host-google-breakpad-7515ab... | 1 
              host-grpc-1.25.0 | 1 
            host-mfgtools-0.02 | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.5 | 1 
                    luvi-2.9.3 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                oprofile-1.3.0 | 1 
           python-bcrypt-3.1.7 | 1 
            python-cffi-1.13.1 | 1 
               qt5webkit-5.9.1 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 
              webkitgtk-2.26.2 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/05ddf134ffd026ec4b7d4f5de4802c7f5015c6cd | ORPH
 aarch64_be  |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/38d02332a40d8634cd89f65e8aeeaebcc488d004 | ORPH
  mips64el   |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/8acb6b8c80923d467d25167b2c573fd72b950843 | ORPH
microblazeel |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/38965069225a6ae35e41e8f977123bb5284afc02 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/fa93d8141e51b39609b1441a682c2647f316460f |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/e472bc237f78bbe6bd062633e0c5f1a99173df57 |     
   nios2     |          boost-1.72.0          | NOK | http://autobuild.buildroot.net/results/05f5a2f57b849fdee4cb937b70979268f9443e83 |     
   sparc     |           czmq-4.2.0           | NOK | http://autobuild.buildroot.net/results/05da1c02bd0ed75f3857dac6f26cf0480766ba42 |     
    arc      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/286e486f26fa0a0084d1b72f03ef105dfc7f0271 |     
    arm      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/3d65b59b81cd5ae7613b9c8c69c0d0e9f448d57b |     
  riscv32    |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/c10ce5987f58287ccc6f2b34d29579e90cc47c7c |     
   nios2     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/5847c16f584d239e738f7620820ab9ed7a64ce87 |     
    arc      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/240add0fb31e70968f007acef2e17c555360cf7b |     
    sh4      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/3b91ec2517b031d2233b40b603863b054bb96631 |     
    arm      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/964aff9e073e908af1907a2e8333a903481fe01b |     
    or1k     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/6605a5a7a5d6a067c3895394f5155a9259373abd |     
    arm      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/27367c208f352aaaa71f717d66317f73e0fa51af |     
    arm      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/f9321bdd8b83473efe53fb12cf86752ab862084d |     
    or1k     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/2a596423c5b241541d195ff269f61d6e94825c4e |     
    arc      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/dcd78ed361a001f264d6ea01f5b32a6a5b0d1efb |     
  mips64el   |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/3aa03bc5aea8cc72d06cca55c33b0534e09d3ea9 |     
  riscv64    |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/ccbdf9d540c32caa662df1e24362e38dc130e84a |     
    arc      |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/b53dd0e5cf26cfbda89f672dd412a63f8da3f734 |     
    mips     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/dad9d0720bfc4d6ccb0da73349f0cfa7efbda3da |     
  mips64el   |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/5a34bee10733c4f1e0c1ec14307d64cb18a6e23d |     
 aarch64_be  |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/f1ac1a9a79f15f4a05ffdba389e0518043290044 |     
    or1k     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/5f011e79cc559e2d859e493c6daf2c63bf288f8b |     
   nios2     |          dante-1.4.2           | NOK | http://autobuild.buildroot.net/results/1f86cbc74486398c617bb911458f149fe4da5f07 |     
    m68k     |          dav1d-0.5.1           | NOK | http://autobuild.buildroot.net/results/1a3f179fb6b2c442e7a0aa49f10a068db3041add |     
  aarch64    |       ecryptfs-utils-111       | NOK | http://autobuild.buildroot.net/results/2063bd18830ef02dca0bed889c43639009bc688e |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/ac09b8158e80cd88222ac4f4cdcd40b78f3ef8e9 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e1b82d7ffdd39e10f053ff70d4cef10787feeedb |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/e278f6cfde41425b33ba74e89e7c90f2b69413bf |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7c909f44d12ad2d752ba56e1735a64a3f4638d0e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e1133e5cbefb0fd10ddcfebe32808e0f98ffbf25 |     
    or1k     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/baa6404ac523d6037629f8f4d7eee7a8386acf11 |     
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/eb5c1c3586b20066ff82b6527e2f3b5cb72e652b |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/1684b3237e68255b6c129be03f15bcd766bb1300 | ORPH
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/71cbc7ff69087ab7759d0c813c61b4aa77f4beaf |     
    mips     | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/30532fd12624516e748ad4f34f59de8398211309 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f617551b2812fd1dca7474e189b1b110b061684e |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/de23545a7ffd78fbd003860f4ce823f25cf8ab46 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/8b7b0ff5e116d37c8f8dc87e6b24de77152ed91d |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/959ad9c46fb075b17819092269621e8a67db4df9 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ec5ba9ef8db4fed773843d89f837b87c892ee1c6 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/09578792956a2bd0b620421e668abf7c596a1de0 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/18287c771b6ee7c4f717aea9526f0a18d8eb8c36 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/df8dbbb15eca32b0f7822503ffeb5848a9c3a045 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a37a22b73b18608e9228db91d59280dfaa74c7b7 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e6f94b50be352a059ebb35e81d76643e73de49bd |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/d2b74002742911eee8c57f745e922c2ee0b39b07 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/29ca91238131a415cb4521701ebb9ad11fafc686 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ce2ac5004e706ee2aa71491dd027c234474feaeb |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/f67ce31efdd2e0bd4c542fe4488a480de5f32d11 |     
  aarch64    |           luvi-2.9.3           | NOK | http://autobuild.buildroot.net/results/ae610141b488d7ca8ea9db0575dec8f5eb13650c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/785c8ae5591247b7d846e9460932d5a02e1c231b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/876b7bfc7203410a84385f33e1943c9aee33fe7a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/383bfd3edb0d78c18d48a0a2c76999fa4eec4519 |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/bd1882db1110e3ba78603038525c199360b11281 |     
  powerpc    |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/b88e55dde1acab967023ae49bb1722eadb9cc6ab |     
  powerpc    |         moarvm-2019.11         | NOK | http://autobuild.buildroot.net/results/85640eb52dbb0a5473246a39f0762c2693c82bab |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/01bc4a9f520a9cca984dd0e242cd78fd57dd008d |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/3d5babe6130db648e9976604719d84f5f193c4c8 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/227a8169f9ed8e0f3af96a40f0e87387e7aa7079 |     
  sparc64    |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/d1b805123a2730f2dc16acf6f8e26c98e89015e2 |     
  mips64el   |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/02cfe6a329df7dee7e26a1693ecb9f45a892c6eb |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/0cd69b0308cd20264ffaeb7b023d0a4ed015e8d4 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/5250c13f1b196890a4a4ecf8904a1d37f7ad6932 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/c763096d2e8f740b08df02a25342aae6c9759cad |     
  powerpc    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b |     
  riscv64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/d9e9553bff3e46ba2e43da99897d3b46e235ecb1 |     
   x86_64    |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/866b6f02e9b0179789d202cc2116791185808c82 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/47c945cd636a5e60fda2779294eeef4128e7e286 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/25bfc31d58b916c1fb081b57a6e42a1a3c95d85f | ORPH
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/6faa124b8ffa7db9a029eef3ea810d50c798b4e6 |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/3798b150cefe87d84e4d8ab751f3ab97c2b73f9e |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/13d3af0ab2836606417f384a585bd4dd3400c819 |     
  aarch64    |        webkitgtk-2.26.2        | NOK | http://autobuild.buildroot.net/results/bade73c202a60836e0b3525ee18093d30feff97c |     
    arm      | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/6bf63447b9fbf22f3bf5dea011d2bf517f6f6cf5 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 2 
                   dvblast-3.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/13680c143f6409ccd7ca8fe6d615a721ee73bee2 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/4cb074f626f09be571cdf0deb62ba8039c204bcc |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/24cb6be685a8ec9a5cf7f517d1a3dc3751cdb2a9 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
                host-go-1.13.5 | 1 
                      icu-64-2 | 1 
              jpeg-turbo-2.0.3 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/aaae57dcd91e5b599e497ea2b21705b48fa1291e |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/fdc407d1eca4f0374aca3a6045550e6462fffac2 |     
   x86_64    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/304bd1d9de2b9fe7067002cb3d9347a88bddb515 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/ef330e2f258be5526679155ded0ddf84aa47c283 |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/236ad29582388daabfab70eefa11f754b497ba88 |     



-- 
http://autobuild.buildroot.net
