From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:53:02 +0200
Subject: [Buildroot] [PATCH 6/6] xlib_libX11: ensure target and host
	variant have the same patch hooks
In-Reply-To: <1369695664-5670-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:01:04 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878v2wz1lt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In preparation for the out-of-tree support, it is important that all
 Thomas> packages have the same patch hooks for the host variant and the target
 Thomas> variant (because the source tree will be shared between host and
 Thomas> target variants when doing out-of-tree build).

 Thomas> In the case of the xlib_libX11 package, the post-patch hook removes
 Thomas> some flags from the build of the makekeys utility, so that when
 Thomas> xlib_libX11 is built for the target, the build of makekeys for the
 Thomas> host works properly. This modification can be applied to the host
 Thomas> variant of xlib_libX11 without any problem.

Committed to next, thanks.
-- 
Bye, Peter Korsgaard
