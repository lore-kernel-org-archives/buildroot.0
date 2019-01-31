From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Jan 2019 08:00:34 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-30
Message-ID: <20190131070034.A3297209BF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   0 |   0 |  16 |
   2018.11.x |  23 |   0 |   0 |  23 |
      master | 203 |  23 |   0 | 226 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  ffmpeg-3.4.5 | 4 
                  daemon-0.6.4 | 2 
                 gnu-efi-3.0.9 | 2 
             host-grpc-v1.16.1 | 2 
                     pcre-8.42 | 2 
                clamav-0.101.1 | 1 
                collectd-5.7.1 | 1 
                    efl-1.21.1 | 1 
                 libdrm-2.4.97 | 1 
                  libssh-0.8.6 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                     lua-5.3.5 | 1 
                 python3-3.7.2 | 1 
                  spice-0.14.1 | 1 
                   strace-4.26 | 1 
zbar-b3b4e32b55f570372fc3af... | 1 


Detail of failures
------------------

     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/df11e6435d649734af93f9a2d1ff769a482ea328 |     
     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/b0e88fb2790cbdacccc5f128f5938dfecc18f357 | ORPH
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/64e1bea9b887e5c4210c4bf7ef25eff6407fbc32 |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/35e28e28b1b0c5daaea8a39bc58252e3d6c9717f |     
        i686 |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/3c55be2bc688671d1de9a8eedd9a7605cdda543a |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/576be5ad539df7cf4d80623387a1f2e551d4762e |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/eeda3e80c2d862f84c0f51df866323d957e88d44 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/f9001e64457a3f411d9d5650248f3874d32767f0 |     
      mipsel |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/23a2303673d7762ee7b50d0e57eb2971934fee8a |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/ec83fe51d2e5dec1ffc4a4f609daa27028388a49 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/c83d40b50f6e7e37e437bf7790115f4419425cdb |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f0b5a5d9a3096752e04f359bf298b8ce0900f213 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d6686165fcde39953c5f78baa9b3432c64f3346e |     
         arm |                  libdrm-2.4.97 | NOK | http://autobuild.buildroot.net/results/89a44460f71ebb01036573d56ff9cf59cc3cc1fd |     
      x86_64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/4a783bd1c93a60e7369abdd3ab1f0e78497efcdd |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/cc542677f26a381d0e842863281808ae15503ec1 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/420c2e6dd849a33be5f17102be49598a89c8bb85 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/ec44fc5b7d484ff81116cac79fe7a8fa3acf7d57 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/2ad34361b4a2df52266b865cf17286396260078b | ORPH
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/2a111a3b21c50b6cc7892cf4c395a2745129d36b |     
        i686 |                   spice-0.14.1 | NOK | http://autobuild.buildroot.net/results/fa3bf993cf4c6a8137a2e0304090b256d1953c28 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/205f6646df5f559647bcd18e3b233aea5065f70c |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/29253ceeab7e74dcf2d1c5e0479f96446b2c79af |     


-- 
http://autobuild.buildroot.net
