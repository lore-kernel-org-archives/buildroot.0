From: GitLab <gitlab@mg.gitlab.com>
Date: Thu, 06 Jul 2017 04:08:49 +0000
Subject: [Buildroot] buildroot | Pipeline #9617434 has failed for master |
	b291525a
Message-ID: <595db7d1c0490_48913f9370cfaf9c275c2@sidekiq02.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: b291525a ( https://gitlab.com/buildroot.org/buildroot/commit/b291525ac74273191c1a53a8361b9e7a6a58e79f )
Commit Message: toolchain: replace absolute symlinks by relativ...
Commit Author: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9617434 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9617434 ) triggered by arnout ( https://gitlab.com/arnout )
had 6 failed builds.

Job #21269239 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269239 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 11.960s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269239 responseStatus[0;m=201 Created token[0;m=_ge-9UQW
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21269238 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269238 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660Grub2Internal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 11.553s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269238 responseStatus[0;m=201 Created token[0;m=mw2W-xvh
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21269240 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269240 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 11.522s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269240 responseStatus[0;m=201 Created token[0;m=b2ESJqVz
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21269242 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269242 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 8.748s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269242 responseStatus[0;m=201 Created token[0;m=TKrSFDmh
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21269237 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269237 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660Grub2External
Trace: 
----------------------------------------------------------------------
Ran 1 test in 8.344s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269237 responseStatus[0;m=201 Created token[0;m=EExFoxVF
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21269241 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21269241 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660SyslinuxExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 7.941s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21269241 responseStatus[0;m=201 Created token[0;m=axgYwbMh
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170706/654e8c30/attachment-0001.html>
