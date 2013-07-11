From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 11:45:23 +0200
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <51DE77FE.2060709@carallon.com>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
 <51DDAF1A.5040602@carallon.com> <20130711104744.7fa84966@skate>
 <51DE77FE.2060709@carallon.com>
Message-ID: <20130711114523.1384e3c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Thu, 11 Jul 2013 10:16:46 +0100, Will Wagner wrote:

> Ok, makes sense that the virtual package is only needed if we have more 
> than one package that offers it. I already have two hardware packages 
> that offer powervr support which is why I did it that way and it sounds 
> like Spenser is planning to add another as well.

Okay, I wasn't really aware there was today another PowerVR
implementation. Is it fully API-compatible with the PowerVR stuff of
the ti-gfx package currently done by Spenser? What is this other
PowerVR thing for compared to the one currently packaged by Spenser?
Is the 'ti-gfx' package name chosen by Spenser appropriate?

> Just to be difficult I'll also point out that currently in buildroot 
> there is only one package (rpi_userland) that offers opengl_es and 
> opengl_egl support so you were obviously planning for the future when 
> you made those a virtual package :)

That's true :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
