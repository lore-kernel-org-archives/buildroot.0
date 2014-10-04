From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-03
Message-ID: <20141004063014.D4B421014E5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-03
===============================

        success : 157
       failures : 89 
       timeouts : 0  
          TOTAL : 246

Classification of failures by reason
====================================

    host-protobuf-c-v1.0.0-rc1 | 22
                   atftp-0.7.1 | 16
                  fan-ctrl-1.3 | 9 
                   dejavu-2.34 | 6 
         python-protobuf-2.6.0 | 5 
                   perl-5.20.1 | 5 
                 opencv-2.4.10 | 3 
                 mesa3d-10.3.0 | 3 
                upmpdcli-0.8.1 | 3 
               valgrind-3.10.0 | 3 
                gptfdisk-0.8.6 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                host-gdb-7.7.1 | 1 
                      gd-2.1.0 | 1 
              libgeotiff-1.3.0 | 1 
                 libssh2-1.4.3 | 1 
                    ruby-2.1.3 | 1 
                  thrift-0.9.1 | 1 
                     vlc-2.1.5 | 1 
                 gnuplot-4.6.6 | 1 
                  python-2.7.8 | 1 
                     radvd-2.7 | 1 

Detail of failures
===================

         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/d86857319d74c5281dcea5a4878d902bf1618b64/
microblazeel |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/9c79890caf28c3925b5c601ae495ddf52d215cd1/
         sh4 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/749e1dc539d363ce497dda53e17ec0b47cea9ae9/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/6b3b3ab5f6880a7479385f3b52ba1580a596fa41/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/77244128ee458b7200dd88c894ae90d0ddf3146b/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/0fa2c5c5b0662b3b324f224c3c32999289bc4bc1/
        sh4a |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/e02efeb508065f01881d99503aaeed9b9faa0cf4/
    mips64el |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/60c6de261c47803403987481fb217f3e32c6034a/
        sh4a |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/81264edb940b27e2e3f287edfe7c453c696c6826/
     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/a8afb742e9301176d1032ef0623706bc4d258d8e/
      x86_64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/31f126c1b15968afe9e839295e5aabc4efc32f37/
    mips64el |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/30a01b94844134e139f14eecc72d1d0859f0c85e/
        bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/5cde03901b4469344315d1705230083aa9a73320/
         arc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/de7498f63d5bbb40a3bdf99e4f5ea4ce6b690886/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/f3c0ca9faddb4d6b8c65ada6ce0a1192910a4a0b/
        bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/e47c6ad2bfe32f8aaffe63b43397c5423c3e5e4a/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/2483f4de5890b1e95835c5880b2e4ac8294c58df/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/98f89e5e606435738ee98a55eb031b24c15ade24/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/07ada7ca667fd76c2337e366aff82e5501d6d385/
        bfin |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/b6a63890ad7af59f4508596db446ccc00b6321e8/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/8098ef539fd86f3a88dd535236250a5b3f88a451/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/b96511064680f07994c28362c7677d37b16cbadd/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/34d8d02d08248b08f018a850140e71483768d81c/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/db93ccca60113a1b308f7cf545439df0a4a9b2b1/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/2d4e1fcdca333a73bef2245faf147df375e07762/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/2555ef3999737d8df0a4da6ad0ce14d340f75b0b/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/b728ce5a59e1bb26c72da19d3066b9f88d2e18a1/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/80fb15f8b274f07256122db66a528d5bb0b1c82b/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a4b1cf8a0f47adc1050f8cf11b488087a67e0376/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6632ce1e8150fae413eb28705369a4fc2bac6828/
