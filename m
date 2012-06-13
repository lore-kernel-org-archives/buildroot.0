From: Richard Braun <rbraun@sceen.net>
Date: Wed, 13 Jun 2012 18:44:20 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: backport hotplug
 support
In-Reply-To: <20120613182859.3217c88c@skate>
References: <1339603696-2787-1-git-send-email-rbraun@sceen.net>
 <20120613182859.3217c88c@skate>
Message-ID: <20120613164420.GA9653@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 13, 2012 at 06:28:59PM +0200, Thomas Petazzoni wrote:
> Unless I'm wrong X11R7.7 has been released some time ago, and it
> includes X server 1.12, at
> http://www.x.org/releases/X11R7.7/src/xserver/. So why would we bother
> backporting 1.8 material to a 1.7 version? Upgrading the complete X.org
> stack to X11R7.7 seems like a much more appropriate solution. Or maybe
> I'm missing something obvious?

Simple lack of time on my part, and I thought it may still be useful.

> Moreover in general, we don't like to carry patches that aim at adding
> features. We carry patches to fix build problems, or sometimes
> architecture-specific fixes, but large new features should not be added
> to packages using patches, otherwise Buildroot will become an
> unmaintainable crap of patches.

Agreed.

-- 
Richard Braun
