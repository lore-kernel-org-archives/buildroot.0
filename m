From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Jun 2019 06:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-12
Message-ID: <20190613060056.CF9A3876E8@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   0 |   0 |  13 |
   2019.05.x |  20 |   2 |   0 |  22 |
      master | 163 |  42 |   0 | 205 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.3.6 | 1 
                  weston-6.0.0 | 1 


Detail of failures
------------------

         sh4 |                      php-7.3.6 | NOK | http://autobuild.buildroot.net/results/2c3325ddef008e02a2d7f11a582c106f907bd61b |     
         arm |                   weston-6.0.0 | NOK | http://autobuild.buildroot.net/results/5dd9d881cc71a81d6408590d6a8fa92372661ae9 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 13
          modem-manager-1.10.0 | 13
  vdr-plugin-vnsiserver-v1.8.0 | 4 
                qt5base-5.12.2 | 2 
/home/buildroot/autobuild/r... | 1 
                   cups-2.2.10 | 1 
              domoticz-4.10717 | 1 
               host-efl-1.22.2 | 1 
               libgtk3-3.22.30 | 1 
                  libssh-0.8.7 | 1 
                   mimic-1.1.0 | 1 
       python-matplotlib-3.0.3 | 1 
                    ruby-2.4.6 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arc | /home/buildroot/autobuild/r... | NOK | http://autobuild.buildroot.net/results/682e1810e98ab0b7e7367cc2be5aa7242da43485 |     
         arm |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/5bb4bfd0080a6c89111a77b750b4236b1b5a7c40 |     
  aarch64_be |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/3a07c35e2c7700898e5a791292cc5ef68776b441 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/bd3755d29e31870cf4d2f1a24050072ffe49740c |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b49db505bab4ad7dfefcc8b453650b2c8fe3cbcb |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e3a3c58e06059a4913645a751ccda003a21d9048 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9af9ce0d3ff29b10db7683b722189b0bc6e40e7c |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/106f8af8c0a9d07a232e19e1656c4899bc96354f |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/39879c88d5f01dc22892cabe538c7d8b34c8ae4a |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/979f26923441ef2aa6139f63f5647809360c43a1 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9d86d6351cc8c3479f39aa6a9a599a646fc95e0d |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/02c4517e2c92c251675e2f1d95247680fed141d1 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/75cc9c6e0e2a93823ea66d74299abc14de7cc574 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/479df920205a6c28ffaf27a78d1cb5a69e9e2059 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0687e02dae1a36a9751681bac2a7c331e5bdb6b9 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a78e13b3c1cc47cf7594a5e8e6f6b558a77545b0 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/057b6121b505c98b22b00307f4c7e7873b5fa632 |     
     sparc64 |                libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/a6d2017e7ff128962e4d9fa7364bc0e75948d3a2 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/a2618a71397648b853aa12c89d4b0b52368b8531 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/09c6ab26cd7f1959feebeb0c90c93745c413d5a6 |     
      x86_64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e88701e941b49f96cb8117ac711fed4f0ee62314 |     
         sh4 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/716dd27e77a9acb453990f9c589e6a1c41a54c2b |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/8cd88ca0c36cc2c1037204434a397d94e5bff0d4 |     
      x86_64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/c4b88f8e9b865509509118ccd2202f95cab75e0a |     
  aarch64_be |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/b97c7892b133663808249c866f5048e25a3291cd |     
        i586 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/357c2fb4d7b47b2731b6012d84ec5341bcabc811 |     
     riscv64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/791c6ba7ef914bf8a294ba3d28039a0d21caa6a3 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e6c11947cfd90d5b37520a00bf9282c984025264 |     
      mipsel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/8e94fdfa430c1d2431888e0d077d2e5916281fdc |     
      xtensa |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/302de6cc9454181b8a923ac85db033101e27067f |     
      mipsel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/859b701cce48fb2b26e1e0b86669b33712f05ee0 |     
       nios2 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/68f8e8b80505d55dc71b23d8e6cc7801bb9ecd37 |     
        or1k |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/c744d357960df6d1d57a2208f4fffd98412bacea |     
      mipsel |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/58f5afe240f1dc7bdae38cd2d8b8c01de4d0d996 |     
     aarch64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/612bdef6bf5263ca64a1469070a778b80d8c75d2 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/68104c197570c98fb1b65b06efb53927c88e7a69 |     
    mips64el |                     ruby-2.4.6 | NOK | http://autobuild.buildroot.net/results/66218e2b66ccc5ad79defd16d6146111f0fa7188 | ORPH
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0730d1246d7cca347dff27bd75a2a4dc72557217 |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/77784c9c169b7cee63ad331c5af9eede1ab0ee00 |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/211f6339af0375a40bd86dedfb4399b608d34853 |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ca68f76ec157aff3a37a716419030e7416ceb06c |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/ae730b19ad5c09332242e5bfe5e480a2480c4652 | ORPH


-- 
http://autobuild.buildroot.net
