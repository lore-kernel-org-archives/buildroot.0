From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Fri, 18 Oct 2013 15:23:23 -0500
Subject: [Buildroot] [RFC PATCH] fs/common.mk: Add support for fakeroot
 script
In-Reply-To: <20131015161941.5d7ffd45@skate>
References: <20131015132102.GA20116@gmail.com> <20131015161941.5d7ffd45@skate>
Message-ID: <20131018202323.GA23065@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 15, 2013 at 04:19:41PM +0200, Thomas Petazzoni wrote:
> Well, the conventional way would be to have those directories created
> by packages (and they can use the <pkg>_PERMISSIONS mechanism to get
> proper ownership or permissions). Or, if they really don't belong to
> any package, create them in the post build script, and have a device
> table assign the permission and ownership.

I didn't realize the device table functionality could modify arbitrary
file/directory ownerships but looking through the makedevs source code
that DOES appear to be true.  I guess let's just consider this thread as
a question disguised as a poorly spelled patch. :)

Cheers,
Andy
