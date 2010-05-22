From: Paul Jones <paul@pauljones.id.au>
Date: Sat, 22 May 2010 18:02:43 +1000
Subject: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
In-Reply-To: <20100522094841.112be57a@surf>
References: <1274510676-19005-1-git-send-email-paul@pauljones.id.au>
	<20100522094841.112be57a@surf>
Message-ID: <001501caf985$2975c0f0$7c6142d0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Saturday, 22 May 2010 5:49 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] xkeyboard-config: Depends on intltool
> 
> On Sat, 22 May 2010 16:44:36 +1000
> Paul Jones <paul@pauljones.id.au> wrote:
> 
> > +XKEYBOARD_CONFIG_DEPENDENCIES = intltool
> 
> Are you sure it's intltool on the the target that is needed ? I think it's
probably
> intltool on the host that is needed, isn't it ?

Umm...
 
Oops! Why didn't I think of that?

Ok disregard this patch!



Paul.
