From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 06:00:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-18
Message-ID: <20190619060107.0A38A85BB8@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-18
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  23 |   0 |   0 |  23 |
   2019.05.x |  22 |   2 |   0 |  24 |
      master | 195 |  39 |   1 | 235 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 
             qt5wayland-5.12.2 | 1 


Detail of failures
------------------

      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/23b5b1ab679c8ecdd7aa835c1a69104e7ff05095 |     
     riscv64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/b6fcdb5983905025ee80212debc5c5e39665a450 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 17
                       unknown | 4 
           flatbuffers-v1.11.0 | 3 
             iputils-s20190515 | 3 
              qt5enginio-1.6.3 | 3 
/home/buildroot/autobuild/r... | 1 
                   cups-2.2.10 | 1 
                cutelyst-2.7.0 | 1 
              domoticz-4.10717 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
                   mimic-1.1.0 | 1 
                       mongodb | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

     aarch64 | /home/buildroot/autobuild/r... | NOK | http://autobuild.buildroot.net/results/64718edcedb11892e545973eb57a51fcc3fdf5a1 |     
     aarch64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/f4229a6e28d67871c2f2b02ff2b2e4273e624ef9 |     
        mips |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/bfab6a56ac6cb54786d94cb2da2ec41801934056 |     
      mipsel |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/dfe94bbdede51a4e9c101f099a532e08533c4852 |     
        i586 |            flatbuffers-v1.11.0 | NOK | http://autobuild.buildroot.net/results/f15d00b763f1dcf40d258b022a80998c342f8986 |     
      x86_64 |            flatbuffers-v1.11.0 | NOK | http://autobuild.buildroot.net/results/dad8a07cfab2c0f1ec0557f427d0e772b928761a |     
         arm |            flatbuffers-v1.11.0 | NOK | http://autobuild.buildroot.net/results/18f9eecae551c2db6544c7432f23e541bae0d8b9 |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/312594793afba528f7b51fb171da7d9ae68d5ed8 |     
     aarch64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/4cde769a9e846bb36c47ada40302f90846e0bbf0 |     
     powerpc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/05bec170b801c834a71b900a078f05a9b5d4d8e8 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/fa69563f8a71d4bf5e9d5efc40ed0511cd619a14 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e01ec28541c6207b317f5814127c61a35365ad30 |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a98d525832caf8df48f6eb21e79d22c8d0a08436 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f0c313d981ce9d6de8e0e60348b3d4b02f6fa29d |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d0f6e440951e8057ec8983be427bca737e2e4930 |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4470d0ecdd1fc5c04bbede0536ced4d188d3f7a8 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/8f5a6e021625acd3c917a517b0e4c886923cb6c2 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/df44a92fbb15bfaacf9e83b15a3e87f4ea98653f |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5fad1fca4c73f35ed31e26247334c55b5c411aa1 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9b0fcba6d6dcdeb32c7737685772300eb4e3ff61 |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/11408c793d1c03a09db1f842747b9fe8c75a5fce |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e4bebde1ff98bfc42d11d7192642cbb9351a11bf |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f4e8d5a4542761faee8e2bfb4618af3311dad202 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/11239523f1d8cafe8f4126040b3eda0b4e58e244 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5e9f1753fccd1c3b23e3c6c5c68936f47bafb8cd |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3ce0abf0c7d5b9043e31da8d06ed19af59e43b09 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/78b07095285353f4933773ea9a86f5adb9d27062 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/46b92da8085bd3bb73f660168ef8f9110127a57a |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4913215ef76c9efe01e1c783f6120f266e2f6b6a |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/084d2c9f9b96943da03510b0b3219444074b9bea |     
      x86_64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/10714fdcc6ee778d98c2592a91322789ae3441a3 |     
     riscv64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/229b3e1539434e949e1233e8eff80506e6f9dfac |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/33fae3d66a208b4f110e7c8b96c1028f4555c04d |     
     riscv32 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/30fb37bb05cb82f33c5a14fcfd750e69e66b3380 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/bef96acf3d181772e9333f09b9df7f0f69a040b8 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/972962eab317b74c2b56a56a09ee2c8cf0eab7a1 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a48890b5bf21b1493fa48739d8276a1c83833844 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/128675664dbce8f35e5a710e85791708263a92f8 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/0f35347a0d4b29fa7b657f42eb3d4d176ad75410 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/60bf7b3b6dc3a04537a4e906e775ecdddff5ad8a |     


-- 
http://autobuild.buildroot.net
