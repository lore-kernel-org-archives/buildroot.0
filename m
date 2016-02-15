From: Martin Bark <martin@barkynet.com>
Date: Mon, 15 Feb 2016 15:10:44 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-02-14
In-Reply-To: <20160215073024.E815F101D00@stock.ovh.net>
References: <20160215073024.E815F101D00@stock.ovh.net>
Message-ID: <CAFGQKxf1p3JGf_Yo7KF23ge9TNwdrSz-D7CbEx=P6f1KEkomcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 15 February 2016 at 07:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2016-02-14
> ===============================
>
>         success : 183
>        failures : 74
>        timeouts : 1
>           TOTAL : 258
>
> Classification of failures by reason
> ====================================
>
>                libcap-ng-0.7.4 | 6
>                 numactl-2.0.11 | 4
> canfestival-7740ac6fdedc23e... | 3
>                  rtptools-1.20 | 3
>                pax-utils-1.1.4 | 3
>                libgtk2-2.24.29 | 3
>                  mesa3d-11.1.1 | 3
>                  libraw-0.17.1 | 3
>                       qt-4.8.7 | 3
>                   stunnel-5.29 | 3
>           libpam-tacplus-1.3.9 | 2
>                  opencv3-3.0.0 | 2
>               gst1-libav-1.6.3 | 2
>                  opencv-2.4.10 | 2
> flann-04b4a56533faf8c8228d0... | 2
>                     sox-14.4.2 | 2
>                    mplayer-1.2 | 2
>                     cups-2.1.2 | 2
>              host-nodejs-5.5.0 | 2
>                  qt5base-5.5.1 | 1
>                 mono-4.2.1.102 | 1
> make: *** wait: No child pr... | 1
>            host-libxslt-1.1.28 | 1
>        openpgm-release-5-2-122 | 1
>                     ruby-2.3.0 | 1
>                 sqlite-3100200 | 1
>                nfs-utils-1.3.3 | 1
>                 moarvm-2016.01 | 1
>               libraw1394-2.1.1 | 1
>            host-mono-4.2.1.102 | 1
>         lttng-babeltrace-1.2.4 | 1
>                   boost-1.60.0 | 1
>                   cairo-1.14.4 | 1
>                  libdrm-2.4.66 | 1
>              spidev_test-v3.15 | 1
>                 sysklogd-1.5.1 | 1
>                    fio-fio-2.6 | 1
> kodi-pvr-mediaportal-tvserv... | 1
> iputils-c8ff6feaf0442f8efd9... | 1
> tvheadend-1aa0073be39119f5d... | 1
>                   trinity-v1.6 | 1
>              util-linux-2.27.1 | 1
>
> Detail of failures
> ===================
>
>        nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7eb743f04fcfcb06c80f0a8a8dbc3f2be0d088d0/
>          arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/7c4c8730524801225d99465a6a3c8b597cb05acf/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/c46b42eec39217fc6158954c742ad2a770ace7a8/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/decc9b7229149fda688bd242476ae25b5bcd1abd/
>       x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d32f8af6e5dd294184eb35bd414cdee993d75459/
>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/7011bf7f7508a27c40f8664b2befd77a4f092686/
>          arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/966515c719ef415941e62570e8c87dfa36a2b4bf/
>         sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/b831b977e0afa3c00515b3efb12b8877845623fd/
> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ead10c0d899287d618944a0fd38653dc6f48a51b/
> microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/456d68e2efda5b9eb174aeb6c84a7dd4f103d0b6/
>       mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/a64dbdd7f31715e82c8fa77774de8e3c9bcd7110/
>     mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0bc2512f8516cb470e521bd32d3dd649479ea32b/
>       mipsel |            host-libxslt-1.1.28 | NOK | http://autobuild.buildroot.net/results/4bb0297c0de0198a3e58540fabb689990a436365/
>       mipsel |            host-mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/b04de94ac52b14791c87682566587fe2b3e7a873/
>       mipsel |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/87e9bbbb36f7fe4868d238ef6a7b72eb8cca7052/
>       x86_64 |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/f748c0956f71a7857d5cc9ae7bfe3c14357a078a/

