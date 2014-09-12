From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-11
Message-ID: <20140912063012.AF99B100DEE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-11
===============================

        success : 224
       failures : 41 
       timeouts : 2  
          TOTAL : 267

Classification of failures by reason
====================================

            libsvg-cairo-0.1.6 | 6 
                 gnupg2-2.0.26 | 4 
libshairplay-139d5ef5556451... | 4 
                   erlang-17.1 | 3 
              librtlsdr-v0.5.3 | 2 
libwebsockets-v1.23-chrome3... | 2 
                    strace-4.9 | 2 
                  zeromq-4.0.4 | 2 
                  tstools-1_11 | 1 
               php-geoip-1.1.0 | 1 
                 webkit-1.11.5 | 1 
    xserver_xorg-server-1.16.0 | 1 
       directfb-examples-1.6.0 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                    ruby-2.1.2 | 1 
          host-gcc-final-4.8.3 | 1 
                xapp_xfs-1.1.4 | 1 
                 tn5250-0.17.4 | 1 
                     tcl-8.6.2 | 1 
                libinput-0.3.0 | 1 
               host-ruby-2.1.2 | 1 
                php-yaml-1.1.1 | 1 
                  thrift-0.9.1 | 1 
                 libpfm4-4.3.0 | 1 
                     vlc-2.1.5 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

    x86_64 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/ed2d4261aef005cd7a567bd01dd8e7c8a96aa2be/
      bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/d887796b7bd54dc167a266cb2dd9ac13722bc51c/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/5f33b561e46c8ec263e7cf25d91d9a73a85dfed8/
       arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/631ec8b719fb8878141a4ad87c1fe84b1297a96b/
       arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/1f313aee75328c27e260c55dbf7caa5d3d6a07d3/
       arm |                    erlang-17.1 | NOK | http://autobuild.buildroot.net/results/2f213d8cf6f828a68a2f36bb95564b8db043e7a2/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/5d66eb9e0976963adf30edd32db6db26b92a8e66/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/3b14a241da1b4756b082d1aeff79c6bc80f9f04c/
       arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/d379b236b5b7e2476d0ee1537e72e9ca14ecbb8a/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/7b018d7f44f37b566259465f563e528b7be5b9cb/
       arm |           host-gcc-final-4.8.3 | NOK | http://autobuild.buildroot.net/results/cc62c9ba0e4e03bb2695b66d8d6284bad699802f/
  mips64el |                host-ruby-2.1.2 | TIM | http://autobuild.buildroot.net/results/104c289e79921221b7f625f01cea44998350fed4/
       arm |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/9a9572a421db1a5733f96dc47d9b889da0de7dc7/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/405da9a945511329929b18740b983c51b8dcc43e/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/27e0b6d00cd0f75d1be7294f4798d5fd422f5f32/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/cb52ed3d34dca6c68669bfcd9b28c6e1a5aca019/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/561817d8b3156b537f4bf76eb539658144a6efb4/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/5e7bb6c3c1bde627fc8129b734f3f9222c2331e9/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/b27466d56518e47d75cc437a962ae3c3a9a2aa3e/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/78340ee174029d7a24b5078751b5b53a3547e10e/
microblazeel |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/f66b449228825765146a6098529d7705695a217e/
  mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/0b3fb2ee9916aa265df5b6e4f04f6dfa25d1fc84/
  mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/b7e490b7d024bdd9ae0ee09fa209aa4dd40b3fd1/
      i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/df9dfd5ef36f64390bf0f6a6de6ef16f5c01e778/
      i686 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/d0fc233bb97c2ea18344746a5b7c63c8de65330a/
   aarch64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/146944da7c5fee565c801c02886eed2bdd48e2d9/
      mips | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/34935667d4318863a6166153d78d8f3195763eda/
   powerpc | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/cdc36e0bcff3299b6707375d2882508f50fbe886/
  mips64el |                php-geoip-1.1.0 | NOK | http://autobuild.buildroot.net/results/e0cc0e0b10c721bcaf442203f47d5f7083084c31/
       arm |                 php-yaml-1.1.1 | NOK | http://autobuild.buildroot.net/results/a2d9e701494bdb5b1f3cf0e44b872c3665ac1186/
       arm |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/c483e65783d41907042d06b8fabedf15ef415cbc/
      mips |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/04de887fd501e1a1b9f811dacdf17596256097e6/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/91c0413e755c365332bc15d1d69ab3d6160ae78c/
    x86_64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/340c62da3e456bd6a5280e7f79d759ab30d5efec/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/dd2345008cf7e14c68f16dfd6bfc34d865b97fa3/
  mips64el |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/25276f4224795c2c81c3df0447d0ff5ddb60c283/
      i686 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/5f430a8e210240d27d19abc626f6be6743a8b6b4/
       arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/7102921b0a8d3a09bf7b3f5f18e56dab6ef36402/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b81759d9645bf653c4fb4b79ad39377a7e377083/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/c36eeeb7a410b00a5d0cf79e783f3237b9720d77/
   powerpc |     xserver_xorg-server-1.16.0 | TIM | http://autobuild.buildroot.net/results/01fb76df24ded1e32ea3e524b39e43b12ab6a1f3/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/5204f6c2f965f945403ae88203ea7c9cd5a5cef3/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/aca005531eb70f171888fe9cda9690a6f1ec1f21/


-- 
http://autobuild.buildroot.net
