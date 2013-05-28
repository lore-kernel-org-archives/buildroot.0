From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 May 2013 20:48:35 +0200
Subject: [Buildroot] [PATCH v2] lttng-babeltrace: fix build failure on
	gcc14
In-Reply-To: <1369765289-30040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 20:21:29 +0200")
References: <1369765289-30040-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hahn9bzw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The gcc14 machine has a moderately old host gcc, which was causing a
 Thomas> recurrent build failure of host-lttng-babeltrace:

 Thomas>  http://autobuild.buildroot.org/results/492/49216052c161874f41738e41e6e0c89a6dd04000/build-end.log

 Thomas> This commit adds a patch to fix this build failure, related to the
 Thomas> access of the ULLONG_MAX define on compilers that did not default to
 Thomas> the C99 variant of the C language.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas> v2:
 Thomas>  Also autoreconf the target package, for consistency.

Committed, thanks.

-- 
Bye, Peter Korsgaard
