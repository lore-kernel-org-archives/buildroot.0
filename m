From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Nov 2017 08:00:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-05
Message-ID: <20171106070008.EF932203A4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-05
================================

      successes : 174
       failures : 53 
       timeouts : 2  
          TOTAL : 229

Classification of failures by reason
====================================

      host-uboot-tools-2017.09 | 8 
                  ffmpeg-3.3.5 | 6 
host-vboot-utils-bbdd62f9b0... | 4 
                      qt-4.8.7 | 4 
                   jimtcl-0.75 | 3 
pdbg-77158819158d1d7053a737... | 3 
             core-dependencies | 2 
       host-erlang-rebar-2.6.4 | 2 
                   mp4v2-2.0.0 | 2 
          usb_modeswitch-2.5.0 | 2 
                   dbus-1.12.0 | 1 
             dbus-python-1.2.4 | 1 
             freerdp-2.0.0-rc0 | 1 
                  fwup-v0.15.4 | 1 
                     gpsd-3.16 | 1 
             gstreamer-0.10.36 | 1 
              host-erlang-19.3 | 1 
       host-go-bootstrap-1.4.3 | 1 
           host-mono-5.4.0.201 | 1 
                   libiio-0.10 | 1 
                  libpjsip-2.7 | 1 
                     lxc-2.1.1 | 1 
                 mesa3d-17.2.4 | 1 
                 mplayer-1.3.0 | 1 
                openobex-1.7.2 | 1 
                   pcre2-10.30 | 1 
                prosody-0.9.12 | 1 
           python-numpy-1.13.3 | 1 
qtuio-abe4973ff60654aad9df7... | 1 


Detail of failures
===================

         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/8f2e5a1baed3562e3454dffac7c0f9ace7dce27a |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/956307bafaa623d07c77f5a6139073fb76121c88 |     
    mips64el |                    dbus-1.12.0 | NOK | http://autobuild.buildroot.net/results/3406ca72396fe3ab078ffdd99a92fb22464900ec | ORPH
microblazeel |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/fc0b686d0892b64215007cdf4cc199b7c7449f7f | ORPH
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/e72bf8bb81da742d751445f4303c45dfa1169d7c |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/9aa1d84289d241683b70223ac2b569a00c98ddf0 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/6b091865d40fd56d71c1aba2ebecf3f29f210d9b |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/adfd1a6711a3ec09b601f005541de41b079ae449 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/16b743ddf0551dd6b035ca3182fa36bddbff7d49 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/070028fa33a9f9bd9c26dfabaf0cc9b6b41d1b9e |     
      xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/99383ef3aed7401abcf7fa5761eb0c84c756e669 |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/ce83cf9e1955b7b0229cd446a3bce1af6ba57855 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/460ae832d70aca3bf784bf97a6af659bfd8e6b5b | ORPH
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/49dcec0bd2f3bb78c18675a9fa5c9c53cc183fd2 | ORPH
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/dd2f4b466286cac5cee308bcc1d000ef4874df2e |     
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/038fabc9117784d5ea1cb7436da2fded2721e4bf |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/7347734950d7dc5c313cd939d463ebbcb05784b5 |     
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/b263b18fd297cd02b27431c1501760895e1ee0cc | ORPH
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/e6912cd7cf238a10fc327174897fac49bee1498a |     
        m68k |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/d5c42033e6e7ef82d5524d696d244842bd43706c | ORPH
         arm |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/c487fb33309e1c8843886fadc67f2bc9ea761c10 | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/33b07df09f53b2baabbb4e259cde719cda4e8aff | ORPH
    mips64el |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/591534a59217d99c8743986a64d7f34838158677 | ORPH
      xtensa |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/b42836fc09653bc83ee958c45c8cf8de66c7025e | ORPH
        or1k |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/51f1eaf7737eb50f13548375fe5683111012e93f | ORPH
       sparc |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/7a909e2b1714e62344a9ff7a31c55318b44c4612 | ORPH
        mips |       host-uboot-tools-2017.09 | NOK | http://autobuild.buildroot.net/results/1cd62a6c684e2c6bd5ca1d5fd4216ab26352d310 | ORPH
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d118a83b6c4f7f910d0d44c279f36251d7ba29e8 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f5f45547cde907ea2be51789eb12379857be0e99 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3ad01e45344c7fefee718d275a58cbbb4b01dedc |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/9518e64740a80e45e92217bcfdf5318b8d6c96e9 |     
         arc |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/c57b998fcec1d29605a7f505d356af42191e1cd5 |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/63dd44b7d0d52829557a6b82834feb0e41b3a735 |     
microblazeel |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/ce290420f3f3eda49017c8bf1b8936e35e5e5c35 |     
        bfin |                    libiio-0.10 | NOK | http://autobuild.buildroot.net/results/b19dd9ed29944d7f79c6f824669e3baaa0bb045a |     
     powerpc |                   libpjsip-2.7 | NOK | http://autobuild.buildroot.net/results/5d72e0f8517a555399978d5a0e9f7efd0a278189 |     
        i686 |                      lxc-2.1.1 | NOK | http://autobuild.buildroot.net/results/841e9601a6afc023d2a303ffb4b7ea63edd816af |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/0376361862888339587a130c3e0f801d9bb2e8fa |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/f9e49af8fd9f48ca8a7c9bf0f7b2abeab250f5eb |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/3aa85303032770ea4831ce63854a9a71daa20207 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b7315c66217c221c8598c08f975aa94039373bf3 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/5c8793a76a14c02dd36faa861fb03c1c3244f473 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/9c7542d766c1a1b1e00a65b5e11b58cc3f633790 | ORPH
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/556b5b82e3307944c261edfe9e2a9246a605d8d5 |     
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/2f3b30620799193572fc24eca07d34f6c33a2482 |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/a7f70de99f1f088ee0b003cdb912bdfb87f03f5a |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/15c7632491a4582d1a8cdc9813741b692f5bb5aa |     
         arc |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/5345b0f82a4fd6535dff0c4d4bba300819591258 |     
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/afd05be383909da26c67cab1b45fe42c016dda3d | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1bf27c5856304a432949f06248937d738adf52cc | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e2f87d7311ac9de61bced4c9a8155f77a03d1daa | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0c7b7373292e4da4c847fa81ee6664f9fb43a764 | ORPH
         arm | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/dc77f982f47079904201d40729ad983e7e0576ae |     
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/f884e9b053a19c810b0d3072cd1794bdabc73675 | ORPH
      xtensa |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/b08a708bf2449abbed09d6a3aec4958b2e15911d | ORPH

-- 
http://autobuild.buildroot.net
