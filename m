From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 23 Jul 2008 16:23:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
In-Reply-To: <20080723134217.GC27147@cloud.net.au>
References: <20080723103550.70E8B3C7D7@busybox.net>
	<20080723134217.GC27147@cloud.net.au>
Message-ID: <20080723142318.GA27902@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2008 at 11:42:17PM +1000, Hamish Moffatt wrote:
>On Wed, Jul 23, 2008 at 03:35:50AM -0700, jacmet at uclibc.org wrote:

>Personally I think the shared build_$(ARCH) is just wrong with multiple
>projects. I might hack my local copy to define BUILD_DIR to match
>PROJECT_BUILD_DIR to fix this.

The project thing as it is now should not have been applied in the first
place. It's misguided and not thought through, let alone implemented
properly. Nothing new. Dead horse.
