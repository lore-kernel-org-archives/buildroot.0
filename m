From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Apr 2019 06:00:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-26
Message-ID: <20190427060039.EF3B68555A@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  25 |   2 |   0 |  27 |
      master | 225 |  53 |   2 | 280 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 13
                cracklib-2.9.7 | 6 
                bind-9.11.6-P1 | 5 
                   bullet-2.88 | 4 
                   netsurf-3.8 | 3 
          wpebackend-fdo-1.0.1 | 3 
        libcpprestsdk-v2.10.12 | 2 
                    postgresql | 2 
                qt5base-5.12.2 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
           host-cryptopp-8.1.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
                  linuxptp-2.0 | 1 
               postgresql-11.2 | 1 
               pulseview-0.4.1 | 1 
                 qt5base-5.6.3 | 1 
              qt5enginio-1.6.3 | 1 
            qt5location-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 
                suricata-4.1.3 | 1 
               wireshark-3.0.1 | 1 
                xapp_xfd-1.1.3 | 1 


Detail of failures
------------------

      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/19cb6f255b3288d2ba88831395ba1f0d60191fad | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/229a94734178fa0dece19a04077fc170a36f1a41 | ORPH
     powerpc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/7eb97e0309c36562fa69b8042979bdeab27ab324 | ORPH
     riscv32 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/86d1dd8aaf376e115d22258557b1d08959da00a8 | ORPH
 powerpc64le |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/f966cbf48fb696b5bee8a41b429f2a8b14dc9c07 | ORPH
      xtensa |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/ab3bcd0a0fd671315a5f073c4d0fd0241ee24149 |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/04a1a4bd6c2f4e5862038a34a595204eef7df78b |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/bf0cbf14053128c7d4fc981b4df1f5393a2e1d67 |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/9908c2755a88d5b070deae5a7e349a36eb2c42f0 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/56fbb840548874054715884afca2655522cb54b0 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/57325332ca06162a2d38013cf7373275e7cc3cfe |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/75c396677a17496d4a5d1be7c952652b852438bb |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/20cc5c686b0a75492c0d79be9ca83f2e2d445967 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6b4290242452d7b60d92f3b5bca00b82ea209f81 |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/a989da7696f1155d37350539b5b13d8605bb14b8 |     
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7a31b6e4891f5e6308e26d6cfa2efce9689558b9 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a79441858fcb5d14b52b16cafab352834af8ca89 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/31dcadb3b2b95440a0d89682c4f0a475cd73f031 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a739b9ee29548f3616ac5067a0f38f561187b54f | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c46b3fe2ba446a46e562e33876442aadd96959f9 | ORPH
       sparc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e7c7f6c1559174c5a8b9476bb2db85352acc94e4 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/27124ce6e8495fcb3257fdfb9579783c49074f12 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b44fde3f2e87423f7eba7a4a9924f60917ca90cf | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/701fc52a6d7a9ab767866df360255d7ae0fd4eda | ORPH
        m68k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/07fffa6b91c50e407f9306866f8dadf317a379d2 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1bdc7112ab213f75edfebfcacf7ded787fa9c56b | ORPH
        m68k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a7fad54f7acfeafa69266ae0604f78d5cfe41b35 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/46393e4c6a5822f7205e20cbf91dc2a5847f65e1 | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/e0453a8e5f65e1d44aa95048b574dd49911376ca |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d4a21f91f149389232b3dae5ec9cf5964ba4dae2 |     
      xtensa | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/158950190141b4f1b0a3d7813322d3971bb8ba75 |     
         arm |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/7f41e19e0d8168c428ca19df9d42756a5a7de0c8 |     
microblazeel |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/accd194a0cf107e162436cb40a23f12a49e9482f |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/6c196ffd275b2b8837361cf6350bd5426a7f0762 |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/70fe4fa0600922e2f2bd432cda3f5f49eae98f0a |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a65bcf597c5c66f6a433ee4d7248350fb045039f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9db81d1b38f7dae7b1e331fd9efcdf54a1d41952 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/c2eac97d707cd067ce0e84b91de6827c224b1a03 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/806a19397e605e9f47fec4bfa523bb51f38fc356 |     
     nds32le |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/881318dad8217be0cd0eb18ce3c5ab3aff216272 |     
         arm |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/297455ce295391c58636ca011ac96a089ac36cce |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/2ca0a85baa1d25d6feeb107072504d5178bcae54 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e61f295258c6a38f0768cd0cfe5d85cf45bd3ca7 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/641c946e90c07df33a3e51fcb570f5793420057d |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/9152a4b8a5ed59c94724c408674c494b9aaa134b |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/a43820c328a5444fe35086d099df2676b03cba9e |     
     riscv32 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/2bfe5e379f7beb7b46ebd39aefe135745b11e446 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/c5194ddac4facac3e1da00370c86243e7ecf20ab |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/3b315ae8d3c13789e0685cdbc2a31e44151e2d5c |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0c226d6248c996fb6ba72684422232714efa725c |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/85632990cca8b5c4562173d7c5728955cbac3395 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/3edd1522d9d57acd319c2f78d8d8c42bedb22066 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/246cc1e9c740d2c4631217a2a7e818fa4c8e39e5 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/e57e48a1a363badca75d965d0be90043eee4421b |     
    mips64el |                 xapp_xfd-1.1.3 | NOK | http://autobuild.buildroot.net/results/e6009f0232eb60ed10eb46b39edf125369eb12e1 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5sensors-5.6.3 | 1 
            supertuxkart-0.9.3 | 1 


Detail of failures
------------------

microblazeel |               qt5sensors-5.6.3 | NOK | http://autobuild.buildroot.net/results/3ba494a3341301cb71d1346aefc28f884479f912 |     
      x86_64 |             supertuxkart-0.9.3 | NOK | http://autobuild.buildroot.net/results/40d91a708953e3affabbe3a34fb389ecd9462fdf |     


-- 
http://autobuild.buildroot.net
