From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Mar 2017 08:28:45 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-07
Message-ID: <20170308072845.2624A2076F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-07
================================

      successes : 178
       failures : 13 
       timeouts : 0  
          TOTAL : 191

Classification of failures by reason
====================================

                    gdb-7.11.1 | 2 
             bluez5_utils-5.44 | 1 
                    efl-1.18.4 | 1 
             firejail-0.9.44.8 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
             lttng-tools-2.9.3 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.1 | 1 
                 qt5base-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
    xserver_xorg-server-1.19.2 | 1 


Detail of failures
===================

      x86_64 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/a0caac737848e7c4c97a8325fc29b11e69c1d70c
        i586 |                     efl-1.18.4 | NOK | http://autobuild.buildroot.net/results/ca296f42c9242a6b93957ac9a0437f37b5b4342d
    mips64el |              firejail-0.9.44.8 | NOK | http://autobuild.buildroot.net/results/84d9b5dc955895e1a1c1074e3917c44c8fc00365
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/32401d3bd2dd74ff5a728c22c577efb420b67e71
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/d6ea1ed7cb6c4f8f8cc36c05b78695f50167450d
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/742dd7a1487436ad33aba3739bfff8449bb746bf
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/31755fc5359f268a6111eb56082e668ff0c78672
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/26b39b63a0c9b00db2d273e64987f2dffd992ad9
         arm |                      php-7.1.1 | NOK | http://autobuild.buildroot.net/results/b5372a9684e7bcdb88023244ba44fbb20707bf7d
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/2ac16335d16cd53cceeabda8f963c9b288a9a1c8
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bc2a0ee4d51662e06c53ff0a723f83c2b627f46b
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/5c0b20f1f804b3fdea832ba5de51a1afafa4ffac
        i586 |     xserver_xorg-server-1.19.2 | NOK | http://autobuild.buildroot.net/results/5890c4b6397326faadecc49fdbe21875fbb20c65

-- 
http://autobuild.buildroot.net
