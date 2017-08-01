From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Aug 2017 08:30:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-31
Message-ID: <20170801063048.E1A5E20C14@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-31
================================

      successes : 165
       failures : 18 
       timeouts : 0  
          TOTAL : 183

Classification of failures by reason
====================================

                     gpsd-3.16 | 2 
             lttng-tools-2.9.5 | 2 
              swupdate-2017.07 | 2 
                  dnsmasq-2.76 | 1 
                    ficl-4.1.0 | 1 
                libressl-2.5.5 | 1 
                librsync-0.9.7 | 1 
         libspatialindex-1.8.5 | 1 
          mediastreamer-2.14.0 | 1 
                    mpv-0.25.0 | 1 
                     nvme-v1.3 | 1 
                openocd-0.10.0 | 1 
     python-cryptography-1.7.2 | 1 
                      qt-4.8.7 | 1 
snappy-be6dc3db83c4701e3e79... | 1 


Detail of failures
===================

        m68k |                   dnsmasq-2.76 | NOK | http://autobuild.buildroot.net/results/c3146d758cca085f5553fcd3f843f738c890f0b1 | ORPH
         arm |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/4302794efefcd8c62cc95c7e015e66ff8f005050 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/64a0bec7efe5b63a2b315bd204fb50884d62f0a8 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/4c240106fb29805382d5ae347e65b6f83d5033d4 |     
        m68k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/f3242dffec031fe32ccc3133d5d6138c49c47055 |     
         arm |                 librsync-0.9.7 | NOK | http://autobuild.buildroot.net/results/91e0333a52b1e8c8a34d43fb1d6de1fb63389a84 | ORPH
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/3cd4bb438158e6f848072af1acae876a8a44ef88 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/27c19943a9a2ae7c53ba0ef6fc924d0dd61fe473 |     
     powerpc |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/3505d9a8df7d3a323782f9b144153ab67329ad0a |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/5839e7a553e7dbe9920cdef7069c18846bafb918 | ORPH
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/f03a4ba557a5bf421ff57f999053a2cd1b4283af |     
microblazeel |                      nvme-v1.3 | NOK | http://autobuild.buildroot.net/results/53b2d1e0c3cdeafb980389bcfd8a10b6ca48fbc2 |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/6517e8364a6ac8c5c959f5bb26067d1e65fabe47 | ORPH
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/073f82ce9a0366297da6464db552eb8049efd55b |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d1c0e5e7d23614e2f90b2da94d667421c59aaab3 | ORPH
         arm | snappy-be6dc3db83c4701e3e79... | NOK | http://autobuild.buildroot.net/results/fc643983a5ec0a49fa626ef033fb82bb7627a8ec |     
         arm |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/c689783cc869162e6967e3dbe67e757e047f6011 |     
   powerpc64 |               swupdate-2017.07 | NOK | http://autobuild.buildroot.net/results/1c349cc5904868e4def292b9fbfa164828e46156 |     

-- 
http://autobuild.buildroot.net
