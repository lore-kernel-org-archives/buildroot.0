From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-09
Message-ID: <20161110073014.8F75E2097D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-09
================================

      successes : 167
       failures : 39 
       timeouts : 0  
          TOTAL : 206

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 3 
                 weston-1.12.0 | 3 
                 mesa3d-13.0.0 | 2 
                    ola-0.10.2 | 2 
                  squid-3.5.22 | 2 
             berkeleydb-5.3.28 | 1 
                coreutils-8.25 | 1 
                    cups-2.1.4 | 1 
                   dante-1.4.1 | 1 
                flannel-v0.5.5 | 1 
             fxload-2008_10_13 | 1 
                  gauche-0.9.4 | 1 
                  guile-2.0.13 | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
                  libffi-3.2.1 | 1 
                 libnss-3.27.1 | 1 
              mosquitto-1.4.10 | 1 
                   mpd-0.19.19 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
net-tools-3f170bff115303e92... | 1 
openblas-f04af36ad0e85b64f1... | 1 
               openldap-2.4.44 | 1 
       opentyrian-9c9f0ec3532b | 1 
                   perl-5.22.2 | 1 
python-libconfig-b271c3d9da... | 1 
          sane-backends-1.0.25 | 1 
                   sudo-1.8.15 | 1 
             tinymembench-v0.3 | 1 
                     vlc-2.2.4 | 1 
xdriver_xf86-video-openchro... | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3f23dbdcda388795cbd27ea001d130490725240a
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/ebf0059086889642c803c5441374edb35a539d11
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/ae66ab50844bba90475227a21a2e6ef16aef91bb
      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fe30986368b633d595c892dfba7d7c519d836700
   powerpc64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c13793ad8a74130da405d2e4001662922863bf9f
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/8c56bdb57b49cb57e348cc08054fe3a32f9e2e09
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/aa20994d4cbcf02f299033ed8da3c5a9b6cb9ca5
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/5eb9d43686d177b35e1a14cf9ed6548965cef6b3
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/97877f6c5dbbdb5822a274259d89fcd85e8f5370
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/390c7d82dbcca8c8e12e71ab549d4ed6d645716d
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/383aaf285cd140827b89c7815ad709708666ad9b
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/d5e237d0385755f1a1c3824c9fda3079f3668af9
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/2cafe9ecd5a10a554e3422c354f92c2a78c9ef99
         arm |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/0fc6751ec11ced4136ebcd8f213cfb0199b31948
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/9dac3ad949a9e7f6a0cbbcf6da060ac7e65f3f43
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/a4c3622ecf249def3628e0bf7501d58c517b734d
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e536c4294ce0ff361bc3983f0a2b30b2ad16fbd3
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/fb2f158322f03f9bf08e912344caf85d00f49f2d
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/1bf384c8bb382339fb39bbccb7919e8b5cc81c56
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/bf5f01233ea0673ed24edfb3db14229d7f932449
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/a9b0e43dd84fa5949c7787304ecec5f58939b98d
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/30f3394fb3c505bcf357c4d8925acf8abe3f59fc
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/8f779bf732454187e9f7268b50c46be0fafa063b
         arm |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/10c06847e8b1ed365c28043d890c6eced58da137
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/8d00f4096b658b1bf58884bbf9c8708ac450c787
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/dcd1aa519ba2b6b08ceeaae5f0e0d1306bf5888b
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/4b62990a8c8a701354a9448d1a3f1a89c930f759
         sh4 |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/f25c0ee67f6f8659482f6e029622386797a2f230
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/1fa555e729800aab2bfea596bd75d4618c81a583
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/b09bc155ee939d170790f9190a5d535080256c44
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/05e3cc9c8695fd70221725b061eacf6702d30729
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/950a9a032cc7402570d899d406c77ccf389a23d8
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/ea6bed4b3d5b34d9f5cb5fc11be6830d30bb64d8
     aarch64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/6c1a47d4bfeba14004a38f2dc77820ea4ef4b2bb
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8c031fa3cdaa05239b3f593d495d163d4d140ee6
     aarch64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/fef35331e87e1b396f93b0ebb480f7a4653e9478
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/f1780ae24e4c30f044ab5cdea6ad8f3054ea43da
        sh4a |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/32a88a60ed7cc4e22548271ea428f6f3f61a2679
      xtensa | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/39869fd9aadb3df750124d7fab66de8d81c77385

-- 
http://autobuild.buildroot.net
