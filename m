From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Oct 2017 08:30:57 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-13
Message-ID: <20171014063057.C392B207DB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-13
================================

      successes : 94 
       failures : 32 
       timeouts : 0  
          TOTAL : 126

Classification of failures by reason
====================================

                  dbus-1.10.24 | 13
            libtomcrypt-1.18.0 | 3 
         xkeyboard-config-2.22 | 3 
             gstreamer1-1.12.3 | 2 
                    sdl2-2.0.6 | 2 
           argp-standalone-1.3 | 1 
                  cc-tool-0.26 | 1 
                    ipset-6.34 | 1 
                   luvi-v2.7.6 | 1 
                 msgpack-2.1.5 | 1 
                     nmap-7.60 | 1 
                   pcre2-10.30 | 1 
pdbg-77158819158d1d7053a737... | 1 
                      qt-4.8.7 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/bd0d198f172fa789aa2cf0bb7edb9b62a7ee247a |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d8f0ba76f7ea1c06738658b24b8a363f8e7a526b |     
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ddaf58e9f8f8cfec9441ef64665e3a468b144d1f | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/0a1e802dafd5cded6bf783127d0edbadc584583d | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bbbe2b1725de6a837cf9d908b4bddfd0510dc077 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/26e2654e3e75e5291d7d28db88aeeb482129d86b | ORPH
         arm |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/b24bc247e4b4030b206c7381d897eab6f9f3aca7 | ORPH
     powerpc |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/aa1736de612de010f4315d95eea1fa1502fe044c | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/e771adc5aed7b974eaca9fbb65a36a98816600d3 | ORPH
         sh4 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/110e07d650049c1cd9006b40acc1cfd3fad832fc | ORPH
        i686 |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/296f161fefe2a785a16efc31651947ddd445df61 | ORPH
        or1k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/45474b5bb456a9709cf300514909ef734f878de3 | ORPH
      xtensa |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/bc7a17b57d124d07c739ac78a08a661ae56f58f7 | ORPH
    mips64el |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ec0d00ca0217588ec4332de31cf49f537df1ea01 | ORPH
        m68k |                   dbus-1.10.24 | NOK | http://autobuild.buildroot.net/results/ea5d0d0e621e09f3bce6c2a178dfc88a51ada1b1 | ORPH
microblazeel |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/88e7208483ce1983e4f51a7e43d6877d9ff6aa66 |     
        m68k |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/f67366b480ca184e43354bdd8087fa1dd7285e6a |     
         arm |                     ipset-6.34 | NOK | http://autobuild.buildroot.net/results/e0b8849c7e018b6fd8ec5fb10dea2350599d3511 |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/30239a102ce81c29fcdd34e9c63e0ee04f116108 |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/7fb9efb52652102fb8151dc786e7730ca4562ec6 |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/ae985d4098e48bc2b2ff8a5cb24d082296c797bd |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/39fa4dbc9625eb30e6a4a014b65fbdb36e0ccec5 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/b9cb22fca46e7619ae586030dc99a5b654826f62 |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/0584a66defde574633f879ea6715d929271777af |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/7d1d49ca19204426257722bc7a6d5169ab70f031 | ORPH
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/007e993913c4cead44b44b5fad3e4e367a7c6439 |     
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7ceb3ae68def7d0f10dceb29277b2f8d9420072c | ORPH
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/e1fe74ef9c4ace02adb7d42c1841ca382bac5f38 |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/ea26492aa1ee35b72f364894b0387eab2787ece4 |     
microblazeel |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/81fe0d589919e2dca4be03eca9425a08b253f07f |     
     powerpc |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/ff6bc34f73c64eab23312ea1bf61b65517149155 |     
        bfin |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/6851e6241da6d3910508dbce60bac8db2d89d41b |     

-- 
http://autobuild.buildroot.net
