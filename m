From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Jun 2020 06:27:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-11
Message-ID: <20200612062723.6D70888341@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  5  |  0  | 19  |
  2020.05.x  | 20  |  5  |  0  | 25  |
    master   | 112 | 80  |  0  | 192 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               linux-pam-1.4.0 | 35
                       unknown | 6 
                  ndisc6-1.0.4 | 4 
                qt5base-5.15.0 | 4 
                  assimp-5.0.1 | 3 
              host-grpc-1.25.0 | 3 
              ibm-sw-tpm2-1563 | 2 
                   mimic-1.1.0 | 2 
          python-web2py-2.20.4 | 2 
               apparmor-2.13.4 | 1 
                     avahi-0.8 | 1 
               domoticz-2020.1 | 1 
             freeswitch-1.10.3 | 1 
                 gnutls-3.6.13 | 1 
             kismet-2016-07-R1 | 1 
          libhttpserver-0.18.0 | 1 
                   libnss-3.52 | 1 
make: *** wait: No child pr... | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
              openjdk-14.0.1+7 | 1 
               pulseview-0.4.1 | 1 
                     qwt-6.1.4 | 1 
                 samba4-4.11.9 | 1 
                      tio-1.32 | 1 
                    vlc-3.0.10 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/c3ef7ad664b9f6fbf43f4df0d449ec327f119eb5 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/1710dbbdf820b928d5b0fa4dbc5d87a88c072b47 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9f91068c48d540fcbdf5d274f6443e55397651c2 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a3b543d61ccf98d8133e6262b88d19a69eed0660 |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4c499a5bb78cf2d1ae915d59b2323d6661d83330 | ORPH
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/1e896c38928971c094b677ee06ed19a3c0dbbdf3 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/b58e4315e97019181fc099befacda00343df1868 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d13109d74f33cc9bb58afc1848d54b1b3b0f4382 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/563269214ef66b410732d493e9a633916acedac6 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/b132ffd49ad42095192c58f7195f4ce5bd051319 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/480301890a0237802a03a3550272a69d835ed6c3 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e47a66c7f41f951343098eff9d0729e258dd8250 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fee0eeb52e354bdc4515b40b76854729393d50f5 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c0d31111d3a63b92919d3d4d7d3db7f6b4a45fe8 | ORPH
    arm      |      libhttpserver-0.18.0      | NOK | http://autobuild.buildroot.net/results/821ee5e524b228860df266393a674e55aee9421f |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/53f9908b5129a031dca0ab855bff54c1f83a7861 |     
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ba4ff0cae5b3190bc1a3f76d703ae1ac78857086 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b01e84c790bbc3c2d2e2c7a09b06555a1610d8d6 | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/228a25d63189c60d16f24cb6a641638986583bf2 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a6314c0994b5f9ce87ca5a85198c90b00b87be76 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/6ca8b00f861424f37190da999547b35996642904 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0f63310c4ca84174f893d8695d9acab529ec3dd8 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/67c72857a9ec0e7636159c4a66898380bd68aa10 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/93b78c27f3ba4c16067e006c270151bd91da1676 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/556bd9609aeab9e3dfe9c92b8e95a69a7300b0b6 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/01b667de89f262a913f6dd2a0deb37ed0daa755b | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0432736ffee376dd84757469434a4bbcfdcdaf4b | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e9e2c151e638b03d45604e85d52ec8c57634f6ba | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/283ae8682c00b455cb328bb307f190715ac7f268 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2183011b5e0270cf4406bfb1868d44b763cad3e5 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/42e83582976e7be403e5fa3852fbac9948ea8d99 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/fddb4efc45c3915e9599cc7755d0571607305ac3 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2f299472ec11dc80fcafbb2ce80d4da3d8c2e770 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a16cf179f263cbd9eee82ed889720736da7db16f | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9df01f9e09819b681482727b3615355d399e7e95 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/fdc21cf0edb27b9cf181b1d131b873c0ba4d8ae9 | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b2f7655eb185d0fb16ea61d400bd20a92668ec68 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d17c3211cc5a33629c521e91b38bc41bd9741f6f | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b2165ec4d14d1ed89cb3e4758ed456cc596df544 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/44080ab5670dac1f5e98315033cc49f63873ef30 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/fcf58c0f651a82b32ae5a44fdac81c978d71e93e | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f7e8793be5a19ab9cecb3dc43e6e71a8d33b99af | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/562471849f1492737aad2d2031dada694ddc304a | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/dcccad6ed4b3a1f8029447668e4f85d53527e0b8 | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/dce8022183ebb8f4dcedf576ae1c6bb679ed6555 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/cdf70d2521e6a6c051f752528b9bf3845453a2bf | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d727efdc70e7a496dec23fe52a4884696be34308 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/07f59716f4221c11df2309fa2aff1bf6e1afe1d6 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/240171db22d64d91ccf5a410a93c7bea154478d5 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/cc5d5b3dc54017695d2807d90b5b481f08723ff6 | ORPH
    i586     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9872639c34435e9c3eb43e8b97fbfcc77f217dde | ORPH
  riscv64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/677000b874db997c8ee35abdd8935b0abb3d691a |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6c93222545649939d547b14dfe1fe2f2beaf0c4b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/658904224c7ef45c48080890461ba9694b9858d7 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/e12b69c01c4e59e649e66fb6e73d8332a957456f |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1cf6384087eaec5c3bc0acae21ecc57382b09f2d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/beb7381cd75d6b413afbfa0556f8c52a0d4095f6 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f3a766cbf06ce715c0b0f4735970504d7934451a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f415db771a0289c99375c2138c38537da8f125bd | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/de5b339c23ab32b0ecbdad8e73aa1ef667374771 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/c754bbae80576e3ebef09d810416b4f55828eb48 |     
  aarch64    |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/f943884fa44aa2ee64299cabafb8576b8ee22b45 |     
   mipsel    |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/d94d3122ed542978ecbc8dabf5ea9de76f6649b7 |     
    arm      |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/9d627152920973effeb48ad03c27a1c69fa83931 |     
  aarch64    |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/09d5a482319499d4fd9938facd282a5fd6fbcdff |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a2c8608a681e00f1d1c9653384fae4466d8f2f84 |     
    mips     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/72fae2cd692557de141c4a8680e9971fb910a217 |     
  riscv64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0e75cf99cb0791fc3d4d6152c9d4ff469a6c646a |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bf199c2daae794df608df20032a8b352f1f0212f |     
   xtensa    |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/2b5f30b7a7f3b35921567b5cfd261a72ba98eecb | ORPH
  mips64el   |         samba4-4.11.9          | NOK | http://autobuild.buildroot.net/results/97a4c3057402e6d3731ad243c510f97891df9e07 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2815a3483f32e7d2992293f3cb658d0499c7556d |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/a7391675ea598e81d3052e36b547e0bb80c7b4d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d56aab9770ce52b8444395d7607975480bb3d55d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/b99bd1b7522c49c2daec3b5789eee2c28d8b5bc5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6fce17a871bb7888a94e42ade8952fa2f6464ecc |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1fa754fecd7cee5e175e45f2b5920300212ee8fa |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/f37fb1569dc77fa80ea866e222dfcd8fc7be636b |     
    arm      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/e2b670ab75e980ab27955c3759854faa9985731b |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/c384f726bfd69e75cf8579c22ee9db9c68f74f37 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 dmalloc-5.5.2 | 1 
                 gnutls-3.6.13 | 1 
          host-acpica-20191018 | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/1b4b36336abefed78d65fa7894a376b3a96969d8 | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/6ec5c1c0753eeae0457f90d100f5ea749487641a |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/54e6bbeda233ec27127be6994ab10cdb2abd9bdb |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/21f11ab6c42c0636593df1bcfe002270fe36fe8e |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cd5236b9095631c36b1b97a54931fa1c4f4f9bb9 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               apcupsd-3.14.14 | 1 
                  assimp-5.0.1 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/87fe126a33df38a5affb726bca49ec563da326a2 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/63c711d1c3ebffaca4405c168b54424a277b5770 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3213ebe3cf9d0fc7189204118cdaac757aa078c7 |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/1f3524fbf09d3fce79ecb16653981e1b2a43de76 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/0b394d954df27eabe24651b9f9f090d3aa9f158c |     



-- 
http://autobuild.buildroot.net
