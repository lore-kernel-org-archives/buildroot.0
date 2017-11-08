From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Nov 2017 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-07
Message-ID: <20171108070008.061A7207AC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-07
================================

      successes : 151
       failures : 44 
       timeouts : 1  
          TOTAL : 196

Classification of failures by reason
====================================

                  ffmpeg-3.3.5 | 7 
                   jimtcl-0.75 | 6 
       host-go-bootstrap-1.4.3 | 4 
host-vboot-utils-bbdd62f9b0... | 3 
                      qt-4.8.7 | 3 
          usb_modeswitch-2.5.0 | 3 
             lttng-tools-2.9.5 | 2 
                   mp4v2-2.0.0 | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
                      feh-2.21 | 1 
                  fwup-v0.15.4 | 1 
       host-erlang-rebar-2.6.4 | 1 
      host-uboot-tools-2017.09 | 1 
                       jose-10 | 1 
                 libdrm-2.4.88 | 1 
                 mesa3d-17.2.4 | 1 
                openobex-1.7.2 | 1 
           oracle-mysql-5.1.73 | 1 
pdbg-77158819158d1d7053a737... | 1 
                    php-7.1.11 | 1 
           python-numpy-1.13.3 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/041437164ec1581a5c3b19183797f1bc263580a8 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c6e2bc6e0ebae04d6dfbab58cd762bf8f3bef195 |     
    mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/5b65c305b50664e02d5f8022278055c80739342d |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/54b74d624e58f12a61c977cd3b5e1da13df5b2aa |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/a324c9f8d1a3c36e3fcccaa127799bb577f46459 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/1fa0b58195ca5487e728922c7203b7f1c52969e5 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/007ab2faf8230419812834c5921eac9a78061cc3 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/6a39feb2bb3b4ffc3e94beddf73606c5e0e37416 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/193bc814e1b18897e03d6c076081d1786fbc654b |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/822ce8032491fa7afccab009af74349430f63650 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/babd5b277c836d690f996c8ebea43fcbecea3044 |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/488009fea599e9521f7de5709b007fc00f7c5786 |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/f51d0b06a9f2d5e23ea41b857ffa9156d7e0858d | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/c3e14ff5ae6d816909089fb6fc90cee2a123d67b | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/19d61063645ac0d1b2ae4371150e75ce4ed9ff20 | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/4b6b8448f7c7a7a9f831624e0aeacdbc56e6c4d6 | ORPH
      mipsel |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/be8dc53277280aed66b41686fb6aa601f1982cee |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/624b6c019afa8d15419034deee109799abc0bcc4 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/588264d814eeb443314147970ca4bf49319fcdac |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e286c311620b2b2a05bc8a52bbe201a1fca3560c |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/57b4c51a6a3158784926ebcda61545632b0ce958 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/f5a25f732e0684168552362056f19361d297d7ab |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/09bc8e4e21acd4e16057eaab8f61eb3c2bcfc03d |     
      x86_64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/52d3d98944d777f3983cbc6f91fe3a6f3e404fbb |     
      x86_64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/3a19109f8451da12c532903ebae464686ccd4121 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/8206ecb1206f26cf1b096762b1a86d21e28a4652 |     
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/5993afad9c4de885a8042222765fddec9288dfe9 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/53e1233c912ded7d739d693b9e4115d0c2c50925 |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/94ce0fe9f0024d00145ef5447a70655f38af3ee7 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/0715b17c5d60da210d36304e8b9895f24db98675 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/ee0132c93cbde1f2aa0a77a56993072828149104 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/5dd5f0bb9d75bb553f981214487018e817132e83 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/d2a6285b0960090ee2fc370a6c67b73449ddf1a3 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/8b5a72dd7cde685f6f68f46aeee8b1b60c96d559 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cbd419c6ab6fa8a6d18dc137c91f895867e53b8a | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/bf8ef699dc0dc22f973d0c234acb53de372d0d42 |     
        m68k |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/8f86076b8e65480142aba693891a6fd3df5a8aef | ORPH
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/0773475327b02b3ef34a1508676a9aa9cf0670c6 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6b1b48edb139a8c57d07d898701329f15bb35acb | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e0b74cf5aa619f3c1716c9bafd1015698c5f0ab4 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2158ba44de8197219d317f9521a5eff832de5449 | ORPH
     aarch64 |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/fa5f7c4a652ec2d2a7e51ed6d72cdca65c31de73 | ORPH
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/f681794f8dcf3c1e912d93ff0e8bb35fe8130e79 | ORPH
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/1c362ee03e67e24b4f4e7d2fee20bf85d7d1c65f | ORPH
         arc |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/bfd927815c2c4a28754176262b864cba1ea04148 |     

-- 
http://autobuild.buildroot.net
