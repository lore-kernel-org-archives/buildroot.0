From: Cristi Magherusan <Cristi.Magherusan@net.utcluj.ro>
Date: Wed, 19 May 2010 00:02:41 +0300
Subject: [Buildroot] obtaining linux kernel from git
In-Reply-To: <4B4C4897.7000400@carallon.com>
References: <4B4B8366.2050007@carallon.com>
	<fa686aa41001111350n43bd53ep11166e4b0c938c38@mail.gmail.com>
	<4B4C4897.7000400@carallon.com>
Message-ID: <1274216561.7985.1.camel@ufo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2010-01-12 at 10:01 +0000, William Wagner wrote:
> On 11/01/2010 21:50, Grant Likely wrote:
> > I posted a patch doing this a while ago, but I didn't pursue it and it
> > didn't get merged.
> >
> > http://lists.busybox.net/pipermail/buildroot/2008-October/023215.html
> >
> >    
> The patch looks great. The only thing I think could be improved is 
> setting BR2_LINUX26_VERSION. Need this so that BR2_PACKAGE_LINUX_KCONFIG 
> gets set to something sensible (default is 
> $(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config).
> 
> Not sure what it would be best to set BR2_LINUX26_VERSION to, could just 
> be "git" although if you specify a different branch I think that might 
> be better
> 
> Will resubmit some patches once I'm done.
> 
> Will
Hi,

Any news about this? 

I'm interested in this feature and I would really like to see it merged.
What else needs to be done in order to achieve this goal?

Regards,
Cristi

-- 
Cristi M?gheru?an, alumnus System/Network Engineer
Technical University of Cluj-Napoca, Romania
http://cc.utcluj.ro  +40264 401247
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100519/4be282c1/attachment.pgp>
