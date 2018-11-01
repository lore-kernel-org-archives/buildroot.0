From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Nov 2018 08:00:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-31
Message-ID: <20181101070020.B301A20798@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   3 |   0 |  21 |
   2018.08.x |  13 |   6 |   0 |  19 |
      master | 165 |  18 |   0 | 183 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 2 
                  giflib-5.1.4 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f9f9d7624f7665bb030789a5aba0c74b87f79332 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f022cd9bf93ae9103928b6ec7654c840a7175e24 |     
     powerpc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/886332af9c129142a1a8068f26e4489bbf81fa06 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 1 
                    efl-1.20.7 | 1 
                 libidn2-2.0.4 | 1 
                libmpeg2-0.5.1 | 1 
             qt5location-5.6.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

        mips |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9be705d8823fb373f841a4b00190b56e109ae08a |     
         arm |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/6acc463c942eab12265978cad18403c0681b0773 |     
      x86_64 |                  libidn2-2.0.4 | NOK | http://autobuild.buildroot.net/results/8af6c739ef0ddb7da5ba3aef797867e2113f0950 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b10863de27f01c03c2b6fc1b82c2b5236a99f56a | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/6b1947f31a36c86bb097567dedbdc62cb8931dfd |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/48644fe7cf6ba1677d71ea39c6f482ddbd561c92 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libffi-3.2.1 | 5 
               valgrind-3.14.0 | 3 
              wireshark-2.2.17 | 2 
     docker-engine-v17.05.0-ce | 1 
              lua-curl-0.3.7-1 | 1 
                poppler-0.59.0 | 1 
                    pppd-2.4.7 | 1 
                qt5base-5.11.2 | 1 
              traceroute-2.1.0 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                   whois-5.3.2 | 1 


Detail of failures
------------------

      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/4284f680890f4b9b9465d7714183011d831f0976 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/99673a9e1c592f93b4c6faff844d422581ab7b8e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/02a8d294a731edd1f111e098057ad17f998e6ea0 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/46ed11b9d766810847ab09221de3c867137dde4c |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2ea2347f4a2e4a0335545167a5288d3bce40604e |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9825ff007f09d8a1abe4be12826ffda5ab782966 |     
         arm |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/c5b2a7f21259bbf79861bd95a2d7ca055920bf09 |     
      xtensa |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/4daa9c29b8123805d349cc45d7c40aacac47a777 |     
     aarch64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/1f55aea6d391b1ff5bd6cec717ab33923c05681f | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/8fb04a2e2ea8db6c71b1d04592da7cec8dd6c704 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/f55cac0714a89414748e13639c7b0cfa1f8775cf |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/792a1d6213c20ba97a8e0c8d38cbc0f01d306d0e |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/c08c2ed8c226dba994360b8942812752f2e8321d | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/b3f8339d91877bfed20658b2b486086373dec74b | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/1fcf4743d44b5bcec4ee7ce4284d29717c778438 | ORPH
         arm |                    whois-5.3.2 | NOK | http://autobuild.buildroot.net/results/d5ab3836c50008ce4882244ed0c24aba802687fd |     
       sparc |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/de011d4eaf555d9e8caf33b4951f926e6cdf490a | ORPH
     powerpc |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/a5034b11005f93df96afd622fe1abdc8d6331ef7 | ORPH


-- 
http://autobuild.buildroot.net
