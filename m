From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-31
Message-ID: <20140101073009.7FBF81013E3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-31
===============================

        success : 89 
       failures : 35 
       timeouts : 0  
          TOTAL : 124

Classification of failures by reason
====================================

                aiccu-20070115 | 5 
                    ola-0.8.32 | 4 
              cryptsetup-1.6.3 | 3 
                 rt-tests-0.83 | 2 
                 libnspr-4.9.6 | 2 
                elfutils-0.155 | 2 
                 libevas-1.7.7 | 1 
                  python-2.7.3 | 1 
          host-gcc-final-4.7.3 | 1 
                 pixman-0.30.0 | 1 
             gstreamer-0.10.36 | 1 
                      qt-4.8.5 | 1 
                coreutils-8.21 | 1 
                rtorrent-0.9.3 | 1 
            libvncserver-0.9.9 | 1 
          openpgm-5.1.118~dfsg | 1 
                  boost-1.54.0 | 1 
             transmission-2.82 | 1 
                 libraw-0.13.4 | 1 
        ltp-testsuite-20130904 | 1 
         host-gettext-0.18.3.1 | 1 
        gst1-plugins-bad-1.2.1 | 1 
ne10-88c18f02199947b2c8b577... | 1 

Detail of failures
===================

  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/757f350bc3bae23a0178e15a06f8fb62b69376d3/
  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/fcddb345f7e70f3ccfc6afdd0c3a7f3a91b3817e/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a7c455c9760797512a6a7d449d078c3918e7661d/
      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/01ab27bc885afffafebb5aab8a51ccc4f0a4dd12/
      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/ee973bfc8dfc218013b7a7bf008ed47a6b45701b/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/5388e075d8e72fc74d5c19b847438c944b206354/
    xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/
      sh4a |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/850bbfece6441dba0070806aa6379dcfb85eca99/
      i686 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/894d5734179a3ee3ae8fc5fe69ca768b74b92982/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/e3d1aac7062ab3a1ee80694c94f0a2a7354cfae3/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/00fbe4d1b1b9eee8a5f474729f2e2ac36bde2d4f/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8e5b178bc61a67280c37f678fe2b3b45746c30b5/
       arm |         gst1-plugins-bad-1.2.1 | NOK | http://autobuild.buildroot.net/results/f3608a6ac642830a1fbf413020925e65c1a0cb8c/
microblaze |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/3be7f3715574d4020bf8e8eed523bff5d16bc5c0/
       arm |           host-gcc-final-4.7.3 | NOK | http://autobuild.buildroot.net/results/b6026280ddcdff06f1d4f2b4b3008d67255eb036/
       arm |          host-gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/56a9d900056c36a107065254ee3d7199680f1464/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/c98ba3ec14931cd7c10d7d93bdea903a246fce50/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7d371c63cae368cf7fdfe749048c8df6535da48b/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4932900522e87da84a47fbf2d796c2fbb3f7e741/
      mips |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/df2f860e895e52a1f6563f6c26716730be6f9fe0/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/ad75fe078ccc25fdfe6ef586dbc43129248a16ad/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/b602a4e0a8eee8e925ec57107752aacb87280c7f/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/5bc4f8ca7c6b95ccbe36f5dd45c7d59a2374126a/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/371da12f8f407002c288e87d3e42d2111b176113/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/380c2e7116dc5f5375855eb32fcae2bec1963824/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/506142ca8d4a0e85f140da8f8b30e1821ae10fe9/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/11a655c673140d973934a4df8b749f5699a0609b/
      bfin |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/69c5d9a2737af6c68a8860769ba7a371e7aa107f/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/980e03c5f8a7678f3343439dc37636855f637f9e/
      i686 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/19f68b2d14d12819f213d6dd2cbff3a3c4d55451/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/69c99fa766577598a629f5cb65b6a114fdd74405/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/4f4292dd5fbadd811507f77df7b545ef39062ff6/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/6011be501771177c89118af20ffb0dcc83afb212/
     nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/93eb2d9099aae4cc2b1df15058b549dfcc6292d3/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/2dd874f59253b4378633466bca619e272a46621a/


-- 
http://autobuild.buildroot.net
