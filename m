From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Feb 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-05
Message-ID: <20150206073016.6D6BC100E6C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-05
===============================

        success : 281
       failures : 55 
       timeouts : 1  
          TOTAL : 337

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
               host-qemu-2.1.2 | 7 
              host-erlang-17.4 | 6 
                libvips-7.42.1 | 5 
                 qt5base-5.4.0 | 5 
                    strace-4.9 | 4 
             libselinux-2.1.13 | 3 
     host-google-breakpad-1373 | 3 
                libsrtp-v1.5.0 | 2 
           libmemcached-1.0.18 | 2 
                   sdparm-1.09 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               ding-libs-0_4_0 | 1 
                  cppcms-1.0.4 | 1 
               qt5webkit-5.4.0 | 1 
                libevas-1.7.10 | 1 
                  snmppp-3.3.4 | 1 
                      qt-4.8.6 | 1 
                   lame-3.99.5 | 1 
                  zeromq-4.0.5 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 

Detail of failures
===================

         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/3990185ec1da723d9ea5205692453a371d4b912d/
        bfin |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/f1aebf48803803e1f57270fd4f449336450ec564/
     powerpc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/a16324b0d1e0946c8ef42af4ef7a7e8aa50b060c/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b479d221e906b536a5c31f2e076b4209782c9836/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/64b4e84be482074675a58c3571e93c4850d3743c/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/46dd1a770d0ce587090e78f54561c065825ebf7b/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e8195c0f62fffb4ea95ed7c410622512e5a46d60/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/59beb0dff11d0945f131d5eeadaccedcf48c1984/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/61d539a98f524beaabda05e756c832ac61348725/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/98e6a4a4046231598f5380e7ec5ac5a6833c5c41/
      x86_64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/8a085b8f7563e0c94680ef7736e829c528b8f3bf/
        mips |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/a42589c34aab85569c434fda4457f34f5bb5be7d/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4e530528c72f0c70f352f39ea09c686753757ecb/
     powerpc |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/c27c9e5b3a3d2e6540b1f614a752e9afa0684f73/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a8272b169a15bcde2b4359029901d361695227c8/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/068ed4f3c90e7d7ccc7a3abc56d1bc594c4193e4/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/575f405284661818bc06a64d9e600a70f831c39b/
      x86_64 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/7d386322cec452ee636adb20be0c1a31f38385fc/
      xtensa |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4298ce40cbe3db50ffe53ecf6856523157df591d/
         arc |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/71dc37f9cc56f3f53676f54bf28f2ca101bc4505/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/a2e59bf3ff0b9ae97946abe0379c6f239341f045/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b0e7f6734bbf88ee61a06f5aec728b397f54012c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/b29342822ca4f14ee997d6f07bab440841a9bc88/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1dacba4afdf191d8e1d1f9851f86f45a4aaf3f6d/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/75fec8be558afd1649ba6a42055e0764d50d19fb/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2cf9e5642a318060d847067a6ec402aa7ab50c40/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/b5e04487af935b7b3406572f2f3279bab9336ab8/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/7bd0d76139ba86c05e5ac8f8af0306f0d7a81f75/
        mips | libsvgtiny-ea9d99fc8b231c22... | TIM | http://autobuild.buildroot.net/results/2303df957331995b91fe93686bdae3c176078755/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/5d32044d47ffe6d5338837933d16b9c6d049c96e/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/f6afef5cf7fedf32b7b095ab43a875db2bcb42d3/
microblazeel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/db70b80014240b7ff2b273d4eb0f269c1b06acb8/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/65ca7e77d06b982fc02ba90dee19e14e279828d8/
microblazeel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/2cf59881db0c09a6651290d893cb22bd0c4a3d8f/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/bc2b49da1d7f8fd52fda74c2aeb4ecb7ad16ee3f/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4eb68bdbf3e305b861c6ddcbbe7cc84fd5202395/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b0f9dd80ebffb669bbb74baf95f24c8205e11810/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/415a3b64442dd69ad5691633644e9e0745867778/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/6673b41a5eea595d4e40e13f3e304dbe859cba18/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/5175e4a6e6cd5e35d9c279088c0cca6d0f2d849a/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/10d8db6ab613c5947c07d0d89abf2cc09af29681/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/e5cb0ef19bbcf810b3f953921dd7afd843a4f395/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/5adb1496ee36e314d99ada4dc39c35b9fe613f86/
      mipsel |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/254cf62bef8bc5d5ffe345d817d16aa9983baa15/
      mipsel |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/c8e2278b5cdf3b4cd2eb36f9864d49e58f9954a8/
         arm |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/41667e5f6d527166edd2a1d85cb07bfe7513b7e8/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/5a27559701108e11765304689981ad7fd43f619a/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/6e785ba7ff92ff4b543f74cd643f12c8db4b7de8/
      x86_64 |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/6918c623b65a3cee45f2c29c29b36f9bf475cc76/
        i686 |                    sdparm-1.09 | NOK | http://autobuild.buildroot.net/results/458b3da912b977335ac292fa7adddfb85961557a/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/709fb656cf0f5cfa6f9d081c3a6d3bb8f82cee27/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/eb1b8f7de75e53bbf66256863562b891ab18f6bd/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/67d75cd4be8e28b5b7474c9b0243b412c0b44ab6/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/3d2d264f07420ac0865950dcfea1bcc315d7f464/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/af57e5d602622662c0167ac504047a3d38c4f65f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/6ff6f2b40ad6fd3330948370ce6c4cad4b72c9e0/


-- 
http://autobuild.buildroot.net
