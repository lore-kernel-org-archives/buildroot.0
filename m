From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Mar 2014 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-14
Message-ID: <20140315073008.4ADD6101995@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-14
===============================

        success : 60 
       failures : 31 
       timeouts : 0  
          TOTAL : 91 

Classification of failures by reason
====================================

                     wget-1.15 | 6 
                    crda-1.1.3 | 5 
               netsnmp-5.7.2.1 | 3 
                  zeromq-3.2.4 | 2 
                directfb-1.6.3 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
                elfutils-0.155 | 1 
         host-python3-3.4.0rc1 | 1 
                  python-2.7.6 | 1 
              host-scons-2.3.0 | 1 
                      fbv-1.0b | 1 
                    mpd-0.18.9 | 1 
               libbluray-0.5.0 | 1 
              gst1-libav-1.2.3 | 1 
           heirloom-mailx-12.5 | 1 
                   ptpd2-2.3.0 | 1 
                libiscsi-1.6.0 | 1 
                 qt5base-5.2.1 | 1 

Detail of failures
===================

   powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/888de53bec16ef97afb18618001d67f782fc7311/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/386e040674c61befe4ac0453855b3b5014f430c7/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e601743e96f03a4eeb883d4e990336eb3530014a/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/c2a5fe2bdf1ac4a826623d91e1205766db8247ef/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/da22266d6f244a57a1c728c2633daeae67834047/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/738fdf1774aedf9558fe4b32d6ada910f603474f/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/bacce053b007b99ea1fb63c25bc3e5380efa2a48/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/11dfcb2b7481e64d8737ec85f0f2fcb862e3958f/
      bfin |                       fbv-1.0b | NOK | http://autobuild.buildroot.net/results/996e42396546555e9fcf0c7135aac610ccca4eee/
     avr32 |               gst1-libav-1.2.3 | NOK | http://autobuild.buildroot.net/results/de71f3fa1231239cc652d0ab6d90fc0e1593828d/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/9f581302591ff978a4797a2cba2bc6372e7d6afb/
    x86_64 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/a3fed9b5f4be7dd09cc3828f71e9b1da0deb14ee/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/aa2e7555c03cbd926ca3f6954e448a04f30b5d8e/
      bfin |                libbluray-0.5.0 | NOK | http://autobuild.buildroot.net/results/610acc6ab318b7495685ab4ccae50c736c9ffdcd/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/b86a83c6549004f226e7255242e54ef4e50c5ec3/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/6f8bdca28b48552f47109b1f9408076c0e4cd73e/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/f2f305b73d7bc29badfd989e5b7cdbf639206e5b/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/13cdf32adf38e0331689e90dbbee7eb02ed6cce3/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/0de4b02f97b4c7bae9601c825ac84e0419f98d78/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/61d623b62cf0a63e6e2b81ca39da40c97a7c1e67/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/99c77f687dee710a01567dc603f6a84e6b428bd8/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/d84974adab61e56b4816bcd7c8186dfeb3d5c8a5/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/f8a87bb87aeeb2571a12a4505521aa25f05cde77/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e149ed70e72dcbd5f9f79ab18a91cab7306c0ec4/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e410dc7ae51cb9bad178bff1b0c1f516b88a42e9/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/47a2a226baf6d42e93d2534ab80031a1674daff0/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/166b3da3a88904438ed071ea09facd3a4aa58d12/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c6df48c72005a321dec9b83936096eadabf7234d/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/bdb213b828e49fcd1d95b9fde8581b91e6e67280/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/646c2d66c8adbfc525b3b1e4ef0c1fe161da921e/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d3a97fe5c8f50f0cfc0ab32f5a0979aa07d34662/


-- 
http://autobuild.buildroot.net
