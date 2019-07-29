From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-28
Message-ID: <20190729060110.C35F020028@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |   6 |   2 |   0 |   8 |
   2019.05.x |   4 |   0 |   0 |   4 |
      master |  91 |  22 |   0 | 113 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           can-utils-2018.02.0 | 3 
                harfbuzz-2.5.2 | 2 
               libupnpp-0.17.1 | 2 
                suricata-4.1.3 | 2 
       gst1-plugins-bad-1.16.0 | 1 
              iputils-20190709 | 1 
                 libv4l-1.16.5 | 1 
                    mpv-0.27.2 | 1 
       python-matplotlib-3.0.3 | 1 
                 python3-3.7.4 | 1 
                qt5base-5.12.4 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.4 | 1 
socketcand-df7fb4ff8a4439d7... | 1 
                       unknown | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                   vlc-3.0.7.1 | 1 


Detail of failures
------------------

     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/87306e1b0fbe350bb68ab4fac4f00f0380e041b1 |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/791658e238f805b34345ab499ff205cf54865efe |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/230f4c5807c3872b741be41f97943c2c37acdac3 |     
         arm |        gst1-plugins-bad-1.16.0 | NOK | http://autobuild.buildroot.net/results/fba64b091a802c600ad6ad2d43a22a2b4d286568 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/d6fee4f386a2cd2714b99f2796f49f5549e737c7 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/d5e439903985134e89be9b9f2f49b96c60cb94c3 | ORPH
        m68k |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/6038be7d64f76eb83e8d152310e9718b6a8ef925 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/7060c63b26b077020cf6acc43391c1e9ed33934d |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/ac5d2ecc8ba60a236a86a6b0c7cf46b373874c9b |     
     riscv64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/9d9dc53e8d89c80b676c1aad4cd7450d9f90b545 |     
     sparc64 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/233b036289f15d9ba9a391c2ff8ca04afaef80ee |     
         arc |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/40a2237638f88d548a8a597ed324d0683a5510cf |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/b8cecb0e17cf19a69893d9afc9f8450a8e0c0beb |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/9a51dec582c7a98c0c1308edd71736ee21b2e4f0 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/6deaf62d9e0a3a667bd4da00fdb24909dc662881 |     
         arm |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/5cce3fac257d69eb055e213335ea794870127a42 |     
microblazeel | socketcand-df7fb4ff8a4439d7... | NOK | http://autobuild.buildroot.net/results/9ea362dd7af5628179f9d476e7c455eb248b9c44 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/28e76225f8bcf7a4d52f31c7ccefbbc65d779031 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/d26732aef44ec2d3d0c3d6e21b0bd8716eb4ce85 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/f0fd05ce8a8b595015baf625481b58967df53458 |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/21003a367a92416971c7780b8022fc97402c8a46 |     
     riscv64 |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/f19d509167ea5d38cba54ae53016caaeb0a076d5 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  brotli-1.0.7 | 1 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/04a01a3116ef2eec5cfbe5a266fd0680c5edea28 |     
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/370cac85e4a333e172ead8c960d49baca2da744c |     


-- 
http://autobuild.buildroot.net
