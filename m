From: William Wagner <will_wagner@carallon.com>
Date: Mon, 01 Feb 2010 09:25:53 +0000
Subject: [Buildroot] Fetching kernel via git
In-Reply-To: <66a1.4b66259d.a7107@getafix.xdna.net>
References: <66a1.4b66259d.a7107@getafix.xdna.net>
Message-ID: <4B669E21.4030303@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/02/2010 00:51, Cameron Hutchison wrote:
> Is there some way to configure buildroot to fetch the kernel sources
> via git?
>    

Patches have been posted on the mailing list before. See 
http://lists.busybox.net/pipermail/buildroot/2010-January/031499.html 
for most recent.

Will try to clean up my patch and submit it shortly.

Will
> I am currently downloading my third complete kernel source tree for
> 2.6.32.7, previously having downloaded 2.6.23.3 and 2.6.31.6.
>
> I keep a git repository with a clone of Linus's public tree and the
> stable trees, so it would save greatly on bandwidth and time if
> buildroot could clone the kernel from that local repository instead of
> downloading a source tarball every time the extraversion bumps up a
> version.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>    

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
