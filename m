From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-12
Message-ID: <20141113073014.A7334101D3B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-12
===============================

        success : 172
       failures : 48 
       timeouts : 3  
          TOTAL : 223

Classification of failures by reason
====================================

                 schifra-0.0.1 | 17
                 clamav-0.98.4 | 5 
                   libcap-2.24 | 3 
             e2fsprogs-1.42.12 | 2 
             host-mysql-5.1.73 | 2 
                rt-tests-v0.89 | 2 
                   lame-3.99.5 | 2 
                    qemu-2.1.2 | 2 
                  perl-gd-2.53 | 1 
                  tremor-18153 | 1 
               iptables-1.4.21 | 1 
                dovecot-2.2.15 | 1 
                  poco-1.4.6p1 | 1 
                  libv4l-1.6.0 | 1 
                  botan-1.10.8 | 1 
           xapp_bdftopcf-1.0.4 | 1 
              librtlsdr-v0.5.3 | 1 
          libmicrohttpd-0.9.38 | 1 
                  cppcms-1.0.4 | 1 
               qt5webkit-5.3.2 | 1 
           libmemcached-1.0.18 | 1 
       opentyrian-2.1.20130907 | 1 
                directfb-1.6.3 | 1 
                   mono-3.10.0 | 1 

Detail of failures
===================

     powerpc |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/2d1563e253b669b45c9df449c5b3a750c04a43dc/
     powerpc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/bfcd164f41f84b0047896d46752405eabf410910/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/e0a765a94a538b0b936ea512f7aba0264fac6309/
microblazeel |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/9ff60a9731b900cc5bc4348336f61ded77f1d034/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/70bc0e68b58f55b4cc793d77b627e802577fbaa7/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/ad452a5c25ce488531197316cff2a5f6e241eaab/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/64fa1bba27f9e9a5961c0339b422255e4567d525/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/404cb6349f4bbf4bc66306addcbd3fe9641b811c/
      xtensa |                 dovecot-2.2.15 | NOK | http://autobuild.buildroot.net/results/c6844bbffff1cd4f738a5fced011d28f73c90b16/
         arm |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/ebf02964de98f82e7d5509c68cbfacdb5bc6f87e/
      x86_64 |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/4dc157bb9cd2e86b9b88ff9c1b66468fa930ede4/
    mips64el |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/07653cae68755dc930e3cb48e77638b8beb882df/
         arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0c87fb7b16c91494be89c3508c5b11d63adac2b7/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/f252053c06f6a984a5ffae0c9eed9467e5cc3a04/
         arm |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/16e43b10e8305a6abc97af835bafe9772c226285/
         arm |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/1bef25457000bb5e0b753b907c4b4f3910330266/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/39e1fb191803d1000bf3c7465e873f716d27a873/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/496c0de6799df8b514d6ade03fb6f778eb38e183/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/538b23417c68f6c8c0c8c92dfc0e8ed314bac01b/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9d60a10954631f1fd881bdfa380ffd1214f9c0cf/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/979a2b3b3bae5517d89afd7a8da35ca44b0ebebe/
        i486 |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/7d46247a659c8ae89cbd8085ba52527ce55efc4f/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/2bd30d942ec718e0a46ba2d1c043c9b6e2e6578b/
         arm |                    mono-3.10.0 | TIM | http://autobuild.buildroot.net/results/d4cf3dec710f979d210b471ff5bb762fff2e390b/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/fc1e8697ec818c5f137d0b95d1bddb3d5f79e39d/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/d6763ae11f9da21bb48d84189a5c7150a22710cd/
        i686 |                   poco-1.4.6p1 | TIM | http://autobuild.buildroot.net/results/1bfc42a1d68a9356de30706b58ab3dd4169c7409/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/75da6ed668feff875dde38e86e33b57a3d01ae98/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/e07891e5aabb005a238c53340789ad928a0b0da0/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/785bd7b700ecae67b0421acbbe05488fbcbc4f27/
        bfin |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/c71fb43d676eac64b359a2835b4540dd77ea18de/
        bfin |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/74668fe0214d9d55f23563f78c062d30d0b999d4/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/9fb86d893c7f392be884ec4f84bfc03d1a0c96a8/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d6293e9ffffe5454e562f57cfbe55878c511e5b8/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/53e3dde4703a1d69a3778bd399927495fe49bcc9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/80585b0a43eac6c500c0b652c74a83c0211e7919/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3bfb17fc2a8a2b22349ea01ace807f3218203a01/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/43bff6cf4dab6d9a8f5bed77884cf11dc2377fc4/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5218296081d9cf4a8a544c2ed1444f32af5ff4f1/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b3d4eb88a9c00c892e008ffe2f3d6add756aefdf/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/96c656e303d60de50c0b60622cc8d588bfab4eff/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/432339d53d349d547e37ba7ea3254fa4aa0d4ed9/
        i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6022f9aa0b6674e5d34bbff639b6f20f7c3c06d4/
      x86_64 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a68e971989e5785f6a800eb9a2ce4097291653c2/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/67be08970f82f71ebe831753937b05bee1653ed9/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/383e3cf1ebc93346021b51de3aba49331ea2641e/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0ad4c3b9a8d2726a4edf3a613a410ab43f4b0efa/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d44d263564162a6947f404141f956ec8e484197a/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3f10e81edb6ea5722d84168e97cb6f9b97377264/
         arm |                   tremor-18153 | TIM | http://autobuild.buildroot.net/results/bd1c778c92e3fb5564e2201f04a52807f88e3ecc/
microblazeel |            xapp_bdftopcf-1.0.4 | NOK | http://autobuild.buildroot.net/results/89f590214687a3f0814fa0cd3cea4bd4fb123fd5/


-- 
http://autobuild.buildroot.net
