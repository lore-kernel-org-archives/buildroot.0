From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 8 Oct 2019 07:43:50 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp-apps: bump to
 version 0.5.3
In-Reply-To: <20191005230831.66b4a557@windsurf>
References: <20191004183132.15564-1-asafka7@gmail.com>
 <20191004183132.15564-16-asafka7@gmail.com>
 <20191005230831.66b4a557@windsurf>
Message-ID: <CALFsTFWE-p8rUtOq8NA+D6fox39vLqoz3f32jQ0QxWs71FVLtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've sent a follow-up patch with the _LICENSE update.

Moreover, when I look at the github repository of this application I
see the application is now called to snmpclitools and the original
repository seems to be empty (just a readme with a reference to the
new one).
What is the desired solution for that case? Should we just add the new
package or should we also remove the current pysnmp-apps package?

Thanks,
Asaf.

On Sun, Oct 6, 2019 at 12:08 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri,  4 Oct 2019 21:31:22 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > Also add hash for license file.
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/python-pysnmp-apps/python-pysnmp-apps.hash | 8 +++++---
> >  package/python-pysnmp-apps/python-pysnmp-apps.mk   | 5 ++---
> >  2 files changed, 7 insertions(+), 6 deletions(-)
>
> I have applied. However, your patch made me re-read the LICENSE file,
> and it's BSD-2-Clause, while our .mk file says it's BSD-3-Clause. Since
> it's a bug not introduced by your patch, I applied your patch as-is.
> Could you send a follow-up patch fixing the _LICENSE variable in the
> .mk file ? This way, we can backport it to our LTS branch.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
