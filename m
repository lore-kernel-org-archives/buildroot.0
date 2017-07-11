From: GitLab <gitlab@mg.gitlab.com>
Date: Tue, 11 Jul 2017 22:38:10 +0000
Subject: [Buildroot] buildroot | Pipeline #9778790 has failed for master |
	0ca30170
Message-ID: <59655352a32da_51c43fedb0bcc0a4186774@sidekiq-asap01.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 0ca30170 ( https://gitlab.com/buildroot.org/buildroot/commit/0ca30170345a81f5f21e4ef4424b1f186cde1988 )
Commit Message: efivar: fix build with gcc 7

Add upstream patc...
Commit Author: Baruch Siach ( https://gitlab.com/baruchsi )
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9778790 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9778790 ) triggered by arnout ( https://gitlab.com/arnout )
had 3 failed builds.

Job #22073344 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22073344 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 96.785s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22073344 responseStatus[0;m=201 Created token[0;m=kTsszxZv
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22073342 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22073342 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 67.509s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22073342 responseStatus[0;m=201 Created token[0;m=Cbshnrex
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22073337 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22073337 )

Stage: test
Name: tests.fs.test_ext.TestExt4
Trace: 
----------------------------------------------------------------------
Ran 1 test in 2.682s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22073337 responseStatus[0;m=201 Created token[0;m=-ffgw3nr
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170711/e42bb159/attachment.html>
