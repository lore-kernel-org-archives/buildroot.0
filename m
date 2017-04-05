From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Apr 2017 08:28:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-04
Message-ID: <20170405062834.F1B4C20821@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-04
================================

      successes : 136
       failures : 36 
       timeouts : 0  
          TOTAL : 172

Classification of failures by reason
====================================

           uboot-tools-2017.03 | 4 
                 xenomai-3.0.3 | 4 
            gesftpserver-0.2.1 | 3 
             ipsec-tools-0.8.2 | 3 
             ntfs-3g-2017.3.23 | 3 
                openobex-1.5.0 | 3 
                    ruby-2.4.1 | 3 
                 libv4l-1.12.2 | 2 
                aiccu-20070115 | 1 
                 binutils-2.27 | 1 
             bluez5_utils-5.44 | 1 
                 efibootmgr-14 | 1 
            gst-ffmpeg-0.10.13 | 1 
                libepoxy-1.4.1 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.23.0 | 1 
                poppler-0.53.0 | 1 
                  samba4-4.5.7 | 1 
                 sudo-1.8.19p2 | 1 


Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e9d96643de285fb8870e8061c042f9dc75ebca9d |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/b3c609fef93507c1ade81557dfa1427959b15c1b | ORPH
         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/006a999d47ede771b35718ea7833bf7cacfe3cf2 |     
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/5928d9d9a647a864b940db37371a75a57bd3d77d |     
         arm |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/454b22554025242d539120f79d8f64c24a38d108 | ORPH
        m68k |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/3789e11d953804a05f7c3475980ccca97dd66361 | ORPH
    mips64el |             gesftpserver-0.2.1 | NOK | http://autobuild.buildroot.net/results/162ff98c2372c55dc5fcf9c33b4d10d727d4011f | ORPH
       sparc |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/53a38bfd8692be6a613ad78a1e8a73f3e1f47cd6 | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9f8a9292d8276493ed78b51eac969c28129b1b08 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b2843b1e6d2e96f5670a9396964bc4e4a55a354b | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/431135d9f985f3b3f935cc29fe16728b2412dd3a | ORPH
      xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/c6da4c0b46d103427a2ba59fa36beb4a22c77987 |     
       sparc |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/384d67652010bf7ff444c4d00ee3d6a956f768c9 | ORPH
         arm |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/f4e29c1cab7d71385428ada80918dc85e95c22c9 | ORPH
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/665dc3004c2329220d3366da672bf4eb4f624a70 |     
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/b6216d7298986b236e79233f5402d9aa55dd10b8 |     
         arm |              ntfs-3g-2017.3.23 | NOK | http://autobuild.buildroot.net/results/9f78c9716361470c09b266979d3bfc79f9b9f7c3 | ORPH
      xtensa |              ntfs-3g-2017.3.23 | NOK | http://autobuild.buildroot.net/results/929b66eda6835b687081277252335ca4330c49e1 | ORPH
        m68k |              ntfs-3g-2017.3.23 | NOK | http://autobuild.buildroot.net/results/fc6aa8912b4bd63c0fb5729d2e3aca32f14e2aa5 | ORPH
microblazeel |                 openobex-1.5.0 | NOK | http://autobuild.buildroot.net/results/a2bd7d3cb809d3fcda49f86b915ba48868108c71 |     
     powerpc |                 openobex-1.5.0 | NOK | http://autobuild.buildroot.net/results/72fef48e33cd5b299afb43578c853bd055630800 |     
        or1k |                 openobex-1.5.0 | NOK | http://autobuild.buildroot.net/results/8a5f674db24ef1117ea9ffc6eb55b3bb9a82ec4c |     
       sparc |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/35b1bdde43987f3ddb660d633864873c03cc6bb8 |     
      xtensa |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/87595c20adbcb8ecb3105f48d455e5b327201c47 | ORPH
    mips64el |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/fcd024f6658890861fd7165e15edc65f77a9d8e7 | ORPH
      x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/a38f28f2af379ae34dbebe63e25b8d6875036421 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/c28883b70e792cd15b8a80b29fe0ac0f94a3e158 |     
         arm |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/5b42e8505856156389d480d0da19f6982cf120d8 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/2733af3eccd4f969f84970a96899b3c68c8a4a0c | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/b361f8e1dde87b460a20ee6e246c9c085572a415 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/93556a5eb60596f67b8f9069e7c3464d0fb4ff6c | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/3d0eea80a084f0f798a2a2071f0d95b47325673e | ORPH
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/aca92f2c3cc5125333e201ece650ff763e4f46cd |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/c3ec13a817909765d7856f80a9de794cc22164af |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/72e0da7fd174ec13f099753d72ede5bc742bbadc |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4945484affc834fc6dc1dde0efbb0ee75f62caca |     

-- 
http://autobuild.buildroot.net
