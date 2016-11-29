From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2016 08:30:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-28
Message-ID: <20161129073024.E217A20BD7@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-28
================================

      successes : 184
       failures : 39 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

             berkeleydb-5.3.28 | 2 
                 libraw-0.17.1 | 2 
                    mpv-0.20.0 | 2 
                 opencv-2.4.13 | 2 
                oprofile-1.1.0 | 2 
               trousers-0.3.13 | 2 
                bind-9.11.0-P1 | 1 
                  boost-1.61.0 | 1 
                collectd-5.5.2 | 1 
                  cppcms-1.0.5 | 1 
                   erlang-18.3 | 1 
                    feh-2.17.1 | 1 
                  gauche-0.9.4 | 1 
                  guile-2.0.13 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libcurl-7.51.0 | 1 
                libmad-0.15.1b | 1 
                 libnss-3.27.1 | 1 
                libpjsip-2.4.5 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
                  nodejs-6.7.0 | 1 
                   ntp-4.2.8p8 | 1 
               openldap-2.4.44 | 1 
                 openssh-7.3p1 | 1 
                    php-7.0.12 | 1 
               polarssl-1.2.19 | 1 
python-libconfig-b271c3d9da... | 1 
                  squid-3.5.22 | 1 
                 synergy-1.3.1 | 1 
                 weston-1.12.0 | 1 
               wireshark-2.2.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/fc7da2ed63a3dc4f6e807e1e0a9fb73c10615c58
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/aeb262ebb89818c7faaac684551a7989402e0cab
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/7effce5b6675a585a24a549a2e637c13e2ee1583
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/992bca5d2708a7b932caba76f7a83376874c3624
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/c43c30b7d589ad7d0f70eedd7c162f32e883d336
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/93f1d1dd89df309c8dda6fbcc92430344bbd4b33
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/848f9afc066f1b11e598cb3b63de80a50427e0b9
 powerpc64le |                     feh-2.17.1 | NOK | http://autobuild.buildroot.net/results/9e3941eb8cd411b3a7377a06d1fbc12960f25187
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/d82d3504e289d99e51143ee4520893fcbac9c63c
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/5097feaa9e15806edb3364c68de156c1015f6d59
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/1a75d9956a0e680453445cf51b7fea89b9178c15
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2575ab0554534a1ec5fdffd001716da2fcae3f74
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c6734c34dc5be696057dfb615bde82baa5ef0995
        m68k |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/46abef3c2d685a08f9843328f9b88d99f02412b7
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/be0be4c106e2c9ea10b0f761f3c674a94592bc7a
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/0c4323eb4062d0be931d462cd5602f190ce2f454
      xtensa |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/d919e1276ce1d39b4b3eb09937927d5959cd69a3
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/99d07d8e9de6899a9a9da735dab9d94bfbed0ad9
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/40d320c3c6ab8a8f6b9ec40deb6609d6c7f5f121
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/02494d0fe0658ad93ca9d574d21d4d20198ec746
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/a509afc8e2134096af039578485370114c069a12
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1d6685a5666b7ac1a045775a1b4a3ef0fdc1730e
        i686 |                   nodejs-6.7.0 | NOK | http://autobuild.buildroot.net/results/5d6afb5184886707e8249ddcbb20b1f582f1e20e
        bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/2a95dba8cd122cce2df58bd67a3949a6e754a7c4
        i586 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/e863694f5fb4d57ca41663f89b43144d97717c60
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/8568b068d493e23e872651b8bae115c9a3ae4aaf
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/0b38fb4697f07dad4c33f125f87d50928f890797
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/23f3cde89310289b3c043d1fdfe35feaea8215ea
 powerpc64le |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/a28c4bb17da648b2609314040c8e8650a7b1dd67
   powerpc64 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/a794415ab091a56182cb011681c241d4e7b87e41
        i586 |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/b48858041d8127490e7c935f7d44f6e79506e7e5
     powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/a3cf73242db9a6cb72ec49c13b01bef7ac28ce57
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/bc0d7b9408173059b3f931dca2d82127fb1ff853
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/0c5ce8430b4dcb96453fbcd5d933e4f2c341c591
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/beaaa15c520e133a505f2a3fc80f9e4a173e65d5
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f34b0df0e296cae1ee5f1cbf1fb0326ef46383c1
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ae7e6c1cd4aeac3bbb66274da0daab97399bd3e2
      x86_64 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/1125199749455e349d8eb87ca86c778763aae489
      x86_64 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/7c23c761fd36b8820d79a6539fcd604d5f5256d8

-- 
http://autobuild.buildroot.net
