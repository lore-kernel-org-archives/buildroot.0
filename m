From: GitLab <gitlab@mg.gitlab.com>
Date: Wed, 05 Jul 2017 03:41:55 +0000
Subject: [Buildroot] buildroot | Pipeline #9582135 has failed for 2017.05.1
	| f3d8beeb
Message-ID: <595c600358c78_48d73faaffd313d44068c@sidekiq03.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: 2017.05.1 ( https://gitlab.com/buildroot.org/buildroot/commits/2017.05.1 )

Commit: f3d8beeb ( https://gitlab.com/buildroot.org/buildroot/commit/f3d8beeb369412a69adc75bf78391fb8a07d49b5 )
Commit Message: Update for 2017.05.1

Signed-off-by: Peter Kors...
Commit Author: Peter Korsgaard ( https://gitlab.com/jacmet )

Pipeline #9582135 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9582135 ) triggered by arnout ( https://gitlab.com/arnout )
had 52 failed builds.

Job #21103419 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103419 )

Stage: test
Name: telit_evk_pro3_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/b/build-essential/build-essential_12.3_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103419 responseStatus[0;m=201 Created token[0;m=tABBH8Cq
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103360 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103360 )

Stage: test
Name: olimex_a20_olinuxino_lime_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb  503  Service Temporarily Unavailable [IP: 54.230.19.163 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103360 responseStatus[0;m=201 Created token[0;m=29CBYGyB
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103413 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103413 )

Stage: test
Name: snps_arc700_axs101_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.192.37.47 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103413 responseStatus[0;m=201 Created token[0;m=2q1ygyec
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103410 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103410 )

Stage: test
Name: s6lx9_microboard_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103410 responseStatus[0;m=201 Created token[0;m=Xz96pmwk
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103404 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103404 )

Stage: test
Name: raspberrypi2_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.187 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103404 responseStatus[0;m=201 Created token[0;m=QetyPKZx
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103353 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103353 )

Stage: test
Name: nanopi_neo_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb  503  Service Temporarily Unavailable [IP: 54.192.48.126 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103353 responseStatus[0;m=201 Created token[0;m=KCpcXGLL
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103359 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103359 )

Stage: test
Name: olimex_a20_olinuxino_lime2_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103359 responseStatus[0;m=201 Created token[0;m=yy7DHE1a
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103393 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103393 )

Stage: test
Name: qemu_ppc_mpc8544ds_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.45 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103393 responseStatus[0;m=201 Created token[0;m=2xcwMosq
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103409 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103409 )

Stage: test
Name: roseapplepi_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.113 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103409 responseStatus[0;m=201 Created token[0;m=2QzCWiq7
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103345 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103345 )

Stage: test
Name: minnowboard_max-graphical_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103345 responseStatus[0;m=201 Created token[0;m=mBuro5yu
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103356 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103356 )

Stage: test
Name: nitrogen6x_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.113 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103356 responseStatus[0;m=201 Created token[0;m=kThqdFsx
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103344 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103344 )

Stage: test
Name: linksprite_pcduino_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103344 responseStatus[0;m=201 Created token[0;m=p_N1V7aJ
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103398 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103398 )

Stage: test
Name: qemu_sparc_ss10_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/b/build-essential/build-essential_12.3_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.244 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103398 responseStatus[0;m=201 Created token[0;m=zqiRytiW
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103361 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103361 )

Stage: test
Name: olimex_a20_olinuxino_lime_mali_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.113 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103361 responseStatus[0;m=201 Created token[0;m=ExQ3gJfP
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103319 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103319 )

Stage: test
Name: ci40_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/g/gcc-6/libx32gcc1_6.3.0-18_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.21 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103319 responseStatus[0;m=201 Created token[0;m=JXN2R3Ey
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103349 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103349 )

Stage: test
Name: mx53loco_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.113 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103349 responseStatus[0;m=201 Created token[0;m=p5eGgEm6
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103347 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103347 )

Stage: test
Name: mx25pdk_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103347 responseStatus[0;m=201 Created token[0;m=Y73aAz8K
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103325 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103325 )

Stage: test
Name: freescale_imx31_3stack_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103325 responseStatus[0;m=201 Created token[0;m=9KHs7nMp
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103335 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103335 )

Stage: test
Name: freescale_p1010rdb_pa_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.8 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103335 responseStatus[0;m=201 Created token[0;m=Zs6pJ6fp
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103341 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103341 )

Stage: test
Name: imx6q-sabresd_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.192.48.159 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103341 responseStatus[0;m=201 Created token[0;m=Trcorsy1
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103327 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103327 )

Stage: test
Name: freescale_imx6dlsabresd_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103327 responseStatus[0;m=201 Created token[0;m=sHhBue_1
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103316 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103316 )

Stage: test
Name: beaglebone_qt5_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103316 responseStatus[0;m=201 Created token[0;m=TN3_R714
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103338 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103338 )

Stage: test
Name: grinn_chiliboard_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.187 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103338 responseStatus[0;m=201 Created token[0;m=wP2uhksp
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103326 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103326 )

Stage: test
Name: freescale_imx6dlsabreauto_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103326 responseStatus[0;m=201 Created token[0;m=nQi2nXkm
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103330 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103330 )

Stage: test
Name: freescale_imx6sololiteevk_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.146 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103330 responseStatus[0;m=201 Created token[0;m=XAWSGqDM
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103342 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103342 )

Stage: test
Name: imx6ulpico_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.113 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103342 responseStatus[0;m=201 Created token[0;m=DyeAKk4y
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103336 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103336 )

Stage: test
Name: galileo_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103336 responseStatus[0;m=201 Created token[0;m=HZ4f9eLm
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103334 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103334 )

Stage: test
Name: freescale_mpc8315erdb_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.31 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103334 responseStatus[0;m=201 Created token[0;m=WA8t_vxX
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103314 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103314 )

Stage: test
Name: beagleboardx15_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/g/gcc-6/libx32gomp1_6.3.0-18_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.45 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103314 responseStatus[0;m=201 Created token[0;m=kz95Ev6Z
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103312 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103312 )

Stage: test
Name: atmel_sama5d4_xplained_mmc_dev_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.21 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103312 responseStatus[0;m=201 Created token[0;m=RHB1YyYS
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103311 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103311 )

Stage: test
Name: atmel_sama5d4_xplained_mmc_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.45 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103311 responseStatus[0;m=201 Created token[0;m=x7zyAfDs
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103310 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103310 )

Stage: test
Name: atmel_sama5d4_xplained_dev_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.192.48.32 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103310 responseStatus[0;m=201 Created token[0;m=yQhRsfqw
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103285 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103285 )

Stage: test
Name: arm_juno_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/g/gcc-6/libx32quadmath0_6.3.0-18_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.148 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103285 responseStatus[0;m=201 Created token[0;m=tLhsovCr
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103304 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103304 )

Stage: test
Name: atmel_sama5d3_xplained_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.183 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103304 responseStatus[0;m=201 Created token[0;m=sv6yNbRH
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103302 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103302 )

Stage: test
Name: atmel_sama5d2_xplained_mmc_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.145 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103302 responseStatus[0;m=201 Created token[0;m=g2P_wwjW
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103318 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103318 )

Stage: test
Name: ci20_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.35 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103318 responseStatus[0;m=201 Created token[0;m=_5hhsoKt
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103284 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103284 )

Stage: test
Name: arm_foundationv8_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.187 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103284 responseStatus[0;m=201 Created token[0;m=4CrxeBzq
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103352 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103352 )

Stage: test
Name: mx6udoo_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.192 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103352 responseStatus[0;m=201 Created token[0;m=YEcWMfen
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103298 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103298 )

Stage: test
Name: at91sam9x5ek_mmc_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.19.146 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103298 responseStatus[0;m=201 Created token[0;m=uPSJVyW1
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103305 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103305 )

Stage: test
Name: atmel_sama5d3_xplained_dev_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.182 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103305 responseStatus[0;m=201 Created token[0;m=rzmxUZxn
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103291 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103291 )

Stage: test
Name: at91sam9g20dfc_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/g/gcc-6/lib32quadmath0_6.3.0-18_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.190 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103291 responseStatus[0;m=201 Created token[0;m=mGi4ro8E
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103367 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103367 )

Stage: test
Name: pandaboard_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/b/build-essential/build-essential_12.3_amd64.deb  503  Service Temporarily Unavailable [IP: 13.32.244.209 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103367 responseStatus[0;m=201 Created token[0;m=vd_KH64s
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103364 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103364 )

Stage: test
Name: openblocks_a6_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.244 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103364 responseStatus[0;m=201 Created token[0;m=AxzsgnLF
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103369 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103369 )

Stage: test
Name: pc_x86_64_efi_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.46 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103369 responseStatus[0;m=201 Created token[0;m=kQi1Hojd
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103382 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103382 )

Stage: test
Name: qemu_mips32r6_malta_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/b/build-essential/build-essential_12.3_amd64.deb  503  Service Temporarily Unavailable [IP: 54.230.79.141 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103382 responseStatus[0;m=201 Created token[0;m=gbyMSRgC
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103328 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103328 )

Stage: test
Name: freescale_imx6qsabreauto_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.120 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103328 responseStatus[0;m=201 Created token[0;m=hthCzJxG
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103294 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103294 )

Stage: test
Name: at91sam9x5ek_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.10 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103294 responseStatus[0;m=201 Created token[0;m=Bsx2Y3yo
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103374 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103374 )

Stage: test
Name: qemu_m68k_mcf5208_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.10 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103374 responseStatus[0;m=201 Created token[0;m=pLMD1rkR
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103383 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103383 )

Stage: test
Name: qemu_mips32r6el_malta_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.85.90.145 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103383 responseStatus[0;m=201 Created token[0;m=k9Azzy7y
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103372 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103372 )

Stage: test
Name: qemu_arm_versatile_nommu_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.192.48.41 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103372 responseStatus[0;m=201 Created token[0;m=maUbzErB
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103378 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103378 )

Stage: test
Name: qemu_microblazeel_mmu_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.35 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103378 responseStatus[0;m=201 Created token[0;m=jMje5qP-
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103371 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103371 )

Stage: test
Name: qemu_arm_versatile_defconfig
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 54.192.48.159 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[32;1mUploading artifacts...[0;m
[0;33mWARNING: build.log: no matching files             [0;m 
[0;33mWARNING: output/images/: no matching files        [0;m 
[0;33mWARNING: output/build/build-time.log: no matching files[0;m 
[0;33mWARNING: output/build/packages-file-list.txt: no matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103371 responseStatus[0;m=201 Created token[0;m=dLkp22Zp
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170705/7a38f01a/attachment-0001.html>
