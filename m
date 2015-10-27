From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-26
Message-ID: <20151027073020.145A4101F56@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-26
===============================

        success : 123
       failures : 92 
       timeouts : 0  
          TOTAL : 215

Classification of failures by reason
====================================

      host-uboot-tools-2015.10 | 14
           uboot-tools-2015.10 | 11
                   mplayer-1.2 | 8 
  toolchain-external-undefined | 6 
                  ffmpeg-2.8.1 | 5 
                 sudo-1.8.14p3 | 3 
liquid-dsp-df5a459fa05dba41... | 2 
                   dvblast-3.0 | 2 
                 mesa3d-11.0.4 | 2 
               lighttpd-1.4.37 | 2 
                ipmiutil-2.9.5 | 2 
                    ruby-2.2.3 | 2 
             python-spidev-3.0 | 2 
                  connman-1.30 | 2 
                  qemu-2.4.0.1 | 2 
                  vsftpd-3.0.3 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
     openvmtools-stable-9.10.2 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                coreutils-8.24 | 1 
                  libv4l-1.8.0 | 1 
               util-linux-2.27 | 1 
                directfb-1.7.7 | 1 
                minidlna-1.1.5 | 1 
         conntrack-tools-1.4.3 | 1 
            libopenh264-v1.4.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
              wireshark-1.12.8 | 1 
                oprofile-1.0.0 | 1 
             host-nodejs-4.1.2 | 1 
           gst1-validate-1.6.0 | 1 
                 opencv3-3.0.0 | 1 
               linknx-0.0.1.32 | 1 
             webkitgtk24-2.4.9 | 1 
                busybox-1.24.0 | 1 
            wpa_supplicant-2.5 | 1 
                  fbterm-1.7.0 | 1 
                  apitrace-7.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
        imx-kobs-3.14.28-1.0.0 | 1 
                   systemd-227 | 1 
                   mpd-0.19.10 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/e1f0c9c3ebb1eca3b4bf421ea6a71deb8c578b14/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/e5d75366869c6b40d29095e6285f667eec40a837/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9012048855bd8a6e159d68b059a7c5ecca87900a/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/7b7fbc6b2aca1fb0b703421bc9d58bc5867f835d/
       sparc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/679f52cfdfe9f0b94bf718177aded21f2062098e/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/a1de7986d67bcbfacec27d5c46fd46c7c620018f/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/5750c9752ce7cd15163424b27e173b1f43ff590a/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/85802ebea221bc7945177e9be981cf58c8b4ceac/
     powerpc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/c5f6def55d7933721056fbc8db9ef12a7d728dc3/
      x86_64 |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/add8d1721a1f8f6fede103bb794545bc5b81a18e/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/f6d2d608aac7bef8a3a548c520cab4e29d17f0de/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/a51f43d9c65ebe36884749e09de894a71031e522/
    mips64el |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b771dd19dba188c56507c465d2b45f1534652380/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/85ab8b37e798978330e0b060c8166a23dce4aa6a/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/e0b21b1e32d08ee6a3428a88f7d4b232c34a6845/
      mipsel |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/b918d9f409affc798c12020f5bf331769184da2e/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/5911f110669164d6a75e748c6971707b31a613fb/
      x86_64 |            gst1-validate-1.6.0 | NOK | http://autobuild.buildroot.net/results/c5eb6cb12dba559226c67f5d258cc151aa8a8d3a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/808202f10ef43fe4b145f108baa81a7471a3d77d/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/c6dd2c0c501343c16632afe81104f2577043cd1d/
      x86_64 |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/c45d3561d4c289c18aa4ee9eae2dd521f8c487dc/
     powerpc |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/1f0ab67a1f785c9ec536f6417d6cceb4093a9d6c/
      xtensa |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/8415c9ec37f159a71b5dc4df9163607e1cfe5707/
    mips64el |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/e970e0d7ab3220d83d2a6005673c2956d7450cfb/
     powerpc |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/956d40119beabe245793a75ccaee9669085f004f/
     powerpc |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/086a695cd8a50e7bae28c54eb9c43d5389e08a49/
      xtensa |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/467eac046127eef00958162bdac4d5095dafcb25/
         arm |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/eabffbe05b149cfe973c38eb59b15086a12b1fe3/
         arc |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/ed8eb1613d7a2c39f29e9953a55c13725c8c7e37/
    mips64el |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/50a7f9c1486e7972cd61b545a1052a72d4fd3439/
         arm |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/91c508a34f8787ef2be2543bf998ba89d0b7a9a4/
         arm |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/fefb6acb53dce1d1f63c5bc1a9b5c090659c6382/
    mips64el |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/d10794b90afe10f6b1965df560a11489080693a7/
     powerpc |       host-uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/aac873eaa3c356cdc62fe6558ed62a253a931d49/
         arm |         imx-kobs-3.14.28-1.0.0 | NOK | http://autobuild.buildroot.net/results/aba47b422ca04b255df3e9dd0aba858309ed76f3/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/f71a4bbca2505fcacb396bcc643c7152d87b5283/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/497d2739c27ce0dcf91bdf2f87c02fc169ba9071/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/19eff74dd7da02a89411fe2c33f73cc7b0d4900a/
      x86_64 |             libopenh264-v1.4.0 | NOK | http://autobuild.buildroot.net/results/5bf4a68b49ec4e051b077efcbf82359d1aee931f/
      x86_64 |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/ec0244712ae88576c8df0a25005b32f3965f38ec/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/0c526f2484a252e26c3c2c70570ad744ed6f1e43/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/563e424d717c0b9e3b2c62b0a2776060dea50dc8/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/eb419fe8ce6d149e94722db9e598fcf8378f9a78/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/a4ac056525260db374a75986fd8c0a200b005c89/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/cad0f22b5d5cb10c18cafe2a2713d8daba075475/
       sparc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/28cec7378e1272c91d28b2b58354ec6e26e03201/
       sparc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/3a673e24c6f400d1bf7b2b328de25c54300bd108/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/a061bdbae7cb49ded9f7822796e92794012360f4/
      mipsel |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/73934ad67efa121fedeaa03fdad290aa63f1485e/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3fdd5ddff49617f88391947eae8d59b5302e3559/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/36f8fdbd8e56b0476a90428b0ae36bbf3388c98f/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0f4d8a789eea4f75dd854b0cee98125b8e25717c/
      mipsel |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1e4b86a56875e2f5499c1119827e8b9683c2d4b0/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/09ded1589f02098733ca6d50db012208eca04b69/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b7fbf8524c445e6a341bfdce51412c8c167d3e7f/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/523ea6c8898ecd95a8ef0f7adad4004b87b4ac82/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/633fdbb1c8e1c0e15c557e8ed3525eb911850b7f/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/fcdbff0c254edca78f4dc99e41956ccb8c1a5017/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/f572573c5f7f9206e0a8309b535a7c633a2d6b16/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/a90051af0a8ee92ba81ff580123e66ba8bf60ae6/
         arm |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/1eea55ca83daede50b0730f657a8071328dd9ba6/
    mips64el |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/f9a12c6d794db12cfcd8000ff31fdaf023e9a908/
      x86_64 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/3ba22ecd51e08d579cd2830f1795226335927864/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/200698e0e731018e84f1128ddae6b12a815ead59/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/b238fd43ac5da0e40c1c3c23169974ad1edcaea6/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/6788099a2bf7e3b3775f2c4f2ff9eab4c0a2de59/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/16196190903ed9f7f74ab5a7766748d327eee0be/
      mipsel |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/3bfa7be7b85debc85f888140b594fc820064b77d/
         sh4 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/2c73105d1e2a0f3a79110171b22703e2d547f292/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/149f36906fc4092f7860e4b1044518f00d447887/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/16c5ec5862b9e86cbbee7d30048970f5075935dd/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6e53bfd504b0383c52db1eb145e4b117aa76e9e2/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6ebad6d2111abd35e92264baa6859c563433d235/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/78245b8a4e1fab2d397348516b977e9f014da6c1/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9fdbb9696c2191a1a2b28b7de62b229656533adf/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5c13b747016bff97eb7f47d42abff88c301e3b32/
    mips64el |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/0f15472597318f4e83f727b0344178a090282acf/
     aarch64 |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/dba39f10c3f3a9b9f17af79231ac7ea564448a6a/
        i686 |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/cbeefb7389f5927d4f7758c2d782f5041e70800d/
         arc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/6b340bc330d6c3bbc58f6b7e59d175203c550866/
     powerpc |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/00546e19cac737c274196fa4e3bf7645a35bcdbe/
       nios2 |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/42e6b26f1233895bc534f8bc15a46a3579b3b37a/
         arm |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/ca151c7bb2709715dbf91cab6a8c9b4d393eaecd/
        bfin |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/dba0521b24aea21879bd08621d60e783616dfc82/
        i686 |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/09204959b25b05e1d93beecbfbf87e21af4433d0/
        bfin |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/1fa8ac695c0e9a02634bea98e743b6ff41370521/
      x86_64 |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/3b8af7271069f7a7714ff9aa9469549296950562/
      xtensa |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/f3f2b111ed43643183429b0d0d3d98d717623ef6/
      xtensa |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/de524bca66b551d67d4ee66ba21a5f1d78ae502c/
      x86_64 |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/0eb26ad0716369e90ada547f25750c7c51888381/
      mipsel |               wireshark-1.12.8 | NOK | http://autobuild.buildroot.net/results/7b7cc7511737d3b8b3f4c34e523b10bf8188ba32/
         arm |             wpa_supplicant-2.5 | NOK | http://autobuild.buildroot.net/results/e21705ae690ab899b6f00e4a15833abef5e54e0e/


-- 
http://autobuild.buildroot.net
