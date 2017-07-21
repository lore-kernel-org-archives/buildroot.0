From: GitLab <gitlab@mg.gitlab.com>
Date: Fri, 21 Jul 2017 08:40:49 +0000
Subject: [Buildroot] buildroot | Pipeline #10076109 has failed for master |
	e9a6a104
Message-ID: <5971be11cc02a_23bd3fa33a5a0f9c23712f@sidekiq-asap02.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: e9a6a104 ( https://gitlab.com/buildroot.org/buildroot/commit/e9a6a104bc82fe6425dfcf9344f560904793c8f1 )
Commit Message: python-systemd: add new package

Add package fo...
Commit Author: Andrey Smirnov
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #10076109 ( https://gitlab.com/buildroot.org/buildroot/pipelines/10076109 ) triggered by Thomas Petazzoni ( https://gitlab.com/tpetazzoni )
had 21 failed builds.

Job #23508560 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508560 )

Stage: test
Name: beaglebone_qt5_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508560 responseStatus[0;m=201 Created token[0;m=Ke7gsTug
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508571 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508571 )

Stage: test
Name: firefly_rk3288_demo_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508571 responseStatus[0;m=201 Created token[0;m=vS5LAffQ
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508672 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508672 )

Stage: test
Name: toradex_apalis_imx6_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-1ef4a29e8cea0239411dde64f9617ad76248fd02/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508672 responseStatus[0;m=201 Created token[0;m=LShvvf2Y
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508595 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508595 )

Stage: test
Name: minnowboard_max_defconfig
Trace: make: *** [target-post-image] Error 1
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 4 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508595 responseStatus[0;m=201 Created token[0;m=5x-cvBYW
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508563 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508563 )

Stage: test
Name: ci40_defconfig
Trace: make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/uboot-custom'
package/pkg-generic.mk:227: recipe for target '/builds/buildroot.org/buildroot/output/build/uboot-custom/.stamp_built' failed
make: *** [/builds/buildroot.org/buildroot/output/build/uboot-custom/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508563 responseStatus[0;m=201 Created token[0;m=mQNqG2m5


Job #23508593 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508593 )

Stage: test
Name: linksprite_pcduino_defconfig
Trace: make: *** [target-post-image] Error 139
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 9 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508593 responseStatus[0;m=201 Created token[0;m=Rh5awqe9
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508534 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508534 )

Stage: test
Name: armadeus_apf27_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.18.6/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508534 responseStatus[0;m=201 Created token[0;m=yB-2kjPH
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508610 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508610 )

Stage: test
Name: olimex_a20_olinuxino_lime2_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.1.4/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 5 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508610 responseStatus[0;m=201 Created token[0;m=qPTV__ot
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508570 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508570 )

Stage: test
Name: firefly_rk3288_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508570 responseStatus[0;m=201 Created token[0;m=rT-MT3KR
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508585 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508585 )

Stage: test
Name: galileo_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-0feded4f96ddca9816c6c1b8a4780cb4065747b9/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508585 responseStatus[0;m=201 Created token[0;m=ghxbKFMz
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508659 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508659 )

Stage: test
Name: riotboard_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2015.10/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508659 responseStatus[0;m=201 Created token[0;m=hv_dD9BD
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508562 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508562 )

Stage: test
Name: ci20_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508562 responseStatus[0;m=201 Created token[0;m=oxbY42k_
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508675 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508675 )

Stage: test
Name: ts5x00_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.17.8/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 3 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508675 responseStatus[0;m=201 Created token[0;m=WPHhzsro
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508584 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508584 )

Stage: test
Name: freescale_p1010rdb_pa_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.1.4/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508584 responseStatus[0;m=201 Created token[0;m=xbjPgDLM
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508583 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508583 )

Stage: test
Name: freescale_mpc8315erdb_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.5.3/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508583 responseStatus[0;m=201 Created token[0;m=72Tvg1F2
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508674 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508674 )

Stage: test
Name: ts4900_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-70d1e85a22879e27cc9e36384438d5a9793e44b0/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508674 responseStatus[0;m=201 Created token[0;m=R5jrD98Z
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508537 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508537 )

Stage: test
Name: armadeus_apf9328_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.18.29/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508537 responseStatus[0;m=201 Created token[0;m=K_qivcsm
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508671 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508671 )

Stage: test
Name: telit_evk_pro3_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.9.11/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508671 responseStatus[0;m=201 Created token[0;m=UFfoEqiJ
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508602 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508602 )

Stage: test
Name: nanopi_m1_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.07-rc1/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508602 responseStatus[0;m=201 Created token[0;m=HazEQZ5t
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508696 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508696 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 140.128s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508696 responseStatus[0;m=201 Created token[0;m=px9bRnec
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23508695 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23508695 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 134.050s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23508695 responseStatus[0;m=201 Created token[0;m=puXxFQax
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/74540fac/attachment.html>
