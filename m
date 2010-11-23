From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 20:32:12 +0100
Subject: [Buildroot] [PATCH] do not strip libthread_db.so
In-Reply-To: <1290248968-16122-1-git-send-email-vapier@gentoo.org>
References: <1290248968-16122-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101123203212.691c2d40@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Nov 2010 05:29:28 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> For proper threading debug support, the libthread_db.so library cannot
> be stripped on the target.  This is because the target gdbserver will
> also load up this library at runtime and poke around its symbols.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, this should go in 2010.11.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
