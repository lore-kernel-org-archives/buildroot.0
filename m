From: GitLab <gitlab@mg.gitlab.com>
Date: Mon, 17 Jul 2017 16:42:06 +0000
Subject: [Buildroot] buildroot | Pipeline #9951242 has failed for master |
	bc801efa
Message-ID: <596ce8deb23c6_e5733fb57981c554687ce@sidekiq-asap05.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: bc801efa ( https://gitlab.com/buildroot.org/buildroot/commit/bc801efacb298e2297024f83e960eaf8a45dd39f )
Commit Message: python-coherence: bump to the latest upstream c...
Commit Author: Yegor Yefremov
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #9951242 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9951242 ) triggered by arnout ( https://gitlab.com/arnout )
had 2 failed builds.

Job #22878573 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22878573 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 107.147s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22878573 responseStatus[0;m=201 Created token[0;m=SyhzpRFz
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22878572 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22878572 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 99.750s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22878572 responseStatus[0;m=201 Created token[0;m=sGpnjsau
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170717/bdb3f924/attachment.html>
