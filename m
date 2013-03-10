From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 13:23:52 +0100
Subject: [Buildroot] [PATCH 4/4] directfb: fixing typo in variables
In-Reply-To: <20130310112527.4a82e689@skate>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-5-git-send-email-c.schoenert@gmail.com>
 <20130310112527.4a82e689@skate>
Message-ID: <513C7B58.3030802@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 10.03.2013 11:25, schrieb Thomas Petazzoni:
> This is good, but since you're renaming configuration options, you
> should add something to the main Config.in.legacy:
> 
> config BR2_PACKAGE_DIRECTB_DITHER_RGB16
> 	bool "DirectFB RGB16 dithering option has been renamed"
> 	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
> 	select BR2_LEGACY
> 
> This way, users who will upgrade will be automatically notified of the
> option rename.

Ahh, o.k. Don't know about this file, thanks for pointing at it. I take
a look at it and rework it.

Regards
Carsten
