From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 09:07:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp-apps: bump to
 version 0.5.3
In-Reply-To: <CALFsTFWE-p8rUtOq8NA+D6fox39vLqoz3f32jQ0QxWs71FVLtA@mail.gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
 <20191004183132.15564-16-asafka7@gmail.com>
 <20191005230831.66b4a557@windsurf>
 <CALFsTFWE-p8rUtOq8NA+D6fox39vLqoz3f32jQ0QxWs71FVLtA@mail.gmail.com>
Message-ID: <20191008090726.42ceb787@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Oct 2019 07:43:50 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> I've sent a follow-up patch with the _LICENSE update.

Thanks!

> Moreover, when I look at the github repository of this application I
> see the application is now called to snmpclitools and the original
> repository seems to be empty (just a readme with a reference to the
> new one).
> What is the desired solution for that case? Should we just add the new
> package or should we also remove the current pysnmp-apps package?

Both: we add the new package, and remove python-pysnmp-apps.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
