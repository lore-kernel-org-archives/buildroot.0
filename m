From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 16:00:33 +0200
Subject: [Buildroot] HTTP access to git repository outdated
In-Reply-To: <20140825105329.GE2661@sapphire.tkos.co.il>
References: <20140825105119.GA31345@dalaran.sceen.net>
 <20140825105329.GE2661@sapphire.tkos.co.il>
Message-ID: <20140825160033.08334f2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 25 Aug 2014 13:53:29 +0300, Baruch Siach wrote:

> On Mon, Aug 25, 2014 at 12:51:19PM +0200, Richard Braun wrote:
> > It looks like git update-server-info isn't run automatically since
> > getting the repository through http gives a slightly outdated tree.
> 
> This is a known problem. Try adding or removing the trailing slash from the 
> git repository URL.

Completely separate issue.

The problem with the http/git difference is that when I push some
changes to the official repository, git update-server-info is not
executed due to some permission issues. So the http side of things only
gets resynced the next time Peter pushes something.

Since I'm the last one to have pushed some stuff.

The last commit available from the http:// repo was pushed by Peter
(f67e7ba06f5f00dc9153ad364932092692458704 package/gutenprint: replaces
-static with -static-libtool-libs).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
