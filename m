From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 18 Oct 2009 14:24:38 +0200
Subject: [Buildroot] [PATCH] samba: updated the samba package to version
 3.3.8
In-Reply-To: <1255867094-8744-1-git-send-email-s.neumann@raumfeld.com>
References: <20091018115653.3CB3B77762@busybox.osuosl.org>
	<1255867094-8744-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20091018122431.GA13529@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 18, 2009 at 01:58:14PM +0200, Sven Neumann wrote:
>From: rvpaasen <rvpaasen@t3i.nl>
>
>Update the samba package to the new makefile format and also update
>it to samba version 3.3.8 (latest 3.3.x version).

>+SAMBA_DEPENDENCIES = \
>+	uclibc \

this dependency above is not needed (because implied and may be another
libc too), please drop it.

http://repo.or.cz/w/buildroot.git?a=commit;h=567d5c24536c8462b6df24f6c7654a72b00f202d
