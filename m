From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Oct 2017 08:30:58 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-08
Message-ID: <20171009063058.66054208CB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-08
================================

      successes : 132
       failures : 65 
       timeouts : 0  
          TOTAL : 197

Classification of failures by reason
====================================

pdbg-77158819158d1d7053a737... | 11
                    parted-3.2 | 8 
            host-lvm2-2.02.173 | 6 
               host-parted-3.2 | 5 
                 mesa3d-17.2.2 | 4 
                     nmap-7.60 | 4 
         xkeyboard-config-2.22 | 4 
      host-uboot-tools-2017.07 | 3 
                openjpeg-2.2.0 | 3 
                    sdl2-2.0.6 | 3 
                  cc-tool-0.26 | 2 
                    flex-2.6.4 | 2 
             dbus-python-1.2.4 | 1 
                libressl-2.5.5 | 1 
           oracle-mysql-5.1.73 | 1 
                   pcre2-10.30 | 1 
                   perl-5.26.1 | 1 
                    php-7.1.10 | 1 
         python-gobject-2.28.6 | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.9.1 | 1 
        wireguard-0.0.20171005 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/89fa4674dacd8ab15c1182bb6bdc5d1aaf818894 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/94642c3fa026c02efe8473546837939474c594b7 |     
 powerpc64le |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/b667be1040dbc8aecd5dba7a931b2f048d9d6ec6 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/260ed8508ba79c012e6ef74afe6780315b1a1043 | ORPH
         arm |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/43f6c4418f9964b27e3add5389e5a4f9ff20ad7f | ORPH
         arc |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/df724767093b86bbc804bab1ad3a7fbd7926507b | ORPH
     powerpc |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/4ac17ed1bf86a27bae2932772036ccf889416e77 | ORPH
         arm |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/b01bbca83307392c57242c55723524898e71613b | ORPH
     aarch64 |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/cc79a4dd191a97373c44c2f139a019c3ce987893 | ORPH
      x86_64 |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/3788b72ed565d69db044b5b88c4f86e0586e1923 | ORPH
microblazeel |             host-lvm2-2.02.173 | NOK | http://autobuild.buildroot.net/results/bef9091c6bce92072d2781d82ea145a5b6212474 | ORPH
    mips64el |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/ac1f00a353b2a33a4cee8d5aac7ec01061f39b8d |     
        i586 |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/64ba56df203cde9c20a28aee1f80922ed6748b54 |     
         arm |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/174cff2545c572d1ab17f8748832a005f39866ef |     
         arm |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/09554e7c61996d7ee8aff63a1335679e5884927a |     
        i686 |                host-parted-3.2 | NOK | http://autobuild.buildroot.net/results/9257c7c343e62d9d396f4996ba7d163d416c2620 |     
      xtensa |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b922e0aecdfe7d414874ede02b35723014207e68 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/285380581e6e80d4a0a6bce542c4f44a9d6beefe | ORPH
        i586 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/97ddb2c71e824639d962235576e1678e1dfc76b7 | ORPH
        m68k |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/ff43dcc0e2bb42d820b7bd647f35331fbcff04ff |     
         arc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/df5f036c2d8b3ecd3403cb97d8cceb2f12a76e83 |     
   powerpc64 |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/0cd9cbf560199d6cae8044af2f453812d8e7fa53 |     
         arc |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/e7db8b6be5451c200882ad0fa49a82ab6defc298 |     
         arm |                  mesa3d-17.2.2 | NOK | http://autobuild.buildroot.net/results/326cc6b443cd1071ea1b53ed822904cb5da9ce93 |     
      x86_64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/e6cd14be2f25ac16a9242abae1a43d23fb119fd1 |     
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c99a2aa1276a6503d573b738f5c0e6a0abdef782 |     
 powerpc64le |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8e732888cc852d5aafd5e6ea88d490e3553d123a |     
 powerpc64le |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/00aa907c04b5e8613af113ce22dac5cba54e094d |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/08fb6dead8844a144b0e9ebc4b8f2696c1c13d07 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/5544df0257ba84a04a214960b387f0cb50e333a6 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/d2b0fb2207df6de085b34a85d5d8ffc27dc4869c |     
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cb14917ded248b1898c70e2e5f19eedee34d305a | ORPH
         arm |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/880245067ef3720bfe1112d951e7a19eb1e36f3d |     
         arm |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/cd5542eca077c2bbbcf43c1b00d25077056a7ea9 |     
    mips64el |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/2b41195d8dcf167432c0c59c307d6ad08ec390e3 |     
      mipsel |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/5ffdd7fab7da2e93ca1343fab7132c17bd3ef8ea |     
     aarch64 |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/dd8f69a66be850a937f354baf0d3bc894d3baeeb |     
    mips64el |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/e44831a13ed290b299c572a247ee32498c970949 |     
   powerpc64 |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/e466ba4744a163a77ae48fc4698c4062f1c96b5e |     
   powerpc64 |                     parted-3.2 | NOK | http://autobuild.buildroot.net/results/d61e7e07b683545270ef26326e9086056a8fd215 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/01086f6f2d6f544bdcdb9c2a56cc570b38ff3c2f | ORPH
      x86_64 | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/a2bf273a5c01c0768812703880d6184a6184976d |     
     powerpc | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/7f586cb4fb269ca48efa4b42c0d744fbd435bac2 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/37d220a641dcd08c40a50a6c72e687e5ed5ba6ce |     
      xtensa | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/044c57bc4d8bc6b4ea557cbf4bc7f782a8879f81 |     
         arm | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/8a5ad19559b71057be17b252b20fdea349e16aa9 |     
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/0007ea7bac294aaceb0a010730098eaaa0b94061 |     
     powerpc | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/d87cb6bb2b84ce8a11161c377283157af6d77f00 |     
      xtensa | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/438bf2b5b9c230611d365d620105b4f9d32f8e70 |     
microblazeel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/501f9f2b864a418d2c4557876c9e02711d83e3a8 |     
      x86_64 | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/e3c532165a4d044b095889e2848e4d989d70014b |     
microblazeel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/f87d1d7efd6fd50c16b35dbeca005593d31cafa0 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/26f5c8e089b50013d0323bd19b63f3bdc3bbd5b7 |     
        m68k |                     php-7.1.10 | NOK | http://autobuild.buildroot.net/results/dd8d842550d42e71946f3afca1d0bf9d2a79d41d | ORPH
         arm |          python-gobject-2.28.6 | NOK | http://autobuild.buildroot.net/results/af5601629385634b0e276495048529ebe447d65f |     
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/25ef323b4e9245b7c33845c643e74af1477735a7 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/ea6ab705636b3ad0ce16068daf85be44564c7250 |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/71b49a39e18ef67902c0a581faf7e8820e06044a |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/00d4d676f5ecef83202215743d3d586b03e77b47 |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/daaaf0dc2d05ea0794766f3d6254caba4adb9fe1 |     
         arm |         wireguard-0.0.20171005 | NOK | http://autobuild.buildroot.net/results/4719fdb802083feb87e574be411d6d9ef668ee74 | ORPH
      mipsel |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/78d3a39b894892ec81a2c0dcd1b97071298bfb02 |     
        m68k |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/e6ef6faf1d2e75f5292eef8b8c5b861503998ae5 |     
         arm |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/8ad7fb47b512d84bebd611c4b5491700588c29ab |     
 powerpc64le |          xkeyboard-config-2.22 | NOK | http://autobuild.buildroot.net/results/77fd7cca0afd83cabde28ff0693b23b035061a10 |     

-- 
http://autobuild.buildroot.net
