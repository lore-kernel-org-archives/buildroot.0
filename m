From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  9 Nov 2018 08:00:39 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-08
Message-ID: <20181109070039.A6BFF224CC@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   1 |   0 |  17 |
   2018.08.x |  21 |   3 |   0 |  24 |
      master | 156 |  23 |   1 | 180 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

        i586 |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/36669ae47c7c087ee822a097c7a2d9eb68fc4f9c |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                 lcdproc-0.5.9 | 1 
                libmpeg2-0.5.1 | 1 
               openswan-2.6.50 | 1 


Detail of failures
------------------

        i686 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/99490453f5e268b350a48f173a8c46f51d1d0200 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/eff6e8aae6b09aca9be4246fb50fa4e772ea3d98 | ORPH
    mips64el |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/37cd2ae308e0b9463bfcbffed086f892e5f5d22c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   luvi-v2.7.6 | 5 
                  libffi-3.2.1 | 4 
               wireshark-2.6.4 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
     docker-engine-v17.05.0-ce | 1 
       gst-plugins-bad-0.10.23 | 1 
          host-libsemanage-2.8 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                libselinux-2.8 | 1 
                 libv4l-1.16.1 | 1 
                   qemu-2.12.1 | 1 
          shairport-sync-3.2.1 | 1 
                    sox-14.4.2 | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/2c91284f787ae83c29fcc4886db6d4109633b168 | ORPH
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/87401847c25181af95cf899c2ee24b548be5db72 |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/257a2974774140c111127460e86c0a59b8a58ac5 |     
       nios2 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/e89d7d0bcc0e4d4779d97e58e71424d4a693180e | ORPH
     aarch64 |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/cd27e3c66274622d0c3dd5a601a36efb1bc45011 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/82fed3a0c0376bfc549fac6a4be3a00d6ac0482f |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b11c33e9b7f6cc5d53a4794653485614f70fc063 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/fdc1bec989a623d3aeaf4f1bdb643859d56c8c39 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/44e8867e670fb8e4a406d98acbae56369cafc832 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a815a87552dd5c7417937fd34e54c8f932a11f99 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/895c803fe00cea719c2a5deb7238c0576f79605c | ORPH
   powerpc64 |                 libselinux-2.8 | NOK | http://autobuild.buildroot.net/results/d36152a68ef92672f20f72d9d2dd27633fa0f654 |     
     powerpc |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/801a45694d5f0575b2f2635ed9bdc6075d7b1442 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/35ebf46b3fec6d00c385a75f81a68c4dc5485790 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/5afbaf83402f3ea08997062c5b37d29cfb32aa5e |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/126b430038c9ed16c740b10ba745c5522df866ed |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/a83aca2b44b44143c40db310fa04430c0b4e6d87 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/935209280e314e1fb88f65a94e97cc10379ef10a |     
        mips |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/656e45721c72197834462eb2bd8c762e520725a4 |     
     powerpc |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/ca3876e321b1c7708c04e431c4d91ebbaddcfd8d |     
         arm |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/153ad2fcdc8ab71f102d023c999675b16b403afa | ORPH
      mipsel |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/5f9b28950c4165c2626df09f3953fbaf110f353e | ORPH
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/913927fe1ede29cc18367ed218265cd74245dfd3 | ORPH
       nios2 |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/5ae6d46573942713687f4e659b3eaf0b768ebc71 | ORPH


-- 
http://autobuild.buildroot.net
