From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 29 Aug 2008 10:38:13 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
In-Reply-To: <87vdxlu3zi.fsf@macbook.be.48ers.dk>
References: <20080827201919.E9B3DF8006@busybox.net>
	<20080828002656.GB10828@cloud.net.au>
	<87vdxlu3zi.fsf@macbook.be.48ers.dk>
Message-ID: <20080829003813.GB13192@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 28, 2008 at 07:02:09AM +0200, Peter Korsgaard wrote:
> But in general I agree - Use select for hard dependencies and only
> print those comment lines for stuff like toolchain settings (locales,
> wchar, ..).

Speaking of wchar and locales, do these work well enough in uClibc to
enable them? I noticed that the latest procps requires wchar, but I have
it disabled because in the past it broke floating point string
conversions in uClibc. Or maybe it was locales that caused that.
I am planning to write a patch for procps to make wchar optional.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
