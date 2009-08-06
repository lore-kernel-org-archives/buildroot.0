From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 06 Aug 2009 14:41:09 +0200
Subject: [Buildroot] [PATCH] directfb: allow to enable debug and trace
 support
In-Reply-To: <1249561046.16366.4.camel@couak.urd44.com>
References: <1249554495-26364-1-git-send-email-s.neumann@raumfeld.com>
	<1249561046.16366.4.camel@couak.urd44.com>
Message-ID: <1249562469.4479.12.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-08-06 at 14:17 +0200, Lionel Landwerlin wrote:

> Also proposed in https://bugs.busybox.net/show_bug.cgi?id=471
> 
> I'm using --enable-debug and --enable-debug-support instead of
> --enable-debug only. Does it make sense ?

--enable-debug-support is on by default anyway. But these two options
are definitely confusing. I am having trouble to understand does what.

My main point was to add support for the --enable-trace option. Perhaps
I should have done that separately.


Sven
