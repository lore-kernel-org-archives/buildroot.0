From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-15
Message-ID: <20150116073014.07A21100B3E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-15
===============================

        success : 306
       failures : 33 
       timeouts : 3  
          TOTAL : 342

Classification of failures by reason
====================================

          sane-backends-1.0.22 | 5 
               dvdauthor-0.7.1 | 3 
               lightning-2.0.5 | 3 
                 xorriso-1.3.8 | 3 
     start-stop-daemon-1.16.15 | 2 
             libselinux-2.1.13 | 2 
kexec-lite-fb8543fea3beb052... | 2 
           libmemcached-1.0.18 | 2 
zmqpp-36413487f05b165dfc82a... | 1 
                 gnuplot-4.6.6 | 1 
                  zeromq-4.0.5 | 1 
               host-qemu-2.1.2 | 1 
           python-pyzmq-14.3.1 | 1 
                      make-4.1 | 1 
                  thrift-0.9.2 | 1 
                    mpd-0.19.8 | 1 
            host-libxml2-2.9.2 | 1 
               sdl_sound-1.0.3 | 1 
                       unknown | 1 
                  tremor-18153 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                    php-5.5.20 | 1 

Detail of failures
===================

        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/2ad250726219220cc0bac04d0f44a2b77a2e3b2a/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6991f75430952375363bf82ddf413756d3ccbb69/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/f65f1901418e219fa03e931d540557822153e6d7/
     powerpc |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/ea5bda5540ab1cfa7de23d119ea1a2649124c36c/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/8b6c68260981222cb2c9ef41b98ac28393f4302e/
        i686 |             host-libxml2-2.9.2 | TIM | http://autobuild.buildroot.net/results/4fe86cb1f3f12ad83569f5ca282edcb9657d63bb/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/6bad4c0538276619302dd617bbe29880586cb333/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/a1b04f65b9ffde5e0d92d0f71064eb06e1a9da39/
     powerpc | kexec-lite-fb8543fea3beb052... | NOK | http://autobuild.buildroot.net/results/e047abea99bb9e6bd06894dde7e5342a5870d513/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8490fbfa6de95355b02d62b0f2ebe90215257d8c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5b4a102a29be2a8bdb93ebaf6606924228236214/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e2a08c9142b60d9bb17ad871268cb8a2a689ede6/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/03d4082773426ec33a06eda7c4b29f053474d39a/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/da06765f66c5aefccadb4735ca3b92dca4cfd31a/
        mips |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/28006ab35379a9b7f380d40b99a760bec1b69e84/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/410053ca2103141dcb8253e72759f128583d0e38/
      x86_64 |                       make-4.1 | NOK | http://autobuild.buildroot.net/results/2330d094bb0e37359a0d29012ffefefbbd33425c/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/ef72e1dec6a1faa70c29f90774bcbb0fb5a043f1/
        bfin |                     php-5.5.20 | NOK | http://autobuild.buildroot.net/results/588130c55871c22dc5ae162a114e4a49981f780e/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/20447a1a750b7e473dc511fe1f84b4c231f00988/
     aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/e4ffc84ee2895aff9f595c9f30cdfff350e6ea2d/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/30ce8d3e8d88fdc7db665ba48757e109fc85a307/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/c71bcecdb96f34459ac812a0c59de971f5f9b493/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/984f2b43e5a34089e27de460a99f181906fa6da4/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/e99ac205fd59cb9b1d728bdebada87169ed5ba69/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/7b3a05868a1b17512e87f98a69984ef82d08c54c/
microblazeel |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/1caec650106fe00a1ced3bba5ce3c6948c2c787c/
        sh4a |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/952051485f23b67ffc449360886d6757c385331f/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/9d7177f0f7c59731527c1ff00158fa9e72a2ac6e/
     powerpc |                   tremor-18153 | TIM | http://autobuild.buildroot.net/results/9df2f2de4cb4420f1daae534185903cf5a9c942f/
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/3bd9dbddcbc0c61573b86c46d3d5c6dcff3557a6/
        bfin |                  xorriso-1.3.8 | NOK | http://autobuild.buildroot.net/results/76adcd209f0c58c24b5feee843754c13b0a7dc89/
         arm |                  xorriso-1.3.8 | NOK | http://autobuild.buildroot.net/results/c3e4f74e962387b476a8f154713393eb045d968e/
         arm |                  xorriso-1.3.8 | NOK | http://autobuild.buildroot.net/results/c2fb1cd4e9fe022e152bf6db7d5d819b08d673cd/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/1a180652402d74e4c7e22ce99d81e01bb6d1edc8/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/6b74f3f9a20ff357bb4587558a2762b90a0eb796/


-- 
http://autobuild.buildroot.net
