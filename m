From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Jun 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-02
Message-ID: <20150603063015.2B963100135@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-02
===============================

        success : 223
       failures : 12 
       timeouts : 1  
          TOTAL : 236

Classification of failures by reason
====================================

pulseview-198f9bc74d6c955a7... | 2 
apitrace-c181b7fbf4b1c39124... | 1 
                 mesa3d-10.5.4 | 1 
                 cdrkit-1.1.11 | 1 
                    qemu-2.3.0 | 1 
               qt5webkit-5.4.1 | 1 
                    wine-1.6.2 | 1 
                 libpcap-1.7.3 | 1 
                  guile-2.0.11 | 1 
       host-erlang-rebar-2.5.1 | 1 
              strongswan-5.3.1 | 1 
                     php-5.6.9 | 1 

Detail of failures
===================

        mips | apitrace-c181b7fbf4b1c39124... | NOK | http://autobuild.buildroot.net/results/8108fa756ebf3da94643d53bd428f76f1c548a32/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9bf984af7d7dc402731ae607510ea2cdae2fecad/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b75ddc7ddde8057f05eb6aba93b5d8d92ef505aa/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/310d39d45bcb232cc0a211e1272936a4c3be77b1/
        bfin |                  libpcap-1.7.3 | NOK | http://autobuild.buildroot.net/results/e19e8ebb46560050029576baa040f2c6928e6424/
      xtensa |                  mesa3d-10.5.4 | NOK | http://autobuild.buildroot.net/results/74e3959051d5ca1200bab835cf2140d347eaf2a7/
        bfin |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/e4c9bdde94342cc72b2bf0c1b5b4671d6e0c7849/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/32e7b632a78ebf7fc4f963c3f51451c50b91c1dd/
      x86_64 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/74beb160d71c64e0ee6e9b325afeecb4d14ece0b/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/064621e3b0b1b7c88e9277c37e8c407ebbf0ed84/
      x86_64 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/4417bcdeb6b65604fd26c12c503df768cda1a9cc/
        i686 |               strongswan-5.3.1 | NOK | http://autobuild.buildroot.net/results/68ff1f110e9e8a1bb021b18e1104a8a563566b5a/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/fc8d24a3a9cf1c8b4f0c50756d25cf27625604b5/


-- 
http://autobuild.buildroot.net
