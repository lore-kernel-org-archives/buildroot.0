From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 08:00:44 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-30
Message-ID: <20171201070044.4CCF22037A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  14 |   0 |   0 |  14 |
      master | 154 |   8 |   1 | 163 |
        next |  47 |   9 |   1 |  57 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 2 
             qt5location-5.6.3 | 2 
               asterisk-14.5.0 | 1 
                  boost-1.65.1 | 1 
              host-erlang-19.3 | 1 
               libxmlpp-2.40.1 | 1 
                 mesa3d-17.2.4 | 1 


Detail of failures
------------------

         arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/7c92fb71d0aee211c8e0ef9d646da477fd97fb4c |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/d60d477c8e62af62157f831c91e8bb7335a8b958 |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/908d5466d968ceea589e91c6f58aed2211a64249 |     
microblazeel |                libxmlpp-2.40.1 | TIM | http://autobuild.buildroot.net/results/a18234d8d606bb2cb9e79460a62854ff08134ec2 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/861dc0b68f433bd98a83a3c5ff7b69d60d61957d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b0c0f2bc514c0fe549c74bb332219feb0e854859 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8b3a7d99127845b6f1eae96ba7a17d6ed1869a6b | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/1fa3dcd3a05e9cc6cc05ece9f2a5e2303325d874 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/55fafc6638bd12bed97cebc578937dc4b6af0f6d |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     avahi-0.7 | 4 
                     axel-2.16 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
                       jose-10 | 1 
             libostree-2017.12 | 1 
        python-pathtools-0.1.2 | 1 
                       unknown | 1 


Detail of failures
------------------

     aarch64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/a1e0d1f969a1192264f23ae2fff5c0437cdcfd41 | ORPH
     powerpc |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/d7172530503011269f9db11bb9aec3e4fd4a5cb5 | ORPH
     aarch64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/5cfd48e598eaef21946217aa5c808a349b97645c | ORPH
         arm |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/59ed3a4013eb3cc9b6974e9d484bac4733f7fa8f | ORPH
        i686 |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/9e767ebdf494bb85b9abe0c4e329a81ece7b072a | ORPH
      xtensa | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/387144bf87cfd80fbb2615f33e9ae85b0ffa96f0 |     
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/58020c2e127ad0a0255e7d373d05b0a824ed63db |     
    mips64el |              libostree-2017.12 | NOK | http://autobuild.buildroot.net/results/8c919f951e1ab48e2042fca77abc5117e0576e69 |     
microblazeel |         python-pathtools-0.1.2 | TIM | http://autobuild.buildroot.net/results/9f1de83c904f68dc2fb70d521d5269b286d28d5a |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/615791d7fa3a266320726a4078fd1833630a97c3 |     


-- 
http://autobuild.buildroot.net
