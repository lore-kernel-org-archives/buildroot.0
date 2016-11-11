From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-10
Message-ID: <20161111073013.4E5A720C20@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-10
================================

      successes : 215
       failures : 60 
       timeouts : 1  
          TOTAL : 276

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 7 
                bind-9.11.0-P1 | 3 
                    mpv-0.20.0 | 3 
                 weston-1.12.0 | 3 
      docker-containerd-v0.2.4 | 2 
                  guile-2.0.13 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                    mpfr-3.1.5 | 2 
                 mplayer-1.3.0 | 2 
                 qt5base-5.6.2 | 2 
             tinymembench-v0.3 | 2 
                collectd-5.5.2 | 1 
         docker-engine-v1.12.2 | 1 
               domoticz-3.5837 | 1 
                    efl-1.18.2 | 1 
                   erlang-18.3 | 1 
             fxload-2008_10_13 | 1 
                     gpsd-3.16 | 1 
                ipmiutil-2.9.9 | 1 
               libepoxy-v1.3.1 | 1 
                 libnss-3.27.1 | 1 
make[7]: *** [libavfilter/a... | 1 
                minidlna-1.1.5 | 1 
net-tools-3f170bff115303e92... | 1 
                    ola-0.10.2 | 1 
                  openjpeg-2.1 | 1 
               polarssl-1.2.19 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
                    qemu-2.7.0 | 1 
qextserialport-ada321a9ee46... | 1 
                    quota-4.01 | 1 
          sane-backends-1.0.25 | 1 
                  squid-3.5.22 | 1 
               tcpreplay-4.1.1 | 1 
                     vlc-2.2.4 | 1 
                     wget-1.18 | 1 
x264-72d53ab2ac7af24597a824... | 1 
                 xenomai-2.6.4 | 1 


Detail of failures
===================

 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/dc50ccea61226fa79a2f9d30e592e01939a4fcba
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/0d53e67858ef4ce80b5d0aae59f223ed99265a56
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/cb7674fbd053616ca445afb0c5a3d15d927ea658
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/788511350d1383b1e3f985f6ac676d151f96fcde
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/bf603d592c5389b563e2ebc81a10a666dfcfc8e4
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/e03d29f4220c8529b84a29deca3700e51d8e2093
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/4725eefeef99f29b483e55ed21d31d37dd76b33c
        sh4a |                domoticz-3.5837 | NOK | http://autobuild.buildroot.net/results/933a00ce49b4243020bd90f4404e7db0f40eac38
         arm |                     efl-1.18.2 | NOK | http://autobuild.buildroot.net/results/162133cbddcca1ea8be660a19771f04296c20fd2
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/a892c48da95622aaadeaa2cc27bb9151d95aab6a
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/b155624a4a4c7e9ec16a74bcf9c466cbf64f600b
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/8c2a2ef3f097e1329c22247789b8e01034d65f21
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/e0fd959d7a151f0c676fc4e4d4f3ab121fa8d7ec
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/b31df47b831179e9066c04825095511c975f46fc
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/0ac0172569355ffef073e2d30d66573112b96932
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/448e2790b17590b090417db2752b2cea35ca66e6
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/9ac277e0744ff1442eecbd342f8e4c60005748f7
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/88d045dd7c5e3834c399ad1e38364628de739d78
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/d2f0d99e940cbecb0b375a2ec09b8a6bd896eef3
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/d793c413fcd958dc7e5decaf2db4121348d313d0
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/e4d4fdef5adfb9387d5facb0e81b627ad1fb3c7b
microblazeel | make[7]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/e7f28660a779f580bb3b8f7f354383879d1486df
 powerpc64le |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/dfcd01f0495c76b893b0ea1102e64025b5827b07
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/d1eae7d5b09815beb0d62b592870b4e864f6f9ef
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/2ad2d79d5c87457670767a17e1e8d58b99322dc3
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/dd106b9c7129a062c1efc6349f83c0968d5c3c32
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4bdbfd0f7229cbe8ea1eb6ff8faa47822441ff90
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/cc89f6ffed3a644dcaeeade18f377750be37f24c
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/86d10508f9d29a302ee05c5cdeb2fb85828ceb2b
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/bb42720fb7a1b2499da9b9d7585da36a6de1f2c5
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/32e8f05b38492dedf04a7fe2f6e23f95b7dd558a
      mipsel |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/111c5f3eed6a5931de27a1b0b02be6e2114198e6
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/5cee20afd8bef5268832cddcb3a5270746be7a57
     powerpc |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/9d2904e5c52b39ca0bc0b65d4c1f9719315d1663
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/2eb1ac6738d8d4038eaa081bd1525daccc4ea62f
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/160e77a9f50dee5e73532424a8d0f77919fc0379
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/bc7ccf5539a8214f313c6dfa1adfdfda4bf6a1ff
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/87bf0996b7a86e5cd3e1639d0d9d232af5c18485
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/1ee926b08039bc4076a127b76a5d54e66e2d6bc2
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/761dd8837553cb4df691ed3b84cdf32ca0d23670
     aarch64 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/48c458c035162169e8ca7c34ae65e9064822f25a
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/f4595538f4b627fcf07912baac230744c037f842
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/ebf37997e6d0ebb649f4c72f9558782db9354b0f
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/283ddc5c1692558dc17fd3b5379c7677e12726d8
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a45aa7ce8570e80f31ae69485f900407537bff0a
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/22cc89930aa3648fbac7c15e5b8e011d33bb88ea
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/f9ace2a3dcb887a472cad2048599882005b12567
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/a352ebafb00fcbe1b7ac21033efdcc8e66abec14
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/af3e2129bb29b82dab24d63ada84f9133d432f51
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/a564cf4a410dc1a4ae7bf38b05883c40891a6f17
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/3ed2da9cab0dd2dbecb49b8be0c49b3e030470fd
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d09230d910cc6bc6825d63d653548373fc3047c3
     powerpc | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/7c1fd43678b40b936c6c6906a3403a3aee06a6b9
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/1275b4c7f26650a8cadd31e8ea4c6f3e4069864b
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/fa606278ba1dbf9f887e5b87be8763e632fad7ff
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/b1e1d87c0b71d25d0f048487dc7f8f367a5cd8a6
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/996cb0bc0e919f0bd614851c364bded22b456871
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/ac771c8fd36b6af79bab83d57ef6b1dbfccbde8f
         arm |                      wget-1.18 | NOK | http://autobuild.buildroot.net/results/5037704532c9ad5204dc13967cd760ed4e11fced
        bfin | x264-72d53ab2ac7af24597a824... | NOK | http://autobuild.buildroot.net/results/c844ac09289eb08e7116c6e82df1c59df331563a
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/af903d32220d04ff6154eeb69f926d3b97656dcd

-- 
http://autobuild.buildroot.net