I was able to reproduce the error in host-nodejs and i can confirm my
patch to update to node 5.6.0
(http://patchwork.ozlabs.org/patch/581620/) fixes this.  Specifically
the update i made to
0003-Use-a-python-variable-instead-of-hardcoding-Python.patch.

Thanks

Martin

>       xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/95bb48c75d18af59e389b4607989dff15d8975ee/
>          arm | kodi-pvr-mediaportal-tvserv... | NOK | http://autobuild.buildroot.net/results/651c47c611f0eaa317acb338d609d8851ea7b463/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/73f4dd9dbc0bcd0add24aa8af90190c7aa391680/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/db3d202351f6d3ccad6a3ca08ad1069d8566ac0c/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/8f86b0f7619f15bad8470a65ced63e4e4748cd37/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/53219207378eb5ee071f3d000a84d695fd612ac4/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3020622b3faae5eeb601176acd8b1cc631ac89d6/
>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0a4876c430bbcc0c06f407e6cb73f212863ea6c6/
>       x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/2d6ca78647c583d9c06cce7b05b2a1498a0fd745/
>          arc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/d9c2c8d63e26e0e1805e8b3d196aafa07d14cadb/
>      sparc64 |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/8fa69008f68310acd0461ca9f1ac67f8a8a63dcb/
>      powerpc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/7df0ebd87a9849d2da128d05b33f41c59e9e5eb2/
>       mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/3cd38be507b29db1cef57c8723e981d28151ece7/
>       mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/e902cc500461a2ded2e9d18f062ff88a3c1c27a7/
>         bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/aad3f6603b7fff8da9dc0296554fe188c18c9336/
>          arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/fd4103def013b00f2d2178a8a267b24f00c040ce/
>         bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/0463ebe95e7a82bc4930aa5712731946e5beccca/
>         bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/dcb67a832c6fc031e3b907ba7bf59893bfed6910/
>          arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/25484fb36d5667fa1a8337abeef44d840af3a5a1/
> microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/30da8afb6995d4c76f20146718c7e0c5cb69e8f0/
> microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/dfeed2fa9b6688dc7d3c37b0d79da8b412b8e704/
> microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/210368ba05c1dceee40054c957fb2228e045f7c8/
>          arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/3cc044979085dc8a75423096791e600f83c1b28e/
>        sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/01d0bc82d2c464656a513daa0e8f5e2a5e95e7de/
>          arm |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/9e798587e027fa909bb64f6cb9a7b7802d308072/
>      aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b3c0c6927cff2e40a6b3b2fef13c3c428d17ec72/
>      aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5a3c6d36792c413781305f7b484b4cdf2c390ba4/
>      powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/c4fcf5a6e3034ccd778e7537174281f5c3423056/
>       x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/3aa1c15af5ae5d9a516cd80a1a710f623e053f16/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/8143669fc689522de67a55fec8744227807775de/
>       mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/55631ab0c57177f4791b5a5bb362ed0fa3d1f105/
>      powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4645bdefdc664c7c4b6783c0f5a07d1b4da730e1/
>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/10f038ca585f6ae327618390e9e62a124399bb15/
>      sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/9fbaec717efefa13c3dc426f8e73c89335bd0c75/
>          sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/06319f5a74621251c8a40d334e89514f534a0521/
>          sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/c247197795a94d65306eb3adac328b473d179adf/
>       x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b788b2649864712d15510ac87dbf1ab734547a80/
>      powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/9055b3187d9761ffecf5d1a952d783a7e1bdba0d/
>      powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/c3c9baa3eda8297343caf717b8c6f545770356f3/
>         bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/546d7879316da3c8b3ac5061c4c42791e7e94fd0/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5acc23d43ad66bde8119a9de8568ddad27cfdbce/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/78b3116d36c1d047c4b8b360947c8512ee984c75/
>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f4afbb11e48efbfbe0dd08e693bf243e71028979/
>        sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/22d64a99115814a9b36794bb7d712f9095bc0ba5/
>          arm |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c08fe9363e13ca4f35a708220cf97ca2bd0b73e3/
>       mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/41e377a777c40ca61deebb1a8bd1407b7f36e192/
>     mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/3d8537be7a44be91dddbed631e1bdb7cc3488dcc/
>      powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/982532da49084fd5468f4bb40d1711817bd0c4c1/
>     mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/f8140ee0c0f2f96c9b1845e4bdfcff3a68724b8f/
>       mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/2e0501d57bb9aa77a573b0a1d0b5017b6eab3847/
>       x86_64 |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/67e07dc7cc8d75c22a1be1e2ec1e1184074d1d34/
>         bfin |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/9e881b2a7ef0778e846bf25a594cdda7aa65407d/
>       mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/5ae4abf6b34a485293274a029a655a4bcb6bc69a/
>     mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/8654924e6e10a07f547f8ddbca374c31a5d7aab2/
>     mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/8614eb112b1e5c7fbbe58f110b8a7f6808ed84d0/
>      powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/2fb94ecfdc32761a09da35e6fcbdd512847ec911/
>       x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/5aa83edc69cd1336adf8482a940e2d623f608917/
>        sparc | tvheadend-1aa0073be39119f5d... | NOK | http://autobuild.buildroot.net/results/ae2d40d58fdc37b0ce7eb60abcc1ca8e3717eb41/
>          arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/2c5e1e71ac25c34e0267defe7279308dfa0e7c5d/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
