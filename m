From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Sep 2017 08:30:53 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-09
Message-ID: <20170910063053.146EB209E3@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-09
================================

      successes : 145
       failures : 33 
       timeouts : 1  
          TOTAL : 179

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 18
                   strace-4.19 | 7 
            xlib_libXpm-3.5.12 | 2 
                    efl-1.20.2 | 1 
       gst1-plugins-bad-1.12.2 | 1 
               linux-pam-1.3.0 | 1 
                   luvi-v2.7.6 | 1 
                   mp4v2-2.0.0 | 1 
                poppler-0.57.0 | 1 
                sdl_ttf-2.0.11 | 1 


Detail of failures
===================

     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/98fde237468a073dfe2125ec06d01904eb2de323 |     
         arm |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/0e3e464eda1bbd35bd45139b7457b6008cf86075 |     
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/bbb16277294839ab1fb5fd1dcb902a69cf1ca679 | ORPH
        i686 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/ae52afb6e814e5049b24dc77a170cb254a72be5e |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/6178941930295fb31ab09506bd95115a2712def1 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f1bd7010e09b5ff050ac8b5414521af1467e5ff2 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b1d1feefc1c72c565bc37a4784aab35f29c842c9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/568ceac9094d27d0dcacaa478394b79eda111100 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/d36373fc68b3a4bb3425884bab051646ea9db246 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/349d6f9217c1a5ebbd7fe7d549b6a77924bfc126 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3b61474f39858162b3103d71599ded0f23eebc88 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c282321ff5ac0f1cf87a3ec168f3e156c1b17155 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c58eed7c073f158074e65d534bbfaee5efdf1db4 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5f96fa9ac705b7f008ac1951728a1f7a9c2dc6a9 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/9afac8ff356c0f25465330f87c854b3d9aa41ff5 |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c58c54d8aaf9c85c0e53e772607af43a73123084 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3d3cecfc9e0d7dfdc131c277b8919fc520a480a1 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4593047d6781c5f3cbae6cd45625d285aa609b98 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8fe24ebd2ab5eda65dd6d42957afd8edd0dc5135 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/aec26d7e5d8f35b2b91d541f24d3e6d3a75decb1 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b236484a895390e63e92ad4c94a49827435039ae |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2d2a99cd92eb366f2b7fe6cea906f01b6024df2c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/908818a239a6a64de20c20476f1a01cc112a6dd6 |     
         arm |                 poppler-0.57.0 | NOK | http://autobuild.buildroot.net/results/1e224bc431a1ab6008b05f180b5dc6a7db5af695 |     
       sparc |                 sdl_ttf-2.0.11 | TIM | http://autobuild.buildroot.net/results/cce936e7c620995399c2a00885100fbb5181880b |     
        or1k |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/3d3fd23c52eab3b56cbd2082568b505e1efe7b69 | ORPH
         arm |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/19288fa219223598af274c8c5cfc36aced332918 | ORPH
    mips64el |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/997bb74b924fd4d2db24af29785ccd1f396d0d2c | ORPH
microblazeel |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/cb78c04f8595832aee84acd02c7c44928db4dc86 | ORPH
      xtensa |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/c25ce66901f4001bb346a67c8920f4016cab0ec2 | ORPH
    mips64el |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/ec92135e9b8d02fefb0e51ecee2b39e5bb587ae9 | ORPH
      x86_64 |                    strace-4.19 | NOK | http://autobuild.buildroot.net/results/a2783da3f9cbceee11e8fe74e7056abf9474a21c | ORPH
    mips64el |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/5908806ed3ac175b66b6293b0d6e9a2c91edacb5 |     
         arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/3cd5f1e9faaf38c31c0a495a76502057022876a7 |     

-- 
http://autobuild.buildroot.net
