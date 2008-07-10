From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 09:47:01 +0200
Subject: [Buildroot] Makefile.autotools.in problems
In-Reply-To: <18377517.post@talk.nabble.com> (Daniel Laird's message of "Thu\,
	10 Jul 2008 00\:37\:28 -0700 \(PDT\)")
References: <18377517.post@talk.nabble.com>
Message-ID: <87y74aqiyy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:

Hi,

 Daniel> This is only a problem as I have not deleted patches
 Daniel> associated with an old version.  However I wanted to raise
 Daniel> the issue in case it was originally planned that you could
 Daniel> have multiple patches in the directory for different versions
 Daniel> and it would apply only those patches that match.

Yes, the Makefile.autotools.in is kinda half baked still.

 Daniel> Perhaps we could have a PKG_STRICT_PATCH variable.  That if
 Daniel> set to true would only apply patches that match the version
 Daniel> string, if not set it would apply all patches.

That or put the patches in version specific sub directories like
openembedded does.

-- 
Bye, Peter Korsgaard
