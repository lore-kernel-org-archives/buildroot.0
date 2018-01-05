From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  5 Jan 2018 08:00:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-04
Message-ID: <20180105070004.A3EBB20727@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-04
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 167 |  26 |   5 | 198 |
   2017.11.x |  15 |   0 |   0 |  15 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libostree-2017.15 | 7 
               tcf-agent-1.6.0 | 3 
                classpath-0.99 | 2 
                   gconf-3.2.6 | 2 
                      qt-4.8.7 | 2 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
      host-xlib_libXfont-1.5.4 | 1 
                 libdrm-2.4.89 | 1 
                 libpqxx-6.0.0 | 1 
                 mplayer-1.3.0 | 1 
            nilfs-utils-v2.2.7 | 1 
                   pcre2-10.30 | 1 
                    php-7.1.12 | 1 
                  physfs-3.0.1 | 1 
         python-watchdog-0.8.3 | 1 
                  qlibc-v2.4.1 | 1 
                 setools-4.1.1 | 1 
wiringpi-96344ff7125182989f... | 1 
                     xen-4.9.0 | 1 


Detail of failures
------------------

         arm |                 classpath-0.99 | NOK | http://autobuild.buildroot.net/results/fe7bdb2e1867f35a339ff2da410131eb285b0f20 | ORPH
     sparc64 |                 classpath-0.99 | NOK | http://autobuild.buildroot.net/results/322e843082c34df7bdc71a8453204ce7062a2812 | ORPH
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/1cd62f9ad5bfc37391d879f4d0df1051e8ff2f3d |     
         arc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/3915e3be9ae7790f9fec0c87a1265621e90b9dea |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/ae7280ed8d879e9940ef93fd63bd99f1a66eaf87 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/e39e160b0fbce73b59d143c5223a9484f202a787 |     
      xtensa |       host-xlib_libXfont-1.5.4 | TIM | http://autobuild.buildroot.net/results/0c998632938932f7adcfeba4ef8c7b047a6c0e8c |     
       sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/4b47af55e026a05ba6ea10140a786f42fe21c0e1 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/018062bd3d9efad26d82b1888edfdc89bd83228c |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/b30a7f68215085f13be59b4761a427a0147754d5 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/09c8283d792eb38b9fb97b03f6a7ac602911bccf |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/38118aa492c7a7fe873bd9fbcdfb0e493a2f5a03 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/dc3ce02c70fb51c76c7b4702f6393d9d56821483 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/22c0c2e8e3599f8d22ce14714fd15e0283f92d97 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/9e9d1e6c4909329e385558aaa68be118e7442ef0 |     
         arm |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/eb6d786d496a0f93160971081690e9201abb021d |     
        mips |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1cf639131d443ed219f86ee3185cb275d596ff5a |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/a9fe41ed428d26ef5500cec9f762c0bae3eebd39 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/6268c0a1b366f68561e71a3eab7ccba8321a7909 | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/c4e6ca15896def0a88361c59331b18c7df8923d0 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/500f58d4bdf096466ce88a9099b89e6b9b632010 |     
      xtensa |          python-watchdog-0.8.3 | TIM | http://autobuild.buildroot.net/results/baaf8e4cbb9099ca307b7ecc8a81cf184610da3e |     
         arc |                   qlibc-v2.4.1 | TIM | http://autobuild.buildroot.net/results/27e224e2df6fc58d2aa325d9666ddae256903966 |     
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ba595c911042e753abf5780aafd093fede0a5220 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d19dfb15d4ff63ee1bc400d2e0eeadeb9c19e7d7 | ORPH
        i686 |                  setools-4.1.1 | TIM | http://autobuild.buildroot.net/results/0205ce480af81c86f012d917804dbe7f24318e81 |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/d010c2c58e183787e8275d6173b09832db876e6b |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/53f84e00e81e05deeb8e92f5e8f945e0fa32e353 |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/7e9f3087dbed6b2d82a61bdec06f9ee697326db9 |     
         arc | wiringpi-96344ff7125182989f... | TIM | http://autobuild.buildroot.net/results/8f61bc787bba3234ced35082804637346ffb821f |     
         arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/fc240f19fdc0d899dc3fde8333a42ec7f8d48e16 |     


-- 
http://autobuild.buildroot.net
