From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Dec 2016 08:29:58 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-08
Message-ID: <20161209072958.AC1EC20BF5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-08
================================

      successes : 226
       failures : 56 
       timeouts : 0  
          TOTAL : 282

Classification of failures by reason
====================================

                   ezxml-0.8.6 | 5 
                 pixman-0.34.0 | 5 
uclibc-ng-test-4ad1c23ae2eb... | 5 
             berkeleydb-5.3.28 | 4 
             freeswitch-1.6.13 | 4 
                    rpm-4.13.0 | 4 
                    cups-2.1.4 | 2 
                 mplayer-1.3.0 | 2 
               qt5webkit-5.6.2 | 2 
                  squid-3.5.22 | 2 
                    dhcp-4.3.5 | 1 
         docker-engine-v1.12.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
             fxload-2008_10_13 | 1 
                  guile-2.0.13 | 1 
                 jack2-v1.9.10 | 1 
libasplib-f7219142e790a329b... | 1 
             libsidplay2-2.1.1 | 1 
                   lite-0.8.10 | 1 
            lttng-libust-2.9.0 | 1 
                     lua-5.3.3 | 1 
net-tools-3f170bff115303e92... | 1 
                 openssh-7.3p1 | 1 
                   perl-5.22.2 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 qt5base-5.6.2 | 1 
                 synergy-1.3.1 | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
                  xl2tp-v1.3.6 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/dfd02f522f2b2aeb21163380fe8e1b450ba1fac2
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/855d010bda18f2b520db5e0a5decb21bc1e6cff8
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/44a09ae39fb5fd23ad8707c53ea28f8e50e864bd
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ef6266bbf3707ebca8c7d40814d68c2cc9ae65fa
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/8abf1aa28451889406d4c379a4dd901c1b736aba
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0457435c81d58b47b4d041371c1c1e748f6bf503
      mipsel |                     dhcp-4.3.5 | NOK | http://autobuild.buildroot.net/results/646dbb4b9cb2b7913018677e04c0b1edb69c7a20
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/651b39bbbfb548fd7cda78edb719793825e6c232
        bfin |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/2f15b81beadd2d902c73d6d8bd7fb06b03f62ef5
         arm |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/8e10052a0d0ad4f47622925349ec5fddb7b672f0
        bfin |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/94caff510ed920d401bda98699b0ebd192680a81
        bfin |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/97cbccfcb32b32450823131c5ef8cb776e116bea
        m68k |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/2cadae7818aea32fd05a52ca5f8168b5b11de2bb
     aarch64 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/2189e2897ac850c552ee8f365ce7fd27d29b70fa
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/d47e2abfd50c3919d52d09a0b135e0e806ca2f81
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/eef1a36e04be308e7a1af2885c4c9f7c8fab10a0
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/e06802aaa40ad344b0697113cb4b2ee4b4ed6921
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/09ebfda7e14da9b34efdade411e3a7f913c9abb9
         arc |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/faa1dcd0bc6d885c7fd044da3626797b0bf3b133
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/d760aa3f2052ebfb5fcb2e6bcbff6c56f410df9f
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/846b9a45439dd6fa806d42e855fa37e76c0f647b
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/fcde1ac374c44a1795399b437953312aec56195a
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/dbc274e05f2a1a2d0ecf017371f80dd4c10ef8f1
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/26858bcf8d88052689c113d86a37ff14ddf9176e
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/68e461808ef938052693fd87a1315e889290e8f7
      xtensa |                      lua-5.3.3 | NOK | http://autobuild.buildroot.net/results/56636ab66a68045c43419feb7d5f356a799b0bda
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a342be6f28b384173a215967a88a19369193ac33
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0fab40c42d52d9705c33a48fe0f9236b4a887359
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/24e54f23f59b8a6553372084d881ed5ba6e8bcbb
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/3367baa3941f2a0073799d780a2b3f4e1df84cd7
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/8c1c699f457648483a4fc01c630099f8baf17ff1
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/95e227dda233b67d154966df61fa902ce205a4a2
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/063b1ca2da4b7faf069fdd582203f1db405039be
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/ba422f3e27bef70799428adca63d41567a515898
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/6cd2ec5de8ecdda3f3db454f1870eb15027afe99
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/c700c43a8ebb138b1f26d4dc0c578272906d648f
     aarch64 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/568305748acbcfb9433fb0f357c70ebfa2f0ed0b
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/316eb3f62f64d8a21a6af4101dbfe93aeb8e1724
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/8803f243fd39708c5e104112ba0b29c7a85d169c
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/596793437ad497a631ed450e87e78838eab23ee0
        sh4a |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/4e82ed1e557622a091001d0b55ac5c66166428af
         arc |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/362502f89631c9ba1d71906527674657ccff01ed
      mipsel |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/810e24cab65f67d143da29c78c0f89d37a851cd7
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/5e664960005d43072c6c8f3188683b504ef29406
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/50033d7ede26d0ff7337bce13aed041c0d7300fd
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/73729282d957576f068f075d1d1530b244726bb0
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/50c79c167cf0a0caffcfae9b44eac52e9a6ea9d1
        i586 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/4655e77a5949bedde7ab5b7382d0a1130ebfaa8b
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/010115e62f7ea62d35a2078e20d220af455006dd
        sh4a | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/f272146e46216313898ec788ff322418c0461b05
      x86_64 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/ddea982f04f2d0553afc2850b62d9982f54e450e
        i686 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/d20c8c0ab5b95b48c6d05c761841a156fbc33546
        i586 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/4ddf1829e0883600cc3e19de712b1a20f4edb745
        i586 | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/4ebbf9524ccd694a4cda8b1fe0e15e1c68434db9
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/30c72dc8e6bafcac96579e6bfb7f3c6e8e69fc2f
    mips64el |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/f2c7db32b9036fbe2c4f45b22cb8af25e45904fc

-- 
http://autobuild.buildroot.net
