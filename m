From: William Wagner <will_wagner@carallon.com>
Date: Thu, 28 Jan 2010 18:07:27 +0000
Subject: [Buildroot] PATCH: Add more config options to alsa, bump version
In-Reply-To: <4B603125.6070002@carallon.com>
References: <4B603125.6070002@carallon.com>
Message-ID: <4B61D25F.9040400@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have revised patch to fix the typo

On 27/01/2010 12:27, Will Wagner wrote:
> This patch adds a lot of extra config options to alsa-lib (default 
> should be the same as before options existed), with these you can 
> substantially reduce the size of the alsa-lib library.
>
> It also changes alsa-utils to only depend on ncurses if you have 
> alsa-mixer selected.
>
> Finally it bumps the version of alsa-lib and alsa-utils to 1.0.22
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100128/4ebd4ad9/attachment-0001.htm>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 0001-bump-alsa-version-add-options.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100128/4ebd4ad9/attachment-0001.diff>
