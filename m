From: Nicolas Robin <nrosfs@gmail.com>
Date: Fri, 15 May 2020 21:55:38 +0200
Subject: [Buildroot] [PATCH 1/3] package/sdl2: enable SSE only if it's
 supported by the target
In-Reply-To: <20200515214840.7327bb1b@windsurf.home>
References: <20200515175357.45954-1-nrosfs@gmail.com>
 <20200515214840.7327bb1b@windsurf.home>
Message-ID: <70CE52ED-932A-4109-89E1-910C2C447846@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I do! Pentium MMX 233MHz, a beast!

Regards,
Nicolas

> Le 15 mai 2020 ? 21:48, Thomas Petazzoni <thomas.petazzoni@bootlin.com> a ?crit :
> 
> On Fri, 15 May 2020 19:53:55 +0200
> Nicolas Robin <nrosfs@gmail.com> wrote:
> 
>> Signed-off-by: Nicolas Robin <nrosfs@gmail.com>
>> ---
>> package/sdl2/sdl2.mk | 6 ++++++
>> 1 file changed, 6 insertions(+)
> 
> Thanks, series applied to next. I'm curious: you're really using SDL2
> on some old platform that has 3DNow support ?
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
