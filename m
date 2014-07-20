From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-19
Message-ID: <20140720063011.566E410188A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-19
===============================

        success : 64 
       failures : 38 
       timeouts : 2  
          TOTAL : 104

Classification of failures by reason
====================================

                  perl-gd-2.53 | 8 
            host-python3-3.4.1 | 7 
             perl-gdgraph-1.48 | 3 
           libmemcached-1.0.18 | 3 
                  opencv-2.4.8 | 2 
           php-memcached-2.2.0 | 2 
                     make-3.82 | 1 
                libcurl-7.37.1 | 1 
          google-breakpad-1320 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  cppcms-1.0.4 | 1 
               libglib2-2.40.0 | 1 
                  python-2.7.8 | 1 
                     popt-1.16 | 1 
               libcuefile-r475 | 1 
               polarssl-1.2.11 | 1 
                xapp_xfs-1.1.3 | 1 
make: *** wait: No child pr... | 1 
          perl-gdtextutil-0.86 | 1 
                upmpdcli-0.7.1 | 1 
                collectd-5.4.1 | 1 

Detail of failures
===================

    x86_64 |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/047dc20aba46885679b6d21cdd2d77fc252374b6/
   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d8f23106e9f4ccc46695f41c954589155baa1b9f/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/2b03937693ea400ddcc7e8364ff7dc22ce651669/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/f33168db914b6063ee36fd84deed4e54e81ebf1b/
   aarch64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/1846f5531b4c0cab230f5de8d23b606643483d18/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/26b9d45165b5fc1d9a4914c663f951c8cf9b13f3/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/65fe6090bdece1dc67e6a23d13c144b689bc6a45/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/56c0478eb0af0eaf3f32fcd5eb21a23c9610fd01/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/50f06f20c1b6280ef87e206dc3f7d5a56c07f5a4/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/b80f3a8cc0d86c0bf41c2d58490bcb591f09e261/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/17a331f5e3629376e51855c110b62208007b7d2c/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/bf951f2c344e7460661a353378b80da428111ab9/
      bfin |                 libcurl-7.37.1 | NOK | http://autobuild.buildroot.net/results/2a274e2dbffd268a391b0e8a15dae5a759b870a1/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/c1a0035267cf21dba68dcb30d572ec5927817e7c/
      sh4a |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f9314ff0f117540d8b251f2b96031f4759e49a78/
  mips64el |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bb589713f599d63d5c1fb6ff9e75cb9555c25853/
       arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/739ae9b2f28486dec8900aa584145d2d38f44331/
      bfin |                      make-3.82 | NOK | http://autobuild.buildroot.net/results/2e1b11ccb501f1ab431c04435be52a6538d035cb/
   powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/9f6627d01cb780b02592e7d438db0bf8a735e56e/
  mips64el |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/b6acd983b8c78005feef6864af469bd348ab742a/
       arm |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/efc9590a193235701fee535f4a1da7b39c426665/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/33633a683227ebce620cb4b4561cfe7d7cbf4ba8/
   powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/0d995f059a36d8dd46d79561eb58a4b7524a64eb/
   powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/69e1ceed511b5e1b43387e48bfa7a73947aa3ae6/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/2576febdaac456486b494941de301d88e1df861d/
    x86_64 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/df881873d9d053fd39f77d4069124621d65e8360/
      sh4a |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/fa099959c2c0d5428d0673893fc5ab1e35ac6726/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/75b9244e440059b7b52c9ce326af72abdc660143/
   powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/bee5add7dad08a573cad2aa1f438625b135551dd/
       arm |              perl-gdgraph-1.48 | NOK | http://autobuild.buildroot.net/results/1897ad69e8ec854ed0ad5f50f5a3c5fa22316d95/
    x86_64 |              perl-gdgraph-1.48 | NOK | http://autobuild.buildroot.net/results/3e1698b0523dfa46f5b3ee03a22af820f7342c39/
       arm |              perl-gdgraph-1.48 | NOK | http://autobuild.buildroot.net/results/712375c490532185d127c135a5588e9ee6b6152d/
   powerpc |           perl-gdtextutil-0.86 | NOK | http://autobuild.buildroot.net/results/fbd276b13c45c3b70561c6cbf5b0c8f72a9fddc4/
      sh4a |            php-memcached-2.2.0 | NOK | http://autobuild.buildroot.net/results/dea9932a0f90c63a503f97cbd887562373b280c3/
      bfin |            php-memcached-2.2.0 | NOK | http://autobuild.buildroot.net/results/01e4971a91db7e256eee77b2fb074e328e5a4c88/
microblazeel |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/f36fa8599f64fc3f1f079a507d651daa2c00b7ec/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/e8eae837a3f0c6b11816c33d68e8523ffc6346c7/
       arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/38c392350d714ba6afc27340490aebffc80ed2e9/
   powerpc |                 upmpdcli-0.7.1 | NOK | http://autobuild.buildroot.net/results/f00fa9b83718abaffd1f52dcd50e582434b3c5e2/
   powerpc |                 xapp_xfs-1.1.3 | NOK | http://autobuild.buildroot.net/results/385cffbab4261337afa449998aa7457a8142db92/


-- 
http://autobuild.buildroot.net
