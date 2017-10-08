From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Oct 2017 08:31:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-07
Message-ID: <20171008063108.C09FC2088E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-07
================================

      successes : 196
       failures : 52 
       timeouts : 0  
          TOTAL : 248

Classification of failures by reason
====================================

        wireguard-0.0.20171005 | 7 
      host-uboot-tools-2017.07 | 6 
                    flex-2.6.4 | 5 
                 mesa3d-17.2.2 | 5 
         xkeyboard-config-2.22 | 5 
             dbus-python-1.2.4 | 4 
                     nmap-7.60 | 3 
                openjpeg-2.2.0 | 3 
                  boost-1.64.0 | 1 
                  cc-tool-0.26 | 1 
             expect-2014-05-02 | 1 
            host-lvm2-2.02.173 | 1 
      host-monolite-1050200001 | 1 
             lttng-tools-2.9.5 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.27.0 | 1 
                openobex-1.7.2 | 1 
         python-gobject-2.28.6 | 1 
           python-numpy-1.13.1 | 1 
                    sdl2-2.0.6 | 1 
           uboot-tools-2017.07 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/ae4e9745ec58788bedc4476a04cdd3165062808a |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1fdacf5b33d97edf937705ed5befae2c9cf8be34 |     
     aarch64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/c35b8287ca6bb4e2de11901e79e71108b4cd5eb3 | ORPH
      mipsel |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/4aed30c76bec5fad48e4c0aef70664336e8337b0 | ORPH
        i686 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/e2debbd8c89f6fe41572c28b31cbf7692bc2fae0 | ORPH
     aarch64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/0ff292ac61c3a754e990e184fb38527924b5252f | ORPH
        i586 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/81fd9c57ea4a560218c9c9105e55cdbda9bcdc7f | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/34c6f1dd167b647333e1e8b6279819206139a8a8 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/952248e9270a1124f44d1703c0a4cefde6a6d970 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/1a14e64631c2b52fb834d4d5eeed5ac3ff18dfe9 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/cba60edc65bf14e191d1d7ace0706008ad281062 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/9b49b96da65ae3e7645496b6775311189a47e1fc | ORPH
         arm |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/dc0c1a9ae09fe838a710d5bd57cabf2fb4d42008 | ORPH
         arm |       host-monolite-1050200001 | NOK | http://autobuild.buildroot.net/results/ed7b3ad78499a172d4380cf3184d6d0d8f0b9f23 |     
   powerpc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/4f6ea604d43958531911a60d005d187367acff0a | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3c1f2244a966824ed76f350121c878b0eeb02807 | ORPH
   powerpc64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/f1fb34ff8c1d56adb3a15e6f7c0426baf6f8772d | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/41bf9eb0585a822ed3dd267d17a876e0f63d934d | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/59fa8a7858117f6a57e5ce8ff203f7a68d57d8b3 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/2489c818dd2166879a9b8c75cb6929dde6b1d6e4 | ORPH
        i686 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/3cdf4be77b4b0a8cb352e0ac94cdda82c24a9618 |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/276dec0ce0d25bc75e5bfdc0b419537289dccfb3 |     
       nios2 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/25430e3e7f9972dd70b618b5e2925c0742f32ea6 |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/7d1bf236120493276a8bdfe228137215d830ed3d |     
      x86_64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/4ade6c6a33b7b3bfc5f023ea0f8264a2c0ae9ac9 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/dedb1d303b8fe0b0b59d1bc47910de5765f3b1bf |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c348c9b376095ac7846b399b624eacbf159fead4 |     
      x86_64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/6f16448912845b5af5d502a03cc60e44f028340d |     
      x86_64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/ac928926ed972157bf57b7c10becd4c8b7dd4e53 |     
        mips |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/7458cd04b95bf7c204fa340013bf59bc5469498c |     
        mips |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/1774fcb2f60af72fb0562ed6d0debbfa9d549404 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fbeaabc4e559a98d6b364a01e972c6e5d54e74b6 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/025e66422edc6685e7e323a386f8ebe8da5f9965 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8d9088bdc881be1192bb8a0d716a4d7f3f8ffae2 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/bfdea8d4dcf86df0cf18e548c82898c0a0eb3c1d |     
      mipsel |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/88406cc5110d2a6d24a1b3d335f8c65aeecf59be |     
         arm |            python-numpy-1.13.1 | NOK | http://autobuild.buildroot.net/results/92b1bce9208452a87b72f3f238176952745ba9ce |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/f6a41eb0458de709e89c706188535e61bd873165 |     
     powerpc |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8e85e41c8fa4395df4d3a072b8f7dacf4f9fe499 | ORPH
         arm |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/dd43820320cec48e33da930af7ca62c31db575da | ORPH
      mipsel |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/cf059bf4b068020283733d5ae44cc299175f06d4 | ORPH
    mips64el |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/53554feb571b81f4d302926970a7f042cb317ece | ORPH
      x86_64 |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/c14dbafd78a4405f96dee35bd4aaca7c487c2b46 | ORPH
microblazeel |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/1d7812477fda4a62f10463b541568d11a7198da9 | ORPH
    mips64el |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/aba5ec3ab76baff7ef4624599d1e94dd7600c2f8 | ORPH
        m68k |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/3fe552d3fe8387c32f61e76055d385d941ce1a45 | ORPH
     aarch64 |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/36112d5e861751d88e1ad431204312ff99aac3e9 |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/c03b5a15b01663e17a148605e6520c83e1f2f776 |     
        m68k |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/017a271f6609282d981a2715a5bb35fd7678333a |     
     sparc64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/cb6061fa43b4c81b21a140385bdb1b529bad8778 |     
   powerpc64 |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/54c5356d26fdc60045679e447f20c2737710f78c |     
      xtensa |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/a64b4da33ab2cfdb2fb188d899f6162326a27ff1 |     

-- 
http://autobuild.buildroot.net
