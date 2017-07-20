From: GitLab <gitlab@mg.gitlab.com>
Date: Thu, 20 Jul 2017 09:53:34 +0000
Subject: [Buildroot] buildroot | Pipeline #10045873 has failed for 2017.05.x
	| 786d15a2
Message-ID: <59707d9eeee0a_de2b3fa2d43673cc1423a@sidekiq-asap05.mail>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Your pipeline has failed.

Project: buildroot ( https://gitlab.com/buildroot.org/buildroot )
Branch: 2017.05.x ( https://gitlab.com/buildroot.org/buildroot/commits/2017.05.x )

Commit: 786d15a2 ( https://gitlab.com/buildroot.org/buildroot/commit/786d15a2b4eaa219c7a38098177e6943d39ae979 )
Commit Message: iproute2: correct license

Source files license...
Commit Author: Baruch Siach ( https://gitlab.com/baruchsi )
Committed by: Peter Korsgaard ( https://gitlab.com/jacmet )

Pipeline #10045873 ( https://gitlab.com/buildroot.org/buildroot/pipelines/10045873 ) triggered by arnout ( https://gitlab.com/arnout )
had 1 failed build.

Job #23338890 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/23338890 )

Stage: test
Name: check-gitlab-ci.yml
Trace: E: Failed to fetch http://deb.debian.org/debian/pool/main/s/serf/libserf-1-1_1.3.9-3_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/m/mercurial/mercurial_4.0-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/r/rsync/rsync_3.1.2-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/s/subversion/subversion_1.9.5-1_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Failed to fetch http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb  503  Service Temporarily Unavailable [IP: 52.84.26.51 80]
E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
[31;1mERROR: Job failed: exit code 1
[0;m


---
You're receiving this email because of your account on gitlab.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170720/51af5ebe/attachment.html>
