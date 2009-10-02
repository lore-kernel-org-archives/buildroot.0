From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 02 Oct 2009 13:12:42 +0200
Subject: [Buildroot] [git commit master] directfb: fix build with
 BR2_PACKAGE_DIRECTFB_DEBUG
In-Reply-To: <20091002105811.23BFE77762@busybox.osuosl.org>
References: <20091002105811.23BFE77762@busybox.osuosl.org>
Message-ID: <1254481962.3924.10.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2009-10-02 at 12:55 +0200, Peter Korsgaard wrote:

> +Subject: [PATCH] gfxcard: fix build error with --enable-debug
> +
> +Commit fdc611ea (Added support for colors and multiple layers in a
> +glyph implementing outlines) changed dfb_gfxcard_drawglyph() to take
> +a layers argument instead of index, but the D_DEBUG_AT call wasn't
> +changed to match.

It that patch upstream already? Otherwise I can take care of that.


Sven
