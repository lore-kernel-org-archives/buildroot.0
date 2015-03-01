From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Mar 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-28
Message-ID: <20150301073013.C981C10055D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-28
===============================

        success : 293
       failures : 10 
       timeouts : 2  
          TOTAL : 305

Classification of failures by reason
====================================

zmqpp-36413487f05b165dfc82a... | 2 
           libmemcached-1.0.18 | 1 
                 cdrkit-1.1.11 | 1 
                      qt-4.8.6 | 1 
                libsrtp-v1.5.0 | 1 
                 webkit-1.11.5 | 1 
                    php-5.5.22 | 1 
checking if /home/test/auto... | 1 
                espeak-1.48.04 | 1 
                  zeromq-4.0.5 | 1 
                 civetweb-v1.5 | 1 

Detail of failures
===================

         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/44e3605a9b9ebc52411e213aa0479d51c6714f16/
        mips | checking if /home/test/auto... | TIM | http://autobuild.buildroot.net/results/ba71d9aa6c0e2a672d9f68833fbd95f830be8995/
     powerpc |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/c28f1fa5b31fe31d86b9dfb7c59a2c72cbef55ec/
      mipsel |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/15b33c97ce7268db96d2e04b8fffd64c19c41d66/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/69261328508b0d11997abde245556e38349af8c6/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/ab80094080c18602a2adb266981f53ebe0647f63/
     aarch64 |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/dc35766806704bf1b7d8463fdf3fa04d1b20bcd6/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/91a7b896c0006d9c43f6b7fd1407973e92cbf54a/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/19b13ff975c4a967fbc1ff2b8075197b99d4b060/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/5a1e39405ce65883a7b7dafd842edc9658a52ee5/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/b74cba6983d286b4af69169d5ea6c43dd10d4c11/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/66f5fab8263111b6c4e16fe35af5790c460942b4/


-- 
http://autobuild.buildroot.net
