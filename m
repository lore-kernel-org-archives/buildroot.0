From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 Nov 2018 08:00:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-06
Message-ID: <20181107070022.266AD20723@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   4 |   0 |  15 |
   2018.08.x |  17 |   3 |   0 |  20 |
      master | 184 |  16 |   1 | 201 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 3 
               openswan-2.6.50 | 1 


Detail of failures
------------------

        or1k |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/f573969f39445d8fe8cba317b1233336e2058d84 |     
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/9cfb597489b03e1407df44755fa43c5b0756e9fa |     
         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/1b2f87e64bec75dec97509ecdc51aeb0491b9e78 |     
         arm |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/02a8ba13f1989ab8188e0c3cbd0cb87d3fc8646f | ORPH

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                p11-kit-0.23.2 | 2 
               openswan-2.6.50 | 1 


Detail of failures
------------------

       nios2 |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/a5669e00202ca62a90e5249f73701e0d71dfa133 | ORPH
     powerpc |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/89ad782e361b865f0487790d7bdce98ba8fd6385 | ORPH
    mips64el |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/450df5c928cb86c65412b01a8be3b51005a63528 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  guile-2.0.14 | 6 
               valgrind-3.14.0 | 2 
                flannel-v0.5.5 | 1 
                host-libsodium | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                  libffi-3.2.1 | 1 
                libmpeg2-0.5.1 | 1 
                 libv4l-1.16.1 | 1 
                  mender-1.4.0 | 1 
               skalibs-2.6.4.0 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/61b1e901d2177b7fe6db1386c22093f984834f1b |     
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/7a37a345e93fd872a96bb50e2b0cb3024d1c74a0 | ORPH
       sparc |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/ca13595a83744d818c6b58b708f320631e80fe98 | ORPH
       sparc |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/95e6e08ca38bcee113b613e3309e0a3bfec603d1 | ORPH
       sparc |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/b49b21d1da629cac00b48e805d86dbf2e010ac5b | ORPH
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/d87d9fd1f3c1c776d158c5b481f6965b793cb295 | ORPH
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/61d2f2d2b7d182de5109b688046ada69ac726bc1 | ORPH
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/5a250d8641b6b8a0f63ce5d61a26e30317a34e13 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b1c19fc15cbb26717dbc5027684a92adade846c4 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/601d4c24e58e99e2161f42654ad871ea9bd56bb1 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/19a4c6c1078c83dc03137a3625437515cabcf015 | ORPH
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/a4a0b87588a5fdbadab8df01e697aba5b195b6f7 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/4b4e41b07563121247690dc01e75161ebb03969c |     
       sparc |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/75c97bc4d7463964869f5a2be341e5d160bb71a6 |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/01acab1baa9be3dd870d6966a469315ad23a485b | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/cac47797e485384f494c1396fc3ad6bcfd5b74ff | ORPH
microblazeel |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/0b30debd6ce55d32aa385ebd7eb7a4bd14631275 | ORPH


-- 
http://autobuild.buildroot.net
