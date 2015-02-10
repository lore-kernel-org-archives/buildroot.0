From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Feb 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-09
Message-ID: <20150210073014.E19721010F3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-09
===============================

        success : 350
       failures : 15 
       timeouts : 3  
          TOTAL : 368

Classification of failures by reason
====================================

                    strace-4.9 | 3 
                 qt5base-5.4.0 | 2 
                  speex-1.2rc1 | 1 
                  ffmpeg-2.5.3 | 1 
                  spice-0.12.4 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                    qemu-2.1.2 | 1 
               libcap-ng-0.7.4 | 1 
                 webkit-1.11.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 python3-3.4.2 | 1 
                sg3_utils-1.40 | 1 
               host-qemu-2.1.2 | 1 
               dvdauthor-0.7.1 | 1 
                  thrift-0.9.2 | 1 

Detail of failures
===================

        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/e8ca92f2e45ef89d3ddc4e4fa7cae08af83b4abf/
       nios2 |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/800fe1d79ef2e52b86a97feeba85b5c47aff8dcd/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/cc9fa2fd0349c954dcd40d0d02945920cf6d5cde/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/035c0b9a25052e0664d355d84c7a62dc257b01c3/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/bd0212dadf0b3cb73aa67becab8654f27dd11f10/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/798ee0021eb7f4d8d806f20eac2ab452cd410839/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/275156a9c5f4d5dc875e066a3a7a0c875ad9032f/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/92c3fb4ddb934115b228652bb8c972bb7459bb40/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/384db0b6b29fc434da73f78cb872080fde918aee/
         arm |                 sg3_utils-1.40 | TIM | http://autobuild.buildroot.net/results/69ff3bafa193009d266970aea1ce29840d931feb/
      x86_64 |                   speex-1.2rc1 | TIM | http://autobuild.buildroot.net/results/e8edb0de0a54515e464ee8393f8a26f33edf5899/
        i686 |                   spice-0.12.4 | TIM | http://autobuild.buildroot.net/results/93f60990b4a303548273b6a02cc8e52088d98a20/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/d3f123367559c758649c6da0ee4df528cb2d4682/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/cd713c2513cd1eb39b657504203338c4b7f5c887/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/0220ecb696a742641b83949f187d2d74e442f48a/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/6ab752d924952176d81faa38cf8da51a4d527307/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3c292def5148c1f5fae8003df656458c6ef3ca43/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/8298b38a42bae89f0f5216aadb782cc99fff5ec4/


-- 
http://autobuild.buildroot.net
