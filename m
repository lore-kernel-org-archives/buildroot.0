From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-15
Message-ID: <20140916063013.B9D01101D2C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-15
===============================

        success : 192
       failures : 31 
       timeouts : 1  
          TOTAL : 224

Classification of failures by reason
====================================

                 gnupg2-2.0.26 | 4 
                     qwt-6.1.0 | 3 
     openvmtools-9.4.6-1770165 | 3 
                 webkit-1.11.5 | 2 
       gst1-plugins-good-1.4.1 | 2 
    bandwidthd-v2.0.1-auto-r08 | 2 
                  thrift-0.9.1 | 2 
                 lcdproc-0.5.7 | 1 
                 wayland-1.5.0 | 1 
                 cdrkit-1.1.11 | 1 
                    ruby-2.1.2 | 1 
               libcap-ng-0.7.4 | 1 
               polarssl-1.2.11 | 1 
                    strace-4.9 | 1 
                 libpfm4-4.3.0 | 1 
       opentyrian-2.1.20130907 | 1 
                 omniorb-4.1.6 | 1 
              librtlsdr-v0.5.3 | 1 
                  autossh-1.4c | 1 
            gst-ffmpeg-0.10.13 | 1 
             lttng-tools-2.4.1 | 1 

Detail of failures
===================

      mipsel |                   autossh-1.4c | NOK | http://autobuild.buildroot.net/results/c053705254567c8f597a10de2c83508cabd74d59/
     powerpc |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/5100a7aa2ef23407d8e070db0c517a0264088b59/
         sh4 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/994cad69ccbdbf7e5746458797a849a2c702bdf8/
        i486 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/89a1418903affa224d4f8b674942778d58d5d52b/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/e5a3bc5169f23865a98606e0d3a7c953375b2634/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/45da9b3228af789897a8b5407110e8c7896d6de4/
     powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/9dff8b995d5c9b949cfc71a6b71f270eb79b435c/
        i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/ce18f61aab6b450978644d78481c3fb338907111/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/d9729da6d72f363640d3cbe397d7cf2f54d23e67/
         arm |        gst1-plugins-good-1.4.1 | NOK | http://autobuild.buildroot.net/results/ee985d94da6a7115b6e62cf407e3c6a90eb3e4bf/
         arm |        gst1-plugins-good-1.4.1 | NOK | http://autobuild.buildroot.net/results/2e3463aabf06f5ffbea691fc83f4f793d1a3c8df/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c8dd1519f1c9108cdee452b4ec149dd560b3a5d7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/97312e61b5dd6e1f4d9437478f042e30c4a5c06a/
         arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/cf86fc3aeb50ff1df0464d0f85400881ad02b8c7/
        bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/c0df18760c5fdb531b8a098934b92254c35514ac/
         arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/f6153a7f8054f3d6c82c4539e70824de1f3447b4/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/c160b9160b21b16a39dd739222844228c8efe7bc/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/1c9951ed129dab9fdb030ec0bb08a28a8d441be9/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/008e4960f8e22283b716011cf929e0daa75d13d1/
      x86_64 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/b0ad6a1f5b1c170cab89cc502fc08e065efc985d/
        i686 |      openvmtools-9.4.6-1770165 | NOK | http://autobuild.buildroot.net/results/d1bf0d43389ff536ec79dd5d6a7cd0b12293233d/
         arm |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/31e8c4e29d51039cd5d213c2fe176a9cc39879da/
         arm |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/d0f9a4b90f62a5e8a1f8b6f99739237ba7eb4174/
     powerpc |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/76f71798b74d30e9d28e316cc153a2d7547950c6/
    mips64el |                      qwt-6.1.0 | NOK | http://autobuild.buildroot.net/results/2ba015acbbfb574cd1b7b5789515c5c5cbfe3c61/
     powerpc |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/09048ab80f6e5c0f3fb10e8f70e31f532ccda792/
        mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/37cae7640a2adf135424bc246c518b4c0ef0bf36/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/a0c8ec3e92d28f6f7123f8b8843decc44ff8cfb0/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/3deb86b9cd8c70a08544dcc005bc29c39ba8f04f/
        bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/45cdddc53639ae451ef2fbd04881228467ed2f5d/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/156d5734a8261f93e1c97a4a2fba89412794afc5/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c1ac3c7a19c06f231df98a39ae54e3d4ff74ed1a/


-- 
http://autobuild.buildroot.net
