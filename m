From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 08:29:01 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-15
Message-ID: <20170216072901.56C6120BB8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-15
================================

      successes : 223
       failures : 36 
       timeouts : 0  
          TOTAL : 259

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 4 
                 glibmm-2.50.0 | 3 
                 qt5base-5.8.0 | 3 
                 civetweb-v1.5 | 2 
          linux-headers-4.9.10 | 2 
             lttng-tools-2.9.3 | 2 
               trousers-0.3.13 | 2 
                 wavpack-5.1.0 | 2 
             alljoyn-16.04.00a | 1 
                classpath-0.98 | 1 
                    efl-1.18.4 | 1 
                 enchant-1.6.0 | 1 
glmark2-7215c0f337dae0b2325... | 1 
                 jsoncpp-1.7.7 | 1 
                  libcec-4.0.2 | 1 
                 libnss-3.27.2 | 1 
            lttng-libust-2.9.0 | 1 
                 openssh-7.4p1 | 1 
           oracle-mysql-5.1.73 | 1 
                poppler-0.51.0 | 1 
              postgresql-9.6.1 | 1 
python-libconfig-b271c3d9da... | 1 
                  samba4-4.5.5 | 1 
                  tcping-1.3.5 | 1 


Detail of failures
===================

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/957c39b51f081a15d3407c0674db9bcee83167fc
        or1k |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/bac37274dc6d1671160e6bacf5ef298461d775e9
        or1k |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/f8b555347ccc18e5b150d96945757bfcc1b7c136
microblazeel |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/9958e1bb82287c5b88dfd80d94d85ccdcc8a72a5
         arm |                     efl-1.18.4 | NOK | http://autobuild.buildroot.net/results/581a2d2c8c847e2a533df174d2f5d202c5df761e
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/888d44b8d7e5a7aaf4a6c46d5bef810e5e8df341
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7535e2190d6c5bfa4b5b2469035f0192ff963cf2
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/8d94b9759d758a9fd70045464cf83ab7268b6386
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/61fd60917b6ac6ef8e5bb77330853acc74795d68
         arm | glmark2-7215c0f337dae0b2325... | NOK | http://autobuild.buildroot.net/results/da77b1fb09680b731fa958f0595fc8b8144ea512
        or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/7349fdf088231145f815bd3b5349147fa0cc6014
      x86_64 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/57b4cd93be039b04498286ecd5eec05b78f59a40
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/2ba4f7466d54409cb4950ec31e0bc414cd89a82b
     powerpc |           linux-headers-4.9.10 | NOK | http://autobuild.buildroot.net/results/164282d83fddd11b1acb0a322948f5151ce4eee8
         arm |           linux-headers-4.9.10 | NOK | http://autobuild.buildroot.net/results/8419bfcd5298d7f90723515981d25c2101d751d6
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/3fe5e8b0db18824d529561de91fc9c84792287ec
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/f6adba42a2d4db87ef0843041f0b92afdd4eed06
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/320592375a09f6cf384b5003eae333a520aa5782
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/7217da7fa6c8eaf289c6052431ba391a7872537b
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f2206b2833e0a0c047ab389f8782247e2a13f97d
         arm |                 poppler-0.51.0 | NOK | http://autobuild.buildroot.net/results/d9f277de538ea65deb942b5fdd67852cf6f9b4ed
        or1k |               postgresql-9.6.1 | NOK | http://autobuild.buildroot.net/results/e9de750e34f10c4a2403696936260ad1547d0d15
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/ab7a158e3ff2979db6f894de235e999332248f51
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/8ffab13952af408da51b764669fd7b4bbee2a036
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/84617078011b37a34d6b0f8b2cece619daf70356
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/cb77a48e6a021447626dbb953c9e5fa3c8a979fb
        or1k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/ec8f078046c92ae23dc973c88ac0fef136ad1535
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8ce6c53c4d4ec8e882d7037e9959e530b18a8864
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/9cfe6664cedd4a97d6b766bef462794ca3332a2e
     aarch64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/5f7e1d2e3d7d2b503d2a594e74c52c531ccbbafd
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/3078dc6585b9c7b0709152fe0d4b81ce5a01bc5b
      mipsel |                   tcping-1.3.5 | NOK | http://autobuild.buildroot.net/results/03caf8403c31e2424c338de4df636dd900408b14
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/e65d1d7c5a4dd4616167cfe2aa938be6af139602
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/dbaa09f5bb8c187d18801872c4101f3b28cd6b96
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/9a693f5b798571917f36cfb7661e2f2638aac550
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/44c8227043045baf4f043da44b8129e43dfff687

-- 
http://autobuild.buildroot.net
