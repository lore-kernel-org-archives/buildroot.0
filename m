From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 06:17:23 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-26
Message-ID: <20190927061728.9F69220399@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  2  |  0  | 17  |
  2019.05.x  | 23  |  0  |  0  | 23  |
  2019.08.x  | 21  |  1  |  0  | 22  |
    master   | 195 | 40  |  1  | 236 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-4.2.1 | 5 
                 mesa3d-19.1.7 | 4 
                  cmocka-1.1.5 | 3 
               wireshark-3.0.3 | 3 
               libupnpp-0.17.1 | 2 
                   lrzip-0.631 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
                     apr-1.7.0 | 1 
                    bird-2.0.6 | 1 
                  c-icap-0.5.5 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                   grpc-1.23.0 | 1 
                 haproxy-2.0.5 | 1 
           host-harfbuzz-2.5.3 | 1 
                     host-llvm | 1 
                      icu-64-2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
                   lsof-4.93.2 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
              python-pyqt5-5.7 | 1 
                qt5base-5.12.4 | 1 
                    strace-5.2 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/549462f337b8e30aa2a57d8012638aab42a3ce4d |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/44f034983515c806e5e0fc781cd824f70e6d5153 |     
    i586     |          c-icap-0.5.5          | NOK | http://autobuild.buildroot.net/results/509305504371242176513d303795b832642dd23d |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/85a426b322c4db255afeab649610e792dc4b61f2 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/afc847a240a4f88baedbeb370ae4b79e38c8b0da |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/c1159332d328d1475a5373f0a0ac1f0d96a0da71 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/30b60187c6562eac8ebdeb76b61a7bb2e4647a67 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/00a032c8f09073e409345452822c801a692bd49b |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/097df89afe032804f0b6c148677f2e55f8178b75 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/c3196a7f42fb0bb24763f34bc94f03d5c3cb3b75 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/73cd53c55f613d6cb396d6526988e611582d6d73 |     
    arc      | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/c56cdc84b3d923ababad7a1450f048dc111fa097 |     
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/8f682428e4c1e63697abcca5792d8a9e0e73823b |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/69d32ca426fbcbb7c939da7fe79b04d024b15a57 |     
 powerpc64   |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/4ba273f51a58d855cce6e59aa7fe638d47edd00f | ORPH
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/61a86ea2b0a4dbcae48bd0f088c18d4f3f6cb3f5 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/cc1e425a4ff15ff1343b94b91f53af03fdb5ab93 | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ea2c0706a733873c140bc201b3901dfef9c9cf5b |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/9daacd80721fcbefbd15c11388629a2abcceb996 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/c8c42eddda14b9e20be22552c671bfe1f9e32284 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/50a4ff06214b137e30510413809a00cdd5041722 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/02446a56927e80be205d6893725cc0a022ac44c4 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/5d25e921f81eaa49be9c4d3c6a8f4838f5a76105 |     
  nds32le    |          lrzip-0.631           | NOK | http://autobuild.buildroot.net/results/31ecae46aa604e02d63f4f1fa65a1d06f003e987 |     
  nds32le    |          lrzip-0.631           | NOK | http://autobuild.buildroot.net/results/a95a689afbfe7671c33415cdb7b07267a26bc73a |     
microblazeel |          lsof-4.93.2           | NOK | http://autobuild.buildroot.net/results/043d14f49675f0ba79a94a09aac35002fdff2ca7 | ORPH
    mips     |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/f1e5991a8cd693327f5488853e1a0875bf5a65bd |     
  riscv32    |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/e995a4402d0f6f009a4ec2129f1d2b728baf805c |     
    mips     |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/171614ddaa633caa71d08168c919abc427a8d228 |     
    arm      |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/f00ccc738a860fd3e3a036895ac9f67f11a58d6b |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b1af0beae86d06b156fe41af17dae61b79da32af |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4ae5328194fefa6673e299e95d1c89505caf1526 |     
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/52369359b1932bf67e71f28ee63b5210247ba1b6 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/964f8ff023324dd21de5813cb9f69f4a72a8180b |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/df19be671994039c88e0cfdc3acadaa7f6324a67 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/ee7bffaf2f26629aaee9db292995bf7e1e55a0e1 |     
   mipsel    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/fa3b202d2ba5c8a4b9337fd0016e87b650194743 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/10d55373195838925e944c77c9f6dca4814f5529 |     
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/530cc7dd7029e7e6882f22b316ea45e58e76cacb | ORPH
  powerpc    |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/4ef3821af949fe7e96aa3ad5dd1916528f9f6c90 | ORPH
    arm      |        wireshark-3.0.3         | NOK | http://autobuild.buildroot.net/results/66e6a479da8ea852f74b4a094d0de4053772f186 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/4049552c8e2a9764b0fbd06e8310a65b911d4cd7 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/071f94d1b1a7a12a2c2f50d24fcd56bf6ac4196e |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/d672c40856d89f1cd7c4fd132a1ef1f17abff5b1 |     



-- 
http://autobuild.buildroot.net
