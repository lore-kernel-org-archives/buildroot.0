From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-11
Message-ID: <20140512063008.74E21100DB2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-11
===============================

        success : 87 
       failures : 32 
       timeouts : 0  
          TOTAL : 119

Classification of failures by reason
====================================

                protobuf-2.5.0 | 6 
           host-protobuf-2.5.0 | 4 
                 cairo-1.12.10 | 4 
             lttng-tools-2.4.1 | 2 
                    sdl-1.2.15 | 2 
                 host-gdb-6.6a | 1 
                  libeio-1.7.7 | 1 
             armadillo-4.000.4 | 1 
                 webkit-1.11.5 | 1 
            btrfs-progs-3.14.1 | 1 
                     lsof-4.85 | 1 
             alsa-utils-1.0.26 | 1 
                  cppcms-1.0.4 | 1 
                    crda-1.1.3 | 1 
               alsa-lib-1.0.26 | 1 
                elfutils-0.155 | 1 
          glibc-2.18-svnr23787 | 1 
jack2-ab409a65df95bc261ff72... | 1 
                aiccu-20070115 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/7864cd5789a9f9b9f0603d738f4e63822d8469dd/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6a89535c0806939dcb6d4160899bd242a0648fb8/
    mipsel |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/8ca7fb8e4b1da8c1a7e4d646469779e4032877ab/
      bfin |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
     avr32 |             btrfs-progs-3.14.1 | NOK | http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/
microblazeel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f94aa7382de01decbf0cd24f00a4ad4c0da1d5af/
      i686 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/036601736a9d593f7731cefff24a6364e95b5550/
   powerpc |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f1ca1a8f7ca8456003c6f17e146151a99835c4c0/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9b7870354d70e27e42d3d9c1f131ab54706bf20e/
     avr32 |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/a26574419aacbea4140dfca1d503bcab599edd71/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/272f18410e4855ab6b3bfd8a44243c1ebecf6abe/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/993247d885172e64eea4f630558633a6ee488986/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/01a23f0f014cfa6d28d65756437ac044adfae206/
      bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/67708ae5907a5330bc1d06d38281357b0856922f/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/c2955bd85f98106692a849858ea4947bf7bcc1fb/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/7d628f590a5a99f6fff97c02db6197789c7e01d1/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/76173e148207d1238cb970c69d2c35151f1fd468/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/a2ebc5745a3f16d5b7090a7414ffd0c1d535b022/
    x86_64 | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/ca81fb8e31a976513772970358f8d399bebc8fa8/
       arm |                   libeio-1.7.7 | NOK | http://autobuild.buildroot.net/results/27854bf8425d64dbb475653161bbf1f386173366/
       arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/908ba3ab5a830696dea649f1623f74579083f4c8/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/71978ab25e521e4b06337a98d9a4aeb73c710b53/
      sh4a |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/f935c159dcafe7fd31caaddfeb93f75ddf6fa903/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/d0014fc462016361e0f33707932f5fce7d8fd832/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/d63de54ae546f434a4872da0ccc1f9cc685fd8b6/
       sh4 |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/400895373468b137138a0522bc00800b80ac3526/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/071ad52698e199eb762387d22ae83d8e6635e20c/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/1d65724a1206ec15842f7704b63c7ebd4c99d077/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/05d6d0bd1b001fb7027589768cbb25cd0d18f52b/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/e3765ce8f7f02045e7fe8bd578735bdd5499288e/
    mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/070a19eb24f0b3d1516679ed3e2d1a54dae2d7cf/


-- 
http://autobuild.buildroot.net
