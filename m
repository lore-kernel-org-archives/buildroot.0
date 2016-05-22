From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-21
Message-ID: <20160522063022.4FEFC101587@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-21
===============================

        success : 174
       failures : 43 
       timeouts : 0  
          TOTAL : 217

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 4 
                 rsyslog-8.9.0 | 3 
                collectd-5.5.1 | 3 
                 jack2-v1.9.10 | 2 
                blktrace-1.1.0 | 2 
                    ustr-1.0.4 | 2 
                 host-go-1.6.2 | 2 
                   mplayer-1.2 | 2 
                 mesa3d-11.2.2 | 2 
liquid-dsp-df5a459fa05dba41... | 2 
                pinentry-0.9.4 | 1 
        ltp-testsuite-20160126 | 1 
                    mpv-0.17.0 | 1 
                moarvm-2016.04 | 1 
               valgrind-3.11.0 | 1 
                   erlang-18.3 | 1 
          sane-backends-1.0.25 | 1 
                  connman-1.32 | 1 
                    putty-0.67 | 1 
                grantlee-0.5.1 | 1 
                     vlc-2.2.3 | 1 
             stress-ng-0.06.02 | 1 
                oprofile-1.1.0 | 1 
                 lvm2-2.02.153 | 1 
                    cups-2.1.2 | 1 
iputils-31d947cf7156cf78d3f... | 1 
      kismet-Kismet-2014-02-R1 | 1 
                   systemd-229 | 1 
             qt5location-5.6.0 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9560c1689fd980316c7d5076d84ec82cc40615a2/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f3dbb71bde1935ae91909fb029e89d0f140e8e8f/
         sh4 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/626990dd22c93b6662adbb0a09cc3879ab8fbfb7/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/2063883d5aa3e5d6bec2fdcda4d9da550364e806/
         arc |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3ba13845214b1faac04d44212c55b3b4ebb3d834/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/72fff374c9553fadcb825f482b68c614ac452385/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/d333514d27c9ceb2d9bc00e4523a68aed72b9113/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/cc727ade61f7048aab8fb5d8f2fc334a5abba659/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/e7def64ef311b914350ff72d7b368c0de5e6301b/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ed6fedf4860e3f757a81663f3ef70053da94a88b/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/a9bc5a0680ef662366c0c4217a87b5468240feb7/
       nios2 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/2674395c1d804df68e7e4bc9bba1d6b7fc6d2dce/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/efe4c4ea0db2b05733361165c8005073a79f40d7/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/369130e5f05c2fac4f4bfbc1d4d4db34dd3cf3f6/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/f297d25c56f05aa9803e18a392ebf0fe2c3c84ad/
         arm | iputils-31d947cf7156cf78d3f... | NOK | http://autobuild.buildroot.net/results/af40bd47486817091fc22b3a4956a1f2614faaab/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cf5e2bf38412b9b6c51582fff7f189bd7b906b14/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/48367bdc5e2f466ea12eb573ba9f5265887a62f4/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/ea5106a94e7e1a5a2e391414b80da552fdb05bcf/
    mips64el | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/e2f7babbeca200735a234b3fc7973914f0443c45/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d6b8d658674b25310251aef775e49b6ae222573c/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/ad6122c8b02a4b5dbc4e9b4a2914c64ae5be26f0/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/a2cf52965109af7f4259bdcd909060a8d59d415c/
        mips |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/8e255d5a08851784612253dd098e738efe211896/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/2d229d6bcf7d46124ec031e19188dd1922d78c4f/
       sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/3e0e34110a70d182c53083e2cfb09f6763254b94/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8c76b9d1e4f4e150606a675f448a820df0226b06/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2d55ab86a9b99e1043962a7f9b2c052af0e7a508/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/0753c919ab5f120dbedc58636b7ee91472ae7a15/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/3584b52768b5150eb3c92dc3b0a0b90b37723774/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/bc196aebd9b5fdc4c404029f932bb3158f0c43d1/
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/84b8e3e73f7e70ea1f013fc7c1120cf23095a77a/
     powerpc |              qt5location-5.6.0 | NOK | http://autobuild.buildroot.net/results/ee63b2003197ae21182aea248d413850eadba460/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/69d11d303a4ae8e15b0a1778a67aa6e29fa576c0/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e63abaa4c5b733d52ebd64cb99d49939fe254540/
     powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/cd590b7c8a99944b510f0400536e768f12b8a37c/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9345649e01421e7a5538c350339f6c9653dfd07f/
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/6d3159334a748d9aaed0f10e090460bf58af2e68/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/a1f44267040cee5954556108b9f02fb9373990da/
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/9e13c9779a84312bcb094604acfa6ec626697aa7/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/f5115516bd514afbb71a9460e82c889bcc18e7e2/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/df3c262a8f97b1ca3771382cb43181028dd7691e/
      mipsel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/c981c24933553f810384ef2adaf19a4ac97bb210/


-- 
http://autobuild.buildroot.net
