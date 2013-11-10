From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 23:46:17 +0100
Subject: [Buildroot] [PATCH v2 1/2] xlib_libpthread-stubs: needs
	-pthread when linking statically
In-Reply-To: <1383956481-16389-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 9 Nov 2013 01:21:20 +0100")
References: <1383956481-16389-1-git-send-email-arnout@mind.be>
Message-ID: <87siv3c1ty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

> Fixes e.g. http://autobuild.buildroot.net/results/1eaa694263b74313b0c90c510abcb11d490a3773/
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> My gcc manual only documents the -pthread option for some architectures,
> but it seems to work for x86, sh and arm as well.

> v2: resend
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
