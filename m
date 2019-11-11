From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 14:55:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcnano-binaries: new package
In-Reply-To: <trinity-d44d2103-0290-4df8-bdc8-499800075a5c-1573480088102@3c-app-webde-bs25>
References: <20191106155611.31575-1-scooby22@web.de>
 <20191106155611.31575-2-scooby22@web.de>
 <20191106230831.0a4017c6@windsurf>
 <trinity-e5303488-a97e-46bb-8738-520846b1c6db-1573110060239@3c-app-webde-bap18>
 <trinity-5b74f91d-c30f-42b7-9c54-1a49e1f58aee-1573467571744@3c-app-webde-bs25>
 <20191111141609.757023f1@windsurf>
 <trinity-d44d2103-0290-4df8-bdc8-499800075a5c-1573480088102@3c-app-webde-bs25>
Message-ID: <20191111145512.6be6c762@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 14:48:08 +0100
"Jens Kleintje" <Scooby22@web.de> wrote:

> > Not a problem, the github macro works with any arbitrary commit.  
> The problem is, that I get everytime the HEAD and not the commit with SHA c01642ed5e18cf09ecd905af193e935cb3be95ed.
> Today I got the commit with SHA 271f87d816a957bf196f6328c34110cab1224d4d.
> Did I miss something?

Depends on how you did it I guess. Did you do it like this:

V4L2GRAB_VERSION = f8d8844d52387b3db7b8736f5e86156d9374f781
V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
