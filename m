From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2016 08:29:57 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-28
Message-ID: <20161229072957.B34CC2076C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-28
================================

      successes : 153
       failures : 86 
       timeouts : 0  
          TOTAL : 239

Classification of failures by reason
====================================

                collectd-5.7.0 | 19
               sdl2_ttf-2.0.14 | 17
               libglib2-2.50.2 | 13
                       kmod-23 | 3 
                 libnss-3.27.1 | 3 
           host-cryptopp-5.6.5 | 2 
             host-nodejs-6.9.2 | 2 
                 jack2-v1.9.10 | 2 
                 openssh-7.4p1 | 2 
                    qemu-2.7.0 | 2 
               qt5webkit-5.6.2 | 2 
                    dhcp-4.3.5 | 1 
freerdp-17834af7bb378f85a3b... | 1 
glmark2-fa71af2dfab711fac87... | 1 
                 gnutls-3.4.17 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  libcdio-0.94 | 1 
                 libraw-0.17.1 | 1 
                  libsvg-0.1.4 | 1 
            lttng-libust-2.9.0 | 1 
                 midori-0.5.11 | 1 
                     nut-2.7.2 | 1 
                    php-7.0.14 | 1 
python-libconfig-b271c3d9da... | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    rpm-4.13.0 | 1 
          shairport-sync-2.8.6 | 1 
                  squid-3.5.23 | 1 
                 sudo-1.8.19p1 | 1 


