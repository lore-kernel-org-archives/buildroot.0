From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Dec 2016 08:30:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-13
Message-ID: <20161214073026.0A99420E18@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-13
================================

      successes : 145
       failures : 47 
       timeouts : 1  
          TOTAL : 193

Classification of failures by reason
====================================

            python-pyicu-1.9.3 | 19
             freeswitch-1.6.13 | 5 
                  cjson-v1.1.0 | 3 
             rabbitmq-c-v0.8.0 | 3 
kvm-unit-tests-5731572b2ac2... | 2 
                 openocd-0.9.0 | 2 
                  squid-3.5.22 | 2 
             berkeleydb-5.3.28 | 1 
                    cups-2.1.4 | 1 
             libsidplay2-2.1.1 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.0 | 1 
 make[1]: *** [all] Terminated | 1 
net-tools-3f170bff115303e92... | 1 
                    php-7.0.14 | 1 
                  stunnel-5.36 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
vpnc-b1243d29e0c00312ead038... | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9e1a89d1d2ea68a4fa6242e99ca3c313715c8bf9
        i686 |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/3d899790acdc5c21733ff6f7f5a1b500e862ea0a
        sh4a |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/bafa9c2f131fbf70886391ece4014066cc0e2177
        i686 |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c94a0756d41cba9f32628b5d04135071eae1fd5c
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0fee984ddd87583dddc8034f1d94fe86771a6b27
         arc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/1113bdf5a0b3010f4abc7306e33d09dce4799fae
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/6969f75a2adc23cf55663e8cbde5a74a29290d60
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/408648eacdb091214634e4902e012c83319fb49f
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/96cd917ff4c99e8c438298b6442ded787aeeb5b3
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/1f644b342a127dada45446969e4c930e5a9664f4
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fc089177f905bf32038b9153d01fe9ecde70fb5f
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d8032a15066a5f134c4165200dfa85e504e467e4
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/638fde4e3060bbd1fea389c8480fb65d85ae086b
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/4de350938b4907ed64f22fa023154e8ca2c77bc4
     powerpc |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/213d1eb2619bbe3c23f0aa43b224bd9b2eeba8aa
        m68k |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/0d9347a6de11e7c32e12c88c3da8bb1aee13e47f
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/766e601608c0c018b4df61644d323cafdb0b36e4
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/844d834f1155831f960e35c24f57a64f0f70e5ac
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/bf669f5d9dd644e6089657f3eb1bbe8184d19052
         arm |                     php-7.0.14 | NOK | http://autobuild.buildroot.net/results/55f51a789642e5555c519db1f1e4609a5197bbf4
       nios2 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/48cfb0fe00fdd52af502f9570d291125fb57b9f0
         arm |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/20722c567b4b38fa352426d5a910ef3f02536b88
        i686 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/9062a774adc0effba777fec5b7f74e6f94ccbe7e
     powerpc |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/a16ec51e2876529c6914a7412e1e29360c5c319f
      x86_64 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/090617c45aeae698b096708ed5688cf62c2987a2
        i686 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/c8b823a6e112f8cf6c28437ed23424987b5da6ed
         arm |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/872e9811af7628e9175fcf1e2b571e92378c22d1
       nios2 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/40d0763cfa980f7b1975d5bb59fd6b79ab089b3c
     aarch64 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/f1d345f881abfcfca5c0614308f79273dc4cb990
       sparc |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/2343b46083c79c6a1d5a2dc57d4d912f523cdbed
       sparc |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/65305e35b07670478dc0e9d0289ae121fb928f2a
         arm |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/9c75d820d542053794d4293b1a1e72f305b0bdea
microblazeel |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/6c32db51c0e2c1009c3d43f5f384973aa3242702
       nios2 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/62fb86004d4434613094f6fa41275b1c45e9fdb8
     sparc64 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/3eb8476f25a4ac4b05f0629386e9fb2f688ce75d
     powerpc |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/e6ce24a7be54b82fc9aba6720e063df4b4cd9d48
        i686 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/a34269c3a7c8d2466abef3f255744f85419fbc45
    mips64el |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/75ec0b308bff3fed04c1357e8bffbd5fa7db9255
         sh4 |             python-pyicu-1.9.3 | NOK | http://autobuild.buildroot.net/results/85270a1d0bb6668e267dad710c5cbb7a87ea2965
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/8f17aca94f68d74b5b55986326abdb8a55f89ffc
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a3cbc611c7b372185a5c864adb9988bd3ba4ec11
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/00ed1766dafe7f4de85f353d9fa6ed0aff8c0c69
    mips64el |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/c6ecb4437bea26bdb71d329f51bf6100fd48e40c
    mips64el |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/50a4b5330753fca014a881ddf549d24f131b7b53
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/b9856f250730aa83fd13a3a8f1960926cbe90a29
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f0ce6f53f3aceb6b44101f127f66432d5fc4b88f
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/aa84b13d460622ee0e98f090222abb0586d91d4b
         arm | vpnc-b1243d29e0c00312ead038... | NOK | http://autobuild.buildroot.net/results/c50c2f5d3b1fdfdb9e56c5d96d2d82bef677b6d8

-- 
http://autobuild.buildroot.net
