From: GitLab <gitlab@mg.gitlab.com>
Date: Sun, 02 Jul 2017 22:46:47 +0000
Subject: [Buildroot] buildroot | Pipeline #9521918 has failed for master |
	e42a827e
Message-ID: <595977d72733e_d2f33fb12308749c355d6@sidekiq02.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: e42a827e ( https://gitlab.com/buildroot.org/buildroot/commit/e42a827ea1511ff11b91f9957603ab7a01f24c61 )
Commit Message: lirc-tools: bump to version 0.9.4d

Drop 0001-t...
Commit Author: Baruch Siach ( https://gitlab.com/baruchsi )
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9521918 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9521918 ) triggered by arnout ( https://gitlab.com/arnout )
had 4 failed builds.

Job #20867956 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20867956 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 650.959s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20867956 responseStatus[0;m=201 Created token[0;m=SsAUs6UB
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20867955 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20867955 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 630.616s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20867955 responseStatus[0;m=201 Created token[0;m=Pguaz2kJ
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20867954 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20867954 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 107.388s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20867954 responseStatus[0;m=201 Created token[0;m=xZUBYtg_
[31;1mERROR: Job failed: exit code 1
[0;m

Job #20867953 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/20867953 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 99.244s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=20867953 responseStatus[0;m=201 Created token[0;m=3qzkR9-6
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170702/0be5fcc0/attachment-0001.html>
