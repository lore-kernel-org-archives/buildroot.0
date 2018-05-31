From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 May 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-30
Message-ID: <20180531060010.26380206F6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |   9 |   1 |   1 |  11 |
      master | 159 |   1 |   3 | 163 |
        next |  26 |  19 |   0 |  45 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
------------------

         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/ed08a82748e238b359e37f8ce90e4560ec30081a |     
     aarch64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a9633ac7b2b884c1f849091e6896b360ccf75983 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 2 
                         boost | 1 
openvmtools-5a9033ddfa95786... | 1 


Detail of failures
------------------

microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/a3aba71758feedac643fb00ea7ba6e23e1170b24 |     
      x86_64 | openvmtools-5a9033ddfa95786... | NOK | http://autobuild.buildroot.net/results/e219b8bacb52bb661eb6663b82f549ed941f26fe |     
     sparc64 |                        unknown | TIM | http://autobuild.buildroot.net/results/53cd33cc85659b088df9c8db592604eebd8c95bb |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/db33d4fa507fb3b4132423cd0a7e25a1fe6e4105 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 9 
host-imx-mkimage-rel_imx_4.... | 3 
          host-faketime-v0.9.6 | 2 
                    gdb-7.11.1 | 1 
                  host-go-1.10 | 1 
             host-libftdi-0.20 | 1 
                    quota-4.01 | 1 
                   whois-5.3.0 | 1 


Detail of failures
------------------

      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/481e8f50af509d2c67290d1e16ec40ba1f79d2be | ORPH
         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/0d9e47202d837a5c54dee1572f4b77418250ef70 | ORPH
       nios2 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/68bce3946fd372b92fc5b4c259e66f3c9f033067 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c73da4506408fb00f62d1870e56d7e7f7ad0fa8a |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/1ff53d2b6b9927403c44447a5c8d3d6b3b2bfe33 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/29e972d7ca7cb37174c0f87840308e35dd8ed742 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/52a18657e832b0168d590b8349e98078c4c9ad69 |     
         arm |              host-libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/ebf01ff1619fcb7cfea062fe13aa0563be580a96 | ORPH
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/ac28ff9be6ef7a73d30cbc1859be2fbb069599c8 |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/5606be1119ea64af2005beb654d1313553c3b789 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/123d140f6a1869020032851109a35ce4190e6ffc |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/217f33923410842dafb1cabdf8df2bf16a91a8fe |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/a899b8a4a255da6c875771ebb282aa7c6c68a4ab |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/2229ab24cb817cf7673a8f08ee7a2841f056c93c |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/08becbf0c8b584fe53f6484ce170cad4657776c4 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/1ebce3d928099e599f534e8a26e4afbda6552aa8 |     
        or1k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/6c23fdd50025ad44e4f17f6869df83db745440ec |     
       sparc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/1375050fac0c5db4dfbc99977bed7e48f73162c5 |     
   powerpc64 |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/18d388d31efb7c953820761576c1c50d7759da3c |     


-- 
http://autobuild.buildroot.net
