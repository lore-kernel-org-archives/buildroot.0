From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-31
Message-ID: <20140401063009.675591015CF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-31
===============================

        success : 61 
       failures : 38 
       timeouts : 0  
          TOTAL : 99 

Classification of failures by reason
====================================

            lttng-libust-2.4.0 | 9 
                    crda-1.1.3 | 3 
                     wget-1.15 | 3 
libuci-262fede3e8c8c08c1eb0... | 3 
             lttng-tools-2.4.0 | 2 
              host-scons-2.3.0 | 2 
                  zeromq-3.2.4 | 2 
                 qt5base-5.2.1 | 1 
               alsa-lib-1.0.26 | 1 
        lttng-babeltrace-1.2.1 | 1 
                  python-2.7.6 | 1 
jack2-37976441044d69b91d61d... | 1 
    xserver_xorg-server-1.15.0 | 1 
           imagemagick-6.8.8-9 | 1 
                 dmalloc-5.4.3 | 1 
                   ptpd2-2.3.0 | 1 
                  samba4-4.1.6 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
              vim-699f8d8f096d | 1 
                  gnupg-1.4.16 | 1 
               audiofile-0.3.6 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5196f147c4ab4ef9a284742c59e05f06a8b9d95e/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3c9d09dddf0a2304f4e2d41e57b8681c5889c885/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f2c5822cac190e82db11c5ad5ef7f6302c032b70/
microblazeel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/e374d86e24c0054087a423e2f82687c7f6389eb5/
     avr32 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/a571f62b02928f06543fac62ffb9db98ab4d4a07/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/33c341696447affac6332bd2f36d20d33ffcdcae/
microblazeel |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/6d89f3924e5780c31f02cf03369d4c37c08d6166/
   powerpc |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/33e6d1870b7397e4dfa1214aac0d180ec9774d4c/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/3c10ca41d762753d13ac8567f4129748379899cf/
  mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/5618b3a85c233137f0e822ce83947b326b73fce6/
      bfin |            imagemagick-6.8.8-9 | NOK | http://autobuild.buildroot.net/results/33f4ba8817ece9c9c1523338371f6a5f27a1e83a/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/a8144416f0dc4364b1c949e0e0dd74d2f67409ca/
   aarch64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/495c4dc96c3070bd4923d8e7d75a974854df09b8/
       sh4 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/13f866eec1279ac6141bc428efeaa9c7766e203c/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/a0f8655db4609f164babea769418ab92aa40a97c/
      i686 |         lttng-babeltrace-1.2.1 | NOK | http://autobuild.buildroot.net/results/01fc0b233e3e14853d4109619f9423cbbe14f9d6/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/5d72f38fbd92d88835863460cc273db29fced164/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/8b1a8fea33c4810c3036c99416d340062ce3032f/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/4f195fb61b058e8b2788f2aaea61450c5bc5b158/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/23e38b48be7a7918f995a23d0ad2ca1e52dd6321/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/bbff7f0797ef6c635ddd2eca65bd4778184ae505/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/c109ae3e092354a661fc5afa57afc77fbb914d27/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/52da2fdd58fb4a5926d1e0c1c3c1f629c5721b50/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/dccfa78c8b4fbf7ca8c91c287715e525ef5e9db2/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/40d4584a70bad78203556a88623bbb18ba8fbff1/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/8ceed7ea98d21991108b46390dd278248460f968/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/510f4393e041363766abf7317f731265fb82ed6c/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/c251ffb529cde424faef2655b809c4458d447272/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/9c5b9575b749f26b5dc1d7a93c6eed0dfb491bc9/
       sh4 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/e2ece451839512ccd8f47c3554cf9e721ad96f5f/
    x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/565edd185e9c1a5589c01ca3dff0c2b974524686/
    xtensa |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/1af8f545f48898b381c7f50d5ca461bd48903d6d/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/e161d566c09ae1ce02099cdf53ce7dec427ed038/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/24b610855f34d2e9682038b5351bb3d43aec2ec8/
   aarch64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/400023ec32fb3ec9a77756dc8dad6cde264806e9/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/ac992f5d75a3670f00b46891b5e4a0a52fe8ea72/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/90f070949e98e5c24b1d5b39de807a95553d1227/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/466b7911e2ac00fd1261b8fbf1856b61af56849a/


-- 
http://autobuild.buildroot.net
