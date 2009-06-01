From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jun 2009 08:35:42 +0200
Subject: [Buildroot] [PATCH] RE: diffutils fails to build
In-Reply-To: <522C1DF17AF50042AD8AE87F7887BD3D0158B35BFB@exch.hq.tensilica.com>
	(Marc Gauthier's message of "Wed\, 27 May 2009 22\:41\:59 -0700")
References: <d9bef6aa0811070426o55805eb1q6d95ddb0476f074b@mail.gmail.com>
	<522C1DF17AF50042AD8AE87F7887BD3D0158B35BFB@exch.hq.tensilica.com>
Message-ID: <878wkc4g1t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marc" == Marc Gauthier <marc@tensilica.com> writes:

 Marc> Hi Ian,

 Marc> Did you get that question resolved?  I'm hitting the same
 Marc> failure with a tree sync'ed circa April 28th.  Presumably only
 Marc> happens with BR2_STRIP_none=y (but that *is* what I want, for
 Marc> debugging, and I do want diffutils).
 
 Marc> So I looked at it a bit, and came up with this tentative fix.
 Marc> Works on an incremental build (have yet to try a full clean
 Marc> build, takes a while).  -Marc

Your patch was wordwrapped, but I committed it by hand (and slightly
changed it) - Thanks.

-- 
Bye, Peter Korsgaard
