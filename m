From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-16
Message-ID: <20131217073008.7EC5B1015C2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-16
===============================

        success : 88 
       failures : 47 
       timeouts : 0  
          TOTAL : 135

Classification of failures by reason
====================================

                    ola-0.8.32 | 8 
           python-pycrypto-2.6 | 5 
              python-pyasn-1.2 | 4 
                   cups-1.3.11 | 2 
                     mdadm-3.3 | 2 
                      icu-51.2 | 2 
             gstreamer-0.10.36 | 1 
                aiccu-20070115 | 1 
               audiofile-0.3.6 | 1 
                 webkit-1.11.5 | 1 
                 dropwatch-1.4 | 1 
                    crda-1.1.3 | 1 
           python-pyzmq-13.1.0 | 1 
                  libv4l-0.8.9 | 1 
                  opencv-2.4.2 | 1 
                  thrift-0.9.1 | 1 
             alsa-utils-1.0.26 | 1 
               alsa-lib-1.0.26 | 1 
                     pv-1.4.12 | 1 
    host-xlib_libxkbfile-1.0.8 | 1 
  toolchain-external-undefined | 1 
                 pixman-0.30.0 | 1 
                   dbus-1.4.26 | 1 
         dvb-apps-be76da69f250 | 1 
         host-elf2flt-20130904 | 1 
                 ffmpeg-0.8.15 | 1 
             bluez_utils-4.101 | 1 
                 libevas-1.7.7 | 1 
                  bonnie-1.03e | 1 
zyre-378b8b5cf76d10f5e41b33... | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c5cbe96497c39643f362ebd6eb91925dd0ff2e14/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/59819c304c8f86ef9a9d9c8f39d9c2428bbfc0d9/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/58cc58bd86dff634c01e3b05641deec8d4b5e1b8/
    xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/098ca222eec4d7f2b187da618e34086841bf6852/
      i686 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3c6b06d8976ebc4eac68337fa2346c35a70b26ea/
     avr32 |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/bb9665a957e4fed25dff3e36bbf105c523dcf0a7/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/0d319fc1ed2ba5e20e3465c275e3907789e5f90e/
   powerpc |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/2dc985fc7cff6bd5d20fc074db4f6f7997dd81f5/
       arm |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/12989773f93f603e0616c7dc9e9c6d10d3ba9671/
       arc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/29343a0218bdd9bdaaf05d03e166bc6ef2a866fd/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/29e3453ffc3336f41b14eb7ed8e48126c37122f4/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/f5358e7e124af6ff9dab309208e87f40d6145438/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/05de55ab9dc8582d84cf38811c843f6f2c4f1629/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/817b19a1c8599e0854f38c5d01c431f0b01c0e68/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/77def60b9ce6ebd7f071b53048addf80bf4b8b4f/
   powerpc |     host-xlib_libxkbfile-1.0.8 | NOK | http://autobuild.buildroot.net/results/c494633f27420d74741df831457311905488596e/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6cae5b9831b3c457bc33db80007a484062d8065f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2fbb4f43a8901f020540f8b83028426a59adf3fc/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/81889ede2d6159e8c57c365b376b0825ca576b1e/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/a8aac07405fe65f482d69da7f784f954951272a7/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/d7981e353f740171ef4e4c4fa0208a6f0db028b3/
   powerpc |                      mdadm-3.3 | NOK | http://autobuild.buildroot.net/results/b4abc317d07b073f8be870ff0e7fee8f8c65f2ff/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/eedb9c748088ff12e3b43d09567be9e4416cbbe4/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/8c513cf313d664079d6caf9bfd2074f032778a72/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/77e4bad1a8249ec8e11bc663b15be573ef45eb77/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/5fc7cce149562f418fb00b77d5ff44031279391e/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/527a932132534bfdf8958f287e5ef60840b00b0a/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/d2f237ec616db34cbb933b21a85f7e3683b10711/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/80750b34bf458e6c8ca45269c4184e688143b856/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c898a2dc59ebf070dfdfe9e44880d00dc83af9a3/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/e66e6b611e476a67a8685ff04102aa3263eb6694/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/95faac158d24a07a174f65eed4acfc24a9cf7b64/
       arm |                      pv-1.4.12 | NOK | http://autobuild.buildroot.net/results/6a65dc1bcaa365bcb29fc7ebda1aac95ccdfbbd4/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/0fa06b5997c46f8f4de755d36f86c1413d12811e/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/0258202ba3329b03b3249f5629a20c81890757f8/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/1cc096be048fd0fc475595149663aa12f31fa3f5/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/807cc7683fe40f37e24015796908db7c8bf00484/
       arm |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/f77e1115c715d99eaaaea50b7e4b39b96321f23b/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/6234ca4f67a22bbc50fc844b97c2508284d2693f/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/9146d2475816e844e71facf831e0ef3a8f6f29a9/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/3c52e2f62964b444589ca0b6bec61da1c7e18857/
   aarch64 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/49a66f91e56eabeb3a1746cf94e289b23341b7d9/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/27c0ff2a05ea47ebe58cdbf2891bfe1d3ca33a45/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/aaf3ca65a69e289cd1642b8c917b36469194a475/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8e797782e151d6803337d3a3d146fac561dd5b7b/
      sh4a |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/420ec547d3b0aa1e6f98ec1a1e61a3e1b8aaf209/
   powerpc | zyre-378b8b5cf76d10f5e41b33... | NOK | http://autobuild.buildroot.net/results/f3aa265d627b54c6cd27904028ef03864b5d6575/


-- 
http://autobuild.buildroot.net