microblazeel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5b0f4a4f1314bebd953cc5e8341f122d84d849b8/
        bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/1ff3febd607d5a4768080e3fa095b636185d0e88/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/90f979b2aca878aced01a74196c8c3b86903f7e7/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/14356d9f6a797fb53d3511ac40859487c7649b8d/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/f3359fab166cf3627f15e59fa44cff36ee213102/
      x86_64 |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/d4375167971472b09965d95d82696a322a4aa776/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/09bdccb112bc50742a60eeb1468e850f243f1ae1/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/279f0dba6f83804fac2d67518f8f6a0675e773e4/
         sh4 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/e4f10472567f95b28aafe9e03e990adf401495bd/
      xtensa |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/279e1ac11cad6baeb34f059ea8a130461bd606b2/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/ca706039cbdd4bb91f78893a1f24be3606c62e48/
         sh4 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/74fccd5b2c15cee1f47f9adb15434da88250886b/
      xtensa |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/4152f0ee055a495122513d44b039ff8fce13c670/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/8c0c029fecb6b9f073d571637d32b50e9c1e10d5/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/dad39b938dfe563e4932fef2d04e559ad05faf42/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/b6198bdfdd7c5124978e56037635e45281f3c566/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/3cf794e986fe1896bafc19525499e943f08357e1/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/bfc96c0e7642d613a152fc6f35488e4f9542f816/
        mips |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/45817a3ded0da08fa729363c40b88fd11e9d2d3b/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/27fa6e6fed86cb5b656bfe1ab479b1a3fbc2c8f0/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/8a21ba702668aaa47c8b9c6f101f684b77b969a1/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/496beb9b5a9ba66ef89416c913f6f08843e9f0f0/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/9d84967dd55a86d0367af6d73ed162758732b53f/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/7f549c889fdb6285068bed4b0447ec61a6bce042/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/52e37ab49d20c6884e4e0dea05134fa86627d4b1/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/98fc538fe2552de87f908fdfe750e1c4043d1ac5/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/ceecb2d2307cc6a1c692867f33cc46fe34bc6bf3/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/2a52c5d8cc8363d6dc69345a8ba69796c1fd8d7d/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/14e4afdd81d38b05d8f482c416cd6b800f9fbc88/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/1fcdfd761f00989214a19d2ed30476e27b8f8601/
         arm |                  mesa3d-10.3.0 | NOK | http://autobuild.buildroot.net/results/49c5ee7a8a0adff325f4cb484b91347de9e36ebb/
         arm |                  mesa3d-10.3.0 | NOK | http://autobuild.buildroot.net/results/b02f1c42ac9467626a21242770440e52baf9e4d2/
        mips |                  mesa3d-10.3.0 | NOK | http://autobuild.buildroot.net/results/01a3a3da833cbe8268af55320c6f354ef5b4f863/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/a693ed23e0adb23f2e176decace2adebd819766c/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/f9b8d12c2b9209a62cff5892550801dac5f809a5/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/db3ea06c4ff7f77e0d062629a79fcf0fd893242e/
       nios2 |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/d61a370a41f7b9ce980a03f3a6e034a7e91bf87f/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/878b945dbd5221a3fffdd91df534778234a79dae/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/3a1c2f0bc802d3cec26ffd4ded8f5c04473a3d4b/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/895aa904f8a9e5c46d2bdae5a3d8480bded985f7/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/c54902f5944069f2a178f63b7b80538b91f6d249/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/8f7ce7283d429955d94c08190623ea4f6eed670d/
     powerpc |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/840e2ebb7432a8106473a4149ddc6d6ea57de9c3/
      xtensa |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/d8f0df33675bdae8ec63fdccad65b92c246289ff/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/7abc48a8c39cc90f0ee7698f34e5764798f29655/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/a2d2a5fcc720fea547de6c0632351ff91c0d8466/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/049527f6cc43a5b566e7d10e16a879bc51b5e77c/
         arc |                      radvd-2.7 | NOK | http://autobuild.buildroot.net/results/2d80c11a2f939023fc38ef97fda7fcd90d2c5639/
microblazeel |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/96b9c30be21cf8658e05ff0196537c3248af528b/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6fe79533dba3fc225fce5462256644747b2c2f67/
         sh4 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/5f59f3b74f8f8caf08f12499463b02411658ab0f/
       nios2 |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/d07f2c7eca690794ec06f10e26774cb1477bfb09/
         arm |                 upmpdcli-0.8.1 | NOK | http://autobuild.buildroot.net/results/91be6618e2a70be40a227f8da35c626c54940bf8/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/ed98875b44dffb0ff88c51eb2b768e4b69fd46cd/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/f21d9a4c1f9794129011f4fe183039d2ee9aaf86/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/ebed5903ddcd21ce5f52f9b7c6a6aff3005cd0c7/
     powerpc |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/beffe1400396309225ca81b0dc982e6a85a57864/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/eaf57c30791c1578d60e12812ca5677029834e25/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/501a6496886f217e67c0514823d7bc383ed9feb3/


-- 
http://autobuild.buildroot.net
