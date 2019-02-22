From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 07:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-21
Message-ID: <20190222070038.2B02325716@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.11.x |  18 |   0 |   0 |  18 |
      master | 186 |  21 |   0 | 207 |
        next |  40 |  12 |   0 |  52 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/acde1328ff453381b8536addda92d8f7172b4249 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 5 
                 qt5base-5.6.3 | 3 
                qt5base-5.11.3 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                  brotli-1.0.7 | 1 
                     gdb-8.1.1 | 1 
                   glm-0.9.8.4 | 1 
                 haproxy-1.9.1 | 1 
           host-cryptopp-8.0.0 | 1 
                   i2pd-2.22.0 | 1 
                   netsurf-3.8 | 1 
             stress-ng-0.09.47 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/9806cd1762ae63f86175f942190f5d1db2bfe04c |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/b40bdbca6669a81301fca523e982dbc9584a4e65 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/13a9a935a18c1991a2bae1032e37809a320ceaec | ORPH
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/d85c82ad9942846f834d96c0c9b319953638c5e4 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/5d0dd9b3a2a30a1793354c413c110bab7ba9dcce |     
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/d389b5964b0f3d7698dbcf0de1c0a1a4949707f7 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c7577b09e37234214a8bf293124ccf16424391a6 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/aa85a531eba8e00c40eb838243ca7a45ce15298b |     
     riscv32 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/15ddf22c01a8fa606f9b34c54b4200ee29e9070d |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3ad812f928c90209b46dee12da3d6c1ff7c95cf6 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/18d0f72fa75935846698bf9ddadd639858f17132 |     
     riscv64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fff2b5a7dc8a4254c8dae1a1fe7a25f9c66ebe3e |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/935c038b921ffa0f185571de41223e4c201e964b |     
        m68k | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/c0ce9186f59386c28ac90b0aa5618ab52f7667b0 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d2718cd5e1e7c0aa7538531ae781398dba3d9b04 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/1bd718e0ca56fd5b2847d4f65bef79505944e19d |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/4a079114101d14e81221ffbb15ff643726da8212 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/234d5983a8e12368321212a7e83538fa8c041dfe |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/316e8d75b0ec00896a7d07f2eb0b8c0716b56447 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/e4a2fa7ed45a6c267679c58cf01c1e6c2552394b |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/3932a4e468f8b9e24ec7c6acb34b315101b2af38 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2019.01 | 4 
                  gqrx-v2.11.4 | 1 
                 ibrdtnd-1.0.1 | 1 
              lua-curl-0.3.9-1 | 1 
                   luvi-v2.7.6 | 1 
            mesa3d-demos-8.4.0 | 1 
            optee-client-3.4.0 | 1 
               runc-v1.0.0-rc6 | 1 
              syslog-ng-3.19.1 | 1 


Detail of failures
------------------

       sparc |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/a003ad5324a0c0f55cb8db5d3e5d69bd21999e16 |     
       sparc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/96301880d4caf99e9344e4a962ac75df8753e398 |     
     riscv64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eb1a92ddfb9b3401c28ec8b3589a831b0d95982e |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3f3a395e4b31aede06ef562af17170ea9404f0e9 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0276d0d79bbbc1fff37edd6a9dc2be72035b9adb |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/5b55fdb9155e8409f7fdd2a287d3e1fb0f7323c9 | ORPH
    mips64el |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/02249878aac84d0e5515e2edf029c8700b7f44d7 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/63fbe124513a48bddbb6fca638ce5b91b1007cb3 |     
         arm |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/89f5481c5886d6891f20027b83e583314e0d94b9 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1ee21f951e02ec11ba9772e7d9aecd4513672d50 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/57c7aa3e9f39ae3cb90c32a72d2b4e16bd46a2df |     
         arm |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/95f739e35da7d62229568dec2cf8816cb6725be0 |     


-- 
http://autobuild.buildroot.net
