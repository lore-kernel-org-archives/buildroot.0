From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-21
Message-ID: <20150822063015.0CDF0100C32@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-21
===============================

        success : 236
       failures : 49 
       timeouts : 0  
          TOTAL : 285

Classification of failures by reason
====================================

                 mesa3d-10.6.3 | 5 
               linux-pam-1.1.8 | 3 
               libupnpp-0.11.0 | 2 
               iptables-1.4.21 | 2 
                 setools-3.3.8 | 2 
                  connman-1.29 | 2 
                minidlna-1.1.4 | 2 
                moarvm-2015.05 | 2 
                directfb-1.6.3 | 2 
                dbus-cpp-0.9.0 | 1 
                 iperf3-3.0.10 | 1 
                mongrel2-1.9.2 | 1 
               polarssl-1.2.14 | 1 
                 cdrkit-1.1.11 | 1 
                  fbterm-1.7.0 | 1 
                coreutils-8.24 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
  toolchain-external-undefined | 1 
                      qt-4.8.7 | 1 
                    ustr-1.0.4 | 1 
xdriver_xf86-video-siliconm... | 1 
                  lshw-B.02.16 | 1 
                   dhrystone-2 | 1 
          powerpc-utils-1.2.24 | 1 
                    php-5.6.12 | 1 
                    qemu-2.3.0 | 1 
                  udisks-1.0.4 | 1 
canfestival-7740ac6fdedc23e... | 1 
                busybox-1.23.2 | 1 
             lttng-tools-2.6.0 | 1 
               libgtk3-3.14.13 | 1 
           libfreeimage-3.17.0 | 1 
                 sudo-1.8.14p3 | 1 
                  cppcms-1.0.4 | 1 
                  mono-4.0.2.5 | 1 
ltrace-c22d359433b333937ee3... | 1 

Detail of failures
===================

       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fe0a36890c5de7cca1f35212c4434d53463c4641/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/0dac4c0639d75540e004d0fdd0ac6cd9fb9c7ef0/
         arc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/c789df03a323991b542d3bb73737a95b269d18f1/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/34ab9879965ea31198809f1fb421b4637fde6bcf/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/5de525cc201987c74730bd8dc6e29b762b7a71fe/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/5e8712feaacefe50405c842970d2ef2248e43a4d/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/257d3607589c27b844b0e29b3e28053b5dadc54d/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/74a51d7fa9d2d026aff60444c22dd4f2ce38bac3/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/e9ad290c264f00dd104ef7ebc5b3cbec773c7a45/
       sparc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/35defeb46270df6510f22de0a6a5b8b0710598d7/
       sparc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/05f299fa817d8d8fbb1cb979b736199d85e54588/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/a9bf5073d441aa43378c5bb069c389b8eb9f519a/
         arm |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/1656714ca391a8f7190004a7e568f3e2b782d458/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/7cbdbdf35c5a76a7babf44e0ab60af6655821774/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/71c922e516426d3efaf2bc0314d46792a8f22e88/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fd79c30f356f3c875c8c46b6ba03870e0a739545/
      x86_64 |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/123711a3027abddd1e4a4ca82ef512858ebfea19/
      mipsel |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/a46fb2b5b39a73762317fa4cb375cd933c07ccc5/
         arm |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/bbbcf56580896faa1334b077db915b27e9d9b80c/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/79605e9914fb1ed2f20863cccbc1ff4476fd35c2/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/ae18bbb1f486bc413db9b517a4811af56dcd1691/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/96dd4ba1b219c99f70d813dd2e7d09698b75e7b0/
      x86_64 |                   lshw-B.02.16 | NOK | http://autobuild.buildroot.net/results/61fb9b93af41b565fd44bab95955ab6f63c1f1ad/
        mips | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/24fcff119abd1b25e09dceda5a949806b2c47a55/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/15d4a78b5ed3e1718303948d449d5245234218e3/
         arc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/35889ad6e5811ee4cf59f6b594370740ef506401/
       sparc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/09e21c1a805ee49fcf3db420e22cda9921b14d9b/
     powerpc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/e26d2024ceb98640e80b0c537d0705c4f5377ef2/
      x86_64 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/671a4b246d2f4285a7bca91460c1d5aa7d3962d7/
    mips64el |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/3212f9bf493cc18886dbe206640004490f369cf5/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/1c5b8e7f645c3d38ca3640f0631f559d3907f63e/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/da762cfb858e79d631fdf9ef4a89ac12f412d04b/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/04f5b6354d3f832b797f5d434bcdc15be8425e8d/
       sparc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/a112f1360b347a7e126f985eb264a0afb57dbb64/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/3fb93797c1284dbbd58859511dd082f09fc61369/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/78cb1445c05b4a53b5119aaa55f4ad6cc037cbb5/
         arm |                     php-5.6.12 | NOK | http://autobuild.buildroot.net/results/dae54fc46a30ad05df46eda74aea8046021e930f/
      xtensa |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/e034202f5012f77a00aedbddf9c4ca3c1e923ea3/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/e5bc363f308c5ffbee0e3f7363acda083bf9c2d6/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/cdcfaefb764ef9ff3bf48fae53bee2331d1a2bd5/
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/851a272427050304638a3f216a02bf6740ce70a1/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7ced132a8118c228a6e594cad2882bcd3d65b9b5/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/1360930800f9b96e2e81687cf48c593862ab56f4/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/b0a9184262c00d668e09279b4419e79e5ec16094/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/e417439d125732ead8966c7c2b6b5a22912a32b3/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ff85851919f720cdaee4aa2d1a64c447f0600fae/
        mips |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/d8b17fb88d21165cb322938e99c364bd9972f145/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/949ac65c5b6da21937b1bf16fa3df5807095efe5/
      xtensa | xdriver_xf86-video-siliconm... | NOK | http://autobuild.buildroot.net/results/73357fa3219719c92357a8870fcb7e3f9b91bbb5/


-- 
http://autobuild.buildroot.net
