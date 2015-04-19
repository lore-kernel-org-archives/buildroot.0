From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-18
Message-ID: <20150419063017.B25D01011FB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-18
===============================

        success : 210
       failures : 83 
       timeouts : 3  
          TOTAL : 296

Classification of failures by reason
====================================

                      bmon-3.6 | 21
                libtirpc-0.2.4 | 9 
libubox-5a0bbefc8fa44044625... | 5 
freerdp-770c67d340d5f0a7b48... | 4 
                  dhcpcd-6.7.1 | 4 
                 rsyslog-8.9.0 | 3 
                 empty-0.6.19b | 3 
             armadillo-4.000.4 | 2 
                     vlc-2.2.0 | 2 
                   bdwgc-7.4.2 | 2 
                    qpdf-5.1.2 | 2 
               valgrind-3.10.1 | 1 
                numactl-2.0.10 | 1 
                ipmiutil-2.9.5 | 1 
               sdl_sound-1.0.3 | 1 
                     nmap-6.47 | 1 
               arptables-0.0.4 | 1 
           libfreeimage-3.17.0 | 1 
                host-gdb-7.8.2 | 1 
                    pppd-2.4.7 | 1 
                   zmqpp-3.2.0 | 1 
                 leveldb-v1.18 | 1 
               gptfdisk-0.8.10 | 1 
