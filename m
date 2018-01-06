From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Jan 2018 08:00:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-05
Message-ID: <20180106070039.EE62C207B4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-05
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 167 |  30 |   4 | 201 |
   2017.11.x |  18 |   3 |   0 |  21 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            nilfs-utils-v2.2.7 | 5 
                       unknown | 4 
             libostree-2017.15 | 3 
             libzip-legal-info | 3 
              host-erlang-20.0 | 2 
                 libdrm-2.4.89 | 2 
                 libpqxx-6.0.0 | 2 
                     pound-2.7 | 2 
                  boost-1.65.1 | 1 
                  ffmpeg-3.4.1 | 1 
                   gconf-3.2.6 | 1 
                    gdb-7.11.1 | 1 
                  gnupg-1.4.22 | 1 
                     gpsd-3.16 | 1 
                 host-icu-60.1 | 1 
                 ibrdtnd-1.0.1 | 1 
              lynx-2.8.9dev.16 | 1 
                 mplayer-1.3.0 | 1 
                  samba4-4.7.3 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/92c5ca2097d368b194bbdfc9c836a78d4e5d07ef |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/fd8861f9b287190e0872f534d89d42d7ec883540 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/3e6c37430127a6a7c4cd4d4181f0933eb8bd24ba |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/db97a8993aa0cc72953470b5ee5943da9dc753ae | ORPH
   powerpc64 |                   gnupg-1.4.22 | NOK | http://autobuild.buildroot.net/results/3d316e357f58343292ea096318a787c6ad216338 | ORPH
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/4ae5985960a4482a3aed8feaf6eae1ebe695cd14 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/ca0a4ac36289675ce8a01c23d14a380736a88f1a |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/ec2b994376070555c8d6a3ee6332f19becc9c7ff |     
      mipsel |                  host-icu-60.1 | NOK | http://autobuild.buildroot.net/results/75c4a3d9799399a7bc191cf31136ed88c462b66a | ORPH
        bfin |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/d8026dfd9949dc9c563ed4b9a385dbc2233f8626 | ORPH
        m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/a59e55652fd14e1539ab0d3e090c6cc56cc95734 |     
        m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/56d251625e5fa24e2821f396489455ce29605cfc |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/172ab61bd7995a61481232adf1605643983bcff7 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/4b9a3c4d1617d44b646a1d50c6fdfe523d4c728d |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/fcd7035fa9dd331ca8a036a76923133f3edd0660 |     
     powerpc |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/47eb6bff28f3ded40947a0ea42bd41292fdcac3c |     
         arm |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/fd5966d117057e4ae444671b2d3f418450611164 |     
      x86_64 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/84034d320620f1273d5f0824a413a344ed3a700a |     
         arm |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/5059522a7d24ed606ce835a42d66ed47d491fbb0 |     
     sparc64 |              libzip-legal-info | NOK | http://autobuild.buildroot.net/results/ddb1cbe691cc291e0258e079119f74ae16d5f874 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/9f1a9b2502055bab3c848a0c7af8e77bae2fe277 |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/251be00705182bfcc83d560c7ebaab5d6e42cd20 |     
        or1k |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/21aa7d135643533e45aad75c1d60049d72e5a1b1 |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/78f92aa87a597f22af0642a5209f9b2e35a170d3 |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/08de4e722a5bf4be0c7dc6bbb5a58589dfd93993 |     
        m68k |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/2067fc1ee2dbc5007aa974892893c5fda5615a64 |     
microblazeel |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/77bb91bf4e85cbdb397b6bd2f38ebf2ccbcaa3fb |     
         arc |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/52c6562aaee3e7adb9938d4661e3f91cc35af85d |     
        i586 |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/434d694326dfd581eb0b38cc84af8f3f19e2fb19 |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/ebdfc102db64f4d8a88310a3ffcaee104c479a74 | ORPH
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/338c1dd1d09ad1a9afcff23250447fdf4e6d5842 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/40f1882b9958de1f962358d7b981cb775d95d426 |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/4a7f7c07fd68c96e26880f8f08beff73ae2aa1ad |     
        mips |                        unknown | TIM | http://autobuild.buildroot.net/results/71197db2d13428d2d32d02efe528a3e9d75e498a |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

               libiscsi-1.18.0 | 1 
                 mesa3d-17.2.4 | 1 
               upmpdcli-1.2.15 | 1 


Detail of failures
------------------

         arm |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/b1a0f392345fa34d6187e1ee297c8c874a9a148c |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/7c3a31d8e76a0d0834249582a75c209d7b24a19a |     
         arc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/ee535430b90670c597e12c28caad2778c7efa345 |     


-- 
http://autobuild.buildroot.net
