From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Jul 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-24
Message-ID: <20140725063012.8107D1015AE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-24
===============================

        success : 81 
       failures : 26 
       timeouts : 2  
          TOTAL : 109

Classification of failures by reason
====================================

                 gnupg2-2.0.23 | 15
               libcuefile-r475 | 1 
make: *** wait: No child pr... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
            host-libxml2-2.9.1 | 1 
                 x11vnc-0.9.13 | 1 
                 libraw-0.13.4 | 1 
                  thrift-0.9.1 | 1 
                libmpeg2-0.5.1 | 1 
               alsa-lib-1.0.28 | 1 
      network-manager-0.9.10.0 | 1 
               ruby-1.9.3-p545 | 1 
                  ffmpeg-1.2.7 | 1 
                 python3-3.4.1 | 1 

Detail of failures
===================

       sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/455c07e7b90cfb514d93ca4a33bc3147f5e042db/
      bfin |                   ffmpeg-1.2.7 | NOK | http://autobuild.buildroot.net/results/d8a1aadebd302abc923bc4865e1242ab2479d641/
    xtensa |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/5ce301382c9ba48aa579138fd4afc7bee5d96f7a/
      sh4a |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/144f620d05b21e07a65227e88e34cba78fbc02e3/
      sh4a |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/a5dd188e4e279ab444c2a47acd7c8515ef631498/
      i686 |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/dd7210e8e41513a31c274889e7653073d6de519b/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/4f5270100242b26370f103c94defd8237a6fc835/
   powerpc |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/eca49a9170af1e1fef6b307ed6137232893f6888/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/56f015a6db732bcb1358a8ae6f2c8db812e09787/
      sh4a |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/c16cd9cb31190335745ecd08efe18c208aefcccd/
      mips |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/a5ad563b33716d5a16ca4062445eab43cd012066/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/392ebe31e31abaa0d6923054f7d9b8058353ba8d/
   powerpc |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/f3b2f76e0922ac0abb9fedf97865d6cf1467be3e/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/0a932bf7e493297bacfc3b8837aa90e57ea54d6e/
   powerpc |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/6e02b42f01986a56c22c44658fa1e488c0a08e7c/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/e7477a71b5ce7310f10de2cae987d9135243bc87/
   powerpc |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/278c0c31d51162dc50a68b0704a7fe223af67e55/
       arm |             host-libxml2-2.9.1 | TIM | http://autobuild.buildroot.net/results/117cc1c30853a14d70d6080970077492b339102a/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/68416f31a23c359dcb0154b2ae08534f3e92411b/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8d280d68e1291c598011de25d46a18628032be90/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/5c26b7362d2a8c706925fec7311c51cc2e54655e/
      i686 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/56566b0caf3a529a0b33c4e072a96dba0231ffd5/
    xtensa |       network-manager-0.9.10.0 | NOK | http://autobuild.buildroot.net/results/d33ed1c3bf1be7c8f8ea02590a770b0d29c7d9fa/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/71e6ac2012484f38aa922438c4819160602f6f00/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/db64997d60b1c36f0983db45f13f026cde335e99/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/151316ae624b8972b27ce632d6c017d8539e2626/
      bfin |                  x11vnc-0.9.13 | NOK | http://autobuild.buildroot.net/results/b9d27977a231d186fe5289232f5d3995ec756266/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/a907d9667a13a3a4c33e6977cd8a4944b1210184/


-- 
http://autobuild.buildroot.net
