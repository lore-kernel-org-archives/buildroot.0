From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Sep 2017 08:31:03 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-23
Message-ID: <20170924063103.6A6AC20974@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-23
================================

      successes : 93 
       failures : 40 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

                   libidn-1.33 | 15
                openjpeg-2.2.0 | 9 
                   mp4v2-2.0.0 | 2 
                 mplayer-1.3.0 | 2 
               asterisk-14.5.0 | 1 
                  cc-tool-0.26 | 1 
       gst1-plugins-bad-1.12.2 | 1 
                libmbim-1.14.2 | 1 
                libressl-2.5.5 | 1 
               librsync-v2.0.0 | 1 
                libshout-2.4.1 | 1 
                    mpv-0.25.0 | 1 
                openntpd-6.2p2 | 1 
           python-numpy-1.13.1 | 1 
               wireshark-2.2.7 | 1 
    xserver_xorg-server-1.19.3 | 1 


Detail of failures
===================

    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/9b7d584a61da3d41917a382b4ed8845801c23209 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f135b2b5c957ac6b4858cdd99b474861ac82dd73 |     
      xtensa |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/899f8f83d1ff56051a1604ec1063e619db6486ea |     
    mips64el |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/55973e9ce795847ef055392f2f4e0adedc0c9327 | ORPH
        m68k |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/5e2200cf27777cea838e7bd29e46a0a9138341c6 | ORPH
     powerpc |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/f2511f159dea271d9e40a4bb356267ac638149b5 | ORPH
         arm |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/a4b2a531e378b66d873ecc1cbd016d7dce86d910 | ORPH
        mips |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/1e46d04a6b5e4a91c1b6740452e4467e03323d4c | ORPH
        m68k |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/9401cc10f6da6a2e3453ebc65ce573c370733fb5 | ORPH
microblazeel |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/b33c0b0e6b1033ab1d1294a91b869ee6adcd391a | ORPH
      mipsel |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/dfdfb34ed81ba3a4b7a7271be482e75eca849dbf | ORPH
     sparc64 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/11d2b09d594fef827f41d02cf75f0fd11f6f2685 | ORPH
     sparc64 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/4339fc0b9e64c1261115da95a80bbc4879789151 | ORPH
         arm |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/eee6478fe36ce0b3622be6a32d85ddbe85592ec2 | ORPH
 powerpc64le |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/f0785d6978806782b6ccde432c0dce4d89006fe5 | ORPH
      x86_64 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/8a34b41771020d8932acb6b8426de7a3bfee93c8 | ORPH
         sh4 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/7471cf203c1c622ab2e4e3590e22d7df13da3d90 | ORPH
         arm |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/b4a89f59b251cf0f11dac7095367f5d2fdab01ba | ORPH
        i586 |                 libmbim-1.14.2 | NOK | http://autobuild.buildroot.net/results/dc11a3dfd18bb7f5078de00412de82de3cce3c48 |     
        bfin |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/3dc252b6a0883ea39e2ecde78584cf46c763905c |     
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/8154ac539f9392f2ff55ff7ab986c28f55f90d36 | ORPH
      xtensa |                 libshout-2.4.1 | NOK | http://autobuild.buildroot.net/results/72aa07d48d6b1d7dea046b88ee4aa943534ffad4 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/a7b217dfbe784994be76bc3bb3f41dc9cd7c0469 |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/aa8e52eeb7e0077acb4bc71c4e27e70d008c2467 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c10edce11393569e8b7a4a5fe5778f223993b444 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7e7c52ff2738ac4c7f918b6cbeb0d34c1a4b0ec3 |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/f2c56cd321c3e8e1e4bbb61c42ec3626dd4e3474 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/92bad29a11560229fc9632542f4be312793cb258 |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/859e5248a903e064c0533eb1bb3b942fb5ace5e1 |     
        i686 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f7183fbcfe68f4dfc127965214c5f5417d5fd6cb |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6706339e7df2f2e7d0d7a15663bed185ca55c2a1 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f85ac0a11997abc8babcd88c540f3c1e700c82dc |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e2ff0a7fa2b911157edf6c43a8eed797b22edd46 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/52c32f0dd1136ba69b8ba0f2214c919857addc62 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4937b323467e90be70d98359f023206789c3a6e3 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/adb89ec2c6f6f15d302dd6851536d9bcf568a7a5 |     
      x86_64 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/efc2a3853a3c5cbbbf84097d3e5bf8688d591cf6 | ORPH
         arm |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/b9a1fa5c847978e4f18b837e9339e4da0705728e |     
       nios2 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/663af47d4e31e8ef762a3e51328a441d0f3790bc |     
     sparc64 |     xserver_xorg-server-1.19.3 | NOK | http://autobuild.buildroot.net/results/04d93745d63fcfbea070c0126862b49f1b6f473e |     

-- 
http://autobuild.buildroot.net
