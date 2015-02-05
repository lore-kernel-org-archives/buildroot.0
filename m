From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Feb 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-04
Message-ID: <20150205073014.1131F101103@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-04
===============================

        success : 285
       failures : 33 
       timeouts : 1  
          TOTAL : 319

Classification of failures by reason
====================================

                   mono-3.12.0 | 4 
                libvips-7.42.1 | 3 
              host-erlang-17.4 | 3 
zmqpp-36413487f05b165dfc82a... | 3 
                    strace-4.9 | 3 
              libarchive-3.1.2 | 2 
               qt5webkit-5.4.0 | 2 
               dvdauthor-0.7.1 | 2 
                 qt5base-5.4.0 | 1 
            host-openocd-0.8.0 | 1 
                  ffmpeg-2.5.3 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                  libnl-3.2.25 | 1 
                 python3-3.4.2 | 1 
                 lcdproc-0.5.7 | 1 
       directfb-examples-1.6.0 | 1 
                     rpm-5.2.0 | 1 
               host-qemu-2.1.2 | 1 
       opentyrian-2.1.20130907 | 1 
                  thrift-0.9.2 | 1 

Detail of failures
===================

        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/aaa3bd21ebff03ba3a64a00938bc872443b1bfc1/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/a600be963234ad044ae07b8099e3e0b4a786530b/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/72f0aaa586a92d7c40b63ff1e3359084f29f640b/
       nios2 |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/8a6d24ecc6487fd20ba663f71996160124083a68/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e43152cbe2aa596055928efed48b76a76eda4c3f/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/de29c8a7a83d2cc310e8c5a6dded4e5173b67399/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/50c587c6e00c0f85e785aeab20b55dde0fe044a3/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/490f23bb3f927ff4610629f4ad99c9fec0c934d4/
         arm |             host-openocd-0.8.0 | TIM | http://autobuild.buildroot.net/results/6edd6317774ada64bc6de7c7eafa1f7a860457ff/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d98cf003c66f3c7363228fdcfcc2ce5dd935ba32/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/2c695e0b7093cbeb8eb7e3680eac3b858552daa8/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/08499dbd9dfcaa76f5ed38b944148376ec57c141/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/3dc91ec96ef2c9bece39e88df5150a14f61367b7/
     powerpc |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/e017f11df1f32edd3f9e85f25eb8e928f96ed56a/
      mipsel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/cdc7cf5d3501f80c74b70aa09f93b2ad4e2f8602/
     aarch64 |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/39173dbcbbd0a243900ea583cec024b51f8b803a/
microblazeel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/6794705195bcdb636a8e6582ef5a1e153d4d66b3/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/56bd9543940458b850dcc0ef52f0396763b2c6ed/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9b8d9092683ae6436ee9c782a76a48e8ff947013/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b4b379e931cafd2bb53447fe6616bfde07edf371/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/837d2767902368c5a2fd7131551f07287218d703/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3938a0fe4791177bd990eceecb40f89725ae6662/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/dbe238c9a4a2f5cf86cc8fbe28ffa6bfa0493abf/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/b8676d102d23bb7707ef6ceccd2f137dec691dc6/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/84d3285cc8e2669c4ff4c1be3a1e8ea9a6933779/
        i686 |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/914056cbd9787aeae4c8b42e8a37453b1a271a02/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/98b70ea09ecef214f13a622dcb926e01a6d6f7d9/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/9e415e7707658c22034aa7d9bcb26b4ee91c8708/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/4978808fdc2af9f6f786bd37b8fdf9d1ad27d813/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/951fe549e577b81e171d736d10c7ec8941b706f2/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/cdb8142b984874f548a1a4fbd10f1e8c7603d1c6/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/8c6a1a6855e6ce58f0071bec128135d76fa62c35/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e77d4d13c748c494bab8808b7aad0da798422658/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/a1483d268e2ac287026f721978fd2d16464545c2/


-- 
http://autobuild.buildroot.net
