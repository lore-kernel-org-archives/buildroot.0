From: GitLab <gitlab@mg.gitlab.com>
Date: Thu, 20 Jul 2017 10:07:43 +0000
Subject: [Buildroot] buildroot | Pipeline #10045872 has failed for master |
	854b9337
Message-ID: <597080ef52022_de2b3fa2c7afbf50187949@sidekiq-asap05.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: master ( https://gitlab.com/buildroot.org/buildroot/commits/master )

Commit: 854b9337 ( https://gitlab.com/buildroot.org/buildroot/commit/854b933705fa42952ab64a3e0b068520a5bca10f )
Commit Message: package/qt5: bump latest version to 5.9.1

Qt 5...
Commit Author: Joshua Henderson
Committed by: Thomas Petazzoni ( https://gitlab.com/tpetazzoni )

Pipeline #10045872 ( https://gitlab.com/buildroot.org/buildroot/pipelines/10045872 ) triggered by arnout ( https://gitlab.com/arnout )
had 2 failed builds.

Job #23338908 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23338908 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubInternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 149.549s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23338908 responseStatus[0;m=201 Created token[0;m=UiQsstyz
[31;1mERROR: Job failed: exit code 1
[0;m

Job #23338906 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23338906 )

Stage: test
Name: tests.fs.test_iso9660.TestIso9660GrubExternal
Trace: 
----------------------------------------------------------------------
Ran 1 test in 84.850s

FAILED (errors=1)
[32;1mUploading artifacts...[0;m
test-output/*.log: found 1 matching files         [0;m 
Uploading artifacts to coordinator... ok          [0;m  id[0;m=23338906 responseStatus[0;m=201 Created token[0;m=Vs_Ez9YE
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/592b5c2f/attachment.html>
