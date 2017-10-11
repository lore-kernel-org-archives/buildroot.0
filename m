From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-10
Message-ID: <20171011063059.C64F22084F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-10
================================

      successes : 177
       failures : 103
       timeouts : 0  
          TOTAL : 280

Classification of failures by reason
====================================

                  dbus-1.10.24 | 30
                    flex-2.6.4 | 7 
            host-lvm2-2.02.173 | 6 
                 msgpack-2.1.5 | 6 
         xkeyboard-config-2.22 | 6 
                 mesa3d-17.2.2 | 4 
                     nmap-7.60 | 4 
                   perl-5.26.1 | 4 
           argp-standalone-1.3 | 3 
      host-uboot-tools-2017.07 | 3 
pdbg-77158819158d1d7053a737... | 3 
        wireguard-0.0.20171005 | 3 
                   jamvm-2.0.0 | 2 
                openjpeg-2.2.0 | 2 
                openobex-1.7.2 | 2 
                   pcre2-10.30 | 2 
         python-gobject-2.28.6 | 2 
             qt5location-5.9.1 | 2 
                  boost-1.64.0 | 1 
             dbus-python-1.2.4 | 1 
                   evemu-2.7.0 | 1 
                      icu-59.1 | 1 
                       jose-10 | 1 
                   mp4v2-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                   qjson-0.9.0 | 1 
                  qt5svg-5.9.1 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/4f0e6251ec06e46fcb916e1a53cbe7f5bb620119 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/116b5e623a8815fc0e52e5e25751a452b60a9e1a |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/75e7c272d66724acd775705b9a578d886894442d |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/1c979097e4badb6c536218f01523d500faca21e7 |     
       sparc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9cfeacf9cebd2c8d6d03e6933f1332c638d4adb7 | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/1222d922d3348246658d876533cad822f77294b8 | ORPH
        mips |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0f8b4d282919b43e9dc1fa3094c6214dcb1b9d48 | ORPH
