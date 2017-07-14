From: GitLab <gitlab@mg.gitlab.com>
Date: Fri, 14 Jul 2017 08:22:24 +0000
Subject: [Buildroot] buildroot | Pipeline #9867484 has failed for master |
	815d78f8
Message-ID: <59687f4017e44_6f293f8e6a5607d8717d4@sidekiq-asap04.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 815d78f8 ( https://gitlab.com/buildroot.org/buildroot/commit/815d78f8ba78eda7bd9f119d9ce2739bf0ae7af8 )
Commit Message: fs/squashfs: cleanup if-else cascade

And add m...
Commit Author: Yann E. MORIN ( https://gitlab.com/ymorin )
Committed by: Peter Korsgaard ( https://gitlab.com/jacmet )

Pipeline #9867484 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9867484 ) triggered by Thomas Petazzoni ( https://gitlab.com/tpetazzoni )
had 24 failed builds.

Job #22454423 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454423 )

Stage: test
Name: beaglebone_qt5_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454423 responseStatus[0;m=201 Created token[0;m=rUpDxsyj
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454428 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454428 )

Stage: test
Name: ci40_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-custom/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454428 responseStatus[0;m=201 Created token[0;m=YB6itdx-
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454380 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454380 )

Stage: test
Name: armadeus_apf9328_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.18.29/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454380 responseStatus[0;m=201 Created token[0;m=e82shyBM
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454475 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454475 )

Stage: test
Name: olimex_a20_olinuxino_lime2_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.1.4/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 5 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454475 responseStatus[0;m=201 Created token[0;m=HbfPMZuC
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454436 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454436 )

Stage: test
Name: firefly_rk3288_demo_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454436 responseStatus[0;m=201 Created token[0;m=_DqhHMwN
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454536 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454536 )

Stage: test
Name: telit_evk_pro3_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.9.11/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454536 responseStatus[0;m=201 Created token[0;m=DcyGWK7v
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454467 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454467 )

Stage: test
Name: nanopi_m1_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2017.07-rc1/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454467 responseStatus[0;m=201 Created token[0;m=3Z34WmPB
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454542 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454542 )

Stage: test
Name: ts4900_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-70d1e85a22879e27cc9e36384438d5a9793e44b0/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454542 responseStatus[0;m=201 Created token[0;m=YRxFphUX
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454369 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454369 )

Stage: test
Name: arcturus_ucp1020_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.1.27/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454369 responseStatus[0;m=201 Created token[0;m=6JxNBLrB
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454538 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454538 )

Stage: test
Name: toradex_apalis_imx6_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-1ef4a29e8cea0239411dde64f9617ad76248fd02/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454538 responseStatus[0;m=201 Created token[0;m=Q5dcrryo
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454449 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454449 )

Stage: test
Name: galileo_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-0feded4f96ddca9816c6c1b8a4780cb4065747b9/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 7 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454449 responseStatus[0;m=201 Created token[0;m=QefoZb73
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454478 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454478 )

Stage: test
Name: olimex_a20_olinuxino_micro_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454478 responseStatus[0;m=201 Created token[0;m=5xfNBh5p
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454427 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454427 )

Stage: test
Name: ci20_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uclibc-1.0.25/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454427 responseStatus[0;m=201 Created token[0;m=5Sy9xjzS
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454523 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454523 )

Stage: test
Name: riotboard_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2015.10/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454523 responseStatus[0;m=201 Created token[0;m=isRXCFQ9
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454458 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454458 )

Stage: test
Name: linksprite_pcduino_defconfig
Trace: make: *** [target-post-image] Error 139
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 9 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454458 responseStatus[0;m=201 Created token[0;m=DsesYNzz
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454544 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454544 )

Stage: test
Name: ts5x00_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.17.8/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 3 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454544 responseStatus[0;m=201 Created token[0;m=UsWwfB7a
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454377 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454377 )

Stage: test
Name: armadeus_apf27_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-3.18.6/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 2 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454377 responseStatus[0;m=201 Created token[0;m=6yxax8Ac
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454435 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454435 )

Stage: test
Name: firefly_rk3288_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-2016.01/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454435 responseStatus[0;m=201 Created token[0;m=srAARed3
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454447 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454447 )

Stage: test
Name: freescale_mpc8315erdb_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.5.3/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454447 responseStatus[0;m=201 Created token[0;m=2H-7yMCt
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454448 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454448 )

Stage: test
Name: freescale_p1010rdb_pa_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/linux-4.1.4/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454448 responseStatus[0;m=201 Created token[0;m=nkJN5sft
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454473 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454473 )

Stage: test
Name: odroidc2_defconfig
Trace: make: *** [/builds/buildroot.org/buildroot/output/build/uboot-eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c/.stamp_built] Error 2
[32;1m$ exit 1[0;m
[32;1mUploading artifacts...[0;m
build.log: found 1 matching files                 [0;m 
output/images/: found 1 matching files            [0;m 
output/build/build-time.log: found 1 matching files[0;m 
output/build/packages-file-list.txt: found 1 matching files[0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454473 responseStatus[0;m=201 Created token[0;m=1vMjedAr
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454576 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454576 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 129.351s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454576 responseStatus[0;m=201 Created token[0;m=b6aFYP_Y
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454575 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454575 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 85.605s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454575 responseStatus[0;m=201 Created token[0;m=tPvV91N1
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22454571 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22454571 )

Stage: test
Name: tests.fs.test_ext.TestExt4
Trace: 
----------------------------------------------------------------------
Ran 1 test in 1.753s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22454571 responseStatus[0;m=201 Created token[0;m=LzkH-qes
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170714/3cfb2853/attachment.html>
