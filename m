From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Mon, 13 Aug 2007 13:19:56 -0500
Subject: [Buildroot] fontconfig fails using latest snapshot
In-Reply-To: <009a01c7ddd5$779933d0$2600a8c0@engineering5>
References: <021c01c7ddcc$a7a9f9f0$dcc4af0a@atmel.com>
	<009a01c7ddd5$779933d0$2600a8c0@engineering5>
Message-ID: <20070813181956.GA17878@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 13, 2007 at 01:12:10PM -0500, Christopher Reder wrote:
> > /usr/include/ft2build.h:56:38: error: freetype/config/ftheader.h: No such
> file or directory
> 
> You need to build freetype2 before fontconfig.
> 
If that is the case, then someone should patch the 'fontconfig' make
file to satisfy the dependency.

-Steve
