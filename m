From: William Wagner <will_wagner@carallon.com>
Date: Tue, 12 Jan 2010 10:01:59 +0000
Subject: [Buildroot] obtaining linux kernel from git
In-Reply-To: <fa686aa41001111350n43bd53ep11166e4b0c938c38@mail.gmail.com>
References: <4B4B8366.2050007@carallon.com>
	<fa686aa41001111350n43bd53ep11166e4b0c938c38@mail.gmail.com>
Message-ID: <4B4C4897.7000400@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2010 21:50, Grant Likely wrote:
> I posted a patch doing this a while ago, but I didn't pursue it and it
> didn't get merged.
>
> http://lists.busybox.net/pipermail/buildroot/2008-October/023215.html
>
>    
The patch looks great. The only thing I think could be improved is 
setting BR2_LINUX26_VERSION. Need this so that BR2_PACKAGE_LINUX_KCONFIG 
gets set to something sensible (default is 
$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config).

Not sure what it would be best to set BR2_LINUX26_VERSION to, could just 
be "git" although if you specify a different branch I think that might 
be better

Will resubmit some patches once I'm done.

Will
-- 

------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
