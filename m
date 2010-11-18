From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Nov 2010 11:48:05 +0100
Subject: [Buildroot] [PATCH] gdb: drop local stripping in favor of top
 level
In-Reply-To: <1290076011-31508-1-git-send-email-vapier@gentoo.org>
References: <1290076011-31508-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101118114805.54cc8fc9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Nov 2010 05:26:51 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Since the top level takes care of stripping for us, and some file
> formats cannot be stripped safely (like FLAT which will error out),
> simply punt the manual stripping from the gdb package.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

BTW, since you're using the FLAT binary format, I suspect that you're
using Buildroot on non-MMU systems. Do you have working non-MMU
configurations that we could use for some build tests and potentially
runtime tests ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
