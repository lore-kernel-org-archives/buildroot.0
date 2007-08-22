From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 21:13:20 +0200
Subject: [Buildroot] Hiding non-buildable packages
In-Reply-To: <1187728137.6145.48.camel@86-115-11-152>
References: <1187728137.6145.48.camel@86-115-11-152>
Message-ID: <20070822191320.GU11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 21, 2007 at 10:28:57PM +0200, Ulf Samuelsson wrote:
>A lot of the packages does not build.

Fixing them is the right thing to do.

>Some only build for some targets.

Certain packages (think specific HW support) should depend on a specific
arch. Which are these?

>I think it would be nice to have the possibility
>to set a config item, which resulted in that only
>packages which seems to build are really visible.

I object to this if you just want to avoid helping to provide patches to
upstream that do fix the respective packages that are ment to work fine.
