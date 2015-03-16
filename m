From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-15
Message-ID: <20150316073020.6611C100E85@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-15
===============================

        success : 269
       failures : 45 
       timeouts : 3  
          TOTAL : 317

Classification of failures by reason
====================================

                  snmppp-3.3.4 | 5 
                  boost-1.57.0 | 3 
      host-gdb-arc-2014.12-gdb | 3 
               alsa-lib-1.0.29 | 2 
               batctl-2014.4.0 | 2 
                   strace-4.10 | 2 
                 binutils-2.22 | 2 
         erlang-p1-tls-53f0478 | 1 
                     vlc-2.1.6 | 1 
                  thttpd-2.25b | 1 
                     nut-2.7.2 | 1 
           libvncserver-0.9.10 | 1 
                libgsasl-1.8.0 | 1 
                gnuradio-3.7.5 | 1 
               qt5webkit-5.4.1 | 1 
                bellagio-0.9.3 | 1 
              strongswan-5.2.2 | 1 
                  guile-2.0.11 | 1 
               libcap-ng-0.7.4 | 1 
     host-python-cheetah-2.4.4 | 1 
                  libnl-3.2.25 | 1 
  toolchain-external-undefined | 1 
freerdp-b21ff842ef3de583751... | 1 
              postgresql-9.4.1 | 1 
softether-16b713b98da8dba29... | 1 
                     gdb-7.7.1 | 1 
               sdl_sound-1.0.3 | 1 
               libecore-1.7.10 | 1 
           xlib_libXfont-1.5.0 | 1 
                  weston-1.7.0 | 1 
                      qt-4.8.6 | 1 
                   attr-2.4.47 | 1 
                collectd-5.4.2 | 1 
                    ruby-2.2.1 | 1 
              memcached-1.4.22 | 1 
                    php-5.5.22 | 1 

Detail of failures
===================

        bfin |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/b6c5dc4c4bfed3e23ebb698bc3b262798fcbedd9/
        i486 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/e3ba9ff32f5e3281fe1188319fccbbbd4d990fab/
         arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/a1fbd396eb5ec4b0d67721a4620c5be660c255f7/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/c86f81c7821c0afbdfb83339bdc9ba9c957f1c83/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/ea98a9fb32f82d12b48d9b790f6f3f535ef4030b/
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/05fa9cb522514e9e5b9e81893f145aab00abd803/
         arc |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/f810ad94ce0ddfedbec118d8c5cbc08a91ad71f2/
         arc |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/52abadacd7aab2d5c11d094937f28198bf220662/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c82625bfaffcc87c39d308c6f60b4da2308d15ba/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/95bb27209f64eaca51f0bf7873403b150b8be002/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8a937afb075b602231a862b937f20b4f70134ade/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/2efb5c6c85496fab2591d3a12e81f5020c1e30b3/
     aarch64 |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/9c16c03760a2e988a9c488e7da47ba02a4cd7181/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/39c68dfdcff85c7dec61af814201508127e5fe65/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/bcf8745d1d82036824d28f7e946ca69f86f5a94f/
      xtensa |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/6994610a3283975064fae98e965954b3825ce694/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2bf348f32498a93753aae8e013653eaeaa1eb6d0/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/81c97224d2748c52c9e1596acbaa875569b0b5e0/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/8566964562c93cde9eb85fb4851bdd49b1c11f72/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/baf7eecbe9d76d10d0596707ca39c1cf3d6020aa/
         arm |      host-python-cheetah-2.4.4 | NOK | http://autobuild.buildroot.net/results/a1f0666b8c7e390b7edc99ab69af200bde9f5796/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/cac821ccbc0450f460d5cbb05e6265a5fa135229/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/1662786cb768d51a3c50f8037f8e31ac2bf503db/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/5c540279a3c4c1eb9e672f3285b16d078703b5dc/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/90c318e3a9ef5e626d0a80e36695d34eda21f97e/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/f5479ddbe788bc01093065377f30ec1e5ed2e4ab/
      xtensa |               memcached-1.4.22 | NOK | http://autobuild.buildroot.net/results/cd8e9d9a5f454c321071c21192958aeee9c39e73/
         arm |                      nut-2.7.2 | TIM | http://autobuild.buildroot.net/results/34510021407db28d0a377045815c1c9447b0fac1/
        i686 |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/3a131785734b59d803f32bc1bc717929843c82d8/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/4ae938730a74f2be0f74fef8a99622f8f42742af/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/34d322833d3eaf9344efe9202f7a0686893b7946/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/ed68e72410d156cfd77196bed21300a0cc42d9ab/
        mips |                     ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/d55ace075c466f403ad137ed7b84a2d7a34573bc/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/fb0f88523c50b557af0b916f6f4ad9f93ce3aea8/
    mips64el |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/2f42e7a58823a94ec61f05fd06b1b4b915ac5e57/
        bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/ddf6792001e3ff9e3a6ca88c03e0111a3bc1b1f9/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7801e1a204c28da266548782ffafaeb499eefd00/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/7d275a911f72d4483d3336b3fdb5f17ff817d920/
      xtensa |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c1eccc90dab16d22b4621ce20cb9aa78357bdd52/
     powerpc | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/244b2131461ab578fd9d141ee7f6653f3be2751e/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/7a4394f06b2cf06b76368eb89a5aef9bf9288b08/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/7b8cfe6b253385ce7f9ce49d43c86c1c6c32b3e3/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/78ddf3b61dc7bcfbccff9163a5e1687cbf454501/
         arm |                   thttpd-2.25b | TIM | http://autobuild.buildroot.net/results/d82f151f3c53bae970f872a76ddea7ef9e2661d4/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/db212f1fda127a7f2345bceed00df987bd42c839/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/97457d27ce19e58d3feb6438958897e4d8efce65/
      mipsel |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/46c8ce7fa09aace892603511001736796d1efe7f/
      x86_64 |            xlib_libXfont-1.5.0 | TIM | http://autobuild.buildroot.net/results/383038116a9a3fb737973aa6309e1e10c85869c2/


-- 
http://autobuild.buildroot.net
