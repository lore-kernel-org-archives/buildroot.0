From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Mar 2018 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-28
Message-ID: <20180301070011.152E720938@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-28
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 138 |   6 |   0 | 144 |
   2017.11.x |  10 |   0 |   0 |  10 |
        next |  27 |  12 |   0 |  39 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 3 
             bluez5_utils-5.48 | 1 
           cups-filters-1.17.9 | 1 
           host-mono-5.4.0.201 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/caa8fa32b8b4a20c4251eb284498312e00316f93 |     
       nios2 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/438287d94da18c6886702348e7460ae11ff53f17 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/54301c4aa162aff58d1886f4622c6c113efa8803 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/a201c0338cceaa52b92600cad7de0e216f86b898 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f6c5368ddb6e7ab1b2d954a184542323bb002884 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/7a941f48e312c35ee03a65b8ba7ea514ad107c77 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 2 
             bluez5_utils-5.48 | 1 
                  ffmpeg-3.4.2 | 1 
                  host-go-1.10 | 1 
                iptables-1.6.2 | 1 
              keepalived-1.4.1 | 1 
                    liblo-0.29 | 1 
               lightning-2.1.0 | 1 
                 mesa3d-17.3.3 | 1 
                nftables-0.8.1 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/623c14726d9366d644c0210359441368bd928b8d |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/c592eb319b75c47d895bca80312e966e0b2b22ee |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/df6d096741b15007e0521f0a8504d3e307bcceba | ORPH
     sparc64 |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/927bb949c81c5a1c8e1f0baaac24c76e093126d3 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/385cc1880e44aa40a1cbf841678694cbcd41242b |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6aa6269e7493a166566c1e3ef08fd1870c3bbee5 | ORPH
     powerpc |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/02ec3816fe83d75efbf97682db594f9c34492b0e |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/a51a4ffa1f192d76e76d10ad4efd8a0320ac2620 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/c275654a9af6930e0a4cbc353616166986a06946 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8a669fb06645a09653dcd20fa0bce3c4134fb848 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8100b1a50c668d43b6d17cccf0c32c36529466bf | ORPH
     aarch64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/ac98e1a46883a2fee3a5a7fff9150210a1b733aa |     


-- 
http://autobuild.buildroot.net
