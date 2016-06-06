From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Jun 2016 08:30:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-05
Message-ID: <20160606063021.DE2931025A7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-05
===============================

        success : 177
       failures : 53 
       timeouts : 0  
          TOTAL : 230

Classification of failures by reason
====================================

               target-finalize | 8 
                nodejs-0.10.45 | 5 
                flannel-v0.5.5 | 5 
     host-binutils-arc-2016.03 | 4 
                    libiio-0.6 | 3 
                 mplayer-1.3.0 | 2 
                wayland-1.11.0 | 2 
          binutils-arc-2016.03 | 2 
                     vlc-2.2.3 | 1 
                  qemu-2.5.1.1 | 1 
                  sstrip-20154 | 1 
              procps-ng-3.3.11 | 1 
               wireshark-2.0.3 | 1 
               libepoxy-v1.3.1 | 1 
             bluez_utils-4.101 | 1 
                fcgiwrap-1.1.0 | 1 
            ecryptfs-utils-109 | 1 
                 gnuplot-4.6.6 | 1 
                  connman-1.32 | 1 
             netbsd-queue-1.70 | 1 
                   erlang-18.3 | 1 
wiringpi-78b5c323b74de782df... | 1 
                 setools-3.3.8 | 1 
                 jack2-v1.9.10 | 1 
                mongrel2-1.9.2 | 1 
                    cups-2.1.2 | 1 
                 libv4l-1.10.0 | 1 
                   strace-4.11 | 1 
           quagga-1.0.20160315 | 1 
                    owfs-3.1p1 | 1 

Detail of failures
===================

         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/3fd779ba57ee89ebf0dc9d388711b26342c74181/
         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/5b9d0b02ba2408eab5f119742d3c4843cf1e114b/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/eb0884571928874330e7ad05d4421458b86b0ca0/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/7b55f7a574b8981f3ec015a26bcec16d642f44c5/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/aee3c33fd5d385467cacb570843255e0545f4e11/
         arm |             ecryptfs-utils-109 | NOK | http://autobuild.buildroot.net/results/f306bef21befd7bad59d158d8897dff4edcc1f3a/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/e35d5a287ada36878091f9126e87736c413fb135/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/9b5e70e42e53e7752245f7c43bd01f208fcf76d0/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/7a0d9ed019cf61942a6c4474c1edd1be840c21e4/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b86538e535904c7da724c108593d07be86acd51c/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/91c8eca0afef19804db9c4858dcc5b13695edea9/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1b673e02773a716d69a89e8de9d68b99aeeaabdd/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/22f6ab9c4b335b458b4dbb1b394b25fc8439a49b/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/7f8c22fb7474b2065cb6820ccf7d626e7cece57c/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/b3abb6a4c664e6e6a6bbf554917780a31429f9ce/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/2632ab5955978ecaa0fb07fd8bb46d87d5482a8a/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/9d076eda5cceda4c88d1842a3685b4ace087fb56/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/b5e75e9372aca6692f266d28382b82a71b9459b6/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b8c1bf8ec4a857b49ab34c540d760cfeed0ff93d/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/c97984f38f5a7df4e4f3cf391430e701e490400b/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/194b2f37cf67c3f867be667d8ce34d821ac10ea3/
      x86_64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/1d97c6d141ce0940642701bb0f4c31529d75a270/
       nios2 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/d15a0e7db1309ded3c32cd770c4b5e73085b697a/
         arm |                  libv4l-1.10.0 | NOK | http://autobuild.buildroot.net/results/8fc8cbc85dacebce5cb6ab13f5ff3b0764117471/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/d3106e05a3f2eda6874a22b01e78ffe84e6c9cf6/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ab4be1db404497a355c24d2074113194258cf930/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/db390265b8dd35ece1fd3c4d051dda02938d48ec/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/f63128b9962bc955252d1a51c8dfe6768fd03c3a/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/ce9ab3cef1b35339191d511556919507d1502883/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/5a8c5ccb4ef83ab96640199075a4d38916b29315/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/af1a3ea264c5733602e5eb66a78d38e9b82f1760/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/d74b42473337d174a287a39e74aa8107667c787b/
         arm |                 nodejs-0.10.45 | NOK | http://autobuild.buildroot.net/results/78e646ff297deebde8697815dc5381ed118a3646/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/8bbdfe50ff781aaf6af9fc0c7a5301ffd90a8066/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/dd0f57330a82ba73d802d97af268df6fa89c9bde/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/4a44144d03cf4d1c0413aa99af28c2e9a701c786/
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/045c16acc6ea04bc9538bfbe9f8051c468aa876c/
      x86_64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/8d4118a96d73809237b89ccc3088e9f208e023f7/
         arm |                   sstrip-20154 | NOK | http://autobuild.buildroot.net/results/e9f0aba6843900909a9ddf31bf0988ab2a2c1a96/
      x86_64 |                    strace-4.11 | NOK | http://autobuild.buildroot.net/results/eea59dee905d3a1992aa9373421b3d75de0ce853/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/0cf16f37c0d2f2b27e59dee7708b9c399f68ff42/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/bc6e6b104460fa325e10099aa279651d53daf620/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/9d5f7a8af6e0aa808eea7bee7d3d1fc80a4a2c25/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/cdcc1fa8691f752e2332ddfcbe72ee961f0a9c31/
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/0e5ee8c802a70d57081a5580caed36830211224d/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/136f91797a27544e301400b5a52cab6ad1ca96a9/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ccc8e38d187330699a85dc2c2b5a5e0a2d3aeec9/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/a1f77a4f0c351f35d86cf44318b1b364f9205d84/
microblazeel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/ec60a44a1956cdeaca6aac675546ab26a8e490a6/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/f63817cd3321cb26b70c771cff7199e09817c09f/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/4ba36690e6cce4e979529a06827c17e9d7a42dc6/
      xtensa |                wireshark-2.0.3 | NOK | http://autobuild.buildroot.net/results/75746f0100436f235a1c0214b8ef4567e0fcda7e/
         arm | wiringpi-78b5c323b74de782df... | NOK | http://autobuild.buildroot.net/results/280ded0def8ccd291ec2ebec34c6197ea4409e99/


-- 
http://autobuild.buildroot.net
