From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 21:13:37 +0200
Subject: [Buildroot] Pixman move from package/x11r7 to package?
In-Reply-To: <19164633.post@talk.nabble.com> (Daniel Laird's message of "Tue\,
	26 Aug 2008 08\:45\:14 -0700 \(PDT\)")
References: <19164633.post@talk.nabble.com>
Message-ID: <87r68b8u8u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:

 Daniel> I have noticed that pixman currently lives in x11r7/pixman.
 Daniel> However this package is required by later cairo
 Daniel> versions(1.6.x) and as such is not X11R7 specific.  Any one
 Daniel> against this being moved into package/pixman?  Without this
 Daniel> later cairo versions will not build and DirectFB on GTK will
 Daniel> fail.

Sounds good to me.


-- 
Bye, Peter Korsgaard
