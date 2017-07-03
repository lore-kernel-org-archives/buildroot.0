From: GitLab <gitlab@mg.gitlab.com>
Date: Mon, 03 Jul 2017 23:31:35 +0000
Subject: [Buildroot] buildroot | Pipeline #9550904 has failed for master |
	0fe71511
Message-ID: <595ad3d7c5e47_2bc63fa4e48a9f4437458@sidekiq04.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 0fe71511 ( https://gitlab.com/buildroot.org/buildroot/commit/0fe71511175a58a3dbee9385fec1c0e4372d8f98 )
Commit Message: package/libunwind: fix build failure due to asm...
Commit Author: Romain Naour
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9550904 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9550904 ) triggered by arnout ( https://gitlab.com/arnout )
had 4 failed builds.

Job #20979765 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20979765 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxInternal
Trace: Ran 1 test in 655.413s

FAILED (errors=1)
23:19:21 TestIso9660SyslinuxInternal              Starting
23:19:21 TestIso9660SyslinuxInternal              Building
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20979765 responseStatus[0;m=201 Created token[0;m=YrcMSKr1
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20979764 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20979764 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 532.600s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20979764 responseStatus[0;m=201 Created token[0;m=ysYxPkz2
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20979762 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20979762 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 145.617s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20979762 responseStatus[0;m=201 Created token[0;m=8SBWZvsK
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20979763 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20979763 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 108.037s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20979763 responseStatus[0;m=201 Created token[0;m=jEWVRjk_
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170703/bb21ab50/attachment.html>
