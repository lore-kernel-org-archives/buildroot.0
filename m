From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-25
Message-ID: <20151126073017.93616101AF9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-25
===============================

        success : 98 
       failures : 32 
       timeouts : 1  
          TOTAL : 131

Classification of failures by reason
====================================

                    gmp-6.0.0a | 3 
            libsemanage-2.1.10 | 2 
             lttng-tools-2.6.0 | 2 
                  guile-2.0.11 | 2 
                libgsasl-1.8.0 | 1 
                espeak-1.48.04 | 1 
            gst-ffmpeg-0.10.13 | 1 
                harfbuzz-1.0.6 | 1 
               arptables-0.0.4 | 1 
          sane-backends-1.0.25 | 1 
         conntrack-tools-1.4.3 | 1 
                minidlna-1.1.5 | 1 
                   bdwgc-7.4.2 | 1 
                iproute2-4.3.0 | 1 
             host-nodejs-4.1.2 | 1 
                     aumix-2.8 | 1 
              quagga-0.99.24.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  apitrace-7.0 | 1 
                  gamin-0.1.10 | 1 
                   hostapd-2.5 | 1 
                 opencv-2.4.10 | 1 
                   erlang-17.5 | 1 
                  ffmpeg-2.8.1 | 1 
           xapp_xditview-1.0.4 | 1 
                  iodine-0.7.0 | 1 
                busybox-1.24.1 | 1 
       kompexsqlite-v1.10.12-1 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/28a36bc68ff9298a2075d156099b35119cd93c4a/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/4e9e0ed9454d258ef4333e847dc394ff22378ca4/
      x86_64 |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/3b48df7ca8670894420bb642a07c72df55b09175/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/37ac9afb7d82e73430c06d350b975e7d69735514/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/8471fa310cc3c9c86b3b4ecdc4e0e88cf9711401/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/85959d76db65c06b073142acf8e6185d49f3b91f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/05242dd65268ab113be7e1241fc21f7b8346fdd9/
     sparc64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/fe7c95099119e8b73e91c0ef6475b2cec87c7b8a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/bf25e48551408acffa953421fa9ec93fd3e961f0/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/f93507a7b0894503d8258ea925cb69ae035ea146/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/ed18f9f40241b97a2f4b49f1eab80db0f952897c/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/a7314bf8d9afedcf75e04690cae52b6811a194fd/
      mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/4b278e029cfa5efe5cf9df71c0e9bf29b3360865/
    mips64el |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/13a6d7c25f91cfd1b2f2d48a934429484b93086f/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8d0e8ab0e7a83fda9ee65f973b5b749b246f1c1a/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/861c3038dff03ded6d97b8bb61ba8754dc21c7f8/
       sparc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/6ff1aa088d3df15037e17367381629983d5577f3/
      x86_64 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/0f88b8cbf4e29b08b415a0c6008b40e31fa559da/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/c8e31510b2d6ddf0d64a019378c413e44df58cd6/
         arm |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/1ab4f284c9cfc2a6a42aebc6da12a766b09acc4c/
         arm |                 iproute2-4.3.0 | NOK | http://autobuild.buildroot.net/results/b5875ced6097523d86a4d55d3db1a6090f42e344/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2d9d72b9c32f92b50450b679ef100074e731816b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/f6c453ddaaea47d7fa1e2c4d8e5bff3d418d2c8e/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/c94bf1672b5440e1a2eee53fd8177823caa26cb5/
     aarch64 |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/263d4e41943b50dbe56b3674f341c98454230d39/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/a1c63a1c8d0462f6433696f885616f4a07d5ced9/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/65e0fbddfee14aff84a4ca59cd7315e1e250b55b/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/9f1a3fe51a8816a598085087916c24d6c8574e8a/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/4b03cab5e613d0abae3ef4b17bcfde49ca4133a9/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/46d0b09a1da2092a178be31b01f1dbbf0481e8a1/
     powerpc |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/c086f3128232af70d24fd5faf9282ce91d6488ef/
      xtensa |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/1e2010be4d35c292478954e40171c966da640de8/
      x86_64 |            xapp_xditview-1.0.4 | TIM | http://autobuild.buildroot.net/results/850c4602b883adf23d44638ea67012fb44154ccf/


-- 
http://autobuild.buildroot.net
