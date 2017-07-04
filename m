From: GitLab <gitlab@mg.gitlab.com>
Date: Tue, 04 Jul 2017 07:12:43 +0000
Subject: [Buildroot] buildroot | Pipeline #9557689 has failed for master |
	22180881
Message-ID: <595b3feb38c53_f323fc27c54f1e013341b@sidekiq08.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 22180881 ( https://gitlab.com/buildroot.org/buildroot/commit/221808810d546e6808c48ec09383bd161d995be5 )
Commit Message: package/mke2img: add option to specify block si...
Commit Author: Yann E. MORIN ( https://gitlab.com/ymorin )
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9557689 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9557689 ) triggered by arnout ( https://gitlab.com/arnout )
had 4 failed builds.

Job #21003848 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21003848 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 435.866s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21003848 responseStatus[0;m=201 Created token[0;m=_i_mcyeb
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21003847 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21003847 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 317.833s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21003847 responseStatus[0;m=201 Created token[0;m=Pze3Jhhn
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21003846 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21003846 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 107.796s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21003846 responseStatus[0;m=201 Created token[0;m=zTma_Ypb
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21003845 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21003845 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 99.137s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21003845 responseStatus[0;m=201 Created token[0;m=2JKgp-s7
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170704/4dedda42/attachment.html>
