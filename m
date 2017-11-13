From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Nov 2017 08:00:40 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-12
Message-ID: <20171113070040.7E49A207C6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   8 |   0 |   0 |   8 |
      master | 108 |  32 |   1 | 141 |
        next |  22 |   7 |   0 |  29 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 4 
pdbg-77158819158d1d7053a737... | 3 
              alsa-lib-1.1.4.1 | 2 
                    chrony-3.2 | 2 
              host-erlang-19.3 | 2 
host-google-breakpad-7515ab... | 2 
                libplist-2.0.0 | 2 
                  cc-tool-0.26 | 1 
                      feh-2.21 | 1 
                  fwup-v0.15.4 | 1 
google-breakpad-7515ab13768... | 1 
           host-mono-5.4.0.201 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                       jose-10 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                   libcap-2.25 | 1 
make[9]: *** [do-all] Termi... | 1 
                   mp4v2-2.0.0 | 1 
           python-numpy-1.13.3 | 1 
              qt5enginio-1.6.2 | 1 
                 tn5250-0.17.4 | 1 
                       unknown | 1 
               upmpdcli-1.2.15 | 1 


Detail of failures
------------------

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/5e969d52c28ad1afcca6e2219232026bf0c93f1c |     
         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/fca2ad71c7d446e4738834a1f220d950bce5fddd |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1d3ddaece1582bed29a66b8f2cf73e57ffe5e9c4 |     
      x86_64 |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/fc8440db025f51c176240ca127bc68a367add21c |     
         arm |                     chrony-3.2 | NOK | http://autobuild.buildroot.net/results/aab3210d6d0c60fb07415d9bbdb09f2d4091446c |     
    mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/dd3000bd99d71383ce82cd6b01b543cd9660130e |     
      mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/c1aa07fd2e8507bd01d3807d94855b1d1d65f321 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/04397429b221b2d59ab5560d3821b33662356509 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/0646e28b7b54115ef3ec922a0a95df4f043af910 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/479a26f40327719fd5c6d98e7354a1793fd5f234 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/f002d07bebf39948116b3f3448b6e19342804d3d |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/357f082875ffd0a3db5406bbf24e7401528a1748 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/c3a3dffd55dde45d6149a128992e09b05db8adda |     
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/a1834e4c7b8ae57faf3ea7f65408e0061945c86f |     
 powerpc64le | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fdcc8a1971e8c69d96419e38c29d7849c7f99939 |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/945c60ff942dfd3daa4da27f5e19470e3d97aed4 |     
         arm |                 libplist-2.0.0 | NOK | http://autobuild.buildroot.net/results/423abc9b87934983bad8b9e1b79d07ada6b1b092 |     
         arm |                 libplist-2.0.0 | NOK | http://autobuild.buildroot.net/results/c351b7a90e670f73cd675f2f24b439b77991c19e |     
         arm | make[9]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/86b71a197e287c6c0c0d9ebf48d027f5cf524303 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/6e717fdbd8a39e3d54005332283119069017e6e0 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/5ff9099412fd44d08f460d73346d848c07d68103 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/ee9fa0233afccf9bbbd968fd542d2a507895638b |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/208938c256e223694093a10ba22e4201a885bcc8 |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/6b9a3310bb4f8c1fd7db0ef4476458b3eec2bf2e |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d9d7f72d980a2cef5db8d3462ad1d380f2e10944 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e7a48f12682d93afcd7c7c69158c038589b6c32f | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1bdc8fabb476ba19d580d8ef4900e15f8bece2eb | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a7b9e4d4ca672b75916734ce0b898769a484e6a4 | ORPH
     aarch64 |               qt5enginio-1.6.2 | NOK | http://autobuild.buildroot.net/results/84c04122596f11f4baf13fb2d65400f0a1838ca7 |     
         arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/42535e697dc21ca5222efc7d2721f669856c521f | ORPH
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/d8aeed2f64e21a277eb0bc5dc08d2339a14c682e |     
     powerpc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/56b08228c2e8fa54882323e9bfff6c5f0a5b6f90 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

        host-xapp_bdftopcf-1.1 | 2 
                   jimtcl-0.75 | 2 
                  boost-1.65.1 | 1 
                 mesa3d-17.2.5 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/a20c6be063311e65dec958e67a7d491c52084574 |     
         arc |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/0494e362f11aee42638703a1a13cb97dc0e047f2 |     
         arm |         host-xapp_bdftopcf-1.1 | NOK | http://autobuild.buildroot.net/results/a779f5cc8b1ddd84f79fdd346e8aff834414244d |     
        or1k |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/87b09418c0355c8f57c1b60571e4f97dca42820c |     
     aarch64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/9273db8d1afa178505f892ee4650182f022c5e74 |     
     powerpc |                  mesa3d-17.2.5 | NOK | http://autobuild.buildroot.net/results/1e77180fca70ea59738dad21e0c7f5673d438172 |     
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/f467ae84e3fd41382c034a3ae2e4033e8a6f90b8 |     


-- 
http://autobuild.buildroot.net
