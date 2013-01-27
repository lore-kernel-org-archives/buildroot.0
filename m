From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jan 2013 17:21:54 +0100
Subject: [Buildroot] [PATCH] polkit: don't build documentation and
	examples
In-Reply-To: <1359299240-19915-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 27 Jan 2013 16:07:19 +0100")
References: <1359299240-19915-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip6ibnq5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Building the manpages of polkit fails with issues in xsltproc. Since
 Thomas> we are generally not that much interested in documentation, we disable
 Thomas> them. This solves the build issues like
 Thomas> http://autobuild.buildroot.org/results/751b71a594fa04924c7c3bb8f2c460ce1e44aa90/build-end.log.

 Thomas> While we're at it, we also disable the build of the polkit example
 Thomas> programs.

Committed, thanks.

-- 
Bye, Peter Korsgaard
