From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Aug 2017 08:30:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-06
Message-ID: <20170807063052.E081621DAB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-06
================================

      successes : 102
       failures : 14 
       timeouts : 0  
          TOTAL : 116

Classification of failures by reason
====================================

snappy-be6dc3db83c4701e3e79... | 3 
                 uclibc-1.0.26 | 3 
     python-cryptography-1.7.2 | 2 
                  cc-tool-0.26 | 1 
                  dnsmasq-2.76 | 1 
                 jack2-v1.9.10 | 1 
                openocd-0.10.0 | 1 
                 qt5base-5.9.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7cfa3d027b80e94018d6264176923707b0a54d7c |     
        or1k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/ecf76eb3847be72cec77a4ec0b3167191836d1dc | ORPH
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/c0610325d7785dfa51c5d36775623ca8fa517f24 |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/ce19191250b62b76ce7b374bff6b98e37c09241b | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/84a15a0629c931220450648022c2bb413ced270a |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e78dae9d93ac5665f536a73bb83c745d9707e934 |     
       sparc |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/3c038c31ef50fae5d0e526e9158ef04351bb5b24 |     
        m68k | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/c8736bbb474d7801655db70f15b3b2db31cdd32d |     
        m68k | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/5c7c48fb2c5a44751f3bbbc0f6123f1512b8989a |     
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/af55aeeebcab4f135939d1eb67520dc3355f90e6 |     
      xtensa |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/b3495e07601a2f0a44485f570edc6eb66b26d3f8 |     
      xtensa |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/4c1336c918aceed486502186ae10bf4a2b84e682 |     
         arm |                  uclibc-1.0.26 | NOK | http://autobuild.buildroot.net/results/1861604ea33d26b8afd23ec37dd43186abc48a4e |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/c4464aca3f3a3392f1f3221f5737c5d67f06fa71 |     

-- 
http://autobuild.buildroot.net
