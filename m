From: GitLab <gitlab@mg.gitlab.com>
Date: Fri, 21 Jul 2017 01:50:28 +0000
Subject: [Buildroot] buildroot | Pipeline #10072322 has failed for master |
	e9a6a104
Message-ID: <59715de46656a_40223fca3d2bf3585685@sidekiq-asap02.mail>
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

Pipeline #10072322 ( https://gitlab.com/buildroot.org/buildroot/pipelines/10072322 ) triggered by arnout ( https://gitlab.com/arnout )
had 2 failed builds.

Job #23484683 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23484683 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 141.284s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23484683 responseStatus[0;m=201 Created token[0;m=8J3xJe1r
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23484682 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23484682 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 122.313s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23484682 responseStatus[0;m=201 Created token[0;m=CYzXEAgx
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/92afe859/attachment.html>
