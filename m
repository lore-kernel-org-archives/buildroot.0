From: GitLab <gitlab@mg.gitlab.com>
Date: Wed, 05 Jul 2017 09:06:00 +0000
Subject: [Buildroot] buildroot | Pipeline #9589735 has failed for master |
	9a3f1f03
Message-ID: <595cabf849e76_fb8d3f8bb42439509291e@sidekiq10.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 9a3f1f03 ( https://gitlab.com/buildroot.org/buildroot/commit/9a3f1f038abc2e699a839bc4cba921acdcd68666 )
Commit Message: linux-firmware: fix spelling mistake on LICENSE...
Commit Author: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9589735 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9589735 ) triggered by arnout ( https://gitlab.com/arnout )
had 2 failed builds.

Job #21139422 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21139422 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 131.501s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21139422 responseStatus[0;m=201 Created token[0;m=np9YmEzA
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21139423 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21139423 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 76.141s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21139423 responseStatus[0;m=201 Created token[0;m=z1uEpEUL
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170705/4f0c20d4/attachment.html>
