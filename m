From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Jan 2018 08:00:37 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-23
Message-ID: <20180124070037.1BEBB20E1C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-23
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 239 |  39 |   4 | 282 |
   2017.11.x |  28 |   2 |   0 |  30 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 6 
             bluez5_utils-5.48 | 5 
         libcpprestsdk-v2.10.1 | 3 
           cups-filters-1.17.9 | 2 
               host-efl-1.20.6 | 2 
                   jamvm-2.0.0 | 2 
        ltp-testsuite-20180118 | 2 
                 mesa3d-17.3.3 | 2 
                 mplayer-1.3.0 | 2 
                      qt-4.8.7 | 2 
                   systemd-236 | 2 
                       unknown | 2 
                  cc-tool-0.26 | 1 
                   gconf-3.2.6 | 1 
      gst1-plugins-base-1.12.4 | 1 
               host-gawk-4.1.4 | 1 
           libvncserver-0.9.11 | 1 
make[4]: *** [.obj/platform... | 1 
            nilfs-utils-v2.2.7 | 1 
                   qjson-0.9.0 | 1 
                  samba4-4.7.4 | 1 
                    sdl2-2.0.7 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

 powerpc64le |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/60cb20d47eba874906593ab422efdd9b6efa59e9 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f45a3d8cd50dd6836660aab729c9292f4c13700a |     
         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/903f360daafd563c56d3df8521f2d1cd99972e6c |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/9fa33f660aa7e8e15759e3fb6a256bef56c859cb |     
         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/45bd0045e593400d3c08781f65299ebd30ee288a |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5654e1b30b94545dadf77ec5d3a70bb1a8d44b2d |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/e319e2fe958df0999b2c2c9b0f5080ceab10d685 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/0a810157985116de9ef40780faadfa94b46be18a |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f7b5bd2ac82c9b6b2a89cb33ef9dae6569f02399 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/73b25af073de852c4da4696029819317eb8e964a |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7dd652158ef9df85e50f3d521d9bc43fe59db839 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8337fe097cda7346f31e791945d2c0c8e808d0f7 |     
       nios2 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/173352426a27e46aa8f1b35e173263b5695ee96e |     
       sparc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/ad36fa91bfd2b7a35b7085d8af5bd40d79074f52 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/ad881628c6b81018b12aeebd07f15cb27c470d09 |     
      x86_64 |       gst1-plugins-base-1.12.4 | NOK | http://autobuild.buildroot.net/results/14f41e9a6cf63e157852e7612a7259b12b0e71ca |     
        i586 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/2ac438216084e923736fc8cc18c8e91e12bf9f58 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/423da7650cddaf1846ac8d09f0a64ef4f38f3758 |     
         arm |                host-gawk-4.1.4 | TIM | http://autobuild.buildroot.net/results/9771bc4da5cad49e8a882bd9b232351928799730 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/8f280288806fe32dadd77b4a24e5b96715487803 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/cee51bb7c6246af02ef5b3a1bb504d0e8bcbf0ec | ORPH
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/bb571a3b6ef59b7121a0389688373c31ac7fd57d |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/f11d46ebc6576b1530ca1cfdfe4107c350af1776 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/cc61b12b266f61c55ffdea167d0329af70b7d79d |     
        m68k |            libvncserver-0.9.11 | NOK | http://autobuild.buildroot.net/results/409cb7abc80154a917029fe08f555ef33ee78a39 | ORPH
     powerpc |         ltp-testsuite-20180118 | NOK | http://autobuild.buildroot.net/results/e7b1d8381596bc48d219bee11043dec519378f8f |     
        mips |         ltp-testsuite-20180118 | NOK | http://autobuild.buildroot.net/results/3697a52b87c3f8dec702192f1c7a67b20eb247fc |     
     aarch64 | make[4]: *** [.obj/platform... | TIM | http://autobuild.buildroot.net/results/5ef4de5b9ec0a87f31f23f60bb62c77eba9b5ffc |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/5a918598f2e3d336ab4218eba62db839bb7a3fa2 |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/3bbf22cdc3165349c374768ed9fb204a999aac9e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ef74ff80a7982b0819713591683a5f4ec9a3f6c8 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a8541f616b08fb9fcb219d603588757edc39b94c |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/2f83b51278658f7b146acea2567684d90304740a |     
         arm |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/3c537e1260dc9ce57657ca0d49e318a10aee111e |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f1875d73e5bcb2ec7a894c50ea098b1f37dd21fb | ORPH
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c242e79ba61913a44bfb3e3af23ccadabfe61c63 | ORPH
    mips64el |                   samba4-4.7.4 | NOK | http://autobuild.buildroot.net/results/a7a5112effa085851ff653988e3a02376fcd00b7 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/d723e71c841c2a2752fe26124fb4ef4fee40359c |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/dc597ecc7dd87fce0530a5c14298427194c8e5fb |     
     powerpc |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/57cbb12b30ae2d5eccc7170a068ba881c79c31b4 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/cc7c8f38c65b453ea304c30e29e3c77155f1f447 |     
        or1k |                        unknown | TIM | http://autobuild.buildroot.net/results/19c60d76dd02fed1eac15127802a300d04509a54 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/195dc9ad4b21f6e7675bed277209ba2480337d54 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.5 | 1 
  refpolicy-RELEASE_2_20170204 | 1 


Detail of failures
------------------

         arm |                host-efl-1.20.5 | NOK | http://autobuild.buildroot.net/results/07234cc83f03158ca9a4bd7159e5ce3d9dd01429 |     
         arm |   refpolicy-RELEASE_2_20170204 | NOK | http://autobuild.buildroot.net/results/c808052617a58296693ca01e765d1c5881ff5996 |     


-- 
http://autobuild.buildroot.net
