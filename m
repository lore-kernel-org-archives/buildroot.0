From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Mar 2017 08:28:51 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-28
Message-ID: <20170301072851.7A31B207E5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-28
================================

      successes : 173
       failures : 15 
       timeouts : 0  
          TOTAL : 188

Classification of failures by reason
====================================

            lttng-libust-2.9.0 | 3 
                 mplayer-1.3.0 | 2 
                      qt-4.8.7 | 2 
             lttng-tools-2.9.3 | 1 
                   ncftp-3.2.6 | 1 
                 qt5base-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.5 | 1 
          shairport-sync-2.8.6 | 1 
                 sngrep-v1.4.2 | 1 
    xserver_xorg-server-1.19.1 | 1 


Detail of failures
===================

        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/336e18645d412cc50074991183f69d621de122c7
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/9c945d235a8ae748416a13f50e190bbb8c312242
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8bbcac9f9debf76cd1f56734bfd494677f2acd21
        i686 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/c07b5bac6146d83c3224de147da3798d3e7b527f
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/63b16a17ea335b7da22913ee0f1d4a0845e1024a
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a3f25b8200b53d919b1fdf32e3bd8ab3a14e3801
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/6eadad0e879ca70bb07b13b4196d42c64b11699f
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c862a44bd3a23be50bc8c8f5f0caa0ad68111804
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dac05138a07f2f3c7c25bbce5d45167b90ec1aa0
     sparc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/b5ae03ba2f6acc32ecd705d594a101b1ed599bc8
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a42ce9ea690313e836521caa2044dff9c26f6ddd
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/7eaa1307629bcc9af01c249c112b4c719a8af2fa
     powerpc |           shairport-sync-2.8.6 | NOK | http://autobuild.buildroot.net/results/698ee6feb238bcd1b215c4d66a14aad8ff7b7a12
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/e3c45a8cadb2bf8f93a142ec73bc05da1c2eb298
    mips64el |     xserver_xorg-server-1.19.1 | NOK | http://autobuild.buildroot.net/results/65fa12aac96cb1e944d12f608e477d273dd83cc7

-- 
http://autobuild.buildroot.net
