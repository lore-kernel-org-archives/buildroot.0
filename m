From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Nov 2010 08:57:00 +0100
Subject: [Buildroot] [PATCH] auto remove empty /usr/share dir
In-Reply-To: <1290115558-8915-1-git-send-email-vapier@gentoo.org>
References: <1290115558-8915-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101119085700.0c222a14@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Nov 2010 16:25:58 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Often times, the only reason /usr/share exists is because of documentation
> installed into it.  So once we're done cleaning the docs, attempt to rmdir
> /usr/share.  If it's empty, things will work out nicely.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
