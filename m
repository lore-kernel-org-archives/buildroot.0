From: GitLab <gitlab@mg.gitlab.com>
Date: Tue, 11 Jul 2017 23:30:30 +0000
Subject: [Buildroot] buildroot | Pipeline #9783571 has failed for master |
	815d78f8
Message-ID: <59655f9626512_def53fb640c318342740b2@sidekiq-asap04.mail>
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

Pipeline #9783571 ( https://gitlab.com/buildroot.org/buildroot/pipelines/9783571 ) triggered by arnout ( https://gitlab.com/arnout )
had 3 failed builds.

Job #22098107 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22098107 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 141.428s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22098107 responseStatus[0;m=201 Created token[0;m=KrTKKNux
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22098108 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22098108 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 118.464s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22098108 responseStatus[0;m=201 Created token[0;m=Nn9MicZW
[31;1mERROR: Job failed: exit code 1
[0;m

Job #22098104 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/22098104 )

Stage: test
Name: tests.fs.test_ext.TestExt4
Trace: 
----------------------------------------------------------------------
Ran 1 test in 2.869s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=22098104 responseStatus[0;m=201 Created token[0;m=HH_wzMy5
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170711/cb928c6b/attachment.html>
