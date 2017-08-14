From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 21:31:13 +0200
Subject: [Buildroot] [PATCH 1/1] libepoxy: bump to version 1.4.3
In-Reply-To: <20170814172320.16984-1-aperez@igalia.com>
References: <20170814172320.16984-1-aperez@igalia.com>
Message-ID: <20170814213113.6187b327@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 20:23:20 +0300, Adrian Perez de Castro wrote:
> Among other small fixes, the new version fixes crashes when running in
> X11 without GLX (i.e. using EGL). Additionally, the changes from patch
> "0002-Make-EGL-support-optional.patch" were committed upstream, and the
> file can be dropped.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Since we're post -rc2 comes the question: do we want to apply this in
master (i.e to be part of the 2017.08 release) or in next.

If it fixes a crash, we probably want it in master. But version bumps
are a bit frowned upon. How much differences are there between 1.4.1
and 1.4.3 ? Are they significant ? If they are significant, is it
possible to backport just the one patch that fixes the crash ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
