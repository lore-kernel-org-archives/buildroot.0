From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 28 Aug 2008 10:26:56 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
In-Reply-To: <20080827201919.E9B3DF8006@busybox.net>
References: <20080827201919.E9B3DF8006@busybox.net>
Message-ID: <20080828002656.GB10828@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 27, 2008 at 01:19:19PM -0700, jacmet at uclibc.org wrote:
> Log:
> fltk: fix long help text lines
> 
> Remove comment when X isn't available while we're at it.
[..]
> -
> -comment "fltk		- disabled (requires Xorg(7))"
> -	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
> 

I think those comments are kind of helpful. Otherwise, if you know a
package exists but can't find it in menuconfig, you need to open up
Config.in to find the dependencies.

Alternatively the package could use select instead of depends.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
