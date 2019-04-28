From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Apr 2019 06:00:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-27
Message-ID: <20190428060043.89405849A6@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  33 |   3 |   0 |  36 |
      master | 261 |  65 |   6 | 332 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 25
                    dhcp-4.4.1 | 11
                cracklib-2.9.7 | 5 
                       netsurf | 3 
                    postgresql | 3 
           host-cryptopp-8.1.0 | 2 
                   netsurf-3.8 | 2 
                qt5base-5.12.2 | 2 
              qt5enginio-1.6.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
               wireshark-3.0.1 | 2 
          wpebackend-fdo-1.0.1 | 2 
                    bird-2.0.4 | 1 
                   dvblast-3.4 | 1 
                     gdb-8.1.1 | 1 
                   mimic-1.1.0 | 1 
               mono-5.14.0.177 | 1 
          qt5multimedia-5.12.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
           uboot-tools-2019.01 | 1 


Detail of failures
------------------

      xtensa |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/1804c18859beca68da60a729549d3c42e93a976e | ORPH
   powerpc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/ce470cb5a5a2756d7cf65f5000856f1dc735276c | ORPH
      mipsel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/96815b1300547c976443bf74b762febdfcc8d3ba | ORPH
    mips64el |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/68db0558b86a556c2309487011caa67145b231c7 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/121cbac62d8ca93ac4915eaa90a1f93b1ac0eef7 | ORPH
     powerpc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/2ee9b97ad0a31c4e6d37e5d5069babf4226db5ac | ORPH
   powerpc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/5dd066fc750d271ee9a85e7e8769f214f561e2b5 | ORPH
 powerpc64le |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/94f43e458a15036e608a2f602c03eb972bbb9782 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/177965aa810ffb15d9aef35a887e161aef40fb2b | ORPH
microblazeel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/04c68d296002edc994be4c2bdab40a874c18014b | ORPH
  aarch64_be |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/0c3117b74374288cccf6f91707bd8a4eaa0d28d4 | ORPH
     riscv64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e37a71f3fcd2ab08a4869032f1de14dd77b1c76a | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/cfadb6d17eb089eb8d82a064b58e3c488f00276b | ORPH
 powerpc64le |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/41ef4b1285dc814cb55fc2a3b0631713c5233b62 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/506bcdea2f5d39af876972b37c4c000d808e54d3 | ORPH
     sparc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e85b94575bfff8e7aacc631f114517721a962880 | ORPH
        or1k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c40c920ea03490b75db985c421f9ae223acda84a | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/2888e7bbfd3363d917f66ea23259f3b2542a50a4 | ORPH
        m68k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/b9a6ef24c1aa01808db5bf0ba7b29450bf236a9c | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/111ce919abee8e6edbb5d108a85d1c78d092732a | ORPH
     riscv32 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/71b26a154d820a59e4a3abe20e6be942e67ad592 | ORPH
         arm |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/60f4c95d6afaa8e471544afe8428444b8b429f14 | ORPH
      xtensa |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/27e74664c91ed0ab6f974d0b316ec9477dd3d73c | ORPH
         sh4 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/0a2a0c00407fa0c490d2a03c0cf4ca0bf5e27e1a | ORPH
    mips64el |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/1c0fba3b3a15a897ef2489e6c35acbdd6d9c2415 | ORPH
        m68k |                     bird-2.0.4 | NOK | http://autobuild.buildroot.net/results/ab9ab2cca2c191ae9a8f0ecb2aa2536a3f020301 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/95ffdc8ab20c6ee81026a9b8b6f0c351d7e22847 |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/14c66f5ae29d8a9d7903606dafd93892b6fd249c |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ff23f1200a5851e610a07eeb0bd6f9f4fb36d707 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/c5db46a8c41856729dd8e2b55e37a679c2774512 |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/32179eadf7578e47a308fc5e464b6bf7d00147f1 |     
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/aa70dc9455c1ed278837a8bdc7a4395e69f66b11 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/49b16d4c00ba7b4b060379420b29f7f2e841b0e9 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7016b64db9aca24f4958af39a32afd71e2b91ccf | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a1a3b75a14413977aa5a5eeaab7236e9bb380c76 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/95c714317b15bfb5de3aadb39e8f4aab56327563 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c0324030ae3556d90d0fa5caff4a8516f874e172 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/9656a3e9f6ffa4f0e17098977215dc3a17d28494 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/588d2f9b3b7a1d06595d773edb2c4232cf392207 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7ab94e8a3c9a243581354277059d55c23b8057ff | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/d232ef3d353a0cd04c96e0c8553ddb9d17f88538 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ce3b1a9ac35cb8941f0a9db9bdff5734ceabfd30 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/5bb5d9267219fea2d8304c3437d44bcf5dd71567 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/f9dc76a7097e298c2bf560a1d2cd3ac1fdba6a92 | ORPH
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/7e68f32e62c34497848f0f7fc1f12dba67bf44d0 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/4805636eb14d3e7032915ac64df88d3c627e694d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/f53abba41ae3bd89cdbd4a28339b23ff52dcd4b9 |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/fb2ae458e887a582b675fe51fdf7b03e2d53df60 |     
microblazeel |                        netsurf | TIM | http://autobuild.buildroot.net/results/bbd919907df1ed96fecd7b061b3d3070f93de52f |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/1f992082af77ea107e6ede5d8431721121f514fd |     
 powerpc64le |                        netsurf | TIM | http://autobuild.buildroot.net/results/4c52ec56e5e56011bfc10e7be9e97c9826779ce9 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/adf06b463d89960724d6fc13fc8078a9df1edff7 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c6a123b5ac068d5b5753b9287f4dadcd0b6bfbf1 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/de3f9294c576f75b429a4da01454a084fd55fba6 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/87b375cfc94b8d35dca9d7e5af9bc6ad0fc0ef8c |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/ba3b2f8c85f18994280c7aa326d96fe897b44b13 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e6273c6f6845be07a619a223222979acd1a3572c |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/f12619257ed07e86277dfbed062f1cd2ef99cd82 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b22fdea4804dd615e603bff6683ef526b4141867 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/35542955cf3322becaccd76ff951b219b80d78fc |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/759d474d38918625374d712a752d6ecf2392e171 |     
     aarch64 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/89e773a320778ac69a76dd85d75daeb1c6ec4f86 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/90a6e1f272ecc79b382f23ebcbbd2207f4ffd104 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/eb11deca90af5a5964267fb987f9b9b63e30c316 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/915b509e814bda16be54a24276b9c740c51e5770 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/397047bfef93b6f7788e4990674124e3c4569de0 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0a6c675213848b2399c43fca9b17dd24503c2369 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/c28789f1e2bec371f9ba74f026fc8fa1ae6d9648 | ORPH
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/74ad22b9f12e00bda48a6a4a09040d2b38822d2f | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/0a234162485a5eef60b6c1d8e69429376a890832 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/372b505d9536139f1a90cae7e65a8130ebe206b2 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/a42ef189da40862422879cae8e2e68bed6b0485c | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e43dde1c98dc85577a7e60b0de808d191c75d056 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/2fe129fc641e621ec2ead70e7e0a5a738ed8cbf3 |     


-- 
http://autobuild.buildroot.net
