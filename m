From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-15
Message-ID: <20181116070015.AF42620736@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.08.x |  17 |   1 |   0 |  18 |
      master | 215 |  13 |   1 | 229 |
        next |  20 |   0 |   0 |  20 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/237b3b7a77808be9cf70eb41a9cfa2037552aad6 |     
      x86_64 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/b1831b9943bde0533cecc3b72182fe66177d7cba |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

              lua-curl-0.3.7-1 | 1 


Detail of failures
------------------

         arm |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/f36efc2d34cce0d88c249afc20540603b6a0379d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   dante-1.4.1 | 2 
               libsigsegv-2.12 | 2 
uclibc-ng-test-c6d62cbc6050... | 2 
               boa-0.94.14rc21 | 1 
                flannel-v0.5.5 | 1 
                host-libsodium | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              libgeotiff-1.4.2 | 1 
                 libv4l-1.16.1 | 1 
                   luvi-v2.7.6 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/fe32f34b9be68ccf8538923072bb5b2783a56084 | ORPH
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/997aaf2f765d320997c64ebd042dc2a9af20ff73 |     
        i686 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/69556f579330b1782eef70fa4194d171204bef63 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2d4a43639962f48465ea164456e13499ccd5ebcd |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/e7de72df9cfa37fee84c272b13c4f5a703c0ca41 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e14007c638f225ec718eb0be9323626f2bcf3a71 |     
     riscv64 |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/2db0732ea5e5b63d61580084bdc37c2731479e26 |     
     riscv64 |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/831a7d96e73c8133ea7972aac30a04c6704a378c |     
     riscv64 |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/3049ebeceaeb7649ef3eecd5cac7c02e9ae10e78 |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/8c865d33eee5bcc2fe04190a8828b0735f46ff13 |     
        i586 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/10c4ff4f4e25a8d23d8428642b220b80c34fce66 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/80ce25ad5ae21949943d124e64a6e0f499522884 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/309ba8c63bd739182edfb5ceb52f5a5524eefc59 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/da23bcdef608c7edd0b2f77cfa69e80426332188 | ORPH


-- 
http://autobuild.buildroot.net
