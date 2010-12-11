From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 Dec 2010 22:53:14 +0100
Subject: [Buildroot] [PATCH] zlib: fix installing when static-only
In-Reply-To: <1291759032-1336-1-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Tue, 7 Dec 2010 16:57:12 -0500")
References: <1291759032-1336-1-git-send-email-vapier@gentoo.org>
Message-ID: <871v5onfhx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> The switch from manual targets to using zlib's targets to fix shared
 Mike> building/installing doesn't work quite right as zlib itself doesn't
 Mike> handle static-only installs fully.

 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Ehh, that seems very similar to the zlib-1.2.5-fix-static-install.patch
we already have?

-- 
Bye, Peter Korsgaard
