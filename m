From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 May 2016 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-03
Message-ID: <20160504063019.05BC11027B8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-03
===============================

        success : 117
       failures : 52 
       timeouts : 2  
          TOTAL : 171

Classification of failures by reason
====================================

                    mpv-0.17.0 | 7 
android-tools-4.2.2+git2013... | 6 
          php-geoip-legal-info | 4 
                 igmpproxy-0.1 | 3 
             stress-ng-0.04.16 | 3 
hidapi-d17db57b9d4354752e0a... | 2 
                    ruby-2.3.1 | 2 
                  ffmpeg-2.8.6 | 2 
      ca-certificates-20160104 | 2 
            host-python3-3.4.3 | 1 
                grantlee-0.5.1 | 1 
          libpam-tacplus-1.3.9 | 1 
                    pppd-2.4.7 | 1 
                libgpgme-1.5.5 | 1 
                    putty-0.67 | 1 
                wayland-1.10.0 | 1 
                   mpd-0.19.15 | 1 
                flannel-v0.5.5 | 1 
                  boost-1.60.0 | 1 
                  connman-1.32 | 1 
            qt5serialbus-5.6.0 | 1 
                    mosh-1.2.5 | 1 
vpnc-70f1211f6f26e87e374d66... | 1 
                 jack2-v1.9.10 | 1 
gmrender-resurrect-aa3d02cf... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                 gtkmm3-3.20.1 | 1 
                libinput-1.2.4 | 1 
                 host-go-1.5.3 | 1 
make[2]: *** [code/CMakeFil... | 1 
     python-setproctitle-1.1.9 | 1 
code/CMakeFiles/assimp.dir/... | 1 

Detail of failures
===================

        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dbbf3eb398b4c11a7b1d13a9d81403c5c23f2a7e/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f11e78323307ecf6f2d21bf523d80e6e9623e399/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/68f1890d1cc892f00cfceba12598db5b10402378/
     sparc64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/fd971b3ebaee473e1650ac9d2f6f2e2497aadd17/
        bfin | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/619ce30dd3c93c674cb2d95c22320f9eac6ab40f/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/1a922345e330fbf83e22c9f9967abeed199605a9/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/754923b1c4f7ddf6f42a37aec5309d1ef0afe0f4/
     powerpc |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/895ee5050ea3ff7f45df541292ab47fd5394b85d/
      x86_64 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/de04d6cd0552899f3fbc438307820cb78b3648f8/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/0b71238b058189644a464c3d9b9e4ceeb0227e61/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/94ecfdda6da506352fa6bd4f5d9a0a3cf1771d38/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f700cfcdda89872a9530233733a88dd20eeea905/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/e6c4d8a3740fe43d60478975455f0345c8bacbcb/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9cb67da8c9b34e013bff089631699e76223b2d31/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/c1fc50f8ac7a142ab0982a42af50c046097a71a7/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/e6eb1e56ee6741d819e90a674186aafdeebe60f4/
     powerpc |                  gtkmm3-3.20.1 | NOK | http://autobuild.buildroot.net/results/d57e6b9f7d3b3de4855b2c26a87974562d7c5bf3/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/79ccf5e0bc4b1cfde9037e7079d043a5afaecf1d/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f432b756e4ff9547b6b2edabb5c9ba3cc1995794/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/772c0fb39b142113fcd9453aca3bfcedfb676e2f/
     powerpc |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/8184d6a94d5cdd3acfee525be683b4ec6b15f7fe/
       sparc |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/8951013d2778f37733e14ac5e70e7b89f9202d37/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/c3a5eb220de6ec2cfd00df6bbd7eeffc5263d6a8/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/d415a41b240c8dce9e082667fd4161ccefe6190f/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/46220726be2695ce8278fa0ff789a4b2932dc6c5/
        i686 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/9349492facf952856af5472707fab058850b6084/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/cc9aabc8f860cddd4eef38d3c80329520d52680b/
        i686 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/1465ad47543af1ea998006ff5722d9dde2e0986e/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/8c537b9dd5e8d07cc64b81b39ea87dba9eec223d/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/1651673b7093070cdf55ee228c53b724296e4ca8/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/88c16d9dcc8948559b0d9c9c2b641979a241ccaa/
         arm |                    mpd-0.19.15 | NOK | http://autobuild.buildroot.net/results/ce99d25ca46f549d452fe8d0278efc9c4d9d60b8/
        i686 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/74f16adbecc75fbaaa2961d5644fa4190f492dcc/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/90a9c817dc2f1628cf1350a7627f34c6fd63bbff/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/57c83913eb32021a4c31c33e18bde7906e3c3dd6/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/88f0d43645d08fed299606d96bfe388c5a9defcb/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/cec24969f1412d5df357e26e80cc946c141fdc39/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/124a6ab92c2dd15224cd066dbbbcffea663df5a9/
         sh4 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7a5f1cd3fe2a4183b584632b1aa7e8bcdf4e94c0/
       nios2 |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/ad35da48694579baf23de34105bd22e0625905bb/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/90595dc85b8d6948561ef42732799561ecd6a648/
    mips64el |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/65d0b593b4d5a0f890e034b3a7043f8e25487372/
         arm |           php-geoip-legal-info | NOK | http://autobuild.buildroot.net/results/2fc28e64b8780898bc6255193c0eb6d65ff04596/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/be245ad88212e36eea42d79976301cecbbd199a0/
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/8f7683b2e204249c37690bae915208298ea94490/
      x86_64 |      python-setproctitle-1.1.9 | NOK | http://autobuild.buildroot.net/results/f66bcaca079099df86096218e8dc842868cae3db/
        i686 |             qt5serialbus-5.6.0 | NOK | http://autobuild.buildroot.net/results/bc7a38e82ed8309da7892df776a76ceecf94f781/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/59dac907a247254f479065d48c0540b177720621/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/ff0f277a9d76db474740d4998b23c41e2f9bc718/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/b8c6effc87212bffa7fdf7188f3bfeb463fe4dbf/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/bb40399f13be778b0161d76d6a40429ce0305280/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/2a3e55e4b41c333ec549d1bef099c3bd985efa6d/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/42e0ec277f64570a758091ff955e722a39a09a83/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/d71f65a8ea1d567fd82097bfbb2d370df09c7152/


-- 
http://autobuild.buildroot.net
