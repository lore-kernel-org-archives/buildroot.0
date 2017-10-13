From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Oct 2017 08:31:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-12
Message-ID: <20171013063111.E5D1620820@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-12
================================

      successes : 127
       failures : 34 
       timeouts : 0  
          TOTAL : 161

Classification of failures by reason
====================================

      host-uboot-tools-2017.07 | 6 
             dbus-python-1.2.4 | 4 
            libtomcrypt-1.18.0 | 3 
wiringpi-96344ff7125182989f... | 3 
           argp-standalone-1.3 | 2 
                  cc-tool-0.26 | 2 
                    ipset-6.34 | 2 
                 msgpack-2.1.5 | 2 
                  boost-1.64.0 | 1 
             lttng-tools-2.9.5 | 1 
                 mesa3d-17.2.2 | 1 
                 mplayer-1.3.0 | 1 
                     nmap-7.60 | 1 
                openjpeg-2.2.0 | 1 
pdbg-77158819158d1d7053a737... | 1 
         python-gobject-2.28.6 | 1 
           uboot-tools-2017.07 | 1 
                     vlc-2.2.6 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a40c32ed509bcbc701c7d571bca3af21dd4169aa |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7e434d1cc07b06bc72bf10e7810113497f45d9db |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/0d71bc24d55d2f8db5c9ac178922c3d956ab1b0f |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/15bca343558f28bb9994afc8262d5c7ff14a3f1c |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/51f3ffff1a23fa201385c1ef083f6a3f61162a07 |     
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/eb31135326356ff4238e08d9f1c8324e4da80d3f | ORPH
        i586 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/56daa9d6e36af3a22c5265ca13c67b2651e4f145 | ORPH
    mips64el |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/b15e97a3aa2a2482f9daa14940ed94600f2d5958 | ORPH
       nios2 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/765837f4765ade76d85431128d01b94e737e034e | ORPH
      x86_64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/f9e13caae9b31c9dcde7d24caecc036324f269cc | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/efb79b773080c81223123cbf113b382f45dc480b | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3e699c976db89dd116d891b6ed821c12cffad01d | ORPH
        or1k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/1014a6c2728ef49b332aa3ed169125a0d5a0ae1e | ORPH
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/53e05fd1317242363f0e934b6ccbec377ea1e88c | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9c6987c55a556c30e927b8d7d6f93a91a502f623 | ORPH
        i586 |                     ipset-6.34 | NOK | http://autobuild.buildroot.net/results/b56a6e3b5036c10f2f2b74e36c130d751b2c1312 |     
         arm |                     ipset-6.34 | NOK | http://autobuild.buildroot.net/results/0dc984427c16fc65a19abaecf17e52c0ca680a80 |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/466672ed9e81c0542410293d7d5ea6bfbd65156d |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/5ae4de8c33ee87a50684389d47399d03e79d07e7 |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/f2ca8d61a9923490b40b349cd77fc4245167064d |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/d0281086cb150388be1025a09be7f58357b15860 |     
     powerpc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/021ada409e2de4e180552550a9883bd0e30f8755 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5ac74031bf71f8a5f8c2bab6a3b0906ab769e043 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/22f64ae9beb6ddf5a52f627685c35f19565296c6 |     
        or1k |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/7a395c50a7a1629de55d08bc026b952ce2486b2d |     
        or1k |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/dad004e1850842f59b4b65898b64566d7d0d2a26 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bea737632a93f68c0a56f027b5d791ec5514615f |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/e1a1002a50c2e9c1f8e2556b96508421258a7077 |     
         sh4 |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/51c500035d1c964aadfbb24856597a8adab5c877 |     
        m68k |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e941da09b3a9f5a2c8af6976be4ca34cb8951e37 | ORPH
    mips64el |                      vlc-2.2.6 | NOK | http://autobuild.buildroot.net/results/978bfc62128c7a5a24b949ff79ac30deb21be74d |     
         arm | wiringpi-96344ff7125182989f... | NOK | http://autobuild.buildroot.net/results/473d60a6aadd5cb72164a33c537b0c968ba6019e |     
         arc | wiringpi-96344ff7125182989f... | NOK | http://autobuild.buildroot.net/results/11cd355eda63aae414a1714187607ff388d93695 |     
    mips64el | wiringpi-96344ff7125182989f... | NOK | http://autobuild.buildroot.net/results/334f5af36c42b2eee094444a33b0bd3dff82f536 |     

-- 
http://autobuild.buildroot.net
