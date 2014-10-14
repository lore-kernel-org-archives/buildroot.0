From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-13
Message-ID: <20141014063014.67756100ECC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-13
===============================

        success : 216
       failures : 39 
       timeouts : 4  
          TOTAL : 259

Classification of failures by reason
====================================

  getent-buildroot-2014.11-git | 9 
                 libplist-1.11 | 3 
freerdp-440916eae2e07463912... | 3 
                 webkit-1.11.5 | 3 
               alsa-lib-1.0.28 | 2 
                    qemu-2.1.2 | 2 
                 libssh2-1.4.3 | 2 
              wireshark-1.12.1 | 1 
               mpdecimal-2.4.0 | 1 
                     rpm-5.2.0 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                       unknown | 1 
                 xinetd-2.3.15 | 1 
               libsigsegv-2.10 | 1 
checking for ANSI C header ... | 1 
                   nginx-1.6.2 | 1 
               iptables-1.4.21 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 gnupg2-2.0.26 | 1 
               madplay-0.15.2b | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
flann-d0c04f4d290ebc3aa9411... | 1 
                  botan-1.10.8 | 1 
                   perl-5.20.1 | 1 
                 lcdproc-0.5.7 | 1 
                busybox-1.22.1 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/5d511aa8c48f98327a4f19f512c3ba5d0436a0c4/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/ef74c4710657652ed672711e13151dc7f696966b/
    mips64el |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/5dc907c0334d3a3b7abff41eef4e025c1f29a655/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/eee0963210f0dd3b03b09768abc4b2eb0df7f9fe/
     powerpc | checking for ANSI C header ... | TIM | http://autobuild.buildroot.net/results/377c02b16cada1ae859edf235e6930d990924e93/
      xtensa | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/d3ac726110f98d87042ff883b2bc4366a2b45ff2/
    mips64el | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/e75cb6e5d2321a9144de6923124e7c6fb71d56e5/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/da6f85b8f8c9acce4951b9df64150c16d1726a83/
        i686 | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/b16ceb57ef48aabfc9a0e5dda91d7311fd9836cf/
    mips64el |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/901b2da7f97424399e82efbec21ca1b1af78c4bf/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/d3534706408588abc30d534f2b3c840c221bd2c5/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/e1623b38e5e564d989b6d24e3f04489e4952f1d8/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/8207527e3e42a226649c5f5fbf62fa8a77b89467/
     powerpc |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/56ef7684b7203bc7615bb84bc877e2d3f3fd95f2/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/69b719a9fa1089f2ddd8aaf5fab4af3ff2d02521/
      x86_64 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/daa8f8b52fbdf7d052fb0189d7a3b6bed76bd95f/
        i686 |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/0e64cb4a4a829e057a33462bab0a56b1291b055a/
        mips |   getent-buildroot-2014.11-git | NOK | http://autobuild.buildroot.net/results/d29a3f52bc6f1f0295494df39070074fd150946d/
      x86_64 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/0c4fa4d105f5fd24d85389126476f4022dafe08c/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/44606930d33d19a2e778107d213a9d5ed2401544/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/20ba4000bec5129a5994c63992fced3a732a0b4b/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/386ad46f3b456edd105c6b79393eaf66b607591f/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/0def2c71662925cee0a983e47f285f3946f00f40/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/dd936808ae1215bee92e211618177e564295bdf3/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/690a7f2cd7b884738f42a6c5dbaca8b379269527/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/ffdbb2d036a58f198566a85d4962694e63e4e4c8/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/a0bff3ac0a8f92f5960bf15d425b219502bb8c25/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/8ae1cc9f47162c7c0d01e6554757dca462679c2c/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/7739116e6a7fd7ef6de347f253727e7f27a51c2f/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/8d5177a30f17c8171815b0ff098368c925a09f28/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/24cd85bcaabe591220241c0688e56b83dd89de25/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/6235aa8a2ba23d3cdb0021b94f6921c3a68303d8/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/d6b64577057f93a3a8c17c329ef5225572066ba9/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/ee1fcc7d2311ae69d05267045bc992d17854bc95/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/d8ba853b312b4395c9bf95e0e66ca687ed2f4897/
        bfin | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/9bd90dcfd7b42a96a09301f3dea7b40de78604a7/
      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/6b6a96d101fabb774a94263b369050db17a69782/
        mips |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/3e5f4882648e2a18a0b7780b405422aefda3efbf/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/b0aead678861ad5e94ee6ec84c1ba99cd4288189/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/219990ac9f0b03e4a53279df7be3adb478904c8a/
        sh4a |               wireshark-1.12.1 | TIM | http://autobuild.buildroot.net/results/a37cda763f3716b5325956e041015e9fbded7548/
     powerpc |                  xinetd-2.3.15 | TIM | http://autobuild.buildroot.net/results/f21a8e2fcb07be05743ca3506051ec2b5f6a5dfd/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/70514731fa868e934ba50076c119456371d26a82/


-- 
http://autobuild.buildroot.net
