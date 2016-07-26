From: daggs <daggs@gmx.com>
Date: Tue, 26 Jul 2016 17:55:31 +0200
Subject: [Buildroot] [PATCH 3/3 v5] odroid-mali: New Package
In-Reply-To: <20160725201849.5c161ce9@free-electrons.com>
References: <20160724163506.20024-1-daggs@gmx.com>
 <20160724163506.20024-3-daggs@gmx.com>
 <20160724223543.1c9dcfc5@free-electrons.com>
 <trinity-8c1f22c5-57a0-4421-aaa1-77ccc703a9ce-1469469573490@3capp-mailcom-bs03>,
 <20160725201849.5c161ce9@free-electrons.com>
Message-ID: <trinity-01682c43-b955-4159-9947-90f2ce6db66d-1469548531444@3capp-mailcom-bs09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Hello,
> 
> On Mon, 25 Jul 2016 19:59:33 +0200, daggs wrote:
> 
> > > fbset is not used by odroid-mali, it's used by odroid-scripts, so this
> > > dependency should be in odroid-scripts. So I've dropped those two lines
> > > from here. Could you send a patch that adds the dependency to
> > > odroid-scripts?  
> > 
> > you are correct, will send a new patch.
> 
> Great, thanks!
> 
> > > It's worth mentioning that for AArch64, this repo contains the OpenGL
> > > libraries for X11. If you have the opportunity to test them, it would
> > > be nice to add support for them.  
> > 
> > I wanted to test it with kodi but 16 doesn't support aarch64.
> > there is a DDX driver for X which I intend to add as soon as I understand how to build it.
> 
> Good, thanks! Note that Bernd has a branch with Kodi 17, if you want to
> test it.

as it is still in RC/Beta, I'd rather not, will wait for the official release.

> 
> Best regards,
> 
> Thomas

Dagg.
