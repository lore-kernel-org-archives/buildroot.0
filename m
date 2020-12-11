From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:28:02 +0100
Subject: [Buildroot] [PATCH] package/jemalloc: add jemalloc-config to
 _CONFIG_SCRIPTS handling
In-Reply-To: <20201129075704.29962-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 29 Nov 2020 08:57:04 +0100")
References: <20201129075704.29962-1-peter@korsgaard.com>
Message-ID: <87zh2kowwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes (part of) http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d/
 > jemalloc installs a jemalloc-config script, leaking build paths and breaking
 > reproducible builds (and per-package builds).

 > Add it to _CONFIG_SCRIPTS so the paths get fixed up for staging and the
 > script removed from target.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
