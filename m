From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Apr 2017 08:28:55 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-05
Message-ID: <20170406062855.D07C4207EC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-05
================================

      successes : 154
       failures : 35 
       timeouts : 0  
          TOTAL : 189

Classification of failures by reason
====================================

             ipsec-tools-0.8.2 | 4 
                busybox-1.26.2 | 3 
                 libv4l-1.12.2 | 3 
                 xenomai-3.0.3 | 3 
            gesftpserver-0.2.1 | 2 
             lttng-tools-2.9.4 | 2 
             ntfs-3g-2017.3.23 | 2 
                    ruby-2.4.1 | 2 
           uboot-tools-2017.03 | 2 
                   cvs-1.12.13 | 1 
                   expat-2.2.0 | 1 
                libepoxy-1.4.1 | 1 
           oracle-mysql-5.1.73 | 1 
                     pcre-8.40 | 1 
                poppler-0.53.0 | 1 
                 qt5base-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    sdl2-2.0.5 | 1 
                  snmppp-3.3.9 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                       unknown | 1 


Detail of failures
===================

         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/c6fdd1cdee0e23bd00fedbd0dae94f921151b0ac | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/fe166d3e22e4773fd2622ca61d9960f1cd0a8e59 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/4758354f0e2f7f127c1a99ef7846eb62f5ce41b5 | ORPH
         arm |                    cvs-1.12.13 | NOK | http://autobuild.buildroot.net/results/d80b9aaaef65ccd113d73899377273e65e75116b | ORPH
    mips64el |                    expat-2.2.0 | NOK | http://autobuild.buildroot.net/results/dd7fa1c7849d65cf6fdef77f8b5d8d005c65e3d6 | ORPH
        i686 |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/58688fec98383acbc1fd279365ca8137fc358480 | ORPH
     powerpc |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/f7f093a3dd89ed53c44e34fe3c6c22d2203ca222 | ORPH
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fa45a057897bc5dad2b4ac27a8b612f12dafb2d2 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4ccc7ae43635a72c2c91b53fa68ecf64c7034d2c | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/792faed70a7f8cb925c1900f7f7e17c8124fe5a7 | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/18d3a03a3f220c03fffa255d648be71b0c3d39d6 | ORPH
        i686 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/2b7a3a59c182d552f688094550ca61836bf083d5 |     
        or1k |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/efeff44716d66c9441487a24d94eecf08326ef94 | ORPH
        i686 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/bb7e765c989d3ef7924629ca28abf6a304f046e6 | ORPH
       sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/c2701f27ef40491632bb1002691229349ed33f6b | ORPH
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/c268de643a2c74394fc55f17e75f145c2b405043 |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/d1964435c03cb12aa3bfbb4bf487d6412afdfb2b |     
      x86_64 |              ntfs-3g-2017.3.23 | NOK | http://autobuild.buildroot.net/results/bce3e8f324db271be40b6d4adb4292a7540c9fd3 | ORPH
       sparc |              ntfs-3g-2017.3.23 | NOK | http://autobuild.buildroot.net/results/111582b581bcc1c3b96fbc8666af3dd0c60456e5 | ORPH
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/34a36d6c2e75c4ddb1c0bbc2cd739f5f198dce8e | ORPH
         arm |                      pcre-8.40 | NOK | http://autobuild.buildroot.net/results/68cf951594b0e67b45f8711745c17b93e2fbc03e | ORPH
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/9fee58076157d814616fa0da51afde8da21a8973 |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/ef259b1e019bec635d66f3a5d6ec9b1df61919f0 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/24989a8580255a13833e2747ea26168698e5d68a |     
        bfin |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/a0e0bbfd6d3ae1eac9c975c5e0201bacb78f9296 | ORPH
        bfin |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/46a1f0661b706aba222aa1fc3e4458bc30590fea | ORPH
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/9f66e88ad99bc93a42e07a99c44524d60701e1f1 |     
        sh4a |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/0000fd885a4f6fba694f0d8dea4919c94f845c3d |     
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/11d9c9c45ee1a3e9a1eb1f297c980795b85b9231 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/dc06f0bb49952960fcdbd9db55135b2de47c5ece | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/f227fe02318dcaf1b1b5d606e280e97798f12b52 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/1b53793eb62dee1b8dd1ff475d57f36aaa2add07 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/6c7f8386eae1ae4119cb20ad1720e1babedd48a6 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/8607ae7ec0485bfc77424051a018dc4864c0a61b |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/2084b5e9c1436bb678828c888b456001d15b40db |     

-- 
http://autobuild.buildroot.net
