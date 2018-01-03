From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Jan 2018 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-02
Message-ID: <20180103070008.0F7DC2082F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-02
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 172 |  20 |   1 | 193 |
   2017.11.x |  17 |   0 |   0 |  17 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            nilfs-utils-v2.2.7 | 7 
                 i2c-tools-4.0 | 2 
             libostree-2017.15 | 2 
                     daq-2.0.6 | 1 
              ghostscript-9.22 | 1 
                     gpsd-3.16 | 1 
make[1]: *** Waiting for un... | 1 
                    mpv-0.27.0 | 1 
                    php-7.1.12 | 1 
                   qjson-0.9.0 | 1 
                      qt-4.8.7 | 1 
          usb_modeswitch-2.5.0 | 1 
                      x265-2.5 | 1 


Detail of failures
------------------

        i586 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/99ec5d70b2ecf3a17fd5b5461d3e6b8ec0d22bfa |     
microblazeel |               ghostscript-9.22 | NOK | http://autobuild.buildroot.net/results/f26aef78b134db24f2a253c72c736467e9a43658 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/0b1e39c30009ff13b2c138bf7231a96e79dafa56 | ORPH
         arm |                  i2c-tools-4.0 | NOK | http://autobuild.buildroot.net/results/28474ec930dc82fa504c57927e1f9bd994b2774a |     
         arm |                  i2c-tools-4.0 | NOK | http://autobuild.buildroot.net/results/2bab61f82fdab8fe7e13da61b7814a4c33501cd8 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/480beb4d6ac86e9bf772e6c08062d54e4d0a89d1 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a39bed575ace78e9fd711107af8723c132900a29 |     
      x86_64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ef73db71221e5d3efd257cfe3d0273ca37d7ca32 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/a68a57f98cc09f66310259f027ff963636df5b3d |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/689f0a322b70f1f85bd3984a7bc9215b5249c39c |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/5ea8346ee4d418367bf3ddbdbf0861762b5a39e1 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/9d6a248f9acbb58b6c2893de58978c6013332415 |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/9020e7313a9e66167cdf427cabc968474ee1fd05 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/c5d93b6ab5b260fe5db46298b956a9ae765c828a |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/d65316c000953db35d9014f3439d937aee072da6 |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/d192ac375c08a324be9dd43f686266d64b65a734 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/d91866a757c6a7ddfa38b76bc3236f8c36778da1 | ORPH
    mips64el |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/fd24beda21ea366372f1d42e2b4dea99c98e92e8 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4fe41437a8219a028dc6c012e8a4d43d49816f58 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/cfc2e008361ecc7b7e4b5a6d21478628e363e2f0 | ORPH
         arm |                       x265-2.5 | NOK | http://autobuild.buildroot.net/results/e73bd4d774a1bc44041b75c585f4b6a18fa9f79c |     


-- 
http://autobuild.buildroot.net
