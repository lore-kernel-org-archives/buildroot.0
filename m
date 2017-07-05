From: GitLab <gitlab@mg.gitlab.com>
Date: Wed, 05 Jul 2017 01:11:14 +0000
Subject: [Buildroot] buildroot | Pipeline #9582146 has failed for master |
	2fce2056
Message-ID: <595c3cb26d417_6a8f3fe97ad911e489063@sidekiq05.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 2fce2056 ( https://gitlab.com/buildroot.org/buildroot/commit/2fce205673945c40c1ce3b0121eb6665348f371f )
Commit Message: CHANGES: add details on the gettext revamp

The...
Commit Author: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9582146 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9582146 ) triggered by arnout ( https://gitlab.com/arnout )
had 2 failed builds.

Job #21103457 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103457 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 117.498s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103457 responseStatus[0;m=201 Created token[0;m=zjiP7ncv
[31;1mERROR: Job failed: exit code 1
[0;m

Job #21103458 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/21103458 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 109.595s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=21103458 responseStatus[0;m=201 Created token[0;m=R4Pu97Jm
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170705/8661281a/attachment.html>
