From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Dec 2017 08:00:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-05
Message-ID: <20171206070004.EB1F420C03@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-05
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 196 |  15 |   0 | 211 |
   2017.08.x |  21 |   0 |   0 |  21 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     axel-2.16 | 4 
              host-erlang-20.0 | 3 
 netcat-openbsd-debian_1.178-3 | 2 
           host-doxygen-1.8.13 | 1 
                 mplayer-1.3.0 | 1 
                   pcre2-10.30 | 1 
                    php-7.1.12 | 1 
             qt5location-5.6.3 | 1 
                  quagga-1.1.1 | 1 


Detail of failures
------------------

         arm |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/c86522542b4b43790b88a2d7d365a8619fb3c58d | ORPH
      xtensa |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/5d32755e338222f451ae05f44656016ff43e22cf | ORPH
        m68k |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/26b2877a8098ed7add60198f75e092bee4fbb2e5 | ORPH
        m68k |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/07fe57c7af4756604d6468b631780997943307a4 | ORPH
         arc |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/b8e32e13f054c274acd898eb5d53c41f8faa0650 |     
        i586 |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/752f6fa0d11f261fb8aa13884f12c090ae6f3da6 |     
        i686 |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/51cbc21efd5af71979f415bb61be44d4f9d29e5a |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/c68ef7ef5b1ba3fc7247bbbc7aef34d97dcd9f27 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1eafdc8bcb881ac7b5bce0e89eb31a882f5c0396 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/d08cd5b5b55d92e647f2176f400e613b8244fcd1 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/59694b8df2e7ecd4ba2465cb417a244b5988ee6b |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/5fbf97f7afe41d70fb729f1579e6427160f0f50f | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/eaadca41e813b82c1707db927b82f0fe838a9e07 | ORPH
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/11ad1cc6704fa744da45be784e676b9d819ea25e |     
      x86_64 |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/75ac417796e36b5ee85c2d8d3bb74a26f4f51090 | ORPH


-- 
http://autobuild.buildroot.net
