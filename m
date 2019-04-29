From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Apr 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-28
Message-ID: <20190429060043.4F626858B5@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  33 |   2 |   0 |  35 |
      master | 276 |  58 |   1 | 335 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 26
                cracklib-2.9.7 | 7 
                    dhcp-4.4.1 | 7 
                   netsurf-3.8 | 3 
           host-cryptopp-8.1.0 | 2 
                suricata-4.1.3 | 2 
                    bird-2.0.4 | 1 
                  libbsd-0.9.1 | 1 
libcamera-ab0188fc8bbb6f397... | 1 
                  linuxptp-2.0 | 1 
                  monkey-1.6.9 | 1 
                       netsurf | 1 
                qt5base-5.12.2 | 1 
                   strace-4.26 | 1 
              syslog-ng-3.19.1 | 1 
                   systemd-241 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
              xapp_xload-1.1.3 | 1 


Detail of failures
------------------

      mipsel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/897644d775b273a5b891be32fef747d8a06a7b5e | ORPH
      xtensa |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/983873251fd74347376ade3c0eabdfb2ffd5c62c | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/bfbcc0e989ba6652814a315a03b18b6ae740c23c | ORPH
     sparc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e76bdc2e385f76683ace5580d00718d139a0f9f9 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/cece0b0de9c03ad7e926336a91000d290f910255 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/5f2fa38c99edd15198a6e14162448ad9e0bd9561 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c72293dae413dd32d9da871759242538b099ee0a | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c3a9e56611a3f37b592a37f4b921d4f707818eda | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/7e69526f93a741520b8befe924dad71e533b3459 | ORPH
   powerpc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/9424ff4757ac92fcc3a68e3474ccf6fcaf592c73 | ORPH
        m68k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/b7e4658e1b0159e2c5d5b354b0d40efd5390ca23 | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/10106511e9fcf385b4571fe2718e4e468d6e79ef | ORPH
        i686 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/13989fe8cfe25a5a8917b7e7a382298666356b52 | ORPH
    mips64el |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c0034c84f589fea4d4c9be0771d7c9b8256ee9ea | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/ba5d1b27bcc8e59dc0b8fb776c3c7ddbd6c5d828 | ORPH
  aarch64_be |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/a8e8da1cbf14551d48ebb90614e6ba9b6cbb7043 | ORPH
    mips64el |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/1f77104d3078038ffd307c7752e0f7479bbe57af | ORPH
      xtensa |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/b838f75a3f5265fa48f6b248e321384d83e9e9b4 | ORPH
        mips |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/7bee6bed2a7bc379e850c91472066bcdb38406a3 | ORPH
     riscv32 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/1dfff9f266aaf699d77c0d1cf7a7c1419123d320 | ORPH
     sparc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/32afd5c031a5f4351aea6c86828614797d3873c5 | ORPH
       nios2 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e036967499658b1fae76fb758f59c2fd7f000265 | ORPH
     riscv32 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/a2eea3e14ad293e167c8a317a173b7a454208237 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/4fe5cecc675537266dafdc021f28c165ef8a0dd1 | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/f19e9d0b3c16da7bceddc6a102ba45efeebf3496 | ORPH
       nios2 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/41cee878fdab7de12acfc0fa7a7a2fd15b5c78c3 | ORPH
        m68k |                     bird-2.0.4 | NOK | http://autobuild.buildroot.net/results/14d25a71bc75d0c33714509cce0f759252925276 |     
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/bd1ccdbad78fd73d00915eb9b8603aa770bdfb52 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/57377c4316ba8642ff3217773956110ff0a4e88a |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/9d1e3219fd100a1d733bee9306d0beb1ccef03ae |     
    mips64el |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/667345efad29accc612b90bbed71c101a51fc1e0 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/9118439d48bc333a265debbdcfde0dfa06fb6210 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6c7395a9194062248051140f18b14270099be978 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/d9028a7a9e5e36d2535832df193ff32ad55ceb90 |     
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8a4d9100c910fa746cc63e5027d4a93404260a4d | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ec87a255f6e0b003f2d67d769d2002e7a66fe6a1 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/25a15bd4e3256e18961ec4b6316d05056a0f5513 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0297d265b1a93216a91aeae1bbfed97650cde995 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1faa9444c97df2e294dc9e16b96615a672ab2b88 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/488a713f3c151c5c78a0889fb3ac34d02f56fd5f | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e9db13384888ca40c0c8ed46a501c1a3a6934e50 | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/59ea96eb6b33756a95e52582573a8c92b794249d |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/0ad908a46ac28e3b9090724ba21a8576680f39bc |     
     nds32le |                   libbsd-0.9.1 | NOK | http://autobuild.buildroot.net/results/eb79fbd8283f62ca08b85d851e3c817e0354f85c |     
       sparc | libcamera-ab0188fc8bbb6f397... | NOK | http://autobuild.buildroot.net/results/b761a64707f58c08f9fe455dae0cd609408e7c3e |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9af83bbd4c9650eba31e9f5e4ec945d6c814bca8 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/fbf6ab0a8a0ecee5a8f8c9ee285c4542f57a4235 |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/5c41cef403a467214d87433e3110e5aedbba18f9 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1a25e8b83dd3f984869213ff8f2d40c90368faf1 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/74a96f188dec399be218d1f8a87533efa65e704a |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1f827a570b16990df34f730c73145d051f18fec2 |     
microblazeel |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/8a1f0a8e8c66b94811fc5a7d43b39e40e207663e |     
     nds32le |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/05ec776548c9bede4878d4c3c43040c5b0aac182 |     
     powerpc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/236d6aabd9e1ac3a6fed109f8c629199f2a46be1 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/39ca7009fdaf153c6f4bc6bf42d7a33c6020d92e |     
        m68k |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/dd42ef4500b568b96926924411be4417ffc7f4d4 |     
      x86_64 |                    systemd-241 | NOK | http://autobuild.buildroot.net/results/a27d2e865ca620b6b2c6f39a07385f74fcfbb385 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c1ed4c1a092064f063e238da9493591cdf2659de |     
      x86_64 |               xapp_xload-1.1.3 | NOK | http://autobuild.buildroot.net/results/a69b957d0f3251031b0c67e951ba8fb8d1043ce0 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

        mips |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/0a7837a706598eb2103f071a5f53330d6e57c0d7 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/7d887dfbf3cad4893f338f41c18491ae0f39b311 |     


-- 
http://autobuild.buildroot.net
