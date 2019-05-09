From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 09 May 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-08
Message-ID: <20190509060042.1026E872A2@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   2 |   0 |  23 |
      master | 224 |  39 |   3 | 266 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 15
                cracklib-2.9.7 | 5 
                   atftp-0.7.2 | 2 
                       netsurf | 2 
                   netsurf-3.8 | 2 
                   bullet-2.88 | 1 
                host-libsodium | 1 
      intel-mediadriver-18.4.0 | 1 
             keepalived-2.0.15 | 1 
    libtorrent-rasterbar-1.2.1 | 1 
               lynx-2.8.9rel.1 | 1 
             openjdk-jdk-12+33 | 1 
           python-numpy-1.16.3 | 1 
                qt5base-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 
                  samba4-4.9.7 | 1 
              spandsp-20180108 | 1 
                    strace-5.0 | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

         arm |                    atftp-0.7.2 | NOK | http://autobuild.buildroot.net/results/8606908b60fca430366d558a8e6db7a06ca08631 |     
         arc |                    atftp-0.7.2 | NOK | http://autobuild.buildroot.net/results/177a64fb419a6d4c2349970bce966819925e4de5 |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/e96cacd185f14479433f91ccd47d76058cf5b345 |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/2fd595b1bd0be42b0e302cf4e6d958a64cb20244 |     
        i686 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b14a16e695ab38d2b30ff801b43dc44ece1efc71 |     
        i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/b31cb312953065de9c8ac36c27aa3260b0872721 |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/695c9775d2fe69ef64b87d8196b097c5ba4995c4 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6cc427b80e8a9abb7850df0a782545fd552d6ee8 |     
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b72ded5e1fb56ca197386472f24d776a52954bac | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0ce9055a6db721b211639b2105ba2f1430b6f5a7 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e92d094e401ffef33f26ba6d10cfbc830befbfe8 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/27bb494c0cc6672a1f5578857d5e8b52a2d5f7be | ORPH
        i586 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7ed74b6183acc34dc5406a6801b01d05b38778d2 | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4232294a3d0c2d52e01f590918c2873e987e876c | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/22357f7ec97d19b7bae58dc65c172bd8f49e0e70 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/44c93bc8a9d982a55bdb747cfc5b084881b3b86a | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4bf68114d8fb6c7b10558f08eff17a2d6cc74156 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7d57931d110011ce9ca5c2cb2192e5ce3e4a37f9 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/02241fe5e6585fdb922557df65141dce47aec99d | ORPH
   powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/befa1070dffc928ce5a56b392ca0f5ecce3d28b7 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6006a70a00e48745c0de372187f1bef28d70de3f | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/cb0ca725aa66d661cfe63168432c626f663f4d44 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bebccc77513aafe07a1e3ee80a36c082ff1b7256 | ORPH
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4f460ff42739e3c8277baf50880139aefd169cfa |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/c4725517fbca4d113a09935c90f6389e85743c08 |     
     nds32le |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/85af2b037f2b3277a572302acf113c9e11d0223b |     
        m68k |     libtorrent-rasterbar-1.2.1 | NOK | http://autobuild.buildroot.net/results/98008526d4b269140dae2462acb77478c79e3ca0 |     
microblazeel |                lynx-2.8.9rel.1 | NOK | http://autobuild.buildroot.net/results/23a421e15c32b17ff2f69f183a2e8620ecb93316 |     
   powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/eeb2863c6237aac8428e49a5ee514d43088b0fb8 |     
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/f938fd1515f1d6e11b57aa6e314135789da52a44 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ca4f61a4aba114b04fcf12f66b6266f78807aab8 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e48416d9ee659dbe9ee3115c4005b2587f08fbe0 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/47b604d67556087289461d54f6b54f67a41d4b09 |     
     aarch64 |            python-numpy-1.16.3 | NOK | http://autobuild.buildroot.net/results/50f7f09a9f830cd7b94f8fc83c09fc3d39297d3d |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d3fa9fa6d897ac120e716d2e114e0706ac62fae7 |     
     powerpc |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/11790cad7dab795d50b53d44750c838a86039d1f |     
    mips64el |                   samba4-4.9.7 | NOK | http://autobuild.buildroot.net/results/28b9caf2e03ff79e32220c7289d34bb8c303abdf |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/b04da43e67b246cf3c4b2805b8cf6cf0c90197a9 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/c036b11bf1f2fc39f42661634ef3e03360fb85de |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/d9e53484b6114a6b6271eb1c40c32ddc9fec6fb3 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/355a4314aa8f36631119841b83f15abe3f8e14ce |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/09464861add139bd4048398029f54d75539385b8 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 2 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/dac3bb7cae5b14598cbdf5f3d1a3c0d1488170b8 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/f6f7c0f526dd5ae5fd594a2db79f1c9d4ac3fd48 | ORPH


-- 
http://autobuild.buildroot.net
