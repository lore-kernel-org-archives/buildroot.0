From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2016 08:29:52 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-21
Message-ID: <20161222072952.25FF82070B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-21
================================

      successes : 174
       failures : 26 
       timeouts : 2  
          TOTAL : 202

Classification of failures by reason
====================================

                busybox-1.26.0 | 2 
             freeswitch-1.6.13 | 2 
             host-nodejs-6.9.1 | 2 
                 libnss-3.27.1 | 2 
             lttng-tools-2.9.0 | 2 
                 mplayer-1.3.0 | 2 
             qt5location-5.6.2 | 2 
host-google-breakpad-7515ab... | 1 
                 jack2-v1.9.10 | 1 
                libmad-0.15.1b | 1 
                 libraw-0.17.1 | 1 
            lttng-libust-2.9.0 | 1 
make[3]: *** [send_raw.o] T... | 1 
                   mimic-1.1.0 | 1 
                 openssh-7.4p1 | 1 
                    putty-0.67 | 1 
python-libconfig-b271c3d9da... | 1 
                    rpm-4.13.0 | 1 
               spi-tools-0.8.1 | 1 
                  stunnel-5.36 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/89baed57aecb5740d7c5ffd2ed1d312392b18393
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/dae0fcc229863199a06e92a42c1d6243257e4046
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/55a0f58331249d34c1429193257c726ef233b97b
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/0e046965f2037c27d4efe32e5b0cb9e0eedf612d
        mips | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/c5e629f26bf6da369dff1e4588c16d2773173e9f
         arm |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/537043bd9b22b1b80cac9339be7e63d5f0a2c99f
        i686 |              host-nodejs-6.9.1 | NOK | http://autobuild.buildroot.net/results/12c6763caf4e12d8bfad1c8af6b5572d90bc0562
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0147120075f74ff2ee4dcc557e3f5c2ad2ba0828
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/a370eb382d2801437276b25ae6d45d07dbe6dc7b
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/2b30be45db0e326a79e9b5d59d97e21a8b998daa
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/f4d09a5b1a8aadf5cd17caa8ea15cbdf9774e257
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f2d02e900371b62e49ccab77c8bde8d421563830
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/daca69931966896b9095a16107295fa150e6e465
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/4f6e4c9aa0ef2241e2d12fd0b371be7ff09b4035
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/688a526b3b884a5b0006b7a7e911cd750f55e086
      mipsel | make[3]: *** [send_raw.o] T... | TIM | http://autobuild.buildroot.net/results/242d85ad263d901930ea35c9995c5872d40fbbc0
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/b62bb5699f0bb502fea9dee859421492b3831bab
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/32c163eaf6fc0a82ab79e094f90dd8962fb33209
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4cf3b23fda72b047055b4009723830642f79abe6
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/f85638e345879ad09b8f4bee10e94d8e39d5268f
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/65246fe6357cd3cd8490bc54baa2394730dcef79
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/824dd963ad93cc48814ac3f39f4f9784842e2a82
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/cf6b1ccea28f2a713d0436d8d96b3a349e42c05a
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/7bdda05688e43fee8bd3b29298269111381a8f1b
        i686 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/1394a6e43529a3969572912dcbdd5606770beeeb
    mips64el |                spi-tools-0.8.1 | TIM | http://autobuild.buildroot.net/results/41941495c99c5d8092a7e8519bfb991a93a481c5
        i686 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/81029efad8b9e2f48c26a7b20f62c90844fc86df
      x86_64 |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/7a7559d5909b5631a3929da0f48610faa5e80490

-- 
http://autobuild.buildroot.net
