From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Apr 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-04
Message-ID: <20140405063009.27E85101A67@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-04
===============================

        success : 49 
       failures : 45 
       timeouts : 1  
          TOTAL : 95 

Classification of failures by reason
====================================

             ipsec-tools-0.8.2 | 20
             host-thrift-0.9.1 | 4 
libuci-262fede3e8c8c08c1eb0... | 3 
                  zeromq-3.2.4 | 2 
              host-scons-2.3.0 | 2 
             util-linux-2.24.1 | 2 
            lttng-libust-2.4.0 | 1 
libstrophe-d408eaf2bbfe5ff5... | 1 
          enlightenment-0.17.3 | 1 
                    gmp-6.0.0a | 1 
                 cairo-1.12.10 | 1 
                   ptpd2-2.3.0 | 1 
                 checking sys/ | 1 
             fxload-2008_10_13 | 1 
                  taglib-1.9.1 | 1 
           heirloom-mailx-12.5 | 1 
                  libv4l-0.8.9 | 1 
              e2fsprogs-1.42.9 | 1 
                    crda-1.1.3 | 1 

Detail of failures
===================

   powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b7cfb57869722d608903c185a53a883a3a8d7285/
  mips64el |                  checking sys/ | TIM | http://autobuild.buildroot.net/results/81e9219094071c6ecf34ebba03fbbe150519afab/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/799a0628cb9c8d1d1d16c5416c14abe05cd6f2fa/
    x86_64 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/d84a6294da88c722e2f25f552621b5096e22e9ad/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/2e17511e493bb81bc481e3704037c7360b8560a9/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/377b706f3fc8e356fe026f846b4e0c24cafaeb8e/
       arm |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/f447ce933ad8dd975b17aeda03cc46b0cace0b03/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/74268f8639d9e72e6790132d123860481288cf36/
microblazeel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/039c8091045b7dba9923283c5aaea27df5370344/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/50e62dd2f0dab47431573744f92f208fac930893/
       arm |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/145ad10bc238f9cb66ce2afce5858d21eeb7f016/
    x86_64 |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/ecf1d318adc3bc9d206eb7841a3213e0514c8571/
   powerpc |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/a0873a86831e3c59a110c5b799e4187aae337230/
       arm |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/1429d36232985aea8ed62992a0b83bb078a68a50/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/de63579cd7e908e65a0dfec7e5dd3a720284ac04/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/723dfe59656b9b89bff68a9cb30d801d90f82351/
   powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e3b432e7fd18657cdba57fde94201bd615162af6/
   powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d5460f192dea75d791610b03e4f804aef09bd77a/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/74353bea92e5b8ce98a8313348e9e926472a1f4f/
   aarch64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/1462dc31aadc53160ac85172813449bc3b55ec04/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9e15fb0942b681583f5ce57255011bed37a4c77d/
  mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b868df342650cd578b820ba55ab641d499007c09/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2c93fb71618e8c34088387640d35e79bc32d28b7/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/f35d76a907634ea765de806e02d7c779744c3e69/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4fa079a5f139434e0797f5c95b8345e0f749a014/
      mips |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/caeaf842617597a3ae6a40b28c9aac6a9e4cb962/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/af87d6f54d598fe80cd6c601a0b00a3d99f63ab9/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/48180f8eb939fdad42bf914f796b51392b88f502/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/782fe2033904c78584fc901ecd4bc81d15244a12/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/af79e9247ddca585b045daa1fb905b495a88ec4c/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/138ff49db162151d78032180807d4785b6a65b67/
   powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c3c412884a55727f4f9bf7d1ef4828a449cd50a8/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/97cf4e76e9e34469ea6e728178242cfc050f15a7/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c11f6efb6546df3d818536a4b3294645491bf28d/
   powerpc | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/f182ac977cc5fdcb207caef928fffdd94d7b43a1/
   aarch64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f66eb2ed349bfe3426be8f03ff8b726929c86432/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/816edce5b3fc6512fc5035ec6281402cb4a41d95/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/4f0daabd79d7eea7b708a101032fb230df6eaca3/
      bfin |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/aa1545e379e7f5f291ee413c0c4f29f89e7f9b78/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/5bfe2628c011c25de9ded757691203d62ccb127a/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/5bdfcf544a83e18d12e27c598084c0ad520d6164/
   powerpc |                   taglib-1.9.1 | NOK | http://autobuild.buildroot.net/results/04c2f5752021f8eb0add61471e44a93dbf627aba/
       sh4 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/8343c05af23aad108d9d6a72e43a713da421e9a2/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/45ffc56784160447c6594354cc3fbab7fa94c196/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/200f3ed50fafaf2f55eac46ab7af0a52a65becac/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/6714244c3572d0ee5c8700d97720d5727e5c433b/


-- 
http://autobuild.buildroot.net
