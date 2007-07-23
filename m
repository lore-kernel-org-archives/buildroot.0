From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 19:18:49 +0200
Subject: [Buildroot] Changes to buildroot for projects.
In-Reply-To: <46A16F40.6050303@realitydiluted.com>
References: <46A16F40.6050303@realitydiluted.com>
Message-ID: <20070723171849.GC9995@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 20, 2007 at 09:28:16PM -0500, Steven J. Hill wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>Ulf,
>
>I wanted to tell you how great the changes to add BSP PROJECT_DIR and the
>like have been working out. I did two product releases today and it was really
>great to be able to build both and share compiled packages between the two.

Except that the PROJECT stuff that you applied (according to Ulf) broke
building a kernel on e.g. x86 (2.6.21.5 kernel and headers, to be
specific). See thread from today "[Buildroot] package/linux/Makefile.in
does not include 'openswan' patches"
