From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 10 Jun 2014 20:42:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-09
In-Reply-To: <20140610063009.EDF82100CE6@stock.ovh.net>
References: <20140610063009.EDF82100CE6@stock.ovh.net>
Message-ID: <CAB0FRsshxZLFz=3TtiSCBYnwEbyWDcho7RYuNXVyGjgVdwk+ig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-06-10 8:30 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Build statistics for 2014-06-09
> ===============================
>
>         success : 85
>        failures : 31
>        timeouts : 0
>           TOTAL : 116
>
> Classification of failures by reason
> ====================================
>
>                  mesa3d-10.2.1 | 8
>                    perl-5.18.2 | 7
>                alsa-lib-1.0.26 | 2
>               cosmo-14.03.04-1 | 2
>                      popt-1.16 | 1
> faifa-aa0b5f90b89a9fd153313... | 1
>                libcuefile-r475 | 1
> flann-d0c04f4d290ebc3aa9411... | 1
>                 libiscsi-1.6.0 | 1
>                  qt5base-5.3.0 | 1
>     xserver_xorg-server-1.15.1 | 1
> znc-b396cafdb249544164ed029... | 1
>                    systemd-213 | 1
>        directfb-examples-1.6.0 | 1
>                   snmppp-3.3.4 | 1
>                  libksba-1.3.0 | 1
>
> Detail of failures
> ===================
>
>       i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5f7e8019428b883a8450fd9d5fad73f66557252e/
>     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/49002702dbd64f9d0a8412d7909b2ddc42c0f696/
>    aarch64 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/127852d15c4f963feb122abef9579a9fc3280de5/
>     x86_64 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/5e7e39917eb9a92c8803e81bc29aca65b4377985/
>       bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/34fbefa2d1b199f93cd8d26ec90df9ced2d44b33/
>       bfin | faifa-aa0b5f90b89a9fd153313... | NOK | http://autobuild.buildroot.net/results/9614d13769bfdc908e12e3242e7e07630dd08869/
>      nios2 | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/0620bf8d60aa57949cede0c5b3920ef5446fe98b/
>       bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/09d6eef85e8a435d1969c2a9a7df0711959c7010/
>       bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/f346bc5d46b3e161e812bbbb7105b1d73a5daf50/
>        arm |                  libksba-1.3.0 | NOK | http://autobuild.buildroot.net/results/fe1ecc10b2ef4ae046f28e219c335cd15d142607/
>    powerpc |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/8cbf46352bce6d640e0fd9eaa1f7fa231921756d/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/1d17d4fcf286fa7ed3a421251d74111a2cf9dfd8/
>        sh4 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/9ccfd3dd495ab6cb3a55d5343d9747eb828a4fe2/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/40967c7b051be8c9f8baf4a60138869eac5510d0/
>     x86_64 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/22f78b72bcfe636fba772bcfd9bb02d5a4bf415b/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/081c67f84ae1af83af1503d9a0fd3534b9d1f83e/
>        arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/2d8f5ec90fbd3203b018f0d5d8a9bf198230d716/
>    powerpc |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/8797db138307033f44a4554f15d2d55378cfaff0/
>       mips |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/b12f1dcd44286f86c1e8d91d8427d8a30ceaaa63/
> microblazeel |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/45281530167e2dc8f325ff83dd08a3c75e2b43e7/
>        arm |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/8bbeb81b4afc49a6473aa649e93e5ee8ad3d40c2/
>       i686 |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/a4444f2d4e9bbcbb55806f16eb74b3aa3637da15/
>    powerpc |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/b223590df04dd3a72017d9edab894a4c5e2d631f/
>     x86_64 |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/84faa4251a6e2dbffad7c97ed25538d3e8b50932/
>    powerpc |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/90c6236bace2538b1a6a5044fe99a9bd3123b87c/

now, berliOS is down for perlcross, please apply
http://patchwork.ozlabs.org/patch/342439/

Fran?ois

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/90a6dcf6deec32fcef86036f063302c66af884ef/
>        arm |                  qt5base-5.3.0 | NOK | http://autobuild.buildroot.net/results/3cd168b929bd65a6b9e5d3abbabb6c97ac1d0f08/
>       bfin |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f220d70c22f5464ce20b3dd40c5388a094ebf2b4/
>       mips |                    systemd-213 | NOK | http://autobuild.buildroot.net/results/10bcd92437eaa27eb61f8281c93efcb53d555e35/
>   mips64el |     xserver_xorg-server-1.15.1 | NOK | http://autobuild.buildroot.net/results/07910a54ab9e154d6b1fd69e7028e056efb4663c/
>        arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/86e5e76a6ccc1396cd84107af63cdaa0ce1dfbee/
>
>
> --
> http://autobuild.buildroot.net
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
