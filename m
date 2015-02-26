From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Feb 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-25
Message-ID: <20150226073014.150E51017F6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-25
===============================

        success : 290
       failures : 18 
       timeouts : 5  
          TOTAL : 313

Classification of failures by reason
====================================

                  thrift-0.9.2 | 5 
libwebsock-3c1615eeadb0b582... | 2 
                      make-4.1 | 1 
                libsrtp-v1.5.0 | 1 
                       unknown | 1 
                    bdwgc-7.2f | 1 
         protobuf-c-v1.0.0-rc1 | 1 
               qt5webkit-5.4.0 | 1 
                 webkit-1.11.5 | 1 
               openswan-2.6.42 | 1 
freerdp-440916eae2e07463912... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
              libarchive-3.1.2 | 1 
yavta-82ff2efdb9787737b9f21... | 1 
make: *** [target-finalize]... | 1 
          sane-backends-1.0.22 | 1 
                pinentry-0.9.0 | 1 
           libvncserver-0.9.10 | 1 

Detail of failures
===================

     powerpc |                     bdwgc-7.2f | NOK | http://autobuild.buildroot.net/results/a54cc1bdc5dcb4c459cfbcae3368811e2170d100/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/38dffb3c3dc7db4dc41aa6e35c8721ee09ade6da/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/825295154569e0749f9f5849200d0963dac225c7/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/4df8a9d7d6f9cf96e9150509d99ad024c2522e9e/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/886195784f7b6ff4b5971eb00070d019bfbf2773/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/6a89183e558e4ff27841c3e544687ad4a04fb036/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/dbf2d348de3831a86728f9d72cb56b9f2ddbf554/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/b80a34a602b1241bc03cd43df1a269389d50e75c/
     powerpc | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/ce13880aed2afd79838eaf1ef5a80ccb811784dd/
         arc |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/09fe475cbee020a574aafe8261142d715159ac2d/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/0698b9de273d7c5e5982830c1515cdd030bcba29/
         arm |          protobuf-c-v1.0.0-rc1 | TIM | http://autobuild.buildroot.net/results/39b5a52f3e0be06a5992e192a64dc352c87d234b/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/72293e06683c6465d5f2ec831c5896dc11991431/
         arm |           sane-backends-1.0.22 | TIM | http://autobuild.buildroot.net/results/67049211d35829f3300e8ee222f8d2317a8752a6/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/1eacc80af30acb94486f9377044f756efe4caca4/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/03f4601f63d5230bcfe721d6e91e5274de09a49a/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/484fdb92286fa95e4da98bfaddd398a77bf0675f/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/bfed0eae7927a8bdb1b9e809f47f2e95f0d8466a/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/72f3fc5a042ef0a3e9bfc53bfd59dbbdbc5170fa/
        i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/ca8a3564cfd2bb806e8351591b6fbe6e0decec87/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5b322c6f01f63a0b33a287a04d130fa70b0846cc/
         arm | yavta-82ff2efdb9787737b9f21... | TIM | http://autobuild.buildroot.net/results/102d775987d7461390890ada08aa8210880e5aab/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f6deab776977c9ea94f6d279227e2f40223306f6/


-- 
http://autobuild.buildroot.net
