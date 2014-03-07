From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  7 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-06
Message-ID: <20140307073009.8C19D101B88@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-06
===============================

        success : 72 
       failures : 27 
       timeouts : 0  
          TOTAL : 99 

Classification of failures by reason
====================================

              host-scons-2.3.0 | 4 
                    crda-1.1.3 | 2 
                     wget-1.15 | 2 
             libxmlrpc-1.25.26 | 2 
                  zeromq-3.2.4 | 1 
               alsa-lib-1.0.26 | 1 
                   duma-2.5.15 | 1 
           imagemagick-6.8.8-7 | 1 
         host-python3-3.4.0rc1 | 1 
               audiofile-0.3.6 | 1 
                  python-2.7.6 | 1 
                 lvm2-2.02.103 | 1 
                directfb-1.6.3 | 1 
                 cairo-1.12.10 | 1 
              wireshark-1.10.5 | 1 
                 mplayer-1.1.1 | 1 
                  samba4-4.1.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                     vlc-2.1.2 | 1 
                elfutils-0.155 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8a8fda68ebfd872d4632334d5060a07d9b9d743f/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ce20a1f4a829f66390f71a9c3426fdc2b95d1c72/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e5ed078ea637cdae59b6e91641928847503e747d/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/0a0a31e53ad1a5811465f250ef99c878f6058440/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/26127ae9eca9061c66d021e557519b99bf49188b/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/35738e3d3107ef1e1dbaeb3a10485bde995ab46d/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/7165872487e27a0d1eaed97cdb3f2571fdaa1370/
      bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/ebd84315389ba74de82e44eb112d21180831b6a9/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/cfcdebc28704d00a05f97820159f796fe05b5b05/
   aarch64 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/e62daf863dbedc48c5cd1455570baba8ec10f5f7/
  mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/9fab5eff4be855b1e86925388e304d0b6e264dc4/
     avr32 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/e2af6375176ca08553e5e32cc52ea22a0a0c50f6/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/9eaf58b56d43757a32ac4cd3eed368a453ad110c/
      mips |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1ea235cd8cd6fe3d1bc84b76978ec279de0109eb/
      i686 |            imagemagick-6.8.8-7 | NOK | http://autobuild.buildroot.net/results/539daf4d9ebc50c16d9303f6dde7951345b6c2ea/
  mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/3949203608b02e0c30d64b4e12d147f2a6d67777/
      i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5047bed31db2f57404ce20d15760e2856038c994/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/39bb5b70538f2baff04d2834e162fa50d391483a/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/1e3613a032da6b1aac37c0e2625c2f01995e2d76/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/4b3c52d6077c460758c2d75e22b642066503e078/
    x86_64 |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/c9d57228175c932e86210b6b6b4ef1177b44234b/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/a34abdcc92a6b2cf976760d66adf6c7572743bb4/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/085485b1cea7f460e6b2b1664fd655f675260815/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/217188d23b67187bbddeb943519d178ecf17d061/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/e450d5efc7435035c956bb962d598837648f319d/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/163eeef59cf0989aa5848043e7c1099c99a53f46/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/39996ae41f18dea64d414558e9fc6fc5102d075d/


-- 
http://autobuild.buildroot.net
