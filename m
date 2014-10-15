From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Oct 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-14
Message-ID: <20141015063013.54B8F100CDF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-14
===============================

        success : 191
       failures : 19 
       timeouts : 6  
          TOTAL : 216

Classification of failures by reason
====================================

  getent-buildroot-2014.11-git | 9 
                 webkit-1.11.5 | 2 
make: *** wait: No child pr... | 2 
               valgrind-3.10.0 | 1 
                upmpdcli-0.8.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
            host-heimdal-1.5.3 | 1 
                 rt-tests-0.83 | 1 
                  thrift-0.9.1 | 1 
                     radvd-2.7 | 1 
                       unknown | 1 
                   nginx-1.6.2 | 1 
                     rpm-5.2.0 | 1 
                 samba4-4.1.12 | 1 
freerdp-440916eae2e07463912... | 1 

Detail of failures
===================

        sh4a | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/51935458bd8c10491f8108609eb51d9590675a44/
    mips64el |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/971bf687aa97f8bc8c2089f111e1b1e2ab715b92/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/2e69b7f3b13e558d3f06b0fc6cc4195d58c95ea0/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/ddcf65e1690445ff191ab821bff3b55026971daf/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/615b9d17f713b4a53192efb00188560a76b9efa3/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/60f2990bc0cfe59681cbf81c5f77a2f0f1fcfd0f/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/f4636d3a97b222569a522429bf1a0691ab8f4282/
    mips64el |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/2f79ca24ddff4eb027c8f5a54af55b371fffae86/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/45ca978e45fcf38880c35fc50717d21ebd29370d/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/85d1e6910da665d9817c3acfcb88fc51489d1bd7/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/8ba14d38713de7833ad0380bb90e0630cd94b6d6/
         arm |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/3cb31cb665fb6678d8744d3530994c69a398017e/
         sh4 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/4c9f972f726afe5ca6cc99317c877aaed42e3068/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/de330f0a7ab9de3420a957fcdcee57abdb714d99/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/6182ec874f8329abb5d5c76a2aebb5d3bfcf086f/
         arc |                      radvd-2.7 | NOK | http://autobuild.buildroot.net/results/84dffb8d97c19ef83c75b822a02dccaef50ab4df/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/8d2d1651edc9a1e86909a9ab0f0bdba7c516c4eb/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c16288c7f46ee65ed4955e9480105ddfcb5ae130/
    mips64el |                  samba4-4.1.12 | TIM | http://autobuild.buildroot.net/results/b0473e01d5cc5dd40b2c81428ee59e762fbc0d72/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/926e0b3af71ac7cfc5b08012345a845468311b52/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/8b2c8bccd28ad3db50d57a65a958023c1ee9323c/
       nios2 |                 upmpdcli-0.8.3 | NOK | http://autobuild.buildroot.net/results/79b29b24d8406559eb3997f96b1b2386a83638fd/
      mipsel |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/6d2c3d62a94fb4fc4be5c016eedbc6a35e46bee6/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b2d1578de32c237b50c5e41c491eef680e3cc058/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/ce70030311cf3e91b76be8ef8175438d9200741c/


-- 
http://autobuild.buildroot.net
