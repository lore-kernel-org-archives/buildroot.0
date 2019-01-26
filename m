From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jan 2019 08:00:33 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-25
Message-ID: <20190126070033.594C2207B2@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.11.x |  14 |   1 |   0 |  15 |
      master | 178 |  29 |   0 | 207 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.1 | 1 


Detail of failures
------------------

     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/c46cb7ee50ac4d93a87e7bb62feee91048facd42 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 


Detail of failures
------------------

    mips64el |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/6407e321fd8ae1d3019e9715ce7d4cf483900e28 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

zbar-b3b4e32b55f570372fc3af... | 6 
                  ffmpeg-3.4.5 | 3 
             libva-utils-2.3.0 | 3 
             host-grpc-v1.16.1 | 2 
                     pcre-8.42 | 2 
                     php-7.3.1 | 2 
            sunxi-tools-v1.4.1 | 2 
                    cups-2.2.7 | 1 
                    efl-1.21.1 | 1 
                 gnu-efi-3.0.9 | 1 
                  gnutls-3.6.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
                     lua-5.3.5 | 1 
                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 
                   taskd-1.1.0 | 1 


Detail of failures
------------------

       sparc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/413e47087cc1da7aea910eb00d3fb56cf5331e38 |     
         arm |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/66079c007319682908d61d39a075e6a727e3847e |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/17f9658b3e6ebc712a0fb86fbb70d66516272148 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d1d331bdb12d215e1c99d95516fc559a7c1a6456 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/92cb386f7d0a0386cc28f4f9d82f3b362631f4ac |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/dcefce36a840c6029f4ede75c4dad55ce4e4efd4 |     
       sparc |                   gnutls-3.6.5 | NOK | http://autobuild.buildroot.net/results/fb318871ad9fedf7ebb8875a6696e92e30556bc9 |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/f9902e26d9d64a89e04e9d8dc2375c81920fbf15 | ORPH
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1413b5999202d2405d6f6bbd244c400aa8cc59e9 |     
 powerpc64le |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/c74182cfe699fbe8e91ce0e809ade2f5f44881f7 |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/3b1a8693a6c08ff1aaaed7556056c2f0c6a9e208 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/db5ce405b1f645589647c56d4d55e5bd973b607a |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/501a51321aedef4694fdd51c25ffc09602470800 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/17d0cdd6c92415283a0291610533e3438f7abaaa |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e8644b70bf39f4da2c47d0cfab4a724937134b0b |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/0801e451db19ef0cee4ac15fbba1f34427c35196 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/d7e99f8096ee0836ae6bf090e2184082d1ca40fb | ORPH
        mips |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/9d7ecb6735e3ea518de020b722353ae0a5b544a7 | ORPH
        m68k |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/6459ca2fdceef8a44a05c953e2cda0ac692d286f | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/6e186e6d6fbf17f941fb144c3eb6a6e9f4ed9362 |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/f8735019cb4808d0dc23c72a87e5b4f6ec0e26a2 | ORPH
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/0b5d7017affbfd86c89f55f00633442740560440 | ORPH
       sparc |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d142562f13c0cc9aa937d17c9f916e0ef1299bc2 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/0308af46493a7e47b7b0e7a0d4e4a363d860fd81 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/0e2307d563ed4662baddbedec73dd8e831f04c22 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/72c4d35d2872d1850dc170248b2b6137fdbaf736 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/b21087c7e39998a55dad4774ac74b71e9b6ad6fa |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/e0c20b8bf3f4d078439c34e12a4cad85d22f304e |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/e36fc75e0da348db0e3a61ee7bda5dc4b87285c8 |     


-- 
http://autobuild.buildroot.net