make: *** [network-manager-... | 1 
       gst-plugins-bad-0.10.23 | 1 
libnfc-7b7f5061427b5456835d... | 1 
                elfutils-0.161 | 1 
                 cdrkit-1.1.11 | 1 
      host-gdb-arc-2014.12-gdb | 1 
               harfbuzz-0.9.40 | 1 
              postgresql-9.4.1 | 1 
               libecore-1.7.10 | 1 
               mongrel2-v1.9.1 | 1 
               iptables-1.4.21 | 1 
                     gdb-7.8.2 | 1 
                    wine-1.6.2 | 1 
           libmemcached-1.0.18 | 1 
              wireshark-1.12.4 | 1 
         lua-periphery-1.0.4-1 | 1 
                 webkit-1.11.5 | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/94ae1c345b8cceceee6309ca37e45b0be956860c/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/d9a6fec5e4d5c4b58f779ca1f34f194cf0ae5bba/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/60dbcb02852e67fccea2e7332a1e3db114a91f1a/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/f222af542b93289e3c7e4e69f8f5f2328d244d8b/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/037d439ae038a91bc26e1600a5a72262a715f49d/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/079c5087c545d83f3181fcba8b4e9751cced445d/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/e1f2ea8c9f32bbf1cd706638ce4054efd1c09ebe/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/67681529c061252c75d92d88eccd00fd231ba323/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/57acab94125e7ac2b69764cc15ced095b9572413/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/bac13e4a1e45ffdecc5353425c4f7096e517c9f7/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/92212e5d5ef7e0ea16dfde71d2a18423f4fccc5b/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/18e7f5caaca6ec7b008615eb61a5429b3419a94e/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/274fbe6c073f11dfd4da4495747a8e557294031f/
microblazeel |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/3d709b0afd6df888b49afb13dffadfacfca78c7a/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/e2659fad3d7cf35dfe04ce7928a936011941bd0f/
         arc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/2bb2c2042b48cbca2014f9c0ccad62271955437d/
        bfin |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/ede25aeec04f293646eb3056303c0d323e4fa1b2/
        bfin |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/088da924e354245a65a5c93ec880a43d61b4f58c/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/24f1ad5720b44e5001b7c524acb99e39efcdd200/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/6adfcea78097151703b53e4ec204ac2a50711c3a/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/1541b29c2bd6ebd2507a67c3b2302a4481671999/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/be8971ab90cb9d03e331d452874ff37d76c78aad/
         arm |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/2683f1733d336b052af0e608d65aab3d4aea4d1e/
      x86_64 |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/adec5a9f5e1bce2f2a7a0a486426369437de613e/
     powerpc |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/db94eaba8748747cd33a2ce3f71ebfbecaf37664/
    mips64el |                       bmon-3.6 | NOK | http://autobuild.buildroot.net/results/70c44730c6b0950767fb94fabaee43038e324c87/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9103571bfd14ef920019f43f3f6e73046d49038e/
microblazeel |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/5e39b7b00d9d62322d1c55c5aa190574197eea64/
microblazeel |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/5ae930d32dac7bd57c791a9991332aabe24b8142/
     aarch64 |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/96020fcb820ad10123dbbba095d3afa019005da3/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/aeb40fec2ca0457423951067b86a9af5ac3328c9/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/84a9b50bdb89455af35f0e6738997f3c875e53c7/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/6779a92fea54a69a86a07862264684f6cf95e078/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/9be18dcbb2d406ee1b6626393c17c2b4f8f58aa9/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/2c75af5a5db00c79e3dfaf2cf5ccbc3b935c9ba5/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/2fe81270de5013eadac6852457c71240ec3dcee0/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/409329d1ce3351c27ec8cb8f0b4094d60c7efa2c/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/9d4c25218dfb2da2da265d55475c97ebbe1c3537/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a28c2cf1edb05f3a604eadb3f1b0ef7cfecb3c24/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/cf172adcd769a71316f1e6a9d4ac8006accd8274/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/c96cc96e5b2bba443bc1d022075644f529181d78/
        mips |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/da757c776643312f580f2fc8c5203711d0306c73/
      x86_64 |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/e85a838fe5f0237c0d809231b955e51ad95eacb3/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/aa5312199f35fb9b7aa898554c8c0be5a4a727af/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/9d8e5514a7721a053db4262baf7220b0503f8e72/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/36c855ef23dedbf825dac24041fc2bc60423216b/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/3ec474752e4a6e90bd1db867a939cad9058f2224/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/03a979ac562b229424748f7d9d49901e15d5e00f/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/0bd8fd59faaaf067c75b3714aa65ba3001f60cce/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f29bf297ee30c39a2dc8b668532d8533e132416a/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5878f2a45ef2275b9feb3f28cf6ae1ea9da5666e/
         arm | libnfc-7b7f5061427b5456835d... | TIM | http://autobuild.buildroot.net/results/3c74b71c7b5b3727e4e8c7db08e50d80bd1dbf6f/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e3a88714d60a9c0f902cda7ce090af05d72c14ed/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/de1f674e175e7ee5f06ea6791e2b10a46cfb3bf5/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/fab5a62d461f423b22e1d081a239fc163046e205/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0f32da2583a5da65c1b6da099a818994b4c97d40/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/53fd3146ea048af2bdde55c570b8e32ab8faa789/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d84b9101e0fd0f203bce32f6cf2b93106b56b7f2/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/66684f100efcf24321bae0bc36d8c92aeb525fdd/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d6cf7e99f44b659d82bc7dd7dd5c698a7ac9b031/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c8ef9973bd50cc8ad8f79753f2139c3e440ff144/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/731cf0e36158e28e8942e74c64f17cd0fcec0cea/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/ce16be1a50b0e97aa8c7072a04e9832f93f14e62/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/b996bb06b37b493ac84fa3b5c23f0c504b3d0744/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/6db7e026b0f6c3769469bc1b7b3b05b7d3348e71/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/9bd3a9268fc62d6ab13ecbe653b3080382ae8855/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/c87e789f076f680abde2abeeaba5c68ec0d76a45/
         arm | make: *** [network-manager-... | NOK | http://autobuild.buildroot.net/results/d87d7d3c0c34f97a5f70e592c2cae0768b33daca/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/d85df76de22dff744c1952c19dbe0ded0e3e02bb/
         arm |                      nmap-6.47 | NOK | http://autobuild.buildroot.net/results/73a562a3a1f356c1a39b2fb57f0848c4b99fe8b1/
      mipsel |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/53818b7f8963cff09b662d66a41135ec3b000c1b/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/b32c2d25b2f3c04c8d72c4fc681a5d415b4b4b2a/
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7391dd23869c1ff031d5e6467370423bb63ab94c/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/2979cdfdc43687bf46c09149597b8fd4c2298666/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/de710e9de54d6322030981ac67092fd04f1f2481/
      x86_64 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/f4b1dbd0c12286d5a53d5a8cc5154e3218f387b0/
      xtensa |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/9cdcb588d9135a82207919ff32f66d0173fd7151/
      mipsel |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d2ff534d00ab872ce220f8281befdfee177e3111/
    mips64el |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/3592e27c74a70a56d6209fa23f42314746a25d84/
    mips64el |                valgrind-3.10.1 | TIM | http://autobuild.buildroot.net/results/381fd6d03a4419d6d9fc3bf968eb0cc401a9faa2/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/4089099e44cc92b319d4ea7dec138bec9dfc4c63/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/57f22c8623268d836e8b402e8c27d418b6fb7f72/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/30c3ccb2b39c348a86a86991bfd9139aa4a65ce2/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/42669ca3b7215765a59a85c53ed724cbff79384e/
      xtensa |               wireshark-1.12.4 | TIM | http://autobuild.buildroot.net/results/3a026f6b3991dfe641411ff24c897f75cd47b423/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/f4332ca3d7dfd05ab8d4605521e43222b6cb472d/


-- 
http://autobuild.buildroot.net
