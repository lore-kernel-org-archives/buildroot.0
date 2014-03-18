From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-17
Message-ID: <20140318073008.034DB102617@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-17
===============================

        success : 66 
       failures : 36 
       timeouts : 0  
          TOTAL : 102

Classification of failures by reason
====================================

                   slang-2.2.4 | 7 
               netsnmp-5.7.2.1 | 4 
                    crda-1.1.3 | 3 
                  python-2.7.6 | 3 
              host-scons-2.3.0 | 3 
zmqpp-36413487f05b165dfc82a... | 2 
                 cairo-1.12.10 | 2 
               qt5script-5.2.1 | 2 
                 lvm2-2.02.103 | 2 
         host-python3-3.4.0rc1 | 1 
                cifs-utils-6.3 | 1 
                  ffmpeg-1.2.5 | 1 
                    php-5.5.10 | 1 
libwebsockets-v1.22-chrome2... | 1 
                  samba-3.6.23 | 1 
                     wget-1.15 | 1 
                   lftp-4.4.15 | 1 

Detail of failures
===================

       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2421e4e0d0d32f9a86439d5ee01a8e1b35f03f17/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/44120d7d776ce3b4bbfed1c2542e381606d4cba4/
     avr32 |                 cifs-utils-6.3 | NOK | http://autobuild.buildroot.net/results/a2645f051d9ea2dce45d10002392145e32607381/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/994086befe27c664f7fd982a32326c02f90c15f1/
     avr32 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/cfae0520d55701b78a9f6513d17b45edcff51188/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f7fd605dc4cf9538ee67798be1de506fda2dbe4a/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/4bc1fe40e69ff782389ef7044d51c163f2c02752/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/0700acc4f657d302f9a92f2359fe61c92b15da70/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/66715e5df0424416db9c0babcb096798698b1d34/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/44bb860bfe9a5138038a6d5f4b81211faa161f52/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a2f75b8e04ea55a8ddf77964b8638cc40b642269/
       arm |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/14b72a78936233b60dd893cef7803f909b846bea/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/decf654c3bf4656831eadcf36824762b7012b18f/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/bce03af7240164bd12f3249e576c2f028f32c1c5/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b4dcd9e98c4ea61f81b28675c0f87cfb2341f091/
      sh4a |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/6df94c6d5c7a4f2290b891b981dde78c91792d1e/
      i686 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/a975d9ebc2063fa84c495eb500304e401f16b77b/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/91220fabca3ae5cae6d15f494c67f3ba2802d514/
      mips |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/2cb413a1d1bd9f425ddec45bf876fa0d44117c2a/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/44ae507bee46414aefe6981a82e332341e7101f2/
       arm |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/79b1e0e5ee2605ac2268ebf1de35580f47816753/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/4a2119725d60b061926a83cdf297032f01c998ad/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/0184268ae66af0b52e35984f622d2f58efded68b/
      i686 |                qt5script-5.2.1 | NOK | http://autobuild.buildroot.net/results/97c05991879c6d9b60775f38e6e8f139a5459cb7/
    x86_64 |                qt5script-5.2.1 | NOK | http://autobuild.buildroot.net/results/f5681823a243ef6429f8b8820db39873f42985fb/
     avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/648abf7fcd94a40f4a3f717cc49e4077002cf280/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/da0740deea431aea37ca4c6050c1b03137611c68/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7b24a3389e7c6e1816d18143c141395c92cacdcf/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/aad6cb23155d49d3dcccdeeb39c5e232ddd5e45d/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/126e7d907c93fddad6115416f566d5abf096d971/
    x86_64 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/a280c2b152660b5d1b189b184d1a4b178a006893/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/3ce8109dfbc3768183aa90882f0b41959728092f/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/fe0a07c40f6228ff3f8283cd2fff2cd5bf7f3893/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/8cdcb2c43b454561f96309cfc363cab630e43da6/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/a88103946561b1c614102da961176869174da889/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/9f96d834cde26b5f5d84e7aa46bf8553741952f3/


-- 
http://autobuild.buildroot.net
