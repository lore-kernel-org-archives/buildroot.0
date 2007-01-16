From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 16 Jan 2007 19:13:35 +0100
Subject: [Buildroot] C++ with mipsel target
In-Reply-To: <20070116142531.86589.qmail@web27007.mail.ukl.yahoo.com>
References: <20070116142531.86589.qmail@web27007.mail.ukl.yahoo.com>
Message-ID: <20070116181335.GA18373@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 16, 2007 at 02:25:31PM +0000, bifferos wrote:
>Is this *supposed* to be supported?

It should work and does work for i386 and gcc-4.2 (modulo a shared
libstdc++ depending on your config), fwiw.

What version of gcc are you building?
>
>Recent SVN on 12th Jan it was broken, and I got a compiler error. 
>I'll post it here if anyone is interested.

If it's related to uClibc then post here (or on the uclibc ML) else file
a bug against bugzilla.
