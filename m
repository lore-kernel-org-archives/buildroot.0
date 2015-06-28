From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-27
Message-ID: <20150628063017.1FB13101073@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-27
===============================

        success : 191
       failures : 48 
       timeouts : 0  
          TOTAL : 239

Classification of failures by reason
====================================

                  uclibc-1.0.3 | 10
pulseview-198f9bc74d6c955a7... | 3 
                 setools-3.3.8 | 3 
               openswan-2.6.43 | 3 
                collectd-5.5.0 | 3 
               upmpdcli-0.11.0 | 2 
                libtirpc-0.3.1 | 2 
                   bdwgc-7.4.2 | 2 
                   tor-0.2.6.9 | 2 
                   audit-2.4.1 | 2 
                 cdrkit-1.1.11 | 1 
                pulseaudio-5.0 | 1 
f2fs-tools-fd32210229d4ad7d... | 1 
            gst-ffmpeg-0.10.13 | 1 
             berkeleydb-5.3.28 | 1 
                 empty-0.6.19b | 1 
               libsigsegv-2.10 | 1 
                oprofile-1.0.0 | 1 
                   libndp-v1.4 | 1 
                    qemu-2.3.0 | 1 
               arptables-0.0.4 | 1 
                  opencv-3.0.0 | 1 
                      atf-0.21 | 1 
                  guile-2.0.11 | 1 
                   ntp-4.2.8p2 | 1 
                    php-5.6.10 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/fc3b79a78f8798b5eeeb562ca13739b7b7b6ea3f/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/a126a739797bb5d6bd0b8f578b5595a7150dc7ae/
        i686 |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/2fb3bf83957d4c27d87790857ca4a1dbaf8bc607/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/0f45a7ae516dc966970da6889fb7fcead8327a31/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/3328000eeadcfd3d235f6ff1f72885fef8fe7d87/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/18cb65c2a68e8662a8018a29c89aa388b2e1c196/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e17a516f6225aac47e04d1022b534332e5a8605c/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f0391f3755ebc32c27048c8490b2d2cdf03af774/
        i686 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/a90f75bc42632ff9bafee8cddef2bdfc2ed82fcc/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/6c9729b624f4e70254c4f3fcf3e24b4d2294f3f7/
    mips64el |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/d88cf2ee1ee4879b147313bd042b87bd5aa2f1ee/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/d0e3dba4a4e527330eb18bcd2ce310dadcf4a0a5/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/2e62a0e168ea448a8dd7c52b38330f5b0a3d2183/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/894540d995978f5f983f4ac64d7a131245a097c4/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f09b163311c0ceca4f816c56dce6bf5db28d159c/
         arm |                    libndp-v1.4 | NOK | http://autobuild.buildroot.net/results/a215a71b533ca57052aa0fd99c35b9fb4cf6235e/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/61bcd2b37b74fb81d40f4797482828a9ac7e4b8c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/0e9f41f74ed26e8452be7d3e458cf7157948f283/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/43577827d14c6361cdd2a98fa5a8fbf4adef66b2/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/e5a177531cde0282dd64832930d83b48cdf6cc60/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/87dd357a4b883ea3cd75546b3d63c4c28245beee/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/da4a267152bf729afdce1968f532015bdbc731aa/
microblazeel |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/795e188ad80a5b2dfe51efbd929bd90be1a17738/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/adc99baf111a4d69e4c5d6fe69a05701717d62c4/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/00a04372a6258d9b8f27441c2456b581bfaa99ed/
        i686 |                     php-5.6.10 | NOK | http://autobuild.buildroot.net/results/6d8670419038a7b5aa872363f6ed8582966b729e/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/3aaefbbf273053668e31e667ab137945cd214f47/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/47c26e7874e3eb2d61258c54186aeddb6b70350e/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/6f1278fbf47232abf47cff39c8af8fb121da0d4c/
      xtensa | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/d8792cd2fdf644b5a67a000fc1be995134d8e8bd/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/893243635e10803e978a81c6f2bc0d2d21c5216f/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c8cd830e9ac7cc431766f16d54715a727ea68c1d/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/aa3a2bb89eb7cd9be95078c6cdcce8efa3e9a5d9/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/191c5560402cfc4d010e97d663a67c5c854d050f/
         arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/c6621f625d905204dcf926f5ab90a947bae8cb3f/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/b26deafc1ad43d49566c7ba6010ec824251161f8/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/e7dc14bb6a12785eb7820da7db35b50cb25aa51a/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/0135c32510a07b4efdcb52c026ec1f3dee271dc5/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/c936932c2af2df9303eb93d86b45cd2bc4e28de1/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/47cf54787cbbe9247e6a6ae6d8ff557ae7a64985/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/73382288086c960e477c63cc945d589702013f18/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/476e5c258b5855d8504d90ff7132f9658407ca85/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/486161e40dbb6dc815bd9d8173d01bc560354d08/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/f2545b311035967405f4f7767ed35da1a2b4bcc0/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/5515a235585a86f5c28e48bfd4ae7ac1d6dfe9c1/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/2b17581de9892f8d5a628fe851b4f8f44180fee5/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/504818cca37909c233a94952d8c35d3be44c277c/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/b26e65f21f0253b1520777b209ea6931e3930c85/


-- 
http://autobuild.buildroot.net
