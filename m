From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jan 2015 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-06
Message-ID: <20150107073012.B16D9100ED6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-06
===============================

        success : 222
       failures : 19 
       timeouts : 5  
          TOTAL : 246

Classification of failures by reason
====================================

                elfutils-0.161 | 5 
                  zeromq-4.0.5 | 2 
             sofia-sip-1.12.11 | 2 
           libmemcached-1.0.18 | 2 
                   lame-3.99.5 | 1 
                    qemu-2.1.2 | 1 
               valgrind-3.10.1 | 1 
                rt-tests-v0.89 | 1 
                libsrtp-v1.5.0 | 1 
             host-guile-2.0.11 | 1 
               kodi-14.0-Helix | 1 
        host-e2fsprogs-1.42.12 | 1 
           python-pyzmq-14.3.1 | 1 
make: *** [target-finalize]... | 1 
                  thrift-0.9.2 | 1 
                xapp_xfs-1.1.4 | 1 
                  squid-3.4.10 | 1 

Detail of failures
===================

         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/1342886ce04153e47987339be76ae76e56beb1de/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/accfe2769ef8dafe9330da77475ada813919a3cb/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/cd7b5fb1b51f8f3071ffeef37027e85dd38e8a28/
        mips |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/ee10c15832310af72e3079e90245bbe76033636f/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/8ee36aece9aa0704f1f02ca9e7082f6e718659ec/
        i686 |         host-e2fsprogs-1.42.12 | TIM | http://autobuild.buildroot.net/results/e537b05b3ab6e3a455f1ce0b123d8b99a32c2469/
        i686 |              host-guile-2.0.11 | TIM | http://autobuild.buildroot.net/results/2d28ceb1fd1fcc4146c8d24bd333eaef5f6b8db9/
         arm |                kodi-14.0-Helix | NOK | http://autobuild.buildroot.net/results/8ab84a0e690b4e778aee5ac8ee7835da5737cfb4/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/cfd50e57775f24b9d78ec5fbf50ff35398aaa6f5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d34302471d5f67dbe4b7c79b3fc866d8ae9b116f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/e744b5df6b22c7fcc526647a6605e9c1ec2fd3c9/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/2415f8fe857a105d75725af354e0a3f8af7f7134/
         arm | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/395fda1d8527ad15eb2134b2e932f018e8311f21/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/ab643122fb76c7e7704f851304b7e3694fccc7c2/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a7324bf81aad8e2ae43974477a319e8982dc370d/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/b1e078591d65a3b5c9d638ad5bbb4ec8c28c38ef/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/1e8c466b7a65b8e70f3318ab1a5bad79468f5efd/
         arm |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/49fe3b9bcfea1e0be0bbb0692a282c2f6179b1bc/
        i686 |                   squid-3.4.10 | TIM | http://autobuild.buildroot.net/results/a398ad8865b53633cd2544e4c011ff4e5f9d18cc/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/4368a4ccf151b040ee9bdf9f4e584b8aee93d918/
      x86_64 |                valgrind-3.10.1 | TIM | http://autobuild.buildroot.net/results/60b4f80afb2e89fefefbb4fae9b061927dd89814/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/9925bcdacbfa7c0e913ba40900cab281fc7ad9c6/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e80e428191c913b3f51da1b26a25974b5868bacd/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/c3a4dd0d149a3d62e3ac84c3dfd226ae6b8ec4d7/


-- 
http://autobuild.buildroot.net
