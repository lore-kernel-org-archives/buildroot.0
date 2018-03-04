From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 08:00:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-03
Message-ID: <20180304070021.3A75A206A6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-03
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 160 |  11 |   0 | 171 |
   2017.11.x |  12 |   1 |   0 |  13 |
        next |  44 |  13 |   0 |  57 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 3 
           cups-filters-1.17.9 | 1 
                   jamvm-2.0.0 | 1 
                 libv4l-1.14.1 | 1 
                 mesa3d-17.3.6 | 1 
             qt5location-5.9.4 | 1 
                    tekui-1.12 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ea6496d16a9ba0def899aeecfd002fd24dec1951 |     
   powerpc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/7cdc869f4ff9daf6e2543d8777d3ca049b9a0198 |     
     sparc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/0349e71688663d0ef369d30e162daa46534a1173 |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/45f31e480fe4429d3dc2acf78c6a79d2fcf0f3eb |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/886e9fa82a0f59a19e6a3909ff9e108d5cdddb01 | ORPH
      x86_64 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/7aea0cbb9e7fe7d9919c9be04ba4567ddcf4e15e | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/1e3fb11271be772e8dc3b15aadb99d605bb96fd6 |     
      x86_64 |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/b7aafbe06fde77c26941eb55a188bc5a01471123 |     
microblazeel |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/a687b4a0633d823b442106ae89259f73357841b5 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/604408b7761051c90daa1f74d1cd2068b636dac8 |     
         arm |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/0b7c7c17b93b224397c02983ea275093e4b57cf1 | ORPH

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/a13e9bcf93681c1f7aec97b7021268a33ac455ab |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              host-erlang-20.0 | 2 
                    htop-2.1.0 | 2 
              keepalived-1.4.1 | 2 
                 libv4l-1.14.1 | 2 
                  ffmpeg-3.4.2 | 1 
                  host-go-1.10 | 1 
                iptables-1.6.2 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    liblo-0.29 | 1 


Detail of failures
------------------

         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/10df72e87831cccab62ab09ea476d9ee4e8beda5 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/1323d8b3c5463ba9e49f49223f1c98e615454700 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/89ab9b89f86d999db9e4108f8a95d2009ebcf70a |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d275990af9e58d9b652c22240c871fcfb24e6ed4 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8831257f09a59c950aa2061947fd57d6ad82714b | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/28aa65fc3913b82627e71cac4f0c8cc7d9d9ec15 | ORPH
       sparc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/3894e81e259e6cc2b3cb02a5dea0484f79ea63be | ORPH
     powerpc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/7f5bfb3035f23cff94aa84477433dedd767def3c |     
         arc |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/9f61ce7447d13ffae247745da03ca9b098175fcb |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/48975ee67040128790bc38db6c2bf26563710629 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/e2015ce629d5608e76acedbcf55531437ce72f60 | ORPH
        i686 |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/0761dacc5a41aa42aaf582ff65e6fbe5d05a593d | ORPH
         arm |                  libv4l-1.14.1 | NOK | http://autobuild.buildroot.net/results/d03e1ff7075269d65ef28adc9f620c1d1f53f5ce | ORPH


-- 
http://autobuild.buildroot.net