microblazeel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/def6a3671f34a375ae919a19c438914dc666762a | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/8d9857be308897ce6b583944c81704c654563cd2 | ORPH
         sh4 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ad254f074b1a3cd5d9644fba401d0996dc6e0e89 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/552f9e264080bf1257226a23a52c3761b881b897 | ORPH
       sparc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/86280fbc8528ccefa1b4d8a56d17f1cf5c675072 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/9498b538806eb05488f8561eafacb343ad18726c | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a58b153ac601d0ad56b892652fb697918c5009d2 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/363e320e721c7c378375f92647afe7b6884807e8 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/73dfab33b740c3f347d5973ff33213af255cca17 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/7b8bb09e6a1403c2d7e38842771ff886f25b4103 | ORPH
        or1k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bc9c18c04fdf729579515bfa16cadc144395f7a4 | ORPH
   powerpc64 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/c74a173962d71ef19859829f631a2e3f8f5da65d | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/f7093ac61c222eea9aa3ab923756d02ef045e686 | ORPH
         arc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bfc68cbe7b171db6c2b296a1747fc7d4559a8752 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/3cc13aaef129218c9c94817b720b2540a8d87c21 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b6750cdb8c64132a062999aebb962a25a856b6b3 | ORPH
         sh4 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/adceeaacdb279dc9b269f9d90de28fe4f0f6cc60 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/15162f14bc1a5e2867b984a41c3c8e8c956a6798 | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/717d6e6770a489723489043fee8b92d6d3ac0582 | ORPH
        or1k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/d204935006a0cde27310e21677cc9fd4c34c9966 | ORPH
      mipsel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0806ce594610a4e9d9ca148876d86dcc9c0c02f0 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/aa80912874d23ef064a35fba1472426682b3a650 | ORPH
      mipsel |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/a4c8f725a0f7a6f4378585d26db0f41d3af47834 | ORPH
        mips |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/5cca0cfd693920570d1fd6a2dbed5d3209872168 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/2fbbd0f537a3fd0b4648a69d8eebf19bca2aaac0 | ORPH
       nios2 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/5559fb1f3fafc8aae6de7d401add74e91bab25c1 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/f773ab03120e1e34af272c58249986e9910cb6a6 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/35bf8cc94cc4cf1d89db056bd0f81ca7447b73f8 | ORPH
         arm |                    evemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ff4f9a61135d1683ff8129b0b6d10662e595c3a9 |     
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/b5cc6875f5520709e4f83719263b78cb7115c4e9 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/c9e2fe0e42c4cf177d0e93ec2623f521949422b6 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/c93a5677e341006934c314e22a7611fcd2bb3408 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3f8589b7c9762e1cbd796c04fa721ae82465710d | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/72326330fd8a689088fe9ae9f24ad925540587ec | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/c3242c102cfcab9a7d4c81246ea2286b73f4450e | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/54ca8f8088c152f5f2820345fac5ab5171c32ba3 | ORPH
         arm |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/43071433814a3176256687720c1d665f41748484 | ORPH
      x86_64 |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/6cde658da1fa815c157acf36b39c10a8d885e9a9 | ORPH
         arm |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/4e6d03e6546ecacfb1b887340d06570757b83a2a | ORPH
     sparc64 |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/9583f55f1043373cafef30b83df753d6d4ce398e | ORPH
        mips |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/cedd7ff4b287d7b71612134444964dc847cc6062 | ORPH
         arm |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/e31a72f40f643b6ecd0c3160e25f788ca4919c38 | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/63c8181c518627f47bfe6943371ad33b837ffc8b | ORPH
       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/fe180bf9336e615e060cb66548aca5cbcd030f85 | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/54c56e36d5e2164827cf5cd16d4c619349826c8c | ORPH
        bfin |                       icu-59.1 | NOK | http://autobuild.buildroot.net/results/c0d2a226629b26d37fcb3b0fbb800f07b93fce3b | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/357537272b9956dc626b24329c4ac36475c9c159 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/0dde5327e270ea63940d01af5e54e90a9e4ad47f | ORPH
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/6121984549a407ae14d5fc8bceeea81958bf7872 |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/c1cfb4307fc3726e278838ca562f5471667b1f71 |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/182b37cd3e43ab8af19ece235556663a032e20df |     
       nios2 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/20dadb0c89ff63466b3b7b33e57a29773ae35865 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/d07d858a03efd14189f3de5a3529d38abbc48d2d |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/7fd53bea01a172f5d4fd522d3ed33e027a6c2942 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e271b275ad60b5f59eadf3ac5f5e8be7fc5b2a7c |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/d55403d3b74ef654360686f472cafa8a543d66e6 |     
        or1k |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/f59ba859e21017baab0b02b32d818633fde39988 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/8a5436202040164eb7cfb2ad7f5feae0f0d03844 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/ae1e53278ef107dd4aafd2a13251ab438f2a5073 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/c5c8ae36056cf6b66e0eebfbd317e60f437b355f |     
        i686 |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/ea539bd9c5c1cde6f7b74d88505a26a74b4af32c |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/37001e88f829c1c4836b3a3303fa0474553746f8 |     
        m68k |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/6c4a966e7a7022a59a39ae27910757f9c5ad370a |     
        i586 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f805c0c529093849636e3293a4fe9852eea30517 |     
         arc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f9d66a67eca9305c8ae461b0dcc22457b5123b55 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a13c85ebfb00622902e54fdd18a312a09f439165 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1eb365db8618582f34c92ddb283f10b2bed19e7f |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/e2d8ab9ae45b72db99c49827fce92a22995b0578 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/e78c172fe444ec827220b6af165db6b6582e21d6 |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d60f6e623e1b5035e922c609873353012fc62c49 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/34c2dadca2a428b8ea7d988fddd5e4464ba70e47 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/1d8cffc9658b575adaebd543c8e63990f17cb9d4 | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/b60730ff27be3968f95a76bb160dab94d160a118 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/70b56e423906ce7b5f649d4b5ed7cdc76700fdda |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/ce0c9b6a3791fdc2f3c491e70724bb4268b48af1 |     
      x86_64 |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/ae8c0ebcec5b7c8d785093580cd043da8e0d8dfb |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/6de9f731fd4c286d54c1a994f21bb9a7827caa77 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/d02d2a75da437f327517d2bcd1f941ebce9d8bd4 |     
      x86_64 |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/676d5b4b13aa71899d186ce414d73ff75871fc58 |     
       nios2 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/bda0389a73ae0705fcf45418ca7a95faa4b49d53 |     
         arm |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/02d16f21908ca5c5ad3544e387c445bd1bd7ff6f |     
     powerpc |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/41f754b354a0fa41f5068cf375b0f6abe2506adb |     
     aarch64 |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/0eeaed81d55639c2a27bf70efeab18eb12a431f4 |     
         arm |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/40d36f8329da20603736b899236ae39d5cd837b4 |     
     aarch64 |                   qt5svg-5.9.1 | NOK | http://autobuild.buildroot.net/results/669880451fcbc126da1b6c2ecf37c640e5785227 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/4f1dbe66b46d5efb5645e84c55d25c0f93f9b282 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/e0d5d635a7143aa4f84c2ce232baf305521c5e71 |     
        mips |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/7132feb6de1b59739c515e312b2e4f499cd8ed2a | ORPH
        m68k |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/cc967f953ebfa4ef4123a2db3dfb18436ca62e54 | ORPH
        or1k |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/469ca8cf6882097448a4d23d6dd1d0f9a4840ff4 | ORPH
      xtensa |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/f0e2a965f6e428317aa5c778ca5b008d8fc41247 |     
     sparc64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/dc2ec4f4958d30a8523952a8ddffbbbbf9ff7a9d |     
      x86_64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/41936e56f598404849c6b77f481412ade55c866b |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/4edca5a8f701eaf79ceb82e0935faae9a114f007 |     
      x86_64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/685c07ca6afbf5fcebcd1064d7dead22d3a16293 |     
      xtensa |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/5b6ea2cbff3ddd8ba795f244b1e8394d95887d18 |     

-- 
http://autobuild.buildroot.net
