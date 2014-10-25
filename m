From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-24
Message-ID: <20141025063015.AC1771011CB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-24
===============================

        success : 213
       failures : 45 
       timeouts : 0  
          TOTAL : 258

Classification of failures by reason
====================================

                 rt-tests-0.83 | 7 
                pulseaudio-5.0 | 5 
freerdp-440916eae2e07463912... | 4 
           libmemcached-1.0.18 | 3 
                elfutils-0.155 | 2 
zlog-ca6162be1608839e99c638... | 2 
                    ipset-6.23 | 2 
                 schifra-0.0.1 | 2 
              qdecoder-r12.0.5 | 2 
               sdl_sound-1.0.3 | 2 
               iptables-1.4.21 | 1 
                collectd-5.4.1 | 1 
            lttng-libust-2.5.0 | 1 
                    qemu-2.1.2 | 1 
                libgtk3-3.12.2 | 1 
                 webkit-1.11.5 | 1 
                   nginx-1.6.2 | 1 
                   gvfs-1.16.2 | 1 
                  libcdio-0.93 | 1 
                   perl-5.20.1 | 1 
       opentyrian-2.1.20130907 | 1 
               mpdecimal-2.4.0 | 1 
               qt5webkit-5.3.2 | 1 
               polarssl-1.2.11 | 1 

Detail of failures
===================

         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/4f77b1e007573c356b265e73d9f880d1fa5bdf0a/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/2bf1981b7fd575f21da86eaf1b3ae621f579ff55/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/0baf98fdbeaec946df0aa9d9b4d843ea87766dae/
        sh4a | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/5edaa6654b90299ead5255d1cbdf79eb8b40fc6f/
         sh4 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/602f3896d5eda01a24861732435eec1fc418e7ec/
      xtensa | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/3236ddfe8eaf89f05f84db60eb42583cca397464/
      x86_64 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/2d55910e859f5b39f4a315472c51dca19483c2ed/
     powerpc |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/94c2a1801c3293effd8e257a0c877aae79f14cb7/
        mips |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/c7ba00a763b9894c05e3bdd36ce3604c9135ad21/
     aarch64 |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/e092c05b949a2bcdadc4f4a0a57d7dd1dc8dca26/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/6ec8b7f1ad508b477d94da0c3970a488123f8b1b/
    mips64el |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/91e3b0df67c9cb79fe96778b831ff5b24fd53f9d/
    mips64el |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/513d79b97bb8ad0e5cd431c47c706b5ec87a9882/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/fce353554793f72fa2c39cb71bd266021d51b5cb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/176a1477cf7571cdef5726fef94f51d4096dc007/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9371fc9b043c691fdd23cd231a99b4d5b0601a62/
         arm |             lttng-libust-2.5.0 | NOK | http://autobuild.buildroot.net/results/ee331e4cd8fa366a87bc8e982b9602c3519b42c9/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/427bff0ce4f8864f03fb0debe991c647bb72f705/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/455634e31460b3a05d77eaef07afaec87bee68e6/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/fa27e8e11186ab8c757fde65ee37ef748b2acba2/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/057a4b9976fd6b9c5cddd117a3f29de51efe719f/
         arm |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/8944dee4314c9443b654529ca97386c177487709/
      xtensa |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ea05d2fbb831405daa3b5bb5ca903dfcf983d0f0/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/d78068fef15b7aef09df52630ecac8b886660965/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/60c025e2499cb0b3926b6c0541330039699dc6b5/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/0a88ed8e7bd7c4a34ade879fe67dba6ea02a30b2/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f430c40fd1d4b91259a02bd96e97cf36952dde2f/
         arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/ec06b196e0fe1e2cccb660c683cd1ba012c7f8c7/
         arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/55e86d72a2c70b04b3cfd052d70645795badc24f/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1bfbce8951cd11375e6bc197ec8332de23ad4bdc/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/f982307967a2da9961625fadb2d8b03e526e0bf9/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/a17849be3c7c3ff155cc5d6254951ed1fba4f602/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/e0e858130c036df81308d207d6d2e49f901b9c55/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/8f8335a339205fcd3977b022a66d4fdec018fa95/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/27f25b8d00a22c9bd774947c8a9c01e2c70cd363/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/5b983e18131b07ad10e03071ef59386106772425/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/375518abcf994cc39f853d8d78e9d42e65d356da/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/dabc9b31851e99d351fc337fe64be097ba132a1e/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b1f703e5440f470e07cd5df417fde24e51d0964f/
     powerpc |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/280628f493b91fcac899414f0cdc310262a441cd/
        sh4a |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/d9477d324c81bb0f45ca08c6f5d8af66725a2430/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6d5ed01ae23f50bdb6700e5e5463f2e42e4e9f4a/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/16a37adccc6d646f7ac219e5692ae16cd9a550b0/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/6935e1107d832e5678c8742239eccd89d4abed47/


-- 
http://autobuild.buildroot.net
