From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Tue, 7 Aug 2007 07:21:39 -0500
Subject: [Buildroot] [patch] libxml2 fixes
In-Reply-To: <46B860B5.8050205@mainstreetsoftworks.com>
References: <46B739FF.5020507@mainstreetsoftworks.com>
	<12028348.post@talk.nabble.com>
	<46B860B5.8050205@mainstreetsoftworks.com>
Message-ID: <20070807122139.GA6430@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 07, 2007 at 08:08:21AM -0400, Brad House wrote:
> 
> Can you run:
> make libxml2-clean
> rm -rf build_arm/libxml2-2.6.29
> 
BTW, make libxml2-dirclean will properly remove and clean out the source
build directory for you.

-Steve
