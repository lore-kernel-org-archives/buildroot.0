From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 08:00:56 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-12
Message-ID: <20181113070056.A9A0A2217E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   2 |   0 |  17 |
   2018.08.x |  16 |   5 |   0 |  21 |
      master | 176 |  16 |   0 | 192 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                 lcdproc-0.5.9 | 1 


Detail of failures
------------------

         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/25c8ea34b0f5bdedb1da0e52da266126aa1fd3ad |     
        or1k |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/b48da84141b8dd401eb665e211820c680aa0b076 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 2 
                  boost-1.67.0 | 1 
               openswan-2.6.50 | 1 
                    sox-14.4.2 | 1 


Detail of failures
------------------

        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6966cfbe482d5896d8b92d8e08b0b1d0a6a5aa8b |     
    mips64el |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/b94cfae47f365f2e512702fd301d7687de80a97e |     
      xtensa |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/3bb47b04968b65e509fcbbc7f1c40a3061e4fdab |     
         arm |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/2c44ca1a8ad2693b9633862d034aae9eeaa90acb | ORPH
        m68k |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/5f017d86919c60f049defa30d9498c16c9ff755c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gstreamer1-1.14.4 | 3 
                  libnspr-4.19 | 2 
               wireshark-2.6.4 | 2 
      docker-containerd-v1.1.3 | 1 
                flannel-v0.5.5 | 1 
       gst-plugins-bad-0.10.23 | 1 
             libid3tag-0.15.1b | 1 
               mono-5.14.0.177 | 1 
                qt5base-5.11.2 | 1 
             qt5wayland-5.11.2 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
               valgrind-3.14.0 | 1 


Detail of failures
------------------

      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/09ea2fe56d1f6de05ad8e6b3c5a6880cfd56aaf8 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/984d49d95b40f677e3e52a66063eaebfd4bede10 |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/127ce41512aa419dd3265311476f65a311f0ad1c | ORPH
     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/0814bed176abe34be0131e9070694def665bf4be |     
     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/1783960a46793aacd9d050dea58775b54a36b5e0 |     
     riscv64 |              gstreamer1-1.14.4 | NOK | http://autobuild.buildroot.net/results/eb605fc7e3020b7d77ef2dd9146d8ab3ee372b76 |     
         arm |              libid3tag-0.15.1b | NOK | http://autobuild.buildroot.net/results/a4fc44f1b1b632c55ef66128fcb21f4d187f1e2b | ORPH
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/b071b1fefbd5654305d9ad28780a315f15f3bfad | ORPH
     riscv64 |                   libnspr-4.19 | NOK | http://autobuild.buildroot.net/results/aeabf9be40dc7d28b33375b2d32df74abaa3d7e3 | ORPH
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/d37a5d60783d24433bd6fea5b17e9970c741e4e9 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/4894438f0d6ea20e6d45dda458e5544d480033d3 |     
    mips64el |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/37b8366cc6c18b1c919ada4da003cd9acca5a22c |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/f7bb21d5df851a987255e1871eb3bc5bd4abce8c |     
    mips64el |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/d3c05ab390f56d329585c0b75c525588b0c8a619 | ORPH
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/9089e74c0f8428d28953ae037a84aa8a08db7ded | ORPH
      mipsel |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/e9f4cd35403a63fc7417c315c315ad970970e967 | ORPH


-- 
http://autobuild.buildroot.net
