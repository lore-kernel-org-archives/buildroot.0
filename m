From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 08 May 2019 06:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-07
Message-ID: <20190508060038.131E086267@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  23 |   4 |   0 |  27 |
      master | 220 |  30 |   1 | 251 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 9 
                cracklib-2.9.7 | 6 
  vdr-plugin-vnsiserver-v1.8.0 | 4 
                    strace-5.0 | 3 
                suricata-4.1.3 | 2 
                   dvblast-3.4 | 1 
                      gzip-1.9 | 1 
                   mimic-1.1.0 | 1 
                mono-5.20.1.27 | 1 
                   netsurf-3.8 | 1 
                          opus | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

        i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/02c49a419b268bf9fb373aea56f4199847af18ea |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b9063e4aeed0e8e17cec8014309caadbadbd2202 |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ab5199638330350646786c65fe2e1dacf5a42b05 |     
        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/bf272cd6f2cacd8dc3948b5d4d2f60858c09610f |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/dab5819eeb2d9904f78ff44277a4146ad190f2ae |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/7a2a6f73ded28b17a654b9133ef59d8ef1aced6a |     
 powerpc64le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a7c4c028a9e2efc2cdf068f70a0807d9864158e8 | ORPH
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b02646c57a3fa874d050c76bcc0504059e9e0600 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7bbc056eb4cfd55ecb32001ae60bf83114e14f4a | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/5617aebbf5c1f7cd0990601ed79164433a3d698e | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6240ee28040aa759177128f774ba3930b0e7858c | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/9f583081e611f9fc70ca6c25bda064301336ed39 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e464e59a1e88d4bff923ac018b7fc650eac80112 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8dcfca057d28c8cebbe7fde9fdf6e98c16ed7a3f | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e7aa42f49a133adb7de47d11a91871b438621c36 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/165624f3a3ff17bae2bca25be34255c461f2410d |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/912194c4774dd22f80d568ff210908685d18e53a | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/fe8fcd85ef768ecedb46f1754b865ec88f19838e |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/bbcb1944563764c57b3b57839602f33eaae422b2 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ae80e78c669c8dca7ede0fbb757da172ecf2a48e |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/49726c748d5229af333aa922b6e9ded5ce523978 |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/3bec2259eacf49e519a9e7de375dd075f1c346ea |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/f142e4c7f0d512bb872572f5e678230117ab0ad5 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/c749e5135dc7274c494077e48199a66e525fc3c5 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/b74a17cfa7112c026938cacafdd18c6dca285005 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/9d247f698536772734123169f062a6e9c1859421 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/612c4258230f07ffb0b551410234d86102b6a0f5 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/970b039d355dc8a1e4a13641dcc5980cc315deec |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/5c8ed2265604402cd7b8a47b9b7bb305e1b1dc13 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/50a4d8458540de34365a90267ff3d4b2cd69b3da |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ac9cecc0a3a79ef09980f3046e2ba9151e305544 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                 mesa3d-18.3.3 | 1 
                   netsurf-3.8 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/cfb8998a0e1d726de6e58375a6b6a4068cbeed93 | ORPH
         sh4 |                  mesa3d-18.3.3 | NOK | http://autobuild.buildroot.net/results/1913590e5a7a573b64e0a13635b58c90017562aa |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0113f0f5807ab0e846a48890c43ae92ac72376f2 |     
     sparc64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/fb989444441b8438ee29186cbe822fa7df158adb | ORPH


-- 
http://autobuild.buildroot.net
