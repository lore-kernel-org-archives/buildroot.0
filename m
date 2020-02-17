From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 20:25:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5charts: fix install with
 per-package
In-Reply-To: <5d345f8c-aab1-5df8-4cef-0f4f0376d1ab@andin.de>
References: <20200216194230.1413696-1-fontaine.fabrice@gmail.com>
 <20200216212356.43072c64@gmx.net>
 <CAPi7W80D9eZJDs-0N+5SA1Z5PGJB-1hvn6h1Dz=aWW=SfSGKMQ@mail.gmail.com>
 <20200217011357.2c7d1f95@windsurf>
 <5d345f8c-aab1-5df8-4cef-0f4f0376d1ab@andin.de>
Message-ID: <20200217202558.61326c74@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 20:19:15 +0100
Andreas Naumann <dev@andin.de> wrote:

> Yes, actually I'm still not quite happy with what I have, or better, 
> with the amount of testing that I got done, but I guess I'll just send 
> what I have now and see your comments.

I think you should go ahead and send it. Other people can help with the
testing, and perhaps by reviewing suggest other ideas.

> Anyway, my approach to fix above issue is to use per-package customized 
> versions of qt.conf with the per-package sysroot and derive target 
> install from these folders also.

OK.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
