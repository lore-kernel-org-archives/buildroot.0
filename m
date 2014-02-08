From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Feb 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-07
Message-ID: <20140208073009.5C3E6100CDC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-07
===============================

        success : 99 
       failures : 33 
       timeouts : 0  
          TOTAL : 132

Classification of failures by reason
====================================

                     vlc-2.1.2 | 6 
         dvb-apps-be76da69f250 | 2 
                libnftnl-1.0.0 | 2 
         qt5connectivity-5.2.0 | 1 
                   open2300-12 | 1 
                      qt-4.8.5 | 1 
                    systemd-44 | 1 
                 cairo-1.12.10 | 1 
           imagemagick-6.8.8-4 | 1 
             util-linux-2.23.2 | 1 
               w_scan-20130331 | 1 
                 libxml2-2.9.1 | 1 
                oprofile-0.9.8 | 1 
                       joe-3.7 | 1 
                coreutils-8.21 | 1 
                elfutils-0.155 | 1 
                 qt5base-5.2.0 | 1 
                 webkit-1.11.5 | 1 
        ltp-testsuite-20130904 | 1 
                       kmod-16 | 1 
                    mpd-0.18.7 | 1 
                      icu-51.2 | 1 
                  thrift-0.9.1 | 1 
              gst1-libav-1.2.2 | 1 
                rtorrent-0.9.3 | 1 
                  samba-3.6.22 | 1 

Detail of failures
===================

      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3f004a970796cfc22bc2256767e4c5dcb87da78b/
    xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/566dc533f7afe7279d8ee53663d2e9c5a3952a96/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/310e355f2f601801e4500b9d3e714d3883e7aa32/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/90e1a2e3e428e6c3fe5b51668ab92c139f176260/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/5b5eec3fba50ee8ce4d5908a9ee368e4e72d87a1/
    x86_64 |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/5fa8193a716c8f05bdb99f5446709b1ca906496a/
     avr32 |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b741e1ce412bec7f7e14ab1dd6385b9e55140c6d/
      i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/5c118d29d0f1ab73b24721be64fbb82f0c3a3b8b/
      bfin |                        joe-3.7 | NOK | http://autobuild.buildroot.net/results/f920c85244afffe38497459753bf005946001d0d/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/9d88ec290a96a5862ba03a9b7d8c9b9a8c2558f4/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/b401337fdbcd73dd944067bfe05d1370d455acd3/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/1ece4286d70f2ae033c1dda9d481050d16cce695/
       arc |                  libxml2-2.9.1 | NOK | http://autobuild.buildroot.net/results/7158a2a19da6bfa950125a951a39061ccaa73101/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/19a77a8c2537a92e386d5f1d1c10ad914fe02236/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/33c1367f7c299ef00cb880386b1416490bf8e1c5/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/d60b908aca08179fc495c42d51cc1625f51f394b/
       arc |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/514f484496750317a5b2f371767a09730c8cf721/
      i686 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/550b1542367eacfb11fb1c32ef496d2a30d391c6/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/91f273dd11280f0d74f7892e66a47114b395eddb/
      i686 |          qt5connectivity-5.2.0 | NOK | http://autobuild.buildroot.net/results/7fe5eeb89190c790f8e6783aa1a21e47907a111b/
       arc |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/a37dd7663a19897421c9cee99679710a4b56b3fc/
     nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/0e86eb19365fbe4f6e341638d0c13fb1ad15c707/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/490d9730ddffca4f105fb6cf73ac4ad28e6e1eb1/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/a972190f8715b87f38023170b3e907c99e5104fe/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3a734dc7271c080ef9d5ad88faa1d031db6afdab/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/19f1450ed5453aa666bc7aae2e965ad81e5f845d/
  mips64el |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/5e42d1139bbbed2421193d8acc52df9442c43730/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/344af6e756a5f2c1ee515a355ae5b288401c4c71/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/41615b8c9b09654a3f7b750cd784118c1e4795c0/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/f8bed9a42f1853db8aa81161d7be5a7cb67afe8f/
      mips |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/d03753f956db98f7a1f7c5b7a5d534e281827c46/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/77966c174bfaecce947fee0de63740cf801ba534/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/549564293607c959fa09e12510bb2aaa79f4f479/


-- 
http://autobuild.buildroot.net
