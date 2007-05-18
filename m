From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 18 May 2007 09:20:55 +0200
Subject: [Buildroot] libiconv
In-Reply-To: <011f01c797fc$89971080$2600a8c0@engineering5>
References: <20070516181623.GA20902@aon.at>
	<011f01c797fc$89971080$2600a8c0@engineering5>
Message-ID: <20070518072055.GA25167@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 16, 2007 at 03:55:29PM -0500, Christopher Reder wrote:
>I have searched around for a solution to the problem I have been having and
>while there are a number of entries with the same issue, no one has a posted
>solution.  I am using buildroot from svn with tiny-x server and metacity
>enabled.  This will bring in gtk+ and other packages.  Without metacity and
>those packages, everything compiles fine.  
>
>When I add it in, I get the following error:
>
>checking for iconv_open in -liconv... no
>configure: error: *** No iconv() implementation found in C library or
>libiconv

How is this related to getc()? Don't hijack threads!
