From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2016 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-16
Message-ID: <20161117073013.567CE20C08@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-16
================================

      successes : 170
       failures : 26 
       timeouts : 1  
          TOTAL : 197

Classification of failures by reason
====================================

                xfsprogs-4.7.0 | 2 
                benejson-0.9.7 | 1 
                    cups-2.1.4 | 1 
                    ffmpeg-3.2 | 1 
libasplib-f7219142e790a329b... | 1 
               libdvbcsa-1.1.0 | 1 
               libepoxy-v1.3.1 | 1 
                 libnss-3.27.1 | 1 
                 libraw-0.17.1 | 1 
make[3]: *** [xmag.o] Termi... | 1 
                 mesa3d-13.0.0 | 1 
                    mpfr-3.1.5 | 1 
                 mplayer-1.3.0 | 1 
                 opencv3-3.1.0 | 1 
               openldap-2.4.44 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
             qt5location-5.6.2 | 1 
                  samba4-4.4.7 | 1 
                  squid-3.5.22 | 1 
                  stella-4.7.2 | 1 
                  stunnel-5.36 | 1 
                sysklogd-1.5.1 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/aacff7d52c38311348b10e4f24db5a6ba49e7176
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/2dbdd4dfb0d00dadaa4e65f56b642488c219a441
         arm |                     ffmpeg-3.2 | NOK | http://autobuild.buildroot.net/results/1d65cbdf5cdead10275c9a965c42f0b9dbdb475c
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/90c615504bd58e13524f38d48e1355a73d9831f5
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/a2638fffddd55e607e7dc210e20b2f079e70ca09
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/a9f303f0eeef8bd226de5bb62899051567f4c43c
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/7dddf4194928495a07aa47274126ab9e8c76f312
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e98f480a7dc5ad6b017c6d68e2bd64b84bb1176a
         arm | make[3]: *** [xmag.o] Termi... | TIM | http://autobuild.buildroot.net/results/702909348f9523c3dd910ec2141eb6cd1f280f3f
        i586 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/13cd081015f125ecf0ecbac6c81a078555212994
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/9feb3199dce448835264f8c2a3907a8fd5020ecf
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d5e1c7f2671387fba45239a4e19dff44dc063867
        i586 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/9da2e96e48b9e0d3db3a30a1c44f745e62b7edd4
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/a5ac763b8e35219a196fab3e7cdaeb85aaaeed35
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/40b9dd2f6c8d2a351f416b40e7ca1df2b7f768b5
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/7757e057260857a9ecec79d230f6429f59b063b8
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/a8360aeb9c42397941bbf4095390248684ec4370
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/65b8d1f74919c3ad3e0fe5b653765b62426a3081
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/31c93c862517fdcf4dc01f223f4c661987b5eba7
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/0a119981d22b88711f46f52572d4a663695ee667
   powerpc64 |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/0970d2c8e1787ceffc46b589522e53d52675e03c
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/7be052793d6f21526a37b1d2e02c798fed499a11
         arm |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/5d8eb42d4ada503970534a7713999f21c14e37cc
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0d165fd377dd3a56bff8247ab55c2e49900ae68e
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/80809964fd31667929f668ef158b2f52f6262149
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/912d7e936881b313b17b4dd641b3d649bfcfc2c4
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/9f877db3b86b25bf1e564f7b96681f2ef1b16974

-- 
http://autobuild.buildroot.net
