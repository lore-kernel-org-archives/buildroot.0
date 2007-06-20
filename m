From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 Jun 2007 11:10:50 +0200
Subject: [Buildroot] Hide troublesome environment variables from sub
	processes [Re: svn commit: trunk/buildroot]
In-Reply-To: <20070619151928.B270A485C2@busybox.net>
References: <20070619151928.B270A485C2@busybox.net>
Message-ID: <20070620091049.GB21092@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 19, 2007 at 08:19:28AM -0700, jacmet at uclibc.org wrote:
>Author: jacmet
>Date: 2007-06-19 08:19:27 -0700 (Tue, 19 Jun 2007)
>New Revision: 18856
>
>Log:
>Hide troublesome environment variables from sub processes
>(E.G. screws up gdb, busybox, ..)
>
>
>Modified:
>   trunk/buildroot/Makefile

You should check for these in dependencies.sh instead.
