From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Feb 2019 07:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-18
Message-ID: <20190219070054.149B02221C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.11.x |  25 |   0 |   0 |  25 |
      master | 205 |  40 |   2 | 247 |
        next |  52 |  12 |   0 |  64 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/303e3a242513ddaaa77c0ada0fe953a797dca201 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 11
              lua-curl-0.3.9-1 | 3 
               runc-v1.0.0-rc6 | 3 
             stress-ng-0.09.47 | 3 
                   glm-0.9.8.4 | 2 
                 ibrdtnd-1.0.1 | 2 
                   luvi-v2.7.6 | 2 
                   netsnmp-5.8 | 2 
                       netsurf | 2 
       poco-poco-1.8.1-release | 2 
                   botan-2.8.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
                   i2pd-2.22.0 | 1 
               madplay-0.15.2b | 1 
                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 
              spandsp-20180108 | 1 
                   systemd-240 | 1 
                upmpdcli-1.4.0 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/d12ffdb6388899d5d08d0f9448b3700d77b5da0d |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/58d2e0cd3fcc77cc049756ca291f54b0498899ff | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/91d35fa89ae72eb718fb9a3f64b32e71c2343861 | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a14b03e36338db8d8da20b308810b1bca0791cad | ORPH
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/9f61c5686c30fe6d9782e2388e28a25601a7bafa |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/c80be5eb62ed66b53717f775f1a6d3334edeeb19 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/41adc1a8778036a3ad2437048a562d0cc7bca2dc | ORPH
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/d3ff6a1c47f0597335156da5e34e5e4989c72f06 |     
      x86_64 |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/c316493909f2caf2ca4ed890b5817a1fdd372c0a |     
        i686 |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/0dbc95ff6f832a3c897a309c60de7be08d0ed77e |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f3f38ff08373625ef46eff75461cd22893f33ea1 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/b327ea99c90b5b433e065737a2827fc3942552ea |     
     powerpc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/f89debdf349eefc9bc14787e508a313f74fc01ba | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0865022850bcde0e65638aa4dec1120b34fe78e2 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0de588daee5fa1e6a17cf2fda2c2a4590d4aa1a3 | ORPH
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/a5e11d14774bdb665a7ff418dbe5ed408e581b9b |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/5a15997ec461230b10f34a9c5c467802ce29597f |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bc2109970f2af887acda056c16f89e53b2e253d9 |     
     riscv32 |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/030c6cc8e2a59b015f8f3793d76234a2ef4ab772 |     
     riscv32 |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/dd48cac70e8cb697b42ee51561902df81edcea40 |     
     riscv32 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/9f9e5c869a25b1a276c4e5e457fc49ee50af1d4d |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/15c5279eb7ba900eab60d5b028ed2a66b3aa3c40 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/37ac3ca9cbfe41b7347fd86f18cab4079c560908 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ca79ec280f5d031ce6768d3294c3448d4dc9c2f6 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a74e1967fe9c32c0caab9b801f89393429062b7d |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/aca001900a8b8ae87edd66cb1341f1fca046cdf7 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/dd88132f944f8518e0caa035099fe446d8e17535 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/1e432a61051180ced3006e1d78b8aacda20fc9e9 |     
 powerpc64le |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6f3194e673a2782eabf7a5bc7f974267b062dd65 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/33f8fe90e97ee39932564574459315274dbb5d4e |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c8561711a5bafa88bf5807853e1c6cfbb1b38d61 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/71b31b4861756cd0ca48332db17e20a8c033d260 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/e15262d7799444649588057abfd95b96f09ecf78 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/63aa179219a97343158fb0a1b1c86b310ebecea8 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/a9a6c19306c8909eb7cd98e406804917752a93e5 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/00ed4a4285b35d8ec0be09217e5b503e4820d971 |     
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f37308c31d624a8f4a2bd44c34436c850198043e |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/428bd2eda4502e92140c9619a4c14673b41105a2 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/6eaad2f1fb6594eb2e811971b557aa027e1d701b |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/925b65314db119844524a94b6860ab367c8fe0ce |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/ec3b4f4efe82b085515d588681d6ab890ea7a94d |     
     sparc64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/b7bcc346ebc25fadd63181996e0008addde5813b | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 3 
            optee-client-3.4.0 | 2 
                beecrypt-4.2.1 | 1 
                     efivar-35 | 1 
      host-uboot-tools-2019.01 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                 qt5base-5.6.3 | 1 
                   strace-4.26 | 1 


Detail of failures
------------------

     riscv32 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/691535f334cec4bd7f1fca15c79994a4f47b5629 | ORPH
     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/51873ca02f2434d75b22342e080c05a60d35735d |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/64c6a704a39737cd683bc829a967436fad498b75 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/9763d21b0f2c92bfa34f22a53d44f2d5cce50d8b |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/f99fadcdc6df06be09e1fdf7857966d1029efd0a |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c951cf03d6200b2619e581a2f3ecdb724dddfcfa |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/5f37c601381325d93ad9a5f3a4b6a768564beb6d |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9d5a509e08e254e190033b3b41327331a9b8216b | ORPH
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/30399ff7fea2f54a1df53873869d44dd7d7cf31d |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1014ec995bd895ec934eec2d7e48a86508ce2aba |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/55199ed1c463e27942ce7e48ad05bd67cfff7e9d |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/0666ef95090c7925b85421f1d9857fdb179de965 |     


-- 
http://autobuild.buildroot.net
