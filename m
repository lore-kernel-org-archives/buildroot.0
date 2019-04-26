From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-25
Message-ID: <20190426060041.EA1BD31AE2@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  23 |   2 |   0 |  25 |
      master | 261 |  49 |   3 | 313 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                cracklib-2.9.7 | 11
                    dhcp-4.4.1 | 11
        libcpprestsdk-v2.10.12 | 5 
                   bullet-2.88 | 4 
                   netsurf-3.8 | 3 
                  linuxptp-2.0 | 2 
                       netsurf | 2 
                suricata-4.1.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                  grpc-v1.18.0 | 1 
           host-cryptopp-8.1.0 | 1 
                host-libsodium | 1 
          libcdaudio-0.99.12p2 | 1 
             openjdk-jdk-12+33 | 1 
                 openssh-7.9p1 | 1 
               qt5webkit-5.9.1 | 1 
                  rpm-4.14.2.1 | 1 
                   strace-4.26 | 1 
                   systemd-241 | 1 


Detail of failures
------------------

         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/fbea58f7aa2c2421dc31d18e50079e945c489357 |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/3e961d40f3d7003061eee0f7dc476d26c444bd7b |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/53dcd4e54f1394e52dba8a46a8a8d0facd781c6d |     
         arm |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/a2609de74c08d9287beb839b93794161a7868e30 |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3dbe5ae82b9cf45534b170d9481ab036025af6d9 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3548dddb38737426cd58bdc09a32523a8f1e7a78 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/70c997e09c45ef2cc41142a906693d359e865139 |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/cd215ee4291ee4b1a067964523dca5cc9a55f408 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/eb990f3baa4940cbf8304a0050afc635e9424a0e |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/3dfa0af082a65c484a0749a8885bbb97141bf18a |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/54bbd09e6c630a254fa3906d2d546d17b286888b |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/7f55aed659093d0374d6092a651f859438d3449c |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/c80e76462a2213684aa96e65b7b1e85521c54ac8 |     
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/4c16aaa074c6e768a6b24a7875ab70db59a31920 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/75fba5a284449471f8f53d832d61c6f3a9c774af |     
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/41e0e1d78bd39106e0aea1a3a8c04b2367c742ef | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bd26926fde193e7ade203cbb245cbb19e56b4853 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d28fa482aa9694c5742ad58184dcebb63b997d04 | ORPH
     sparc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bb9b7245c4db9f2fd4da9c04f9c78934e0138710 | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6f67e9f6c9db2ea978d66e16e96f1219d4a008db | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ca20e9deabb1fbf403f23c3cf3087dbcd872f676 | ORPH
     nds32le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1046ccb1ffa29bb15f964fe41c196db0194c6fc4 | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c9ce2fdc0ed620bdbb646d2afda81868d6e17c90 | ORPH
     sparc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/47db0d2db09ea52a24d7f775d8bc835278554ca0 | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fd42a796c72b879e9105487b24b01a7756b9a2b9 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/42de3cb44db476249ab787bdfacaee88795dabd3 | ORPH
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/a2c258ac8c438a05121d2957e8a4f1cb109cb146 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/0f8aa4df7c0f404f2feb25f94a5b9124a60507e1 |     
   powerpc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d48384ef5afea118c9e0f221efb5316bd2dbc022 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/a84be1e85c7dd8c80324aac3d29165faf993f190 | ORPH
     riscv64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/de08bc2269ad2579b425923ed64216e5660bfb83 |     
 powerpc64le |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/65840c7c5b337f1d4e5768d8e68198a5449603fd |     
     sparc64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/08a82c9cfcef502c2cdb0896132f012bb4fb4c87 |     
     riscv32 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/c308eadd7090bb0c539ab4e06a7c4d2b3675ddcf |     
      xtensa |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/39ae7fa15725be957f6a5eec7feee22755a25ac8 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5c6a8c606f7817890cc1f583a18e864907d35b12 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a8c121e466dfb35a08e153c6de88229e3e3e043f |     
        mips |                        netsurf | TIM | http://autobuild.buildroot.net/results/499d32e322f5242ad2705d2a73443e6c82a35aa8 |     
     riscv32 |                        netsurf | TIM | http://autobuild.buildroot.net/results/0ff5ca1fac8aa4e87006aee7fa527ed5aefb13b7 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fb1c64efa0f095a4df20923c6b30974b8c3022f1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9180a22ba1837e34f79b3aa9cff5eac4d807eee9 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5b934c1d4aacd4f7402f6796ba489ebfdab2e9f2 |     
   powerpc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/302896cf05f0b122b450888b789f3f37acc58512 |     
       sparc |                  openssh-7.9p1 | NOK | http://autobuild.buildroot.net/results/33d0e56368ab0e74d523be4837824654a4684746 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/23210b3a6a03e8ad7ef1d607da62c7b22e3a22c9 |     
      xtensa |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/26e20e19d878811d90fce52eb0951ee4d8b59068 |     
     nds32le |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/24023f2fa3dbf7c281726abdbfd4322badaffbfb |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/045b4f0ef5e475634eae2af9e72e2e976e25f366 |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/0940cb9251914d6a3eee59ffe347bec131a90309 |     
         arm |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/416c6b1e1dcc2bcdfbb597ee0d7bba27c65d2e37 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/949a0f6918e5f1883e6dd1a94218bd9ed9f76392 |     
    mips64el |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/afb4812c65da6d206887f26443332844d59ba7cc |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 
           qt5serialbus-5.11.3 | 1 


Detail of failures
------------------

     riscv64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/d03f14363a6095fdf9573871244c98895f88600e |     
microblazeel |            qt5serialbus-5.11.3 | NOK | http://autobuild.buildroot.net/results/5183390f1801bf19de21e053a6001c3a241af308 |     


-- 
http://autobuild.buildroot.net
