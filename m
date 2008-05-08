From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 08 May 2008 14:43:22 +0100
Subject: [Buildroot] make clean;make fails
In-Reply-To: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1FE@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E353016EB1F1FE@srv02.nortechonline.net>
Message-ID: <4823037A.3000400@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
> So then I thought I'd try 'make clean', 'make' but it would appear this doesn't put all the necessary stuff into project_build_arm/at91sam9260dfc/root/ (e.g. /usr/bin directory is missing, /etc/shadow file is missing amongst others)
> 
> Is this is bug in the buildroot system, or something I'm doing wrong?
> 

I have also found that this leaves you with a non-working buildroot. I 
think it is a bug but have never had the time to investigate exactly 
what is broken.

Doing a make dirclean as well before the make seems to get you a working 
again.

Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
