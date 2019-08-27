From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Aug 2019 06:17:18 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-26
Message-ID: <20190827061723.EFA3C882AC@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  2  |  0  | 17  |
  2019.05.x  | 16  |  2  |  0  | 18  |
    master   | 197 | 30  |  0  | 227 |
     next    | 20  |  2  |  0  | 22  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                host-go-1.12.5 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         host-go-1.12.5         | NOK | http://autobuild.buildroot.net/results/185ccab760ab17e109f842dafa37528ecb7a6d3f |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/12d1f41f934eefa6b3bf41a4f14bf5b3ba00316e |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/2e8f397fbff09f27aafb6a4765b154041051480a |     
    sh4      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/2b9f7219bc7c5f0765891fbe1ebd15d7e1704a59 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 5 
                    ffmpeg-4.2 | 4 
                  flashrom-1.1 | 4 
                      icu-64-2 | 3 
           python-numpy-1.16.4 | 3 
   vdr-plugin-vnsiserver-1.8.0 | 2 
       gst1-plugins-bad-1.16.0 | 1 
                     gzip-1.10 | 1 
                host-go-1.12.9 | 1 
               libsigsegv-2.12 | 1 
                openblas-0.3.6 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.12.4 | 1 
               qt5webkit-5.9.1 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/b640957f16251d5f8c8cf7cbade99fe95e9e7a11 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/0060c365e6dc31fee1793dd256dc09475bc9b53b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/5a9fad0cb8ed3a01290fc4602d0afd2bf7d3b47a |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/13a584dac88f0634614c11d1c4afd9b71bd8185e |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/12f611abc634359893029b089f589b3c70e6c4ae |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/87bfc19374670906ec3321565cdb186c9900318a |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/713edcb1b46b6cbec6855cfe0007ef9f1248f574 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f74af08dbceb0f8dfda01ba43bd619f36f58fce4 |     
    arm      |    gst1-plugins-bad-1.16.0     | NOK | http://autobuild.buildroot.net/results/16ff15d07070f364b6dcb61a5a116cc98e8fd467 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/f0b8a0e33f271349018cc07957e4b09273039814 | ORPH
  aarch64    |         host-go-1.12.9         | NOK | http://autobuild.buildroot.net/results/d974c73a7f8e8a0e3e7c034bfb425d476f102d63 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/372c5bf1b29d87da0dac9850676446aa06e903c5 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bb858a92cf68f570c1ac2e8780b4ff43e2641985 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/758fdfad5bb7e367a23bfe70bf7c4da0f6e7f575 | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e72fa7b9299ab79aa6352011830097c39c0901a1 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/65b7ebb9ecb609d76060c69a425388101d773d94 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d4c3b07e707107ed99bbc79c99a2e29d20a42475 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/ca8726eb466f3c42721d59e7c63dfaa4b7d88fef |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1f2226f032ac59d14ba5e7cc2d3b410e749f38ab |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/15973037f66c3275a29c18d5180f7fa3cb3980be |     
 powerpc64   |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/aff62d6382f86e8994217485321daf4e32847a17 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/aeec9c736ff1293d126d881f512e9057bc2880de |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/001c1f7201f612ff8203ab20233e1b459384e987 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/ae90bfbb26fa9f4ffbc27271e7fbd653092d8120 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/c930fc1cf54919e009fc94b930abd9f4b4b3f07e |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/a0870212b9cca40c8f9466d383862715683e924c |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/6959b110b10316a565783d7f1b75b613e5798207 |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/2720dfb9968879ad3787e95e11f9389a928c8a20 |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/60408c773a3d56fef01704bd342ecf219c630f1a |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/1ab87015cfab94dd9d7d478ba6b1bebae4fff041 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                qt5base-5.12.4 | 1 
                    strace-5.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/c06121ec748c68c5dd734353fe7330f07bfc51fc |     
    arm      |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/5494c9e21e623a9b7d87e06d86ed5e95d696c21a |     



-- 
http://autobuild.buildroot.net