Detail of failures
===================

         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b012f6c19862258db4bb729bd2d885a4ac94365d
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a099f2a0e3a3babbd485ab7f2d55646a97fd2c66
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fbf8ebb13c3f244ab02133b36d49dbcc03a22811
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ad3046c83fd78ce281109e13db6350a90f0d1146
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bcb03cef9c846a8192459084d876e6c9b1c10f4e
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/06130e7e8e5973bdc7a6560502ff62f96f7055d3
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fb537cba4499b717151f5e0047dea2832d553d2d
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bddeef4b5567c195d19e7669e7bc07912c0a8fbf
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0c2e316aa75787c73d336ebcb05c8776ec42aa7e
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8e603c6c38f86bd2f5255d0f7b967e454bac11da
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/6c393cffb6ad4e676e311e9fc23ddbb2bcc2cf36
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/66ce0368fcae1683f79f4960d13c4083e2b29752
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5b6d47712ba519b4e13b4549b7bd6c15942b63ea
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e8e43b8c29b88b02690f1e5dfb5f5738053b36ec
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5216dc0bc7836379e9df73407a36acc0881e96eb
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/51186cedca07e4b542be53e7a9de85f1f9a82878
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f75a37a8c6fc5d91a8999d20562f6dcfa6548d31
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3f80514d0adc0c4c8639004294f9d5820300850d
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a1760155cf974d4503ac13dc0ff44e115702a920
         arm |                     dhcp-4.3.5 | NOK | http://autobuild.buildroot.net/results/bfeb40dcb3f51053c969ea05a1f8c718870807ae
        i586 | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/77626b39fc659764d50a578717342d4971bdc0e8
         arm | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/947dfad353b0f18678769893f11278d7c72b110b
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/db76b7940643c251f54ac6836ca6390efcafafe7
         arm |            host-cryptopp-5.6.5 | NOK | http://autobuild.buildroot.net/results/abc9511ffb965d1b9b2285e9a9d671671ce0143b
         arm |            host-cryptopp-5.6.5 | NOK | http://autobuild.buildroot.net/results/67f58ec08588d029d901cc5c29066a4056ab4db0
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/92abbc33ac7a30aeca672f906514075b14ed6ef2
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/2be9aef26c2dfb6b11f760b2d0ad294dab49cdc3
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0c1df169cb3920ad30f04872f87f31b351a20516
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/dec4933195afb9095ac6531a3f42d577080546ac
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/d37200acb0845bcb1eed7dc5d15cb24713d98f4c
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/0268154cab17b94fb05bef87366759d878af680c
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/0eb2488e535c7f24645f9776f7c4d4cca5b3b021
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/43a467f63a15721b5559a2a7b727dc5319d2cdf1
      xtensa |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/bf50bff9833e89436385e82dca4d778deb7296e6
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f104f8643cb7037c3b14952dfb0f25b2d9256f92
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/935d7f54d86c2cc3170199aa52771d4c1bc41c1e
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f072319d7fb641fd71b5dd257defb7f83e40feac
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d08fe0006f4dfedda228dc7f60e897c3572fbe83
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/aa347e7d82cccb5b8b3321098d549acbdb1d011c
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f299de4fdddf4a850d3dad30d234f0c6dd76c161
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/7dc4f4ad22c2f2f39fc249b622dc15ebb74ed63b
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/58a6663a3ab81b1beff4cc4285092173eb51ed97
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f37a920d3c2490250e6b19171af15ea70de01d32
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f4ab1137d2d226f3c83ff70863173b8e1131ee97
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/11c78028655a450e4fdb93ee612f81b7bdb7f229
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8cc5e8c6df40bbf171b3ba551379622083831100
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/26a1b60cc7f8bf6109b2ec73cd928e5f6bffdbf3
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/38eeadd087470c22ea0918729ee114cfc72e0383
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/5686d692790cf045dab8767a23718426fbd14dea
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/01b084f172ef2afd71ef38874b1137ad3f5faf0f
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/8c7517b075f88f467b0a3440b3dfa806f9f6cd7d
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/e53b71406986d0358a5c17e490b7b4c6a83cf8bd
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/bd139a0eae06e427a325085191c2afeb37be5230
    mips64el |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/04bb05ff79ffe24d7df6e16403d57730fac8caba
      x86_64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/4055d38ec83e17239f7915bd54841d4c8c22ce97
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/b2647b1b41693ede3c31422a2b0944864d6f6712
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/e16089eae9e596183db137605df79cfa075bbf0e
         arm |                     php-7.0.14 | NOK | http://autobuild.buildroot.net/results/434a2666a400376892d4dad89366fa9709479014
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6ace0e23f484bbb2009f63aaf027bb1618d847bc
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/298a97cec428c1d1be23689a5cfbde507c3993af
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/18b86b1b82eda4bd8d5839335e84d048a5c20bc7
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/022215869f40c3b34e26832d74beeafaa54f10aa
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/3719223256a3c4b9d517775713a6af86957a4d1f
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/9416a019224c4b2ae2dbdcdc992118f113c4fba6
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/79814956b0f0fa914881e9cab3a604b947a2daa7
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/80e40419d657ee16b4d38f08d894822e532ab63d
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a91bb681b86cb44d7f43bfa183d18c114d0f6c0f
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6397856cae5a7e139b449435feadaafaff312870
         sh4 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/49a5977012044a5d94128b5ec6f234d0227be750
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/fd2ee6c6fde879c0e33a2c4fc2be0763346b9c77
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c7635eb0329e2bd14f7f87964101d2a24cb7ca39
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c53e675632be5252e67765525513bca932aaa3de
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/d750fbb62f6f33047ee78fb8bea342a312a43aa5
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/698551a9e5d647dbbcae63a6fd9913fcf49797e7
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/259270511dab9a03e4df64acbc56901aff5b0ba7
microblazeel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2312dac042b4480d6df7cdcf88e17226bcc90b5c
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/bbe36b29d9161dd85262b801a3ae757d18d9af64
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3e3c34c6a259634397df3128387c2350b4e5f114
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/60fe64537bc34e156b2ed4771d2572033fd9159b
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ef337f5a018c8a0b56461c2cfde8ed8eff5d3668
   powerpc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/29f3c2a5c703cf859ca5e3584b0cd70c6bc7169f
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1e5f4460dec2e118cddf8d0ec6438c1a6f8b66eb
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5e341b63443dc87ee580b1ffca7ae3f30e6c25c2
     powerpc |           shairport-sync-2.8.6 | NOK | http://autobuild.buildroot.net/results/8ff63a626f66c038ddfb592a191de8d42c21269d
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/829d5a0ad60a2b441c5b99cd0921800d473586e4
        i586 |                  sudo-1.8.19p1 | NOK | http://autobuild.buildroot.net/results/dfe031f76b1cfcd2aa5c4e4a3c927d5925a240a1

-- 
http://autobuild.buildroot.net
