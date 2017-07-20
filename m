From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 23:11:44 +0200
Subject: [Buildroot] buildroot | Pipeline #10045873 has failed for
	2017.05.x | 786d15a2
In-Reply-To: <4a565636-d087-b736-c364-7988f6407aa6@mind.be> (Arnout
 Vandecappelle's message of "Thu, 20 Jul 2017 22:41:03 +0200")
References: <59707d9eeee0a_de2b3fa2d43673cc1423a@sidekiq-asap05.mail>
 <4a565636-d087-b736-c364-7988f6407aa6@mind.be>
Message-ID: <87fudq4xv3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 20-07-17 11:53, GitLab wrote:
 > [snip]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/s/serf/libserf-1-1_1.3.9-3_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/s/subversion/libsvn1_1.9.5-1_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/m/mercurial/mercurial-common_4.0-1_all.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/m/mercurial/mercurial_4.0-1_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/r/rsync/rsync_3.1.2-1_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/s/subversion/subversion_1.9.5-1_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Failed to fetch
 >> http://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-21_amd64.deb
 >> 503 Service Temporarily Unavailable [IP: 52.84.26.51 80]
 >> E: Unable to fetch some archives, maybe run apt-get update or try with --fix-missing?
 >> ERROR: Job failed: exit code 1

 >  To avoid this in the future, perhaps you should cherry-pick
 > commit d2a151cea0a9066015b9e6c1fb714a84faffec0f
 > Author: Arnout Vandecappelle <arnout@mind.be>
 > Date:   Sun Jul 2 18:24:59 2017

 >     .gitlab-ci.yml: use the Buildroot CI image published on Docker Hub

Good idea. Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
