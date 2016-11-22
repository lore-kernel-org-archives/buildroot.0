From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-21
Message-ID: <20161122073016.3100920C6C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-21
================================

      successes : 132
       failures : 27 
       timeouts : 1  
          TOTAL : 160

Classification of failures by reason
====================================

                 jack2-v1.9.10 | 3 
                    mpfr-3.1.5 | 3 
net-tools-3f170bff115303e92... | 2 
                       unknown | 2 
                collectd-5.5.2 | 1 
glmark2-fa71af2dfab711fac87... | 1 
                  guile-2.0.13 | 1 
             gupnp-dlna-0.10.5 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
libasplib-f7219142e790a329b... | 1 
make[1]: *** [IMG_png.lo] T... | 1 
openblas-f04af36ad0e85b64f1... | 1 
               openldap-2.4.44 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                    qemu-2.7.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                     rpm-5.2.0 | 1 
               tcpreplay-4.1.1 | 1 
                     vlc-2.2.4 | 1 
xdriver_xf86-video-openchro... | 1 
                xfsprogs-4.7.0 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/51eb43ca5439e442a1990127c1dc63bc13fc73dd
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/bc776ae900bfe88926ad46c1003910b8bd11a30d
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/d1f49b34980f50f924c7eee7687facb505907f3d
 powerpc64le |              gupnp-dlna-0.10.5 | NOK | http://autobuild.buildroot.net/results/28ac12e60291a06928a83c4c076dd41e7e44551c
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/973aa75ee1904168ec061e9b59dfa28592172438
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d0b03370681c69258c1a9b337e4f75b07266e3f0
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e84d66413eca5318f62da7ef9362e41dec829f7e
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/089b8fb0fef1325d3b7940bfd51322e5b694ebce
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/b1c1c2c85da705616a14e7741ad0d634e6a63bb0
         arm | make[1]: *** [IMG_png.lo] T... | TIM | http://autobuild.buildroot.net/results/9f1fe05a0371c5a6e4f26925cd549c7a43798003
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/5ed9dbe97b8e462233ec6b271d91d41e46aeaa08
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/61806a630b3d89beb5d1b58607af66dbfe366c5e
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/579de571270ad562fbb1699224d557d16276704b
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2ed8e81d021ec0ddbab1a016a1fdce1f0a99966e
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/5319b674e55144a5bec6c6b2b09ceb6f86369a57
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f102ec2e6391018edf5b275ff2b0690ae53d121b
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/36f8f4b8bb014519641160d1f637d232ccd377db
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/698fa1842d1a46cf4b17e9d83e1071fe05e40ce9
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/d85a8d69c17abc0336a50e352b04b0ab58be7911
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f43b4db0269acac25048d59aec77cb30cdc1b3c5
        i586 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/85e56686d2cb075db31cd77faf94bb5b4345f982
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/13a11be17a349f7ba16fa898737898eebc772bc1
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/3afcf8553dd55aee72b5568a206bbd01f542b740
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/b1e5cda1f3e3273a55e4ff6d91d7805cb7750861
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f3fa735c41a7fb1d2b63166031c40cb5fa7d81ce
      mipsel | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/99ca7a66dd295a9871e8b23e98d33c4fc9f94bda
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/ee9ec1cbfad63c884fb17d6e3236f5d659f9be72
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/f9e0165a21b36f86ef210d76a3046e6e3736baef

-- 
http://autobuild.buildroot.net
