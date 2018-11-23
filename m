From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 08:00:57 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-22
Message-ID: <20181123070057.2DCB420DD1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.08.x |  17 |   1 |   0 |  18 |
      master | 199 |   9 |   0 | 208 |
        next |  36 |  10 |   0 |  46 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/83cf02f2dd24c35ead718adf9edc66eb4b0552fb |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                    efl-1.20.7 | 1 


Detail of failures
------------------

      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/2ca10a62e9cdf089c3f926a38ee91d6e455acf47 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               valgrind-3.14.0 | 2 
                   dante-1.4.1 | 1 
                flannel-v0.5.5 | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
                qt5base-5.11.2 | 1 
          shairport-sync-3.2.1 | 1 
          usb_modeswitch-2.5.2 | 1 


Detail of failures
------------------

     aarch64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/5222592f2052e18c184fae42214c112e7f39be6e |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/02039969b16534d4020ecd4574bae71b91c1e6b8 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/561b5a22091b2f36965e34d3b9f72e638c2a311e | ORPH
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/6c9f5b121e78081295c8b5b8a6f3d5b4f642d37d |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/d3131d4633581b2270a4f64219b27490f5f14c7b |     
     powerpc |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/c5b0d1d2867e49c022a2ad971dd9f358ff0f3865 |     
     riscv64 |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/8297be35725b816ff5afaf909605ceb41223efb6 | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/0c4840bd5d36392c2cbd9d70cdf71b01b71894c3 | ORPH
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/721aa45fa50f76bed1201632f77356e0dae86be6 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

              tpm2-abrmd-2.0.3 | 3 
             gstreamer1-1.14.4 | 1 
          host-libsemanage-2.8 | 1 
     intel-microcode-20180807a | 1 
              keepalived-1.4.2 | 1 
                  libnspr-4.19 | 1 
linuxptp-303b08cbf55096aba5... | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/4fc0c4a8f387d9d33a98097d259b36f89c2f5398 |     
   powerpc64 |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/6bd9677728310fec0a162f91aaea47e6e1872725 |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/4b5981585a3913f0d9b432ad96fdbcc8adb565b8 |     
        or1k |               keepalived-1.4.2 | NOK | http://autobuild.buildroot.net/results/2b64f2e5b1d7644042ec582d47d77a0503fbbc5c |     
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/d6fa0d7c2b17242d26f36c011082675753072971 | ORPH
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/139d4d42fd45d31c94a01edaed895e3a395055e8 |     
        or1k |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/1eeae816637ac695da349449f820a575f22b4a79 |     
         arc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/6413c1fa6836355578f176d7077e52844c5cb512 |     
     powerpc |               tpm2-abrmd-2.0.3 | NOK | http://autobuild.buildroot.net/results/9e1bc0b3d4ed9cdcff9d93c972a12e7eaf08b362 |     
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/9874ad4df3643b40191022cbc3b6dde801cc7fdd | ORPH


-- 
http://autobuild.buildroot.net
