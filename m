From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-22
Message-ID: <20150123073013.DBDE41011DD@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-22
===============================

        success : 265
       failures : 30 
       timeouts : 1  
          TOTAL : 296

Classification of failures by reason
====================================

              host-erlang-17.4 | 3 
                    mpd-0.19.8 | 3 
          sane-backends-1.0.22 | 2 
                libsrtp-v1.5.0 | 2 
               lightning-2.0.5 | 2 
             libselinux-2.1.13 | 2 
                 python3-3.4.2 | 2 
                      make-4.1 | 1 
                    gpm-1.20.7 | 1 
                libgtk3-3.14.5 | 1 
                      qt-4.8.6 | 1 
               host-qemu-2.1.2 | 1 
              libarchive-3.1.2 | 1 
           heirloom-mailx-12.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
make: *** wait: No child pr... | 1 
                    fltk-1.3.2 | 1 
           python-pyzmq-14.3.1 | 1 
                    dash-0.5.8 | 1 
           libvncserver-0.9.10 | 1 
          libmicrohttpd-0.9.38 | 1 
                rt-tests-v0.89 | 1 

Detail of failures
===================

        i686 |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/458f22aa61fb175d00673f94e996105504b1c13d/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/2683cdca24d7ecc67cd6bcb2a352cbb9dfb464ff/
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/fcb264e3827b75a40891be978bc24f8c9ded9f57/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/70f2ddff297bdb08ae384b22ec64bfdae5635c5b/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/1b7d9097939c0233cd4a785e972734717c7184cb/
     aarch64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/32eb5bcffd68c653d8a731d1453f5564d545eb81/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f189a9247bc26b7e3d40c3e9f7d11b396e6a432a/
       nios2 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/739c3b7e57777e5762bdd3ee336212e65785f4c0/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/00519130d345b71c52beca93c71266cb892affe9/
     powerpc |                 libgtk3-3.14.5 | NOK | http://autobuild.buildroot.net/results/120654c43de98ea90244e523f6eb7f43c00cace4/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/b6583d668d73dc768a36f329028476083a45dc94/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/558ced76321c5de4c5ca37ca7da277ba923dcfed/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/01a1be79c108e491554c4faa181a4605038e019c/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/7e2982ba6341ffeed102957f000b840752c76325/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/548e220bfd06f1d3714150e5179547a2dfa20158/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/47785a893d754d260c3b4532c9b7bf01e21c1544/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/9109c829ca6d4bc0302494578ccca24bb1dda1ff/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/8d27fdf74a768d4686103b73dcc6d24e834c0c62/
     powerpc |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/b4f14aa756f0df169069221dc7e579c87d5404b0/
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/7f280efd7d3b31f2c51dbcdf52c6249338c73f28/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/6f701f7501dc8440769e5b54053ebfd187e1385b/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/1647070dd3cac2216ebc3d058ca03c3913fbe1b0/
         sh4 |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/3eeb691ee46b36d217c7a42c61c4e33510cb49df/
         arc |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/b006922f53d344a2d49b57b764f015b9b8981fbb/
         arc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/95898bb4279db6a0eabdf04561ac8332c1366eff/
    mips64el |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/e93f52ec8878a356598e160b59ead6bb53956d65/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2e59a7a2eb71abf96bef3d6772d460b6afc1ddc8/
      x86_64 |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/9998dcf8c82989d9eba772e16ce3905b24badbfc/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/de9b5bbfcb4764d2bd2e0dfcdbaa0585b0c3e93d/
microblazeel |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/1214e1492753cbae0176274649616c76dc49c88e/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/2de45194220e83840df16e70e3a7fb44ed466f16/


-- 
http://autobuild.buildroot.net
