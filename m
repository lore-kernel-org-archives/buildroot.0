From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 06:00:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-23
Message-ID: <20190524060054.102F386CB8@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  15 |   1 |   0 |  16 |
      master | 217 |  13 |   1 | 231 |
        next |  42 |  15 |   0 |  57 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 5 
             iputils-s20190515 | 4 
                cracklib-2.9.7 | 2 
   host-xapp_mkfontscale-1.1.3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                openzwave-v1.6 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/67a3fc211005126904af15f945a9f8d351ccf6e8 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/67f39cd0f021bca30bf8521fa8a6b14bcf3a016c |     
        i686 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e95e35b7f1d2a5a86bcfacd758cbd8f996058ec5 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/9c0067dacd5693478872386879b53996a71fd860 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d33c6fbd4f0084c1073754afaef0ec423c807a30 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b61b5cf7fd10b00311da5fc57b9f8bb252357d1c | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/84c5672f93a882bb9192a1874d7256122f649366 | ORPH
         arm |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/a64ae47702ebb66cca5fb898f7dc28bbf6ecb4fc |     
         arc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/f33e986cbfa24a8aabbd383eca6c19f450332f07 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a0cea5d1babf12d76fdb8af81702af9b1c10f3e7 |     
    mips64el |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a961fa2cdbd3f2c113172bf0a52540d834620935 |     
     riscv64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/68c1a0cab207430f7044dcf20ef9720f53e20040 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7ef72b93b6c54d42c52dfe59127156f2fbe6d926 |     
     aarch64 |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/cbe0671831d874a5b96a944b891fe1eea823667b |     
         arc |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/fe5e5df83c1524d4d3230a81d2f6a2f2cbaee80c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                  brotli-1.0.7 | 1 
                        glibmm | 1 
                  grpc-v1.18.0 | 1 
           host-mfgtools-v0.02 | 1 
                  linuxptp-2.0 | 1 
                   mimic-1.1.0 | 1 
                 minizip-2.8.2 | 1 
           python-numpy-1.16.3 | 1 
              qt5wayland-5.6.3 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/d86251974a0a348a64d9a1d1fd7d02dd4aff0792 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/65c38e757bf4f3a529872f227a53b3ea4f8becef |     
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/aec4d5e22dc059ca434efee68630decbf92322d5 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/b8d4c95333296ea91e37c2c58be6db7f1ef02239 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0345571f253a1e3cef8f8f37b6bb751a4806879e |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/d3b5ef71adeb8a8373cb9fca05be3958ca41247f |     
       sparc |                  minizip-2.8.2 | NOK | http://autobuild.buildroot.net/results/2f11b237a3577df55bc1ee139ed4d51f3ee4e08d |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a646fd73ce04c9e53bd4e091b0d7d595536d72bb |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f09199697928854927390b129702daf97afdbb0b |     
         arm |            python-numpy-1.16.3 | NOK | http://autobuild.buildroot.net/results/3005bc7481d7138a59f4f4c20a28d9cb42abc632 |     
    mips64el |               qt5wayland-5.6.3 | NOK | http://autobuild.buildroot.net/results/d7f1ab1c59c7c222d677a5fdf0892e6822569a5f |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/9ea425ea4227361c07d21e841efdecddddfd9812 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/a312460d8872f96e99393e838058d4d21c8b4f78 |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/1dde512b2bb06bff021650ee40f869fcce473ab8 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b9ec4c36b800d6e7fcf685f423cca4ae0094a7c2 |     


-- 
http://autobuild.buildroot.net
