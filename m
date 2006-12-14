From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 14 Dec 2006 16:35:40 +0100
Subject: [Buildroot] [patch] directfb URL
In-Reply-To: <200612141623.28760.uli@suse.de>
References: <200612141623.28760.uli@suse.de>
Message-ID: <20061214153540.GA2094@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 14, 2006 at 04:23:28PM +0100, Ulrich Hecht wrote:
>Hi!
>
>0.9.25.1 has been moved to Old.

And anyone who touches this, please also check that it gets passed the
proper flags (the staging-dir libs, not the host ones..)
http://bugs.busybox.net/view.php?id=959
