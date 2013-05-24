From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 May 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-23
Message-ID: <20130524063004.76C8152C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-23
===============================

        success : 112
       failures : 57 
       timeouts : 0  
          TOTAL : 169

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 5 
                 pixman-0.28.2 | 4 
                mongrel2-1.8.0 | 4 
media-ctl-ac40b79f002a2315f... | 3 
               wvstreams-4.6.1 | 2 
                libtirpc-0.2.2 | 2 
               sconeserver-211 | 2 
                 qt5base-5.0.2 | 2 
                 binutils-2.21 | 2 
                  boost-1.53.0 | 2 
                libcurl-7.28.1 | 2 
      gst-plugins-good-0.10.31 | 1 
                lmbench-3.0-a9 | 1 
                   icu-4.8.1.1 | 1 
                 libiconv-1.14 | 1 
          qt5declarative-5.0.2 | 1 
                 netsnmp-5.7.2 | 1 
                  weston-1.1.0 | 1 
                libsigsegv-2.6 | 1 
                host-gdb-7.5.1 | 1 
              pptp-linux-1.7.2 | 1 
                  gamin-0.1.10 | 1 
               libglib2-2.30.3 | 1 
                busybox-1.21.0 | 1 
                  ne10-88c18f0 | 1 
             libatomic_ops-7.2 | 1 
                   bzip2-1.0.6 | 1 
         host-gutenprint-5.2.9 | 1 
                  readline-6.2 | 1 
                   hostapd-2.0 | 1 
             bluez_utils-4.101 | 1 
                 cdrkit-1.1.11 | 1 
                 libnspr-4.9.2 | 1 
                 rt-tests-0.83 | 1 
                   dbus-1.4.24 | 1 
               qt5webkit-5.0.2 | 1 
                 libpfm4-4.3.0 | 1 
                 cairo-1.12.10 | 1 

Detail of failures
===================

   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/761acfe07de5b9a3d704b1277f1e31f07c662903/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/878adbd0017e253268fe53a4df7db2755a4a5f4e/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3711bc7de451bc3a9066c930f8f3cddf555b57ef/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/9a9c5e6ad23260795255e03835f7d448d3516516/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/5280bba9529b4e673967905dbf6f92c2fb57cc5d/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/9245edce29282c21092d08e026517aba9478182a/
      bfin |                    bzip2-1.0.6 | NOK | http://autobuild.buildroot.net/results/3b82290d931d9adaa74be95aa2f83fc872578e04/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ededd73cc3de464be2545f1173649091eb2cf08c/
       arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/be4f75acebb7da35adef1a8b539d7f89bc2f1519/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/12a1b855a19794020037475310e5221b78f880db/
       arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/60b03069c5ee1b5ae77dc2efb2bd0d1ffeedb9b4/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/cfcdabbb56af544a40a188a88ace54505811acd6/
       arc |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/47ffd2d414f6a383dcf81d391999281c606323e8/
   powerpc |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/097e431f5f33c3a86754e836ddf43b1d54e54850/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/fe5c73d13c7cac180c28a774ce500c2b16988555/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/71989beb9d242a5b196479c8377b368b63da37f9/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/b82436e1a1f37b2d06dff3121a18b3552876c7c5/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/16167a05f4d4ae0a90140de0ebe2ffef531be3ff/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/3674bd71fe28f95142c891c068f5fd8de056adfc/
       arm |                    hostapd-2.0 | NOK | http://autobuild.buildroot.net/results/7c258064f4ea6b23ee79ba9a3807e5e688d5a57f/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/cfb65d82bb3690499ae4be2bbd5f297580867b06/
       arm |              libatomic_ops-7.2 | NOK | http://autobuild.buildroot.net/results/1d0aff836abf1b92648bb5fc01d4d8b289f8ba72/
       arc |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/9ac5476aa2b27d386fa232dfc01596adddc2d027/
  mips64el |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/da679136f2ed99eb3d40810b17285b0e5cd0d200/
      bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/23f6ff66f94e5c9863937a19bfa7009eea5aa17b/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/d1b143c0cd5943c59eacea7cd458fb5723a065e2/
   aarch64 |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/ac098b7ccf921fdfe429a46699ae913860ef0c45/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/a41d724bbd401f92331f5c48a844a6878c3a2593/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/480b357663d73970ae4f515d8a0033e8746c241e/
microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/edea974e2f09d39366a652d40fecbfa3eb096327/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a5a37dc8a2b047ced865798bf1344d5eb3b3d6e7/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/1bc6209efae2d05a63f68ffe1ef7d2065cfd9e00/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/de547db674a023083270a17a3673f36477fe2040/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/c9547fc7838472a0220cdbd1171616862c29bac2/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4aaf2ba960d2190e57f3d1e8c74a61053199e4a8/
   powerpc |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/805a2b363546fe31582ffaa351152dddd2b4da3a/
   powerpc |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/483741647ac5c1715e4240b5979497d63f33cd42/
    x86_64 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/4f68230d0b9c6414fe3b9496e609e32c8c0ffd55/
   powerpc |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/9c925f66638667eda7dd97b506e461bf4892d4e3/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/7538f84b683e0756c138f71c8c715b6805dc287f/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/c17fcf905ce8195a0a58e007301f6574f1bfa797/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/26b34c042453c328480f6ca3bf5a4a28a12d18aa/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/def3c39e9f53f4488340027c5d1300e5f4edba09/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/450cab4a1b2b91d300afad7e7580ad0a08ea96b8/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/971fc6d441f153a15ca91312ac93ce40899b398f/
      bfin |               pptp-linux-1.7.2 | NOK | http://autobuild.buildroot.net/results/9b80537d0efb3fefab486abaecd128bd18e0efdb/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8fe79a15b72f04ac01d4b5f330f5e2fde896fdaf/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/34df643ac3bd6c8928685b95e138ccebe4bca912/
       arm |           qt5declarative-5.0.2 | NOK | http://autobuild.buildroot.net/results/1c5ddcb1e485633ee580bd669da33f6f669aae29/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/a65a67c2d2887fc6930e300c646efbe61be0187b/
       arm |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/af2a7908740276035786fe913aa5b185b6f4ff07/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/6fa6bd7860e8e4d6f37fc99dde4162dc4cefbbae/
   powerpc |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/545ea7691fba47bc5ee4dd0765e8367326fb9679/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/884f1a3b4757fbe30ad6e20b2b7afd5e9942f806/
   powerpc |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/49378f1c4ad4df99079c91961c7beb3e439578ab/
    x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2fd073faf5f19b447d9373a6d3984af8f95d8087/
   powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/dc76e134ae74ba693d1e7b63d834df5a7990026f/


-- 
http://autobuild.buildroot.net
