From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:06:20 +0100
Subject: [Buildroot] [PATCH 1/2] libv4l: fix a typo to not override the
	LIBV4L_DEPENDENCIES variable
In-Reply-To: <1446125625-7009-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 29 Oct 2015 13:33:44 +0000")
References: <1446125625-7009-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87twp9336b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Otherwise host-pkgconf will not be installed and the configure script
 > will fail with an error like this one:

 > ./configure: line 16346: PKG_PROG_PKG_CONFIG: command not found
 > [snip]
 > ./configure: line 20511: syntax error near unexpected token `X11,'
 > ./configure: line 20511: `PKG_CHECK_MODULES(X11, x11, x11_pkgconfig=yes,
 > x11_pkgconfig=no)'

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
